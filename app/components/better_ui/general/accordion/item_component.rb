# frozen_string_literal: true

module BetterUi
  module General
    module Accordion
      class ItemComponent < ViewComponent::Base
        ITEM_THEME = {
          default: 'border-gray-200 bg-white',
          white: 'border-gray-100 bg-white',
          blue: 'border-blue-200 bg-blue-50',
          red: 'border-red-200 bg-red-50',
          green: 'border-green-200 bg-green-50',
          yellow: 'border-yellow-200 bg-yellow-50',
          violet: 'border-violet-200 bg-violet-50',
          orange: 'border-orange-200 bg-orange-50',
          rose: 'border-rose-200 bg-rose-50'
        }.freeze

        ITEM_HEADER_THEME = {
          default: 'text-gray-900 hover:bg-gray-50',
          white: 'text-gray-900 hover:bg-gray-50',
          blue: 'text-blue-900 hover:bg-blue-100',
          red: 'text-red-900 hover:bg-red-100',
          green: 'text-green-900 hover:bg-green-100',
          yellow: 'text-yellow-900 hover:bg-yellow-100',
          violet: 'text-violet-900 hover:bg-violet-100',
          orange: 'text-orange-900 hover:bg-orange-100',
          rose: 'text-rose-900 hover:bg-rose-100'
        }.freeze

        ITEM_SIZE_HEADER = {
          small: 'text-sm px-4 py-3',
          medium: 'text-base px-5 py-4',
          large: 'text-lg px-6 py-5'
        }.freeze

        ITEM_SIZE_CONTENT = {
          small: 'px-4 py-3',
          medium: 'px-5 py-4',
          large: 'px-6 py-5'
        }.freeze

        ITEM_SIZE_ICON = {
          small: 'w-4 h-4',
          medium: 'w-5 h-5',
          large: 'w-6 h-6'
        }.freeze

        def initialize(title:, expanded: false, disabled: false, icon: 'chevron-down', 
                      theme: :default, size: :md, classes: '', **options)
          @title = title
          @expanded = expanded
          @disabled = disabled
          @icon = icon
          @theme = theme
          @size = size
          @classes = classes
          @options = options

          validate_params
        end

        private

        attr_reader :title, :expanded, :disabled, :icon, :theme, :size, :classes, :options

        def validate_params
          validate_theme
          validate_size
          
          raise ArgumentError, 'title cannot be blank' if title.blank?
        end

        def validate_theme
          return if ITEM_THEME.key?(theme)

          raise ArgumentError, "Invalid theme: #{theme}. Must be one of #{ITEM_THEME.keys}"
        end

        def validate_size
          return if ITEM_SIZE_HEADER.key?(size)

          raise ArgumentError, "Invalid size: #{size}. Must be one of #{ITEM_SIZE_HEADER.keys}"
        end

        def unique_id
          @unique_id ||= "accordion-item-#{SecureRandom.hex(4)}"
        end

        def content_id
          "#{unique_id}-content"
        end

        def header_id
          "#{unique_id}-header"
        end

        # Attributi per il wrapper dell'item
        def item_attributes
          base_classes = [
            'bui-accordion-item',
            ITEM_THEME[theme],
            classes
          ].compact.join(' ')

          {
            class: base_classes,
            'data-bui-accordion-target': 'item'
          }.merge(options)
        end

        # Attributi per il button header
        def header_attributes
          base_classes = [
            'bui-accordion-header',
            'w-full flex items-center justify-between text-left font-medium transition-colors duration-200',
            ITEM_SIZE_HEADER[size],
            ITEM_HEADER_THEME[theme],
            disabled? ? 'cursor-not-allowed opacity-50' : 'cursor-pointer'
          ].compact.join(' ')

          {
            class: base_classes,
            type: 'button',
            id: header_id,
            'aria-expanded': expanded,
            'aria-controls': content_id,
            'data-action': 'click->bui-accordion#toggle',
            'data-bui-accordion-target': 'trigger',
            disabled: disabled
          }
        end

        # Attributi per il contenuto
        def content_attributes
          base_classes = [
            'bui-accordion-content',
            'transition-all duration-300 ease-in-out overflow-hidden',
            ITEM_SIZE_CONTENT[size],
            expanded? ? 'block' : 'hidden'
          ].compact.join(' ')

          {
            class: base_classes,
            id: content_id,
            'aria-labelledby': header_id,
            'data-bui-accordion-target': 'content'
          }
        end

        # Attributi per l'icona
        def icon_attributes
          base_classes = [
            'bui-accordion-icon',
            'transition-transform duration-200',
            ITEM_SIZE_ICON[size],
            expanded? ? 'rotate-180' : ''
          ].compact.join(' ')

          {
            class: base_classes,
            'data-bui-accordion-target': 'icon'
          }
        end

        def disabled?
          disabled
        end

        def expanded?
          expanded
        end
      end
    end
  end
end
