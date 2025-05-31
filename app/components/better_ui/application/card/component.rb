# frozen_string_literal: true

module BetterUi
  module Application
    module Card
      class Component < ViewComponent::Base
        # Costanti per le classi CSS
        CARD_THEME = {
          default: 'bg-gray-900 border-gray-800',
          white: 'bg-white border-gray-200',
          red: 'bg-red-50 border-red-200',
          rose: 'bg-rose-50 border-rose-200',
          orange: 'bg-orange-50 border-orange-200',
          green: 'bg-green-50 border-green-200',
          blue: 'bg-blue-50 border-blue-200',
          yellow: 'bg-yellow-50 border-yellow-200',
          violet: 'bg-violet-50 border-violet-200',
          purple: 'bg-purple-50 border-purple-200'
        }.freeze

        CARD_SIZE = {
          small: 'p-4',
          medium: 'p-6',
          large: 'p-8'
        }.freeze

        CARD_ROUNDED = {
          none: 'rounded-none',
          small: 'rounded-md',
          medium: 'rounded-lg',
          large: 'rounded-xl',
          full: 'rounded-2xl'
        }.freeze

        CARD_SHADOW = {
          none: 'shadow-none',
          small: 'shadow-sm',
          medium: 'shadow-md',
          large: 'shadow-lg'
        }.freeze

        CARD_TREND_COLOR = {
          green: 'text-green-600',
          red: 'text-red-600',
          blue: 'text-blue-600',
          yellow: 'text-yellow-600',
          purple: 'text-purple-600',
          indigo: 'text-indigo-600',
          gray: 'text-gray-600'
        }.freeze

        CARD_TITLE_SIZE = {
          small: 'text-xs',
          medium: 'text-sm',
          large: 'text-base'
        }.freeze

        CARD_VALUE_SIZE = {
          small: 'text-lg',
          medium: 'text-2xl',
          large: 'text-3xl'
        }.freeze

        def initialize(
          title:,
          value:,
          trend: nil,
          change: nil,
          color: :green,
          theme: :default,
          size: :medium,
          rounded: :medium,
          shadow: :small,
          classes: nil,
          **options
        )
          @title = title
          @value = value
          @trend = trend
          @change = change
          @color = color
          @theme = theme
          @size = size
          @rounded = rounded
          @shadow = shadow
          @classes = classes
          @options = options

          validate_params
        end

        private

        attr_reader :title, :value, :trend, :change, :color, :theme, :size, :rounded, :shadow, :classes, :options

        def validate_params
          validate_theme
          validate_size
          validate_rounded
          validate_shadow
          validate_trend
          validate_color
        end

        def validate_theme
          return if CARD_THEME.key?(theme)
          
          raise ArgumentError, "Invalid theme: #{theme}. Valid options: #{CARD_THEME.keys.join(', ')}"
        end

        def validate_size
          return if CARD_SIZE.key?(size)
          
          raise ArgumentError, "Invalid size: #{size}. Valid options: #{CARD_SIZE.keys.join(', ')}"
        end

        def validate_rounded
          return if CARD_ROUNDED.key?(rounded)
          
          raise ArgumentError, "Invalid rounded: #{rounded}. Valid options: #{CARD_ROUNDED.keys.join(', ')}"
        end

        def validate_shadow
          return if CARD_SHADOW.key?(shadow)
          
          raise ArgumentError, "Invalid shadow: #{shadow}. Valid options: #{CARD_SHADOW.keys.join(', ')}"
        end

        def validate_trend
          return if trend.nil? || [:up, :down].include?(trend)
          
          raise ArgumentError, "Invalid trend: #{trend}. Valid options: :up, :down, nil"
        end

        def validate_color
          return if CARD_TREND_COLOR.key?(color)
          
          raise ArgumentError, "Invalid color: #{color}. Valid options: #{CARD_TREND_COLOR.keys.join(', ')}"
        end

        def card_classes
          base_classes = [
            CARD_THEME[theme],
            CARD_SIZE[size],
            CARD_ROUNDED[rounded],
            CARD_SHADOW[shadow],
            'border'
          ]

          base_classes << classes if classes.present?
          base_classes.compact.join(' ')
        end

        def title_classes
          base_classes = [
            CARD_TITLE_SIZE[size],
            'font-medium'
          ]

          if theme == :default
            base_classes << 'text-gray-300'
          else
            base_classes << 'text-gray-500'
          end

          base_classes.join(' ')
        end

        def value_classes
          base_classes = [
            CARD_VALUE_SIZE[size],
            'font-semibold'
          ]

          if theme == :default
            base_classes << 'text-white'
          else
            base_classes << 'text-gray-900'
          end

          base_classes.join(' ')
        end

        def trend_classes
          base_classes = [
            CARD_TREND_COLOR[color],
            'text-sm font-medium flex items-center'
          ]

          base_classes.join(' ')
        end

        def show_trend?
          trend.present? && change.present?
        end

        def trend_up?
          trend == :up
        end

        def trend_icon_size
          case size
          when :small
            'h-3 w-3 mr-0.5'
          when :medium
            'h-4 w-4 mr-0.5'
          when :large
            'h-5 w-5 mr-1'
          end
        end
      end
    end
  end
end
