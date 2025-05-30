# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Textarea
        class Component < ViewComponent::Base
          attr_reader :name, :value, :placeholder, :required, :disabled, :classes, :options,
                      :theme, :size, :rounded, :form, :rows

          # Temi supportati per il Textarea
          TEXTAREA_THEME = {
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

          # Dimensioni supportate per il Textarea
          TEXTAREA_SIZES = {
            small: 'px-2 py-1 text-xs',
            medium: 'px-3 py-2 text-sm',
            large: 'px-4 py-3 text-base'
          }.freeze

          # Border radius supportati per il Textarea
          TEXTAREA_RADIUS = {
            none: 'rounded-none',
            small: 'rounded-sm',
            medium: 'rounded-md',
            large: 'rounded-lg',
            full: 'rounded-2xl'
          }.freeze

          # Classi base per il Textarea
          TEXTAREA_BASE_CLASSES = 'block w-full border shadow-sm disabled:bg-gray-100 disabled:cursor-not-allowed focus:outline-none focus:ring-1 resize-y'

          # @param name [String] Nome del campo textarea
          # @param value [String] Valore del campo
          # @param placeholder [String] Placeholder del campo
          # @param required [Boolean] Se il campo è obbligatorio
          # @param disabled [Boolean] Se il campo è disabilitato
          # @param rows [Integer] Numero di righe per la textarea
          # @param theme [Symbol] Tema del componente (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
          # @param size [Symbol] Dimensione del componente (:small, :medium, :large)
          # @param rounded [Symbol] Border radius (:none, :small, :medium, :large, :full)
          # @param classes [String] Classi CSS aggiuntive
          # @param form [ActionView::Helpers::FormBuilder] Form builder Rails opzionale
          # @param options [Hash] Opzioni aggiuntive per la textarea
          def initialize(name:, value: nil, placeholder: nil, required: false, disabled: false, 
                         rows: 3, theme: :default, size: :medium, rounded: :medium, classes: '', form: nil, **options)
            @name = name
            @value = value
            @placeholder = placeholder
            @required = required
            @disabled = disabled
            @rows = rows
            @theme = theme
            @size = size
            @rounded = rounded
            @classes = classes
            @form = form
            @options = options

            validate_params
            super()
          end

          # Attributi per l'elemento textarea standalone
          def textarea_attributes
            {
              name: @name,
              id: @name,
              value: @value,
              placeholder: @placeholder,
              required: @required,
              disabled: @disabled,
              rows: @rows,
              class: build_classes
            }.merge(@options)
          end

          # Attributi per l'elemento textarea con form builder
          def form_textarea_attributes
            {
              class: build_classes,
              placeholder: @placeholder,
              required: @required,
              disabled: @disabled,
              rows: @rows
            }.merge(@options)
          end

          private

          # Costruisce le classi CSS complete
          def build_classes
            [
              TEXTAREA_BASE_CLASSES,
              get_theme_classes,
              get_size_classes,
              get_rounded_classes,
              @classes
            ].compact.join(' ')
          end

          # Restituisce le classi del tema
          def get_theme_classes
            TEXTAREA_THEME[@theme]
          end

          # Restituisce le classi della dimensione
          def get_size_classes
            TEXTAREA_SIZES[@size]
          end

          # Restituisce le classi del border radius
          def get_rounded_classes
            TEXTAREA_RADIUS[@rounded]
          end

          # Valida i parametri del componente
          def validate_params
            validate_theme
            validate_size
            validate_rounded
            validate_rows
          end

          # Valida il tema
          def validate_theme
            return if TEXTAREA_THEME.key?(@theme)

            raise ArgumentError, "Tema non valido: #{@theme}. Temi supportati: #{TEXTAREA_THEME.keys.join(', ')}"
          end

          # Valida la dimensione
          def validate_size
            return if TEXTAREA_SIZES.key?(@size)

            raise ArgumentError, "Dimensione non valida: #{@size}. Dimensioni supportate: #{TEXTAREA_SIZES.keys.join(', ')}"
          end

          # Valida il border radius
          def validate_rounded
            return if TEXTAREA_RADIUS.key?(@rounded)

            raise ArgumentError, "Border radius non valido: #{@rounded}. Valori supportati: #{TEXTAREA_RADIUS.keys.join(', ')}"
          end

          # Valida il numero di righe
          def validate_rows
            return if @rows.is_a?(Integer) && @rows.positive?

            raise ArgumentError, "Il numero di righe deve essere un intero positivo: #{@rows}"
          end
        end
      end
    end
  end
end
