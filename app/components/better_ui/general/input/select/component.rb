# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Select
        class Component < ViewComponent::Base
          # Costanti con classi Tailwind dirette
          SELECT_THEME = {
            default: 'border-gray-300 text-gray-800 focus:border-gray-600 focus:ring-gray-600',
            white: 'border-gray-300 text-gray-900 focus:border-gray-500 focus:ring-gray-500',
            red: 'border-gray-300 text-red-600 focus:border-red-500 focus:ring-red-500',
            rose: 'border-gray-300 text-rose-600 focus:border-rose-500 focus:ring-rose-500',
            orange: 'border-gray-300 text-orange-600 focus:border-orange-500 focus:ring-orange-500',
            green: 'border-gray-300 text-green-600 focus:border-green-500 focus:ring-green-500',
            blue: 'border-gray-300 text-blue-600 focus:border-blue-500 focus:ring-blue-500',
            yellow: 'border-gray-300 text-yellow-600 focus:border-yellow-500 focus:ring-yellow-500',
            violet: 'border-gray-300 text-violet-600 focus:border-violet-500 focus:ring-violet-500'
          }.freeze

          SELECT_SIZE = {
            small: 'px-2 py-1.5 text-xs',
            medium: 'px-3 py-2 text-sm',
            large: 'px-4 py-3 text-base'
          }.freeze

          SELECT_ROUNDED = {
            none: 'rounded-none',
            small: 'rounded-sm',
            medium: 'rounded',
            large: 'rounded-lg',
            full: 'rounded-full'
          }.freeze

          SELECT_BASE_CLASSES = 'block w-full bg-white border-2 shadow-sm focus:outline-none focus:ring-2 focus:ring-offset-2 transition-colors duration-200'.freeze

          attr_reader :name, :options, :selected, :required, :disabled, :multiple, :searchable,
                      :theme, :size, :rounded, :placeholder, :search_placeholder, :max_height,
                      :form, :classes, :html_options

          # @param name [String] Nome del campo select (obbligatorio)
          # @param options [Array<Hash>] Array di opzioni nel formato [{value: 'value', label: 'label'}, ...]
          # @param selected [String, Array, nil] Valore/i selezionato/i
          # @param required [Boolean] Se il campo è obbligatorio
          # @param disabled [Boolean] Se il campo è disabilitato
          # @param multiple [Boolean] Se multiple opzioni possono essere selezionate
          # @param searchable [Boolean] Se abilitare la ricerca
          # @param theme [Symbol] Tema del componente (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
          # @param size [Symbol] Dimensione del componente (:small, :medium, :large)
          # @param rounded [Symbol] Border radius (:none, :small, :medium, :large, :full)
          # @param placeholder [String] Testo placeholder per il trigger
          # @param search_placeholder [String] Testo placeholder per il campo search
          # @param max_height [String] Altezza massima del dropdown (default: "300px")
          # @param form [ActionView::Helpers::FormBuilder, nil] Form builder Rails opzionale
          # @param classes [String] Classi CSS aggiuntive
          # @param html_options [Hash] Attributi HTML aggiuntivi
          def initialize(
            name:, 
            options:, 
            selected: nil, 
            required: false, 
            disabled: false, 
            multiple: false,
            searchable: true,
            theme: :default, 
            size: :medium, 
            rounded: :medium, 
            placeholder: nil,
            search_placeholder: nil,
            max_height: "300px",
            form: nil,
            classes: '', 
            **html_options
          )
            @name = name
            @options = options
            @selected = normalize_selected(selected)
            @required = required
            @disabled = disabled
            @multiple = multiple
            @searchable = searchable
            @theme = theme.to_sym
            @size = size.to_sym
            @rounded = rounded.to_sym
            @placeholder = placeholder || (multiple ? "Seleziona opzioni..." : "Seleziona...")
            @search_placeholder = search_placeholder || "Cerca..."
            @max_height = max_height
            @form = form
            @classes = classes
            @html_options = html_options

            validate_params
          end

          private

          def validate_params
            validate_theme
            validate_size
            validate_rounded
          end

          def validate_theme
            return if SELECT_THEME.key?(@theme)

            raise ArgumentError, "Invalid theme: #{@theme}. Valid themes are: #{SELECT_THEME.keys.join(', ')}"
          end

          def validate_size
            return if SELECT_SIZE.key?(@size)

            raise ArgumentError, "Invalid size: #{@size}. Valid sizes are: #{SELECT_SIZE.keys.join(', ')}"
          end

          def validate_rounded
            return if SELECT_ROUNDED.key?(@rounded)

            raise ArgumentError, "Invalid rounded: #{@rounded}. Valid rounded options are: #{SELECT_ROUNDED.keys.join(', ')}"
          end

          def normalize_selected(selected)
            return [] if selected.nil?
            return selected if selected.is_a?(Array)
            [selected]
          end

          def container_attributes
            {
              'data-controller': 'select',
              'data-select-multiple-value': @multiple,
              'data-select-searchable-value': @searchable,
              'data-select-selected-value': @selected.to_json,
              'data-select-placeholder-value': @placeholder,
              'data-select-search-placeholder-value': @search_placeholder,
              'data-action': 'keydown->select#keydown',
              class: "relative #{@classes}"
            }.merge(@html_options)
          end

          def trigger_classes
            [
              SELECT_BASE_CLASSES,
              SELECT_THEME[@theme],
              SELECT_SIZE[@size],
              SELECT_ROUNDED[@rounded],
              'cursor-pointer flex items-center justify-between',
              @disabled ? 'opacity-50 cursor-not-allowed' : 'hover:border-gray-400'
            ].compact.join(' ')
          end

          def dropdown_classes
            [
              'absolute z-50 w-full mt-1 bg-white border border-gray-300 shadow-lg',
              @rounded == :none ? 'rounded-none' : 'rounded-md',
              'hidden opacity-0 scale-95 translate-y-1',
              'transition-all duration-150 ease-out'
            ].join(' ')
          end

          def search_input_classes
            [
              'w-full px-3 py-2 text-sm border-0 border-b border-gray-200',
              'focus:outline-none focus:border-gray-400 bg-gray-50'
            ].join(' ')
          end

          def options_container_classes
            [
              'overflow-y-auto',
              "max-h-[#{@max_height}]"
            ].join(' ')
          end

          def option_classes
            [
              'px-3 py-2 cursor-pointer hover:bg-gray-50 flex items-center justify-between',
              'transition-colors duration-150'
            ].join(' ')
          end

          def input_name
            if @form.present?
              @form.field_name(@name)
            else
              @multiple ? "#{@name}[]" : @name
            end
          end

          def input_id
            if @form.present?
              @form.field_id(@name)
            else
              @name.to_s.gsub(/[\[\]]+/, '_').gsub(/_$/, '')
            end
          end

          def hidden_input_value
            if @multiple
              @selected.to_json
            else
              @selected.first || ''
            end
          end

          def trigger_text
            if @selected.empty?
              @placeholder
            elsif @multiple
              case @selected.length
              when 1
                selected_option = @options.find { |opt| opt[:value].to_s == @selected.first.to_s }
                selected_option ? selected_option[:label] : @selected.first
              else
                "#{@selected.length} selezionati"
              end
            else
              selected_option = @options.find { |opt| opt[:value].to_s == @selected.first.to_s }
              selected_option ? selected_option[:label] : @selected.first
            end
          end

          def trigger_text_classes
            @selected.empty? ? 'text-gray-500' : 'text-gray-900'
          end

          def selected_option_values
            @selected.map(&:to_s)
          end

          def option_selected?(option)
            selected_option_values.include?(option[:value].to_s)
          end

          def badge_container_classes
            'flex flex-wrap gap-1 mt-2'
          end

          def chevron_icon
            '
            <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
            </svg>
            '.html_safe
          end
        end
      end
    end
  end
end
