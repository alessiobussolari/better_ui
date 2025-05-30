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

          # Dimensioni supportate per il Text Input
          TEXT_INPUT_SIZES = {
            small: 'h-8 px-2 py-1 text-xs',
            medium: 'h-10 px-3 py-2 text-sm',
            large: 'h-12 px-4 py-3 text-base'
          }.freeze

          # Border radius supportati per il Text Input
          TEXT_INPUT_RADIUS = {
            none: 'rounded-none',
            small: 'rounded-sm',
            medium: 'rounded-md',
            large: 'rounded-lg',
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
          # @param size [Symbol] Dimensione del componente (:small, :medium, :large)
          # @param rounded [Symbol] Border radius (:none, :small, :medium, :large, :full)
          # @param classes [String] Classi CSS aggiuntive
          # @param form [ActionView::Helpers::FormBuilder] Form builder Rails opzionale
          # @param options [Hash] Opzioni aggiuntive per l'input
          def initialize(name:, value: nil, placeholder: nil, required: false, disabled: false, 
                         type: :text, theme: :default, size: :medium, rounded: :medium, classes: '', form: nil, **options)
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

          # Restituisce le classi del tema
          def get_theme_classes
            TEXT_INPUT_THEME[@theme]
          end

          # Restituisce le classi della dimensione
          def get_size_classes
            TEXT_INPUT_SIZES[@size]
          end

          # Restituisce le classi del border radius
          def get_rounded_classes
            TEXT_INPUT_RADIUS[@rounded]
          end

          # Valida i parametri del componente
          def validate_params
            validate_type
            validate_theme
            validate_size
            validate_rounded
          end

          # Valida il tema
          def validate_theme
            return if TEXT_INPUT_THEME.key?(@theme)

            raise ArgumentError, "Tema non valido: #{@theme}. Temi supportati: #{TEXT_INPUT_THEME.keys.join(', ')}"
          end

          # Valida la dimensione
          def validate_size
            return if TEXT_INPUT_SIZES.key?(@size)

            raise ArgumentError, "Dimensione non valida: #{@size}. Dimensioni supportate: #{TEXT_INPUT_SIZES.keys.join(', ')}"
          end

          # Valida il border radius
          def validate_rounded
            return if TEXT_INPUT_RADIUS.key?(@rounded)

            raise ArgumentError, "Border radius non valido: #{@rounded}. Valori supportati: #{TEXT_INPUT_RADIUS.keys.join(', ')}"
          end

          # Valida il tipo
          def validate_type
            return if TEXT_INPUT_TYPES.include?(@type)

            raise ArgumentError, "Tipo non valido: #{@type}. Tipi supportati: #{TEXT_INPUT_TYPES.join(', ')}"
          end
        end
      end
    end
  end
end
