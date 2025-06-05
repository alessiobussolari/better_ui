# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Toggle
        class Component < ViewComponent::Base
          # Costanti con classi Tailwind dirette
          TOGGLE_THEME = {
            default: 'peer-checked:bg-gray-800',
            white: 'peer-checked:bg-white border peer-checked:border-gray-900',
            red: 'peer-checked:bg-red-600',
            rose: 'peer-checked:bg-rose-600',
            orange: 'peer-checked:bg-orange-600',
            green: 'peer-checked:bg-green-600',
            blue: 'peer-checked:bg-blue-600',
            yellow: 'peer-checked:bg-yellow-600',
            violet: 'peer-checked:bg-violet-600'
          }.freeze

          TOGGLE_TRACK_SIZE = {
            small: 'w-9 h-5',
            medium: 'w-11 h-6',
            large: 'w-14 h-7'
          }.freeze

          TOGGLE_THUMB_SIZE = {
            small: 'w-4 h-4',
            medium: 'w-5 h-5',
            large: 'w-6 h-6'
          }.freeze

          TOGGLE_THUMB_POSITION = {
            small: 'peer-checked:translate-x-4',
            medium: 'peer-checked:translate-x-5',
            large: 'peer-checked:translate-x-7'
          }.freeze

          TOGGLE_BASE_TRACK = 'relative bg-gray-300 rounded-full transition-colors duration-200 ease-in-out'.freeze
          TOGGLE_BASE_THUMB = 'bg-white rounded-full shadow-sm transform transition-transform duration-200 ease-in-out absolute top-0.5 left-0.5'.freeze

          TOGGLE_LABEL_GAP = {
            small: 'gap-2',
            medium: 'gap-2.5',
            large: 'gap-3'
          }.freeze

          TOGGLE_LABEL_TEXT = {
            small: 'text-sm',
            medium: 'text-base',
            large: 'text-lg'
          }.freeze

          attr_reader :name, :value, :checked, :required, :disabled, 
                      :label, :label_position, :theme, :size,
                      :form, :classes, :options

          # @param name [String] Nome del campo toggle (obbligatorio)
          # @param value [String] Valore del toggle quando è attivo (default: "1")
          # @param checked [Boolean] Se il toggle è attivo
          # @param required [Boolean] Se il campo è obbligatorio
          # @param disabled [Boolean] Se il campo è disabilitato
          # @param label [String, nil] Testo della label associata al toggle
          # @param label_position [Symbol] Posizione della label (:left, :right)
          # @param theme [Symbol] Tema del componente (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
          # @param size [Symbol] Dimensione del componente (:small, :medium, :large)
          # @param form [ActionView::Helpers::FormBuilder, nil] Form builder Rails opzionale
          # @param classes [String] Classi CSS aggiuntive
          # @param options [Hash] Opzioni aggiuntive per l'input (es. data attributes)
          def initialize(name:, value: '1', checked: false, required: false, disabled: false, 
                         label: nil, label_position: :right, theme: :default, 
                         size: :medium, form: nil, classes: '', **options)
            @name = name
            @value = value
            @checked = checked
            @required = required
            @disabled = disabled
            @label = label
            @label_position = label_position.to_sym
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
            validate_label_position
          end

          def validate_theme
            return if TOGGLE_THEME.key?(@theme)

            raise ArgumentError, "Invalid theme: #{@theme}. Valid themes are: #{TOGGLE_THEME.keys.join(', ')}"
          end

          def validate_size
            return if TOGGLE_TRACK_SIZE.key?(@size)

            raise ArgumentError, "Invalid size: #{@size}. Valid sizes are: #{TOGGLE_TRACK_SIZE.keys.join(', ')}"
          end

          def validate_label_position
            return if [:left, :right].include?(@label_position)

            raise ArgumentError, "Invalid label_position: #{@label_position}. Valid positions are: left, right"
          end

          def container_classes
            base_classes = ['inline-flex', 'items-center']
            base_classes << TOGGLE_LABEL_GAP[@size]
            base_classes << (@disabled ? 'opacity-50 cursor-not-allowed' : 'cursor-pointer')
            base_classes << @classes if @classes.present?
            base_classes.join(' ')
          end

          def track_classes
            [
              TOGGLE_BASE_TRACK,
              TOGGLE_THEME[@theme],
              TOGGLE_TRACK_SIZE[@size]
            ].join(' ')
          end

          def thumb_classes
            [
              TOGGLE_BASE_THUMB,
              TOGGLE_THUMB_SIZE[@size],
              TOGGLE_THUMB_POSITION[@size]
            ].join(' ')
          end

          def input_attributes
            attrs = {
              type: 'checkbox',
              name: input_name,
              value: @value,
              class: 'sr-only peer',
              checked: @checked,
              required: @required,
              disabled: @disabled,
              id: input_id
            }

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
            @options[:id] || "toggle_#{@name}"
          end

          def label_classes
            TOGGLE_LABEL_TEXT[@size]
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
              class: 'sr-only peer',
              id: input_id,
              checked: @checked,
              disabled: @disabled,
              required: @required,
              **@options
            }, @value, '0')
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

          def render_toggle_with_label
            if @label_position == :left
              label_left_content
            else
              label_right_content
            end
          end

          def label_left_content
            content_tag(:label, class: container_classes, for: input_id) do
              safe_join([
                content_tag(:span, @label, class: label_classes),
                render_toggle_switch
              ])
            end
          end

          def label_right_content
            content_tag(:label, class: container_classes, for: input_id) do
              safe_join([
                render_toggle_switch,
                content_tag(:span, @label, class: label_classes)
              ])
            end
          end

          def render_toggle_switch
            content_tag(:div, class: 'relative') do
              safe_join([
                input_tag,
                content_tag(:div, '', class: track_classes),
                content_tag(:div, '', class: thumb_classes)
              ])
            end
          end
        end
      end
    end
  end
end
