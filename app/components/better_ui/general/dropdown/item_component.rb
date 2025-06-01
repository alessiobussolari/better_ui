# frozen_string_literal: true

module BetterUi
  module General
    module Dropdown
      class ItemComponent < ViewComponent::Base
        include BetterUi::General::Components::Icon::IconHelper
        
        attr_reader :text, :icon, :href, :theme, :disabled, :active, :classes, :html_options

        # Classi base per l'elemento del dropdown
        DROPDOWN_ITEM_BASE_CLASSES = "flex items-center w-full px-4 py-2 text-sm transition-colors"

        # Temi per gli elementi del dropdown con classi Tailwind dirette
        DROPDOWN_ITEM_THEME = {
          default: "text-gray-700 hover:bg-gray-100 hover:text-gray-900",
          white: "text-gray-900 hover:bg-gray-50",
          red: "text-red-700 hover:bg-red-50 hover:text-red-900",
          rose: "text-rose-700 hover:bg-rose-50 hover:text-rose-900",
          orange: "text-orange-700 hover:bg-orange-50 hover:text-orange-900",
          green: "text-green-700 hover:bg-green-50 hover:text-green-900",
          blue: "text-blue-700 hover:bg-blue-50 hover:text-blue-900",
          yellow: "text-yellow-700 hover:bg-yellow-50 hover:text-yellow-900",
          violet: "text-violet-700 hover:bg-violet-50 hover:text-violet-900"
        }.freeze

        # Stati per gli elementi del dropdown
        DROPDOWN_ITEM_STATE_DISABLED = "opacity-50 cursor-not-allowed pointer-events-none"
        DROPDOWN_ITEM_STATE_ACTIVE = "bg-gray-100 text-gray-900"

        def initialize(
          text:,
          icon: nil,
          href: nil,
          theme: :default,
          disabled: false,
          active: false,
          classes: nil,
          **html_options
        )
          @text = text
          @icon = icon
          @href = href
          @theme = theme.to_sym
          @disabled = disabled
          @active = active
          @classes = classes
          @html_options = html_options

          validate_params
        end

        # Combina tutte le classi per l'elemento
        def item_classes
          classes = [
            DROPDOWN_ITEM_BASE_CLASSES,
            get_theme_classes,
            @classes
          ]

          classes << DROPDOWN_ITEM_STATE_DISABLED if @disabled
          classes << DROPDOWN_ITEM_STATE_ACTIVE if @active

          classes.compact.join(" ")
        end

        # Restituisce gli attributi per l'elemento
        def item_attributes
          attrs = {
            class: item_classes,
            role: "menuitem"
          }

          if @href.present? && !@disabled
            attrs[:href] = @href
          end

          if @disabled
            attrs["aria-disabled"] = "true"
            attrs[:tabindex] = "-1"
          end

          @html_options.except(:class).each do |key, value|
            attrs[key] = value
          end

          attrs
        end

        # Determina se usare un link o un button
        def tag_name
          @href.present? && !@disabled ? :a : :button
        end

        # Verifica se rendere il componente
        def render?
          @text.present?
        end

        private

        def get_theme_classes
          DROPDOWN_ITEM_THEME[@theme] || DROPDOWN_ITEM_THEME[:default]
        end

        def validate_params
          validate_theme
        end

        def validate_theme
          unless DROPDOWN_ITEM_THEME.keys.include?(@theme)
            raise ArgumentError, "Il tema deve essere uno tra: #{DROPDOWN_ITEM_THEME.keys.join(', ')}"
          end
        end
      end
    end
  end
end
