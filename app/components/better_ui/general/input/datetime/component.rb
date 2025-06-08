# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Datetime
        class Component < ViewComponent::Base
          attr_reader :name, :value, :required, :disabled, :classes, :options,
                      :theme, :size, :rounded, :form, :min, :max, :type

          # Temi supportati per il Datetime Input
          DATETIME_INPUT_THEME = {
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

          # Dimensioni supportate per il Datetime Input - Sistema uniforme 7 livelli
          DATETIME_INPUT_SIZES = {
            xxs: 'h-6 px-1 py-0.5 text-xs',     # Extra extra small
            xs: 'h-7 px-1.5 py-0.5 text-xs',    # Extra small
            sm: 'h-8 px-2 py-1 text-xs',        # Small
            md: 'h-10 px-3 py-2 text-sm',       # Medium (default)
            lg: 'h-12 px-4 py-3 text-base',     # Large
            xl: 'h-14 px-5 py-3.5 text-lg',     # Extra large
            xxl: 'h-16 px-6 py-4 text-xl'       # Extra extra large
          }.freeze

          # Border radius supportati per il Datetime Input
          DATETIME_INPUT_RADIUS = {
            none: 'rounded-none',
            xxs: 'rounded-sm',
            xs: 'rounded',
            sm: 'rounded-md',
            md: 'rounded-lg',
            lg: 'rounded-xl',
            xl: 'rounded-2xl',
            xxl: 'rounded-3xl',
            full: 'rounded-full'
          }.freeze

          # Tipi supportati per il Datetime Input
          DATETIME_INPUT_TYPES = [
            :date, :month, :week, :time
          ].freeze

          # Formati di validazione per tipo
          DATETIME_FORMAT_PATTERNS = {
            date: /^\d{4}-\d{2}-\d{2}$/,
            month: /^\d{4}-\d{2}$/,
            week: /^\d{4}-W\d{2}$/,
            time: /^\d{2}:\d{2}$/
          }.freeze

          # Classi base per il Datetime Input
          DATETIME_INPUT_BASE_CLASSES = 'block w-full border shadow-sm disabled:bg-gray-100 disabled:cursor-not-allowed focus:outline-none focus:ring-1'

          # @param name [String] Nome del campo input
          # @param type [Symbol] Tipo del campo datetime (:date, :month, :week, :time)
          # @param value [String] Valore del campo nel formato appropriato per il tipo
          # @param required [Boolean] Se il campo è obbligatorio
          # @param disabled [Boolean] Se il campo è disabilitato
          # @param min [String] Valore minimo selezionabile nel formato appropriato
          # @param max [String] Valore massimo selezionabile nel formato appropriato
          # @param theme [Symbol] Tema del componente (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
          # @param size [Symbol] Dimensione del componente (:sm, :md, :lg)
          # @param rounded [Symbol] Border radius (:none, :sm, :md, :lg, :full)
          # @param classes [String] Classi CSS aggiuntive
          # @param form [ActionView::Helpers::FormBuilder] Form builder Rails opzionale
          # @param options [Hash] Opzioni aggiuntive per l'input
          def initialize(name:, type: :date, value: nil, required: false, disabled: false, 
                         min: nil, max: nil, theme: :default, size: :md, rounded: :md, classes: '', form: nil, **options)
            @name = name
            @type = type
            @value = value
            @required = required
            @disabled = disabled
            @min = min
            @max = max
            @theme = theme
            @size = size
            @rounded = rounded
            @classes = classes
            @form = form
            @options = options

            validate_params
            super()
          end

          # Attributi per l'elemento input standalone
          def input_attributes
            {
              type: @type,
              name: @name,
              id: @name,
              value: @value,
              required: @required,
              disabled: @disabled,
              min: @min,
              max: @max,
              class: build_classes
            }.compact.merge(@options)
          end

          # Attributi per l'elemento input con form builder
          def form_input_attributes
            {
              class: build_classes,
              required: @required,
              disabled: @disabled,
              min: @min,
              max: @max
            }.compact.merge(@options)
          end

          # Metodo helper per Rails form builder specifico per tipo
          def form_field_method
            case @type
            when :date then :date_field
            when :month then :month_field
            when :week then :week_field
            when :time then :time_field
            else :date_field
            end
          end

          private

          # Costruisce le classi CSS complete
          def build_classes
            [
              DATETIME_INPUT_BASE_CLASSES,
              get_theme_classes,
              get_size_classes,
              get_rounded_classes,
              @classes
            ].compact.join(' ')
          end

          # Definizione dinamica dei metodi get
          [
            { constant: :DATETIME_INPUT_THEME, var: :@theme, default: :default, method: :get_theme_classes },
            { constant: :DATETIME_INPUT_SIZES, var: :@size, default: :md, method: :get_size_classes },
            { constant: :DATETIME_INPUT_RADIUS, var: :@rounded, default: :md, method: :get_rounded_classes }
          ].each do |config|
            define_method(config[:method]) do
              self.class.const_get(config[:constant])[instance_variable_get(config[:var])] || self.class.const_get(config[:constant])[config[:default]]
            end
          end

          # Valida i parametri del componente
          def validate_params
            validate_type
            validate_theme
            validate_size
            validate_rounded
            validate_datetime_format
          end

          # Definizione dinamica delle validazioni
          [
            { values: DATETIME_INPUT_THEME.keys, method: :validate_theme, param: 'theme', var: :@theme },
            { values: DATETIME_INPUT_SIZES.keys, method: :validate_size, param: 'size', var: :@size },
            { values: DATETIME_INPUT_RADIUS.keys, method: :validate_rounded, param: 'rounded', var: :@rounded },
            { values: DATETIME_INPUT_TYPES, method: :validate_type, param: 'tipo', var: :@type }
          ].each do |config|
            define_method(config[:method]) do
              value = instance_variable_get(config[:var])
              unless config[:values].include?(value)
                raise ArgumentError, "#{config[:param].capitalize} non valido: #{value}. Valori supportati: #{config[:values].join(', ')}"
              end
            end
          end

          # Valida il formato dei valori datetime
          def validate_datetime_format
            validate_single_datetime(@value, 'value') if @value
            validate_single_datetime(@min, 'min') if @min
            validate_single_datetime(@max, 'max') if @max
          end

          # Valida un singolo valore datetime
          def validate_single_datetime(datetime_string, field_name)
            return if datetime_string.nil? || datetime_string.to_s.strip.empty?

            pattern = DATETIME_FORMAT_PATTERNS[@type]
            return if pattern && datetime_string.match?(pattern)

            expected_format = get_expected_format(@type)
            raise ArgumentError, "Il campo #{field_name} deve essere nel formato #{expected_format} per il tipo #{@type}: #{datetime_string}"
          end

          # Restituisce il formato atteso per il tipo
          def get_expected_format(type)
            case type
            when :date then 'YYYY-MM-DD'
            when :month then 'YYYY-MM'
            when :week then 'YYYY-WXX'
            when :time then 'HH:MM'
            else 'formato valido'
            end
          end
        end
      end
    end
  end
end
