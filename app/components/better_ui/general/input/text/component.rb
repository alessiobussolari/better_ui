# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Text
        class Component < BetterUi::Component
          attr_reader :name, :value, :placeholder, :required, :disabled, :classes, :options,
                      :theme, :size, :rounded, :form, :type

          # Costanti con naming conforme alle nuove regole BetterUi
          TEXT_INPUT_THEME_CLASSES = {
            default: 'border-gray-300 focus:border-blue-500 focus:ring-blue-500',
            white: 'border-white focus:border-gray-300 focus:ring-gray-300 bg-white',
            red: 'border-red-300 focus:border-red-500 focus:ring-red-500',
            rose: 'border-rose-300 focus:border-rose-500 focus:ring-rose-500',
            orange: 'border-orange-300 focus:border-orange-500 focus:ring-orange-500',
            green: 'border-green-300 focus:border-green-500 focus:ring-green-500',
            blue: 'border-blue-300 focus:border-blue-500 focus:ring-blue-500',
            yellow: 'border-yellow-300 focus:border-yellow-500 focus:ring-yellow-500',
            violet: 'border-violet-300 focus:border-violet-500 focus:ring-violet-500'
          }.freeze

          # Sistema uniforme 7 livelli per SIZE
          TEXT_INPUT_SIZE_CLASSES = {
            xxs: 'h-6 px-1 py-0.5 text-xs',      # Extra extra small
            xs: 'h-7 px-1.5 py-1 text-xs',       # Extra small
            sm: 'h-8 px-2 py-1 text-xs',         # Small
            md: 'h-10 px-3 py-2 text-sm',        # Medium (default)
            lg: 'h-12 px-4 py-3 text-base',      # Large
            xl: 'h-14 px-5 py-4 text-lg',        # Extra large
            xxl: 'h-16 px-6 py-5 text-xl'        # Extra extra large
          }.freeze

          # Sistema uniforme 7 livelli per ROUNDED
          TEXT_INPUT_ROUNDED_CLASSES = {
            none: 'rounded-none',      # Nessun border radius
            xs: 'rounded-sm',          # Extra small
            sm: 'rounded',             # Small
            md: 'rounded-md',          # Medium (default)
            lg: 'rounded-lg',          # Large
            xl: 'rounded-xl',          # Extra large
            full: 'rounded-full'       # Border radius completo
          }.freeze

          # Tipi supportati per il Text Input
          TEXT_INPUT_TYPES = [
            :text, :password, :email, :tel, :url, :number, :search,
            :date, :time, :datetime_local, :month, :week, :color
          ].freeze

          # Classi base per il Text Input
          TEXT_INPUT_BASE_CLASSES = 'block w-full border shadow-sm disabled:bg-gray-100 disabled:cursor-not-allowed focus:outline-none focus:ring-1'.freeze

          # Configurazione con sistema automatico configure_attributes
          configure_attributes({
            theme: {
              var: :@theme,
              default: :default,
              constants: [:TEXT_INPUT_THEME_CLASSES],
              methods: [:get_theme_class]
            },
            size: {
              var: :@size,
              default: :md,
              constants: [:TEXT_INPUT_SIZE_CLASSES],
              methods: [:get_size_class]
            },
            rounded: {
              var: :@rounded,
              default: :md,
              constants: [:TEXT_INPUT_ROUNDED_CLASSES],
              methods: [:get_rounded_class]
            }
          })

          def initialize(
            name:, 
            value: nil, 
            placeholder: nil, 
            required: false, 
            disabled: false, 
            type: :text, 
            theme: :default, 
            size: :md, 
            rounded: :md, 
            classes: '', 
            form: nil, 
            **options
          )
            @name = name
            @value = value
            @placeholder = placeholder
            @required = required
            @disabled = disabled
            @type = type.to_sym
            @theme = theme.to_sym
            @size = size.to_sym
            @rounded = rounded.to_sym
            @classes = classes
            @form = form
            @options = options

            # Validazione automatica tramite configure_attributes + validazione tipo
            validate_params
            validate_type
          end

          # Attributi per l'elemento input standalone
          def input_attributes
            {
              type: @type,
              name: @name,
              id: @name,
              value: @value,
              placeholder: @placeholder,
              required: @required,
              disabled: @disabled,
              class: build_classes
            }.merge(@options)
          end

          # Attributi per l'elemento input con form builder
          def form_input_attributes
            {
              class: build_classes,
              placeholder: @placeholder,
              required: @required,
              disabled: @disabled
            }.merge(@options)
          end

          private

          # Costruisce le classi CSS complete
          def build_classes
            [
              TEXT_INPUT_BASE_CLASSES,
              get_theme_class,    # Metodo generato automaticamente
              get_size_class,     # Metodo generato automaticamente
              get_rounded_class,  # Metodo generato automaticamente
              @classes
            ].compact.join(' ')
          end

          # Validazione del tipo di input
          def validate_type
            unless TEXT_INPUT_TYPES.include?(@type)
              raise ArgumentError, "Tipo non valido: #{@type}. Valori supportati: #{TEXT_INPUT_TYPES.join(', ')}"
            end
          end
        end
      end
    end
  end
end
