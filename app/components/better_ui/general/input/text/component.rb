# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Text
        class Component < ViewComponent::Base
          attr_reader :name, :value, :placeholder, :required, :disabled, :classes, :options,
                      :theme, :size, :rounded, :form, :type

          # Temi supportati per il Text Input
          TEXT_INPUT_THEME = {
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

          # Dimensioni supportate per il Text Input - Sistema uniforme 7 livelli
          TEXT_INPUT_SIZES = {
            xxs: 'h-6 px-1 py-0.5 text-xs',      # Extra extra small
            xs: 'h-7 px-1.5 py-1 text-xs',       # Extra small
            sm: 'h-8 px-2 py-1 text-xs',         # Small
            md: 'h-10 px-3 py-2 text-sm',        # Medium (default)
            lg: 'h-12 px-4 py-3 text-base',      # Large
            xl: 'h-14 px-5 py-4 text-lg',        # Extra large
            xxl: 'h-16 px-6 py-5 text-xl'        # Extra extra large
          }.freeze

          # Border radius supportati per il Text Input
          TEXT_INPUT_RADIUS = {
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

          # Tipi supportati per il Text Input
          TEXT_INPUT_TYPES = [
            :text, :password, :email, :tel, :url, :number, :search,
            :date, :time, :datetime_local, :month, :week, :color
          ].freeze

          # Classi base per il Text Input
          TEXT_INPUT_BASE_CLASSES = 'block w-full border shadow-sm disabled:bg-gray-100 disabled:cursor-not-allowed focus:outline-none focus:ring-1'

          # @param name [String] Nome del campo input
          # @param value [String] Valore del campo
          # @param placeholder [String] Placeholder del campo
          # @param required [Boolean] Se il campo è obbligatorio
          # @param disabled [Boolean] Se il campo è disabilitato
          # @param type [Symbol] Tipo del campo input (:text, :password, :email, :tel, :url, :number, :search, :date, :time, :datetime_local, :month, :week, :color)
          # @param theme [Symbol] Tema del componente (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
          # @param size [Symbol] Dimensione del componente (:xxs, :xs, :sm, :md, :lg, :xl, :xxl)
          # @param rounded [Symbol] Border radius (:none, :sm, :md, :lg, :full)
          # @param classes [String] Classi CSS aggiuntive
          # @param form [ActionView::Helpers::FormBuilder] Form builder Rails opzionale
          # @param options [Hash] Opzioni aggiuntive per l'input
          def initialize(name:, value: nil, placeholder: nil, required: false, disabled: false, 
                         type: :text, theme: :default, size: :md, rounded: :md, classes: '', form: nil, **options)
            @name = name
            @value = value
            @placeholder = placeholder
            @required = required
            @disabled = disabled
            @type = type
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
              get_theme_classes,
              get_size_classes,
              get_rounded_classes,
              @classes
            ].compact.join(' ')
          end

          # Definizione dinamica dei metodi get
          [
            { constant: :TEXT_INPUT_THEME, var: :@theme, default: :default, method: :get_theme_classes },
            { constant: :TEXT_INPUT_SIZES, var: :@size, default: :md, method: :get_size_classes },
            { constant: :TEXT_INPUT_RADIUS, var: :@rounded, default: :md, method: :get_rounded_classes }
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
          end

          # Definizione dinamica delle validazioni
          [
            { values: TEXT_INPUT_THEME.keys, method: :validate_theme, param: 'theme', var: :@theme },
            { values: TEXT_INPUT_SIZES.keys, method: :validate_size, param: 'size', var: :@size },
            { values: TEXT_INPUT_RADIUS.keys, method: :validate_rounded, param: 'rounded', var: :@rounded },
            { values: TEXT_INPUT_TYPES, method: :validate_type, param: 'tipo', var: :@type }
          ].each do |config|
            define_method(config[:method]) do
              value = instance_variable_get(config[:var])
              unless config[:values].include?(value)
                raise ArgumentError, "#{config[:param].capitalize} non valido: #{value}. Valori supportati: #{config[:values].join(', ')}"
              end
            end
          end
        end
      end
    end
  end
end
