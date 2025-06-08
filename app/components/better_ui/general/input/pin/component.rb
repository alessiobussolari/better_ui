# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Pin
        class Component < ViewComponent::Base
          # Costanti con classi Tailwind dirette
          PIN_THEME = {
            default: 'border-gray-300 focus:border-blue-500 focus:ring-blue-500',
            white: 'border-gray-300 bg-white focus:border-gray-900 focus:ring-gray-900',
            red: 'border-red-300 focus:border-red-500 focus:ring-red-500',
            rose: 'border-rose-300 focus:border-rose-500 focus:ring-rose-500',
            orange: 'border-orange-300 focus:border-orange-500 focus:ring-orange-500',
            green: 'border-green-300 focus:border-green-500 focus:ring-green-500',
            blue: 'border-blue-300 focus:border-blue-500 focus:ring-blue-500',
            yellow: 'border-yellow-300 focus:border-yellow-500 focus:ring-yellow-500',
            violet: 'border-violet-300 focus:border-violet-500 focus:ring-violet-500'
          }.freeze

          PIN_SIZE = {
            xxs: 'w-6 h-6 text-xs',     # Extra extra small
            xs: 'w-7 h-7 text-xs',      # Extra small
            sm: 'w-8 h-8 text-sm',      # Small
            md: 'w-12 h-12 text-base',  # Medium (default)
            lg: 'w-16 h-16 text-lg',    # Large
            xl: 'w-20 h-20 text-xl',    # Extra large
            xxl: 'w-24 h-24 text-2xl'   # Extra extra large
          }.freeze

          PIN_GAP = {
            xxs: 'gap-1',        # Extra extra small
            xs: 'gap-1.5',       # Extra small
            sm: 'gap-2',         # Small
            md: 'gap-3',         # Medium (default)
            lg: 'gap-4',         # Large
            xl: 'gap-5',         # Extra large
            xxl: 'gap-6'         # Extra extra large
          }.freeze

          PIN_BASE_CLASSES = 'rounded-md border text-center font-mono focus:outline-none focus:ring-2 focus:ring-offset-1 transition-colors'.freeze

          attr_reader :name, :value, :length, :placeholder, :required, :disabled,
                      :theme, :size, :form, :classes, :options

          # @param name [String] Nome del campo pin (obbligatorio)
          # @param value [String] Valore del pin preimpostato
          # @param length [Integer] Numero di campi pin (4-8, default: 6)
          # @param placeholder [String] Placeholder per campi vuoti (default: '•')
          # @param required [Boolean] Se il campo è obbligatorio
          # @param disabled [Boolean] Se il campo è disabilitato
          # @param theme [Symbol] Tema del componente (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
          # @param size [Symbol] Dimensione del componente (:small, :medium, :large)
          # @param form [ActionView::Helpers::FormBuilder, nil] Form builder Rails opzionale
          # @param classes [String] Classi CSS aggiuntive
          # @param options [Hash] Opzioni aggiuntive per attributi HTML
          def initialize(name:, value: '', length: 6, placeholder: '•', required: false, disabled: false,
                         theme: :default, size: :md, form: nil, classes: '', **options)
            @name = name
            @value = value.to_s
            @length = length.to_i
            @placeholder = placeholder
            @required = required
            @disabled = disabled
            @theme = theme.to_sym
            @size = size.to_sym
            @form = form
            @classes = classes
            @options = options

            validate_params
          end

          private

          def validate_params
            validate_theme
            validate_size
            validate_length
            validate_name
          end

          def validate_theme
            return if PIN_THEME.key?(@theme)

            raise ArgumentError, "Invalid theme: #{@theme}. Valid themes are: #{PIN_THEME.keys.join(', ')}"
          end

          def validate_size
            return if PIN_SIZE.key?(@size)

            raise ArgumentError, "Invalid size: #{@size}. Valid sizes are: #{PIN_SIZE.keys.join(', ')}"
          end

          def validate_length
            return if @length >= 4 && @length <= 8

            raise ArgumentError, "Length must be between 4 and 8, got: #{@length}"
          end

          def validate_name
            return if @name.present?

            raise ArgumentError, "Name is required for pin input components"
          end

          def container_classes
            base_classes = ['flex', 'items-center']
            base_classes << PIN_GAP[@size]
            base_classes << @classes if @classes.present?
            base_classes.join(' ')
          end

          def input_classes
            [
              PIN_BASE_CLASSES,
              PIN_SIZE[@size],
              PIN_THEME[@theme],
              (@disabled ? 'opacity-50 cursor-not-allowed' : '')
            ].compact.join(' ')
          end

          def controller_attributes
            {
              data: {
                controller: 'bui-pin',
                'bui-pin-length-value': @length,
                'bui-pin-name-value': @name,
                'bui-pin-placeholder-value': @placeholder
              }
            }
          end

          def input_attributes(index)
            attrs = {
              type: 'text',
              class: input_classes,
              maxlength: '1',
              autocomplete: 'off',
              inputmode: 'numeric',
              pattern: '[0-9]*',
              placeholder: @placeholder,
              disabled: @disabled,
              required: @required && index == 0, # Solo il primo campo è required per validazione
              data: {
                'bui-pin-target': 'input',
                action: [
                  'input->bui-pin#inputChange',
                  'keydown->bui-pin#inputKeydown',
                  'paste->bui-pin#inputPaste'
                ].join(' ')
              }
            }

            # Imposta valore se presente
            if @value.present? && @value[index]
              attrs[:value] = @value[index]
            end

            attrs.merge(@options.except(:id))
          end

          def hidden_input_attributes
            attrs = {
              type: 'hidden',
              name: input_name,
              value: @value,
              data: { 'bui-pin-target': 'hiddenInput' }
            }

            # Aggiungi ID se specificato
            if @options[:id]
              attrs[:id] = @options[:id]
            end

            attrs
          end

          def input_name
            if @form
              @form.field_name(@name)
            else
              @name
            end
          end

          def render_pin_inputs
            @length.times.map do |index|
              tag(:input, input_attributes(index))
            end
          end

          def render_hidden_input
            tag(:input, hidden_input_attributes)
          end

          def render_pin_container
            content_tag(:div, class: container_classes, **controller_attributes) do
              safe_join([
                render_hidden_input,
                *render_pin_inputs
              ])
            end
          end
        end
      end
    end
  end
end
