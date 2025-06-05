# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Rating
        class Component < ViewComponent::Base
          # Costanti con classi Tailwind dirette
          RATING_THEME = {
            default: 'text-yellow-400',
            yellow: 'text-yellow-400',
            orange: 'text-orange-400',
            red: 'text-red-400',
            pink: 'text-pink-400',
            purple: 'text-purple-400',
            blue: 'text-blue-400',
            green: 'text-green-400',
            gray: 'text-gray-400'
          }.freeze

          RATING_SIZE = {
            small: 'text-sm',
            medium: 'text-xl',
            large: 'text-3xl'
          }.freeze

          RATING_EMPTY_COLOR = 'text-gray-300'.freeze
          RATING_HALF_COLOR = 'text-yellow-300'.freeze

          attr_reader :name, :value, :max_stars, :readonly, :half_stars,
                      :theme, :size, :show_value, :form, :classes, :options

          # @param name [String] Nome del campo rating (obbligatorio se non readonly)
          # @param value [Float, Integer] Valore del rating attuale (0.0 - max_stars)
          # @param max_stars [Integer] Numero massimo di stelle (default: 5)
          # @param readonly [Boolean] Se il rating è in sola lettura
          # @param half_stars [Boolean] Se supportare mezze stelle
          # @param theme [Symbol] Tema del componente (:default, :yellow, :orange, :red, :pink, :purple, :blue, :green, :gray)
          # @param size [Symbol] Dimensione del componente (:small, :medium, :large)
          # @param show_value [Boolean] Se mostrare il valore numerico accanto alle stelle
          # @param form [ActionView::Helpers::FormBuilder, nil] Form builder Rails opzionale
          # @param classes [String] Classi CSS aggiuntive
          # @param options [Hash] Opzioni aggiuntive per attributi HTML
          def initialize(name: nil, value: 0, max_stars: 5, readonly: false, half_stars: true,
                         theme: :default, size: :medium, show_value: false, form: nil,
                         classes: '', **options)
            @name = name
            @value = value.to_f
            @max_stars = max_stars.to_i
            @readonly = readonly
            @half_stars = half_stars
            @theme = theme.to_sym
            @size = size.to_sym
            @show_value = show_value
            @form = form
            @classes = classes
            @options = options

            validate_params
          end

          private

          def validate_params
            validate_theme
            validate_size
            validate_value
            validate_max_stars
            validate_name if interactive?
          end

          def validate_theme
            return if RATING_THEME.key?(@theme)

            raise ArgumentError, "Invalid theme: #{@theme}. Valid themes are: #{RATING_THEME.keys.join(', ')}"
          end

          def validate_size
            return if RATING_SIZE.key?(@size)

            raise ArgumentError, "Invalid size: #{@size}. Valid sizes are: #{RATING_SIZE.keys.join(', ')}"
          end

          def validate_value
            return if @value >= 0 && @value <= @max_stars

            raise ArgumentError, "Value must be between 0 and #{@max_stars}, got: #{@value}"
          end

          def validate_max_stars
            return if @max_stars > 0

            raise ArgumentError, "Max stars must be greater than 0, got: #{@max_stars}"
          end

          def validate_name
            return if @name.present?

            raise ArgumentError, "Name is required for interactive rating components"
          end

          def interactive?
            !@readonly
          end

          def container_classes
            base_classes = ['inline-flex', 'items-center', 'gap-1']
            base_classes << @classes if @classes.present?
            base_classes.join(' ')
          end

          def rating_container_classes
            base_classes = ['flex', 'items-center']
            base_classes << (interactive? ? 'cursor-pointer' : 'cursor-default')
            base_classes.join(' ')
          end

          def star_classes(index)
            base_classes = [RATING_SIZE[@size], 'transition-colors', 'duration-150']
            base_classes << (interactive? ? 'hover:scale-110 transform transition-transform' : '')
            base_classes.compact.join(' ')
          end

          def controller_attributes
            return {} unless interactive?

            {
              data: {
                controller: 'bui-rating',
                'bui-rating-rating-value': @value,
                'bui-rating-max-value': @max_stars,
                'bui-rating-readonly-value': @readonly,
                'bui-rating-half-stars-value': @half_stars,
                'bui-rating-name-value': @name,
                action: 'keydown->bui-rating#keydown'
              },
              tabindex: '0'
            }
          end

          def star_attributes(index)
            attrs = {
              data: {
                'bui-rating-target': 'star',
                index: index
              }
            }

            if interactive?
              attrs[:data][:action] = [
                'click->bui-rating#starClick',
                'mouseover->bui-rating#starHover',
                'mouseleave->bui-rating#starLeave'
              ].join(' ')
            end

            attrs
          end

          def hidden_input_attributes
            return {} unless interactive?

            {
              type: 'hidden',
              name: input_name,
              value: @value,
              data: { 'bui-rating-target': 'hiddenInput' }
            }
          end

          def input_name
            if @form
              @form.field_name(@name)
            else
              @name
            end
          end

          def input_id
            @options[:id] || "rating_#{@name}"
          end

          def display_value
            if @value % 1 == 0
              @value.to_i.to_s
            else
              @value.to_s
            end
          end

          def star_display_state(index)
            star_number = index + 1
            
            if @value >= star_number
              :full
            elsif @half_stars && @value >= star_number - 0.5
              :half
            else
              :empty
            end
          end

          def star_color(state)
            case state
            when :full
              RATING_THEME[@theme]
            when :half
              RATING_HALF_COLOR
            when :empty
              RATING_EMPTY_COLOR
            end
          end

          def star_symbol(state)
            case state
            when :full, :half
              '★'
            when :empty
              '☆'
            end
          end

          def render_star(index)
            state = star_display_state(index)
            
            content_tag(:span, star_attributes(index).merge(class: "#{star_classes(index)} #{star_color(state)}")) do
              if state == :half
                render_half_star
              else
                star_symbol(state)
              end
            end
          end

          def render_half_star
            content_tag(:span, class: 'relative inline-block') do
              safe_join([
                content_tag(:span, '☆', class: RATING_EMPTY_COLOR),
                content_tag(:span, class: 'absolute inset-0 overflow-hidden w-1/2') do
                  content_tag(:span, '★', class: RATING_THEME[@theme])
                end
              ])
            end
          end

          def render_hidden_input
            return unless interactive?
            
            tag(:input, hidden_input_attributes)
          end

          def render_value_display
            return unless @show_value
            
            content_tag(:span, class: "ml-2 text-sm text-gray-600", data: { 'bui-rating-target': 'display' }) do
              "(#{display_value})"
            end
          end

          def render_stars_container
            content_tag(:div, class: rating_container_classes, **controller_attributes) do
              safe_join([
                render_hidden_input,
                *@max_stars.times.map { |i| render_star(i) }
              ].compact)
            end
          end
        end
      end
    end
  end
end
