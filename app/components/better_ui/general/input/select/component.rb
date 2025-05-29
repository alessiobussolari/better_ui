# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Select
        class Component < ViewComponent::Base
          attr_reader :name, :options, :selected, :required, :disabled, :multiple, 
                      :theme, :size, :rounded, :placeholder, :form, :options_html, 
                      :classes, :html_options

          # Classi base sempre presenti
          SELECT_BASE_CLASSES = "block w-full border shadow-sm focus:outline-none focus:ring-2 focus:ring-offset-0"

          # Temi di select con classi Tailwind
          SELECT_THEME = {
            default: "bg-white border-gray-300 focus:border-blue-500 focus:ring-blue-500",
            white: "bg-white border-gray-300 focus:border-blue-500 focus:ring-blue-500",
            red: "bg-white border-red-300 focus:border-red-500 focus:ring-red-500",
            rose: "bg-white border-rose-300 focus:border-rose-500 focus:ring-rose-500",
            orange: "bg-white border-orange-300 focus:border-orange-500 focus:ring-orange-500",
            green: "bg-white border-green-300 focus:border-green-500 focus:ring-green-500",
            blue: "bg-white border-blue-300 focus:border-blue-500 focus:ring-blue-500",
            yellow: "bg-white border-yellow-300 focus:border-yellow-500 focus:ring-yellow-500",
            violet: "bg-white border-violet-300 focus:border-violet-500 focus:ring-violet-500"
          }.freeze

          # Dimensioni con classi Tailwind
          SELECT_SIZE = {
            small: "px-2 py-1.5 text-xs",
            medium: "px-3 py-2 text-sm",
            large: "px-4 py-3 text-base"
          }.freeze
          
          # Border radius con classi Tailwind
          SELECT_ROUNDED = {
            none: "rounded-none",
            small: "rounded-sm",
            medium: "rounded-md",
            large: "rounded-lg",
            full: "rounded-full"
          }.freeze

          # Stati del select
          SELECT_STATE = {
            disabled: "bg-gray-100 cursor-not-allowed opacity-75"
          }.freeze

          # @param name [String] Name of the select field (required)
          # @param options [Array<Hash>] Array of options for the select in format [{value: 'value', label: 'label'}, ...]
          # @param selected [String, Array, nil] Selected value or values
          # @param required [Boolean] Whether the field is required
          # @param disabled [Boolean] Whether the field is disabled
          # @param multiple [Boolean] Whether multiple options can be selected
          # @param theme [Symbol] Component theme (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
          # @param size [Symbol] Component size (:small, :medium, :large)
          # @param rounded [Symbol] Border radius (:none, :small, :medium, :large, :full)
          # @param placeholder [String, nil] Placeholder text for the field (creates an initial disabled option)
          # @param form [ActionView::Helpers::FormBuilder, nil] Optional Rails form builder
          # @param options_html [Hash] Additional HTML attributes for option tags
          # @param classes [String] Additional CSS classes
          # @param html_options [Hash] Additional HTML attributes for the select tag
          def initialize(
            name:, 
            options:, 
            selected: nil, 
            required: false, 
            disabled: false, 
            multiple: false, 
            theme: :default, 
            size: :medium, 
            rounded: :medium, 
            placeholder: nil,
            form: nil,
            options_html: {}, 
            classes: '', 
            **html_options
          )
            @name = name
            @options = options
            @selected = selected
            @required = required
            @disabled = disabled
            @multiple = multiple
            @theme = theme.to_sym
            @size = size.to_sym
            @rounded = rounded.to_sym
            @placeholder = placeholder
            @form = form
            @options_html = options_html
            @classes = classes
            @html_options = html_options

            validate_params
          end

          def combined_classes
            [
              SELECT_BASE_CLASSES,
              SELECT_THEME[@theme],
              SELECT_SIZE[@size],
              SELECT_ROUNDED[@rounded],
              @disabled ? SELECT_STATE[:disabled] : nil,
              @classes
            ].compact.join(' ')
          end

          def select_attributes
            attrs = {
              name: form_field_name,
              id: @html_options[:id] || form_field_id,
              class: combined_classes
            }

            # Aggiungi attributi booleani solo se true
            attrs[:required] = @required if @required
            attrs[:disabled] = @disabled if @disabled
            attrs[:multiple] = @multiple if @multiple

            # Aggiungi altri attributi HTML
            @html_options.except(:id, :class).each do |key, value|
              attrs[key] = value unless value.nil?
            end
            
            # Rimuovi attributi con valori nil o false
            attrs.compact
          end

          def form_field_name
            if @form.present?
              @form.field_name(@name)
            else
              @name
            end
          end

          def form_field_id
            if @form.present?
              @form.field_id(@name)
            else
              @name.to_s.gsub(/[\[\]]+/, '_').gsub(/_$/, '')
            end
          end

          def selected?(option)
            return false if @selected.nil?
            
            if @selected.is_a?(Array)
              @selected.include?(option[:value])
            else
              option[:value].to_s == @selected.to_s
            end
          end

          private

          def validate_params
            validate_theme
            validate_size
            validate_rounded
          end
          
          def validate_theme
            unless SELECT_THEME.keys.include?(@theme)
              raise ArgumentError, "Invalid theme: #{@theme}. Valid themes are: #{SELECT_THEME.keys.join(', ')}"
            end
          end
          
          def validate_size
            unless SELECT_SIZE.keys.include?(@size)
              raise ArgumentError, "Invalid size: #{@size}. Valid sizes are: #{SELECT_SIZE.keys.join(', ')}"
            end
          end
          
          def validate_rounded
            unless SELECT_ROUNDED.keys.include?(@rounded)
              raise ArgumentError, "Invalid rounded: #{@rounded}. Valid rounded options are: #{SELECT_ROUNDED.keys.join(', ')}"
            end
          end
        end
      end
    end
  end
end