# frozen_string_literal: true

module BetterUi
  module General
    module Accordion
      class Component < BetterUi::Component
        renders_many :items, "BetterUi::General::Accordion::ItemComponent"
        
        attr_reader :multiple, :theme, :variant, :size

        # Costanti rinominate secondo le convenzioni
        ACCORDION_THEME_CLASSES = {
          default: 'border-gray-200',
          white: 'border-gray-100 bg-white',
          blue: 'border-blue-200',
          red: 'border-red-200',
          green: 'border-green-200',
          yellow: 'border-yellow-200',
          violet: 'border-violet-200',
          orange: 'border-orange-200',
          rose: 'border-rose-200'
        }.freeze

        ACCORDION_VARIANT_CLASSES = {
          minimal: '',
          bordered: 'border',
          separated: 'space-y-2'
        }.freeze

        ACCORDION_SIZE_CLASSES = {
          xxs: 'text-xs',        # Extra extra small
          xs: 'text-xs',         # Extra small
          sm: 'text-sm',         # Small
          md: 'text-base',       # Medium (default)
          lg: 'text-lg',         # Large
          xl: 'text-xl',         # Extra large
          xxl: 'text-2xl'        # Extra extra large
        }.freeze

        # Configurazione con configure_attributes
        configure_attributes({
          theme: {
            var: :@theme,
            default: :default,
            constants: [:ACCORDION_THEME_CLASSES],
            methods: [:get_theme_class]
          },
          variant: {
            var: :@variant,
            default: :bordered,
            constants: [:ACCORDION_VARIANT_CLASSES],
            methods: [:get_variant_class]
          },
          size: {
            var: :@size,
            default: :md,
            constants: [:ACCORDION_SIZE_CLASSES],
            methods: [:get_size_class]
          }
        })

        def initialize(
          multiple: false,
          theme: :default,
          variant: :bordered,
          size: :md,
          **html_options
        )
          @multiple = multiple
          @theme = theme.to_sym
          @variant = variant.to_sym
          @size = size.to_sym
          @html_options = html_options

          validate_params
        end

        private

        attr_reader :html_options

        # Attributi per il wrapper principale
        def wrapper_attributes
          base_classes = [
            'bui-accordion m-4 p-2 rounded-lg',
            get_size_class,
            get_variant_class,
            get_theme_class,
            @html_options[:class]
          ].compact.join(' ')

          {
            class: base_classes,
            'data-controller': 'bui-accordion',
            'data-bui-accordion-multiple-value': multiple
          }.merge(@html_options.except(:class))
        end
      end
    end
  end
end
