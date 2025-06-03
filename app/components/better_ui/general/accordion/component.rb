# frozen_string_literal: true

module BetterUi
  module General
    module Accordion
      class Component < ViewComponent::Base
        renders_many :items, "BetterUi::General::Accordion::ItemComponent"

        ACCORDION_THEME = {
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

        ACCORDION_VARIANT = {
          minimal: '',
          bordered: 'border rounded-lg',
          separated: 'space-y-2'
        }.freeze

        ACCORDION_SIZE = {
          small: 'text-sm',
          medium: 'text-base',
          large: 'text-lg'
        }.freeze

        def initialize(multiple: false, theme: :default, variant: :bordered, size: :medium, 
                      classes: '', **options)
          @multiple = multiple
          @theme = theme
          @variant = variant
          @size = size
          @classes = classes
          @options = options

          validate_params
        end

        private

        attr_reader :multiple, :theme, :variant, :size, :classes, :options

        def validate_params
          validate_theme
          validate_variant
          validate_size
        end

        def validate_theme
          return if ACCORDION_THEME.key?(theme)

          raise ArgumentError, "Invalid theme: #{theme}. Must be one of #{ACCORDION_THEME.keys}"
        end

        def validate_variant
          return if ACCORDION_VARIANT.key?(variant)

          raise ArgumentError, "Invalid variant: #{variant}. Must be one of #{ACCORDION_VARIANT.keys}"
        end

        def validate_size
          return if ACCORDION_SIZE.key?(size)

          raise ArgumentError, "Invalid size: #{size}. Must be one of #{ACCORDION_SIZE.keys}"
        end

        # Attributi per il wrapper principale
        def wrapper_attributes
          base_classes = [
            'bui-accordion',
            ACCORDION_SIZE[size],
            ACCORDION_VARIANT[variant],
            ACCORDION_THEME[theme],
            classes
          ].compact.join(' ')

          {
            class: base_classes,
            'data-controller': 'bui-accordion',
            'data-bui-accordion-multiple-value': multiple
          }.merge(options)
        end
      end
    end
  end
end
