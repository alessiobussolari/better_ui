# frozen_string_literal: true

module BetterUi
  module Application
    module Card
      class Component < BetterUi::Component
        attr_reader :title, :value, :trend, :change
        
        # Costanti per le classi CSS - Nomi corretti secondo convenzione
        CARD_THEME_CLASSES = {
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

        # Sistema uniforme 7 livelli per size
        CARD_SIZE_CLASSES = {
          xxs: 'p-1',                # Extra extra small
          xs: 'p-2',                 # Extra small
          sm: 'p-3',                 # Small
          md: 'p-6',                 # Medium (default)
          lg: 'p-8',                 # Large
          xl: 'p-10',                # Extra large
          xxl: 'p-12'                # Extra extra large
        }.freeze

        # Chiavi uniformi per rounded
        CARD_ROUNDED_CLASSES = {
          none: 'rounded-none',
          sm: 'rounded-md',          # Cambiato da :small
          md: 'rounded-lg',          # Cambiato da :medium
          lg: 'rounded-xl',          # Cambiato da :large
          full: 'rounded-2xl'
        }.freeze

        # Chiavi uniformi per shadow
        CARD_SHADOW_CLASSES = {
          none: 'shadow-none',
          sm: 'shadow-sm',           # Cambiato da :small
          md: 'shadow-md',           # Cambiato da :medium
          lg: 'shadow-lg'            # Cambiato da :large
        }.freeze

        # Colori trend con nome corretto
        CARD_COLOR_CLASSES = {
          green: 'text-green-600',
          red: 'text-red-600',
          blue: 'text-blue-600',
          yellow: 'text-yellow-600',
          purple: 'text-purple-600',
          indigo: 'text-indigo-600',
          gray: 'text-gray-600'
        }.freeze

        # Dimensioni titolo
        CARD_TITLE_SIZE_CLASSES = {
          xxs: 'text-[0.6rem]',      # Extra extra small
          xs: 'text-xs',             # Extra small
          sm: 'text-xs',             # Small
          md: 'text-sm',             # Medium (default)
          lg: 'text-base',           # Large
          xl: 'text-lg',             # Extra large
          xxl: 'text-xl'             # Extra extra large
        }.freeze

        # Dimensioni valore
        CARD_VALUE_SIZE_CLASSES = {
          xxs: 'text-sm',            # Extra extra small
          xs: 'text-base',           # Extra small
          sm: 'text-lg',             # Small
          md: 'text-2xl',            # Medium (default)
          lg: 'text-3xl',            # Large
          xl: 'text-4xl',            # Extra large
          xxl: 'text-5xl'            # Extra extra large
        }.freeze

        # Dimensioni icone trend
        CARD_TREND_ICON_SIZE_CLASSES = {
          xxs: 'h-2 w-2 mr-0.5',    # Extra extra small
          xs: 'h-2.5 w-2.5 mr-0.5', # Extra small
          sm: 'h-3 w-3 mr-0.5',     # Small
          md: 'h-4 w-4 mr-0.5',     # Medium (default)
          lg: 'h-5 w-5 mr-1',       # Large
          xl: 'h-6 w-6 mr-1',       # Extra large
          xxl: 'h-7 w-7 mr-1.5'     # Extra extra large
        }.freeze

        # Configurazione con configure_attributes
        configure_attributes({
          theme: {
            var: :@theme,
            default: :default,
            constants: [:CARD_THEME_CLASSES],
            methods: [:get_theme_class]
          },
          size: {
            var: :@size,
            default: :md,
            constants: [:CARD_SIZE_CLASSES, :CARD_TITLE_SIZE_CLASSES, :CARD_VALUE_SIZE_CLASSES, :CARD_TREND_ICON_SIZE_CLASSES],
            methods: [:get_size_class, :get_title_size_class, :get_value_size_class, :get_trend_icon_size_class]
          },
          rounded: {
            var: :@rounded,
            default: :md,
            constants: [:CARD_ROUNDED_CLASSES],
            methods: [:get_rounded_class]
          },
          shadow: {
            var: :@shadow,
            default: :sm,
            constants: [:CARD_SHADOW_CLASSES],
            methods: [:get_shadow_class]
          },
          color: {
            var: :@color,
            default: :green,
            constants: [:CARD_COLOR_CLASSES],
            methods: [:get_color_class]
          }
        })

        def initialize(
          title:,
          value:,
          trend: nil,
          change: nil,
          color: :green,
          theme: :default,
          size: :md,
          rounded: :md,
          shadow: :sm,
          **html_options
        )
          @title = title
          @value = value
          @trend = trend
          @change = change
          @color = color.to_sym
          @theme = theme.to_sym
          @size = size.to_sym
          @rounded = rounded.to_sym
          @shadow = shadow.to_sym
          @html_options = html_options

          validate_params
        end

        def card_classes
          base_classes = [
            get_theme_class,
            get_size_class,
            get_rounded_class,
            get_shadow_class,
            'border'
          ]

          base_classes << @html_options[:class] if @html_options[:class].present?
          base_classes.compact.join(' ')
        end

        def title_classes
          base_classes = [
            get_title_size_class,
            'font-medium'
          ]

          if @theme == :default
            base_classes << 'text-gray-300'
          else
            base_classes << 'text-gray-500'
          end

          base_classes.join(' ')
        end

        def value_classes
          base_classes = [
            get_value_size_class,
            'font-semibold'
          ]

          if @theme == :default
            base_classes << 'text-white'
          else
            base_classes << 'text-gray-900'
          end

          base_classes.join(' ')
        end

        def trend_classes
          base_classes = [
            get_color_class,
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
          get_trend_icon_size_class
        end

        def validate_trend
          return if trend.nil? || [:up, :down].include?(trend)
          
          raise ArgumentError, "Invalid trend: #{trend}. Valid options: :up, :down, nil"
        end

        private

        def validate_params
          super # Chiama la validazione di BetterUi::Component
          validate_trend
        end
      end
    end
  end
end
