# frozen_string_literal: true

module BetterUi
  module General
    module Tabs
      class Component < BetterUi::Component
        renders_one :navigation
        renders_one :panels
        TABS_VARIANT_CLASSES = {
          pills: 'bg-gray-100 rounded-lg p-1',
          underline: 'border-b border-gray-200',
          bordered: 'border border-gray-200 rounded-lg',
          minimal: ''
        }.freeze

        TABS_THEME_CLASSES = {
          default: 'text-gray-600',
          blue: 'text-blue-600',
          red: 'text-red-600',
          green: 'text-green-600',
          yellow: 'text-yellow-600',
          violet: 'text-violet-600',
          orange: 'text-orange-600',
          rose: 'text-rose-600',
          white: 'text-white'
        }.freeze

        TABS_SIZE_CLASSES = {
          xxs: 'text-xs',        # Extra extra small
          xs: 'text-xs',         # Extra small
          sm: 'text-sm',         # Small
          md: 'text-base',       # Medium (default)
          lg: 'text-lg',         # Large
          xl: 'text-xl',         # Extra large
          xxl: 'text-2xl'        # Extra extra large
        }.freeze

        TABS_ORIENTATION_CLASSES = {
          horizontal: 'flex-row',
          vertical: 'flex-col'
        }.freeze

        configure_attributes({
          variant: {
            var: :@variant,
            default: :pills,
            constants: [:TABS_VARIANT_CLASSES],
            methods: [:get_variant_class]
          },
          theme: {
            var: :@theme,
            default: :default,
            constants: [:TABS_THEME_CLASSES],
            methods: [:get_theme_class]
          },
          size: {
            var: :@size,
            default: :md,
            constants: [:TABS_SIZE_CLASSES],
            methods: [:get_size_class]
          },
          orientation: {
            var: :@orientation,
            default: :horizontal,
            constants: [:TABS_ORIENTATION_CLASSES],
            methods: [:get_orientation_class]
          }
        })

        def initialize(variant: :pills, theme: :default, size: :md, orientation: :horizontal,
                      navigation_classes: '', panels_classes: 'mt-4', **options)
          @variant = variant
          @theme = theme
          @size = size
          @orientation = orientation
          @navigation_classes = navigation_classes
          @panels_classes = panels_classes
          @options = options

          validate_params
        end

        private

        attr_reader :variant, :theme, :size, :orientation, :navigation_classes, :panels_classes, :options



        # Attributi per il wrapper principale (con data-controller)
        def wrapper_attributes
          {
            'data-controller': 'bui-tabs'
          }.merge(options)
        end

        # Attributi per il container della navigazione tabs
        def navigation_attributes
          base_classes = [
            'flex',
            get_orientation_class,
            get_variant_class,
            get_theme_class,
            get_size_class,
            navigation_classes
          ].compact.join(' ')

          {
            class: base_classes,
            role: 'tablist'
          }
        end

        # Attributi per il container dei panel
        def panels_attributes
          {
            class: panels_classes
          }
        end
      end
    end
  end
end
