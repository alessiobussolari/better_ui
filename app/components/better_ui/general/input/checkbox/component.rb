# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Checkbox
        class Component < BetterUi::Component
          attr_reader :name, :value, :checked, :required, :disabled, :indeterminate, 
                      :label, :label_position, :classes, :form, :options

          # Delega per usare helper BetterUi
          delegate :bui_text, to: :helpers

          # Costanti con naming conforme alle nuove regole BetterUi
          CHECKBOX_THEME_CLASSES = {
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

          # Sistema uniforme 7 livelli per SIZE
          CHECKBOX_SIZE_CLASSES = {
            xxs: 'h-2.5 w-2.5',       # Extra extra small
            xs: 'h-3 w-3',            # Extra small
            sm: 'h-3.5 w-3.5',        # Small
            md: 'h-4 w-4',            # Medium (default)
            lg: 'h-5 w-5',            # Large
            xl: 'h-6 w-6',            # Extra large
            xxl: 'h-7 w-7'            # Extra extra large
          }.freeze

          # Sistema uniforme 7 livelli per ROUNDED
          CHECKBOX_ROUNDED_CLASSES = {
            none: 'rounded-none',      # Nessun border radius
            xs: 'rounded-sm',          # Extra small
            sm: 'rounded',             # Small
            md: 'rounded-md',          # Medium (default)
            lg: 'rounded-lg',          # Large
            xl: 'rounded-xl',          # Extra large
            full: 'rounded-full'       # Border radius completo
          }.freeze

          # Costanti ausiliarie per label e gap
          CHECKBOX_LABEL_GAP_CLASSES = {
            xxs: 'gap-1',              # Extra extra small
            xs: 'gap-1.5',             # Extra small
            sm: 'gap-1.5',             # Small
            md: 'gap-2',               # Medium (default)
            lg: 'gap-2.5',             # Large
            xl: 'gap-3',               # Extra large
            xxl: 'gap-3.5'             # Extra extra large
          }.freeze

          CHECKBOX_LABEL_TEXT_CLASSES = {
            xxs: 'text-xs',            # Extra extra small
            xs: 'text-xs',             # Extra small
            sm: 'text-xs',             # Small
            md: 'text-sm',             # Medium (default)
            lg: 'text-base',           # Large
            xl: 'text-lg',             # Extra large
            xxl: 'text-xl'             # Extra extra large
          }.freeze

          # Classe base sempre presente
          CHECKBOX_BASE_CLASSES = 'appearance-none border-2 focus:outline-none transition-colors duration-200 cursor-pointer disabled:cursor-not-allowed disabled:opacity-50'.freeze

          # Configurazione con sistema automatico configure_attributes
          configure_attributes({
            theme: {
              var: :@theme,
              default: :default,
              constants: [:CHECKBOX_THEME_CLASSES],
              methods: [:get_theme_class]
            },
            size: {
              var: :@size,
              default: :md,
              constants: [:CHECKBOX_SIZE_CLASSES],
              methods: [:get_size_class]
            },
            rounded: {
              var: :@rounded,
              default: :md,
              constants: [:CHECKBOX_ROUNDED_CLASSES],
              methods: [:get_rounded_class]
            }
          })

          def initialize(
            name:, 
            value: "1", 
            checked: false, 
            required: false, 
            disabled: false, 
            indeterminate: false, 
            label: nil, 
            label_position: :right, 
            theme: :default, 
            size: :md, 
            rounded: :md, 
            classes: '', 
            form: nil, 
            **options
          )
            @name = name
            @value = value
            @checked = checked
            @required = required
            @disabled = disabled
            @indeterminate = indeterminate
            @label = label
            @label_position = label_position.to_sym
            @theme = theme.to_sym
            @size = size.to_sym
            @rounded = rounded.to_sym
            @classes = classes
            @form = form
            @options = options

            # Validazione automatica tramite configure_attributes
            validate_params
            validate_label_position
          end

          private

          def validate_label_position
            return if [:left, :right].include?(@label_position)

            raise ArgumentError, "Invalid label_position: #{@label_position}. Valid positions are: left, right"
          end

          def checkbox_classes
            [
              CHECKBOX_BASE_CLASSES,
              get_theme_class,      # Metodo generato automaticamente
              get_size_class,       # Metodo generato automaticamente
              get_rounded_class,    # Metodo generato automaticamente
              @classes
            ].compact.join(' ')
          end

          def input_attributes
            attrs = {
              type: 'checkbox',
              name: input_name,
              value: @value,
              class: checkbox_classes,
              checked: @checked,
              required: @required,
              disabled: @disabled,
              id: input_id
            }

            # Aggiungi controller Stimulus per indeterminate seguendo le regole BetterUi
            if @indeterminate
              attrs['data-controller'] = 'bui-checkbox'
              attrs['data-bui-checkbox-indeterminate-value'] = 'true'
            end

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
            @options[:id] || "checkbox_#{@name}"
          end

          def label_classes
            [
              'flex items-center cursor-pointer',
              @disabled ? 'opacity-50 cursor-not-allowed' : '',
              CHECKBOX_LABEL_GAP_CLASSES[@size]
            ].compact.join(' ')
          end

          def label_text_classes
            CHECKBOX_LABEL_TEXT_CLASSES[@size]
          end

          def input_tag
            if @form
              form_checkbox
            else
              manual_input
            end
          end

          def form_checkbox
            @form.check_box(@name, {
              class: checkbox_classes,
              id: input_id,
              checked: @checked,
              disabled: @disabled,
              required: @required,
              data: @indeterminate ? { indeterminate: 'true' } : {},
              **@options
            }, @value)
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

          def render_checkbox_with_label
            if @label_position == :left
              label_left_content
            else
              label_right_content
            end
          end

          def label_left_content
            content_tag(:label, class: label_classes, for: input_id) do
              safe_join([
                bui_text(@label, classes: label_text_classes),
                input_tag
              ])
            end
          end

          def label_right_content
            content_tag(:label, class: label_classes, for: input_id) do
              safe_join([
                input_tag,
                bui_text(@label, classes: label_text_classes)
              ])
            end
          end
        end
      end
    end
  end
end
