# frozen_string_literal: true

module BetterUi
  module General
    module Accordion
      class ItemComponent < BetterUi::Component
        attr_reader :title, :expanded, :disabled, :icon

        # Costanti aggiornate con simboli
        ITEM_THEME_CLASSES = {
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

        ITEM_HEADER_THEME_CLASSES = {
          default: 'text-gray-900 hover:bg-gray-900 hover:text-gray-50',
          white: 'text-gray-900 hover:bg-gray-50',
          blue: 'text-blue-900 hover:bg-blue-100',
          red: 'text-red-900 hover:bg-red-100',
          green: 'text-green-900 hover:bg-green-100',
          yellow: 'text-yellow-900 hover:bg-yellow-100',
          violet: 'text-violet-900 hover:bg-violet-100',
          orange: 'text-orange-900 hover:bg-orange-100',
          rose: 'text-rose-900 hover:bg-rose-100'
        }.freeze

        ITEM_SIZE_HEADER_CLASSES = {
          xxs: 'text-xs px-2 py-1',
          xs: 'text-xs px-3 py-2',
          sm: 'text-sm px-4 py-3',
          md: 'text-base px-5 py-4',
          lg: 'text-lg px-6 py-5',
          xl: 'text-xl px-7 py-6',
          xxl: 'text-2xl px-8 py-7'
        }.freeze

        ITEM_SIZE_CONTENT_CLASSES = {
          xxs: 'px-2 py-1',
          xs: 'px-3 py-2',
          sm: 'px-4 py-3',
          md: 'px-5 py-4',
          lg: 'px-6 py-5',
          xl: 'px-7 py-6',
          xxl: 'px-8 py-7'
        }.freeze

        ITEM_SIZE_ICON_CLASSES = {
          xxs: 'w-3 h-3',
          xs: 'w-3 h-3',
          sm: 'w-4 h-4',
          md: 'w-5 h-5',
          lg: 'w-6 h-6',
          xl: 'w-7 h-7',
          xxl: 'w-8 h-8'
        }.freeze

        # Configurazione con configure_attributes
        configure_attributes({
          theme: {
            var: :@theme,
            default: :default,
            constants: [:ITEM_THEME_CLASSES, :ITEM_HEADER_THEME_CLASSES],
            methods: [:get_theme_class, :get_header_theme_class]
          },
          size: {
            var: :@size,
            default: :md,
            constants: [:ITEM_SIZE_HEADER_CLASSES, :ITEM_SIZE_CONTENT_CLASSES, :ITEM_SIZE_ICON_CLASSES],
            methods: [:get_size_header_class, :get_size_content_class, :get_size_icon_class]
          }
        })

        def initialize(
          title:,
          expanded: false,
          disabled: false,
          icon: 'chevron-down',
          theme: :default,
          size: :md,
          classes: '',
          **options
        )
          @title = title
          @expanded = expanded
          @disabled = disabled
          @icon = icon
          @theme = theme.to_sym
          @size = size.to_sym
          @classes = classes
          @options = options

          validate_params
          raise ArgumentError, 'title cannot be blank' if title.blank?
        end

        private

        attr_reader :title, :expanded, :disabled, :icon, :theme, :size, :classes, :options

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
            get_theme_class,
            @classes
          ].compact.join(' ')

          {
            class: base_classes,
            'data-bui-accordion-target': 'item'
          }.merge(@options)
        end

        # Attributi per il button header
        def header_attributes
          base_classes = [
            'bui-accordion-header',
            'rounded-lg w-full flex items-center justify-between text-left font-medium transition-colors duration-200',
            get_size_header_class,
            get_header_theme_class,
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
            get_size_content_class,
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
            get_size_icon_class,
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
