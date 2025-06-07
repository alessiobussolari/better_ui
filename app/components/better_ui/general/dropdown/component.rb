# frozen_string_literal: true

module BetterUi
  module General
    module Dropdown
      class Component < ViewComponent::Base
        include BetterUi::General::Components::Icon::IconHelper
        
        attr_reader :trigger, :position, :theme, :size, :rounded, :animation, :fullwidth, :show_chevron, :selectable, :classes, :html_options

        # Classi base spostate nel template HTML per migliore leggibilità

        # Temi per il trigger del dropdown con classi Tailwind dirette
        DROPDOWN_TRIGGER_THEME = {
          default: "bg-white border-gray-300 text-gray-700 hover:bg-gray-50 focus:ring-blue-500",
          white: "bg-white border-gray-300 text-gray-900 hover:bg-gray-50 focus:ring-gray-500",
          red: "bg-red-600 border-red-600 text-white hover:bg-red-700 focus:ring-red-500",
          rose: "bg-rose-600 border-rose-600 text-white hover:bg-rose-700 focus:ring-rose-500",
          orange: "bg-orange-600 border-orange-600 text-white hover:bg-orange-700 focus:ring-orange-500",
          green: "bg-green-600 border-green-600 text-white hover:bg-green-700 focus:ring-green-500",
          blue: "bg-blue-600 border-blue-600 text-white hover:bg-blue-700 focus:ring-blue-500",
          yellow: "bg-yellow-500 border-yellow-500 text-white hover:bg-yellow-600 focus:ring-yellow-500",
          violet: "bg-violet-600 border-violet-600 text-white hover:bg-violet-700 focus:ring-violet-500"
        }.freeze

        # Dimensioni del trigger con classi Tailwind dirette
        DROPDOWN_TRIGGER_SIZE = {
          small: "px-3 py-1.5 text-sm",
          medium: "px-4 py-2 text-sm",
          large: "px-6 py-3 text-base"
        }.freeze

        # Border radius con classi Tailwind dirette
        DROPDOWN_ROUNDED = {
          none: "rounded-none",
          small: "rounded-md",
          medium: "rounded-lg",
          large: "rounded-xl",
          full: "rounded-full"
        }.freeze

        # Posizioni del menu dropdown
        DROPDOWN_POSITION = {
          bottom: "top-full left-0",
          top: "bottom-full left-0",
          left: "top-0 right-full mr-2",
          right: "top-0 left-full ml-2"
        }.freeze

        # Animazioni del dropdown
        DROPDOWN_ANIMATION = {
          fade: "transition-opacity duration-150",
          slide: "transition-all duration-150 transform",
          none: ""
        }.freeze

        # Stili per full-width del trigger
        DROPDOWN_FULLWIDTH = {
          true => "w-full text-left justify-start",
          false => "inline-flex justify-center"
        }.freeze

        def initialize(
          trigger:,
          position: :bottom,
          theme: :default,
          size: :medium,
          rounded: :medium,
          animation: :fade,
          fullwidth: false,
          show_chevron: true,
          selectable: false,
          classes: nil,
          **html_options
        )
          @trigger = trigger
          @position = position.to_sym
          @theme = theme.to_sym
          @size = size.to_sym
          @rounded = rounded.to_sym
          @animation = animation.to_sym
          @fullwidth = fullwidth
          @show_chevron = show_chevron
          @selectable = selectable
          @classes = classes
          @html_options = html_options

          validate_params
        end

        def fullwidth_classes
          [
            get_fullwidth_classes
          ].compact.join(" ")
        end

        # Restituisce solo le classi dinamiche per il trigger
        def dynamic_trigger_classes
          [
            get_trigger_theme_classes,
            get_trigger_size_classes,
            get_trigger_rounded_classes
          ].compact.join(" ")
        end

        # Restituisce solo le classi dinamiche per il menu
        def dynamic_menu_classes
          [
            get_position_classes,
            get_animation_classes,
            get_menu_rounded_classes
          ].compact.join(" ")
        end

        # Metodi per attributi rimossi - ora gestiti direttamente nel template HTML

        # Verifica se rendere il componente
        def render?
          @trigger.present?
        end

        private

        def get_trigger_theme_classes
          DROPDOWN_TRIGGER_THEME[@theme] || DROPDOWN_TRIGGER_THEME[:default]
        end

        def get_trigger_size_classes
          DROPDOWN_TRIGGER_SIZE[@size] || DROPDOWN_TRIGGER_SIZE[:medium]
        end

        def get_trigger_rounded_classes
          DROPDOWN_ROUNDED[@rounded] || DROPDOWN_ROUNDED[:medium]
        end

        def get_menu_rounded_classes
          DROPDOWN_ROUNDED[@rounded] || DROPDOWN_ROUNDED[:medium]
        end

        def get_position_classes
          DROPDOWN_POSITION[@position] || DROPDOWN_POSITION[:bottom]
        end

        def get_animation_classes
          DROPDOWN_ANIMATION[@animation] || DROPDOWN_ANIMATION[:fade]
        end

        def get_fullwidth_classes
          DROPDOWN_FULLWIDTH[@fullwidth] || DROPDOWN_FULLWIDTH[false]
        end

        def validate_params
          validate_theme
          validate_size
          validate_rounded
          validate_position
          validate_animation
        end

        def validate_theme
          unless DROPDOWN_TRIGGER_THEME.keys.include?(@theme)
            raise ArgumentError, "Il tema deve essere uno tra: #{DROPDOWN_TRIGGER_THEME.keys.join(', ')}"
          end
        end

        def validate_size
          unless DROPDOWN_TRIGGER_SIZE.keys.include?(@size)
            raise ArgumentError, "La dimensione deve essere una tra: #{DROPDOWN_TRIGGER_SIZE.keys.join(', ')}"
          end
        end

        def validate_rounded
          unless DROPDOWN_ROUNDED.keys.include?(@rounded)
            raise ArgumentError, "Il border radius deve essere uno tra: #{DROPDOWN_ROUNDED.keys.join(', ')}"
          end
        end

        def validate_position
          unless DROPDOWN_POSITION.keys.include?(@position)
            raise ArgumentError, "La posizione deve essere una tra: #{DROPDOWN_POSITION.keys.join(', ')}"
          end
        end

        def validate_animation
          unless DROPDOWN_ANIMATION.keys.include?(@animation)
            raise ArgumentError, "L'animazione deve essere una tra: #{DROPDOWN_ANIMATION.keys.join(', ')}"
          end
        end
      end
    end
  end
end
