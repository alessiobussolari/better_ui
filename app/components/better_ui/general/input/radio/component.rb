# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Radio
        class Component < ViewComponent::Base
          # Costanti con classi Tailwind dirette
          RADIO_THEME = {
            default: 'border-gray-300 text-gray-800 focus:border-gray-600 focus:ring-gray-600 checked:bg-gray-800 checked:border-gray-800',
            white: 'border-gray-300 text-gray-900 focus:border-gray-500 focus:ring-gray-500 checked:bg-white checked:border-gray-900 checked:text-gray-900',
            red: 'border-gray-300 text-red-600 focus:border-red-500 focus:ring-red-500 checked:bg-red-600 checked:border-red-600',
            rose: 'border-gray-300 text-rose-600 focus:border-rose-500 focus:ring-rose-500 checked:bg-rose-600 checked:border-rose-600',
            orange: 'border-gray-300 text-orange-600 focus:border-orange-500 focus:ring-orange-500 checked:bg-orange-600 checked:border-orange-600',
            green: 'border-gray-300 text-green-600 focus:border-green-500 focus:ring-green-500 checked:bg-green-600 checked:border-green-600',
            blue: 'border-gray-300 text-blue-600 focus:border-blue-500 focus:ring-blue-500 checked:bg-blue-600 checked:border-blue-600',
            yellow: 'border-gray-300 text-yellow-600 focus:border-yellow-500 focus:ring-yellow-500 checked:bg-yellow-600 checked:border-yellow-600',
            violet: 'border-gray-300 text-violet-600 focus:border-violet-500 focus:ring-violet-500 checked:bg-violet-600 checked:border-violet-600'
          }.freeze

          RADIO_SIZE = {
            xxs: 'h-2 w-2',        # Extra extra small
            xs: 'h-2.5 w-2.5',     # Extra small
            sm: 'h-2.5 w-2.5',     # Small
            md: 'h-3 w-3',         # Medium (default)
            lg: 'h-4 w-4',         # Large
            xl: 'h-5 w-5',         # Extra large
            xxl: 'h-6 w-6'         # Extra extra large
          }.freeze

          RADIO_ROUNDED = {
            none: 'rounded-none',
            small: 'rounded-sm',
            medium: 'rounded',
            large: 'rounded-lg',
            full: 'rounded-full'
          }.freeze

          RADIO_BASE_CLASSES = 'appearance-none border-2 focus:outline-none focus:ring-2 focus:ring-offset-2 transition-colors duration-200 cursor-pointer disabled:cursor-not-allowed disabled:opacity-50'.freeze

          RADIO_LABEL_GAP = {
            xxs: 'gap-1',          # Extra extra small
            xs: 'gap-1.5',         # Extra small
            sm: 'gap-1.5',         # Small
            md: 'gap-2',           # Medium (default)
            lg: 'gap-2.5',         # Large
            xl: 'gap-3',           # Extra large
            xxl: 'gap-3.5'         # Extra extra large
          }.freeze

          RADIO_LABEL_TEXT = {
            xxs: 'text-xs',        # Extra extra small
            xs: 'text-xs',         # Extra small
            sm: 'text-xs',         # Small
            md: 'text-sm',         # Medium (default)
            lg: 'text-base',       # Large
            xl: 'text-lg',         # Extra large
            xxl: 'text-xl'         # Extra extra large
          }.freeze

          attr_reader :name, :value, :checked, :required, :disabled, 
                      :label, :label_position, :theme, :size, :rounded, :classes, :form, :options

          # @param name [String] Nome del campo radio (obbligatorio)
          # @param value [String] Valore del radio button (obbligatorio)
          # @param checked [Boolean] Se il radio è selezionato
          # @param required [Boolean] Se il campo è obbligatorio
          # @param disabled [Boolean] Se il campo è disabilitato
          # @param label [String, nil] Testo della label associata al radio
          # @param label_position [Symbol] Posizione della label (:left, :right)
          # @param theme [Symbol] Tema del componente (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
          # @param size [Symbol] Dimensione del componente (:small, :medium, :large)
          # @param rounded [Symbol] Border radius (:none, :small, :medium, :large, :full)
          # @param classes [String] Classi CSS aggiuntive
          # @param form [ActionView::Helpers::FormBuilder, nil] Form builder Rails opzionale
          # @param options [Hash] Opzioni aggiuntive per l'input (es. data attributes, aria attributes)
          def initialize(name:, value:, checked: false, required: false, disabled: false, 
                         label: nil, label_position: :right, theme: :default, 
                         size: :md, rounded: :full, classes: '', form: nil, **options)
            @name = name
            @value = value
            @checked = checked
            @required = required
            @disabled = disabled
            @label = label
            @label_position = label_position.to_sym
            @theme = theme.to_sym
            @size = size.to_sym
            @rounded = rounded.to_sym
            @classes = classes
            @form = form
            @options = options

            validate_params
          end

          private

          def validate_params
            validate_theme
            validate_size
            validate_rounded
            validate_label_position
          end

          def validate_theme
            return if RADIO_THEME.key?(@theme)

            raise ArgumentError, "Invalid theme: #{@theme}. Valid themes are: #{RADIO_THEME.keys.join(', ')}"
          end

          def validate_size
            return if RADIO_SIZE.key?(@size)

            raise ArgumentError, "Invalid size: #{@size}. Valid sizes are: #{RADIO_SIZE.keys.join(', ')}"
          end

          def validate_rounded
            return if RADIO_ROUNDED.key?(@rounded)

            raise ArgumentError, "Invalid rounded: #{@rounded}. Valid rounded options are: #{RADIO_ROUNDED.keys.join(', ')}"
          end

          def validate_label_position
            return if [:left, :right].include?(@label_position)

            raise ArgumentError, "Invalid label_position: #{@label_position}. Valid positions are: left, right"
          end

          def radio_classes
            [
              RADIO_BASE_CLASSES,
              RADIO_THEME[@theme],
              RADIO_SIZE[@size],
              RADIO_ROUNDED[@rounded],
              @classes
            ].compact.join(' ')
          end

          def input_attributes
            attrs = {
              type: 'radio',
              name: input_name,
              value: @value,
              class: radio_classes,
              checked: @checked,
              required: @required,
              disabled: @disabled,
              id: input_id
            }

            # Unisci le opzioni personalizzate
            attrs.merge(@options)
          end

          def input_name
            if @form
              @form.field_name(@name)
            else
              @name
            end
          end

          def input_id
            @options[:id] || "radio_#{@name}_#{@value}"
          end

          def label_classes
            [
              'flex items-center cursor-pointer',
              @disabled ? 'opacity-50 cursor-not-allowed' : '',
              RADIO_LABEL_GAP[@size]
            ].compact.join(' ')
          end

          def label_text_classes
            RADIO_LABEL_TEXT[@size]
          end

          def input_tag
            if @form
              form_radio
            else
              manual_input
            end
          end

          def form_radio
            @form.radio_button(@name, @value, {
              class: radio_classes,
              id: input_id,
              checked: @checked,
              disabled: @disabled,
              required: @required,
              **@options
            })
          end

          def manual_input
            attrs = input_attributes.map do |key, value|
              if value == true
                key.to_s
              elsif value == false || value.nil?
                nil
              else
                "#{key}=\"#{value}\""
              end
            end.compact.join(' ')
            
            "<input #{attrs} />".html_safe
          end

          def render_radio_with_label
            if @label_position == :left
              label_left_content
            else
              label_right_content
            end
          end

          def label_left_content
            content_tag(:label, class: label_classes, for: input_id) do
              safe_join([
                content_tag(:span, @label, class: label_text_classes),
                input_tag
              ])
            end
          end

          def label_right_content
            content_tag(:label, class: label_classes, for: input_id) do
              safe_join([
                input_tag,
                content_tag(:span, @label, class: label_text_classes)
              ])
            end
          end
        end
      end
    end
  end
end
