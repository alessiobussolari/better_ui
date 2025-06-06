# frozen_string_literal: true

module BetterUi
  module General
    module Tabs
      class Component < ViewComponent::Base
        renders_one :navigation
        renders_one :panels
        TABS_VARIANT = {
          pills: 'bg-gray-100 rounded-lg p-1',
          underline: 'border-b border-gray-200',
          bordered: 'border border-gray-200 rounded-lg',
          minimal: ''
        }.freeze

        TABS_THEME_DEFAULT = {
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

        TABS_SIZE = {
          small: 'text-sm',
          medium: 'text-base',
          large: 'text-lg'
        }.freeze

        TABS_ORIENTATION = {
          horizontal: 'flex-row',
          vertical: 'flex-col'
        }.freeze

        def initialize(variant: :pills, theme: :default, size: :medium, orientation: :horizontal, 
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

        def validate_params
          validate_variant
          validate_theme
          validate_size
          validate_orientation
        end

        def validate_variant
          return if TABS_VARIANT.key?(variant)

          raise ArgumentError, "Invalid variant: #{variant}. Must be one of #{TABS_VARIANT.keys}"
        end

        def validate_theme
          return if TABS_THEME_DEFAULT.key?(theme)

          raise ArgumentError, "Invalid theme: #{theme}. Must be one of #{TABS_THEME_DEFAULT.keys}"
        end

        def validate_size
          return if TABS_SIZE.key?(size)

          raise ArgumentError, "Invalid size: #{size}. Must be one of #{TABS_SIZE.keys}"
        end

        def validate_orientation
          return if TABS_ORIENTATION.key?(orientation)

          raise ArgumentError, "Invalid orientation: #{orientation}. Must be one of #{TABS_ORIENTATION.keys}"
        end

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
            TABS_ORIENTATION[orientation],
            TABS_VARIANT[variant],
            TABS_THEME_DEFAULT[theme],
            TABS_SIZE[size],
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
