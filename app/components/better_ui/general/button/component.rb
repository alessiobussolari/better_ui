module BetterUi
  module General
    module Button
      class Component < BetterUi::Component
        attr_reader :text, :full_width, :disabled, :icon, :icon_position, :href, :method, :data, :classes, :id, :button_type, :html_options

        # Classi base sempre presenti
        BUTTON_BASE_CLASSES = "inline-flex items-center justify-center font-medium transition-colors duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2"

        # Costanti rinominate secondo convenzione
        BUTTON_THEME_CLASSES = {
          default: "bg-black text-white hover:bg-gray-900 focus:ring-gray-900",
          white: "bg-white text-black border border-gray-300 hover:bg-gray-50 focus:ring-gray-400",
          red: "bg-red-500 text-white hover:bg-red-600 focus:ring-red-500",
          rose: "bg-rose-500 text-white hover:bg-rose-600 focus:ring-rose-500",
          orange: "bg-orange-500 text-white hover:bg-orange-600 focus:ring-orange-500",
          green: "bg-green-500 text-white hover:bg-green-600 focus:ring-green-500",
          blue: "bg-blue-500 text-white hover:bg-blue-600 focus:ring-blue-500",
          yellow: "bg-yellow-500 text-black hover:bg-yellow-600 focus:ring-yellow-500",
          violet: "bg-violet-500 text-white hover:bg-violet-600 focus:ring-violet-500",
          purple: "bg-purple-500 text-white hover:bg-purple-600 focus:ring-purple-500"
        }

        BUTTON_SIZE_CLASSES = {
          xxs: "px-1 py-0.5 text-xs",
          xs: "px-1.5 py-1 text-xs",
          sm: "px-2.5 py-1.5 text-xs",
          md: "px-4 py-2 text-sm",
          lg: "px-6 py-3 text-base",
          xl: "px-8 py-4 text-lg",
          xxl: "px-10 py-5 text-xl"
        }

        BUTTON_ROUNDED_CLASSES = {
          none: "rounded-none",
          xxs: "rounded-sm",
          xs: "rounded",
          sm: "rounded-md",
          md: "rounded-lg",
          lg: "rounded-xl",
          xl: "rounded-2xl",
          xxl: "rounded-3xl",
          full: "rounded-full"
        }

        # Costanti per validazione
        BUTTON_ICON_POSITION_VALUES = [:left, :right]

        # Configurazione con configure_attributes
        configure_attributes({
          theme: {
            var: :@theme,
            default: :white,
            constants: [:BUTTON_THEME_CLASSES],
            methods: [:get_theme_class]
          },
          size: {
            var: :@size,
            default: :md,
            constants: [:BUTTON_SIZE_CLASSES],
            methods: [:get_size_class]
          },
          rounded: {
            var: :@rounded,
            default: :md,
            constants: [:BUTTON_ROUNDED_CLASSES],
            methods: [:get_rounded_class]
          }
        })

        def initialize(
          text: nil,
          theme: :white,
          size: :md,
          full_width: false,
          disabled: false,
          icon: nil,
          icon_position: :left,
          href: nil,
          method: nil,
          data: {},
          classes: nil,
          id: nil,
          rounded: :md,
          button_type: :button,
          **html_options
        )
          @text = text
          @theme = theme.to_sym
          @size = size.to_sym
          @full_width = full_width
          @disabled = disabled
          @icon = icon
          @icon_position = icon_position.to_sym
          @href = href
          @method = method
          @data = data
          @classes = classes
          @id = id
          @rounded = rounded.to_sym
          @button_type = button_type.to_sym
          @html_options = html_options

          validate_params
        end

        def link?
          @href.present?
        end

        def combined_classes
          [
            BUTTON_BASE_CLASSES,
            get_theme_class,
            get_size_class,
            get_rounded_class,
            @full_width ? "w-full" : nil,
            @disabled ? "opacity-50 cursor-not-allowed" : nil,
            @classes,
            @html_options[:class]
          ].compact.join(" ")
        end

        def button_attributes
          attrs = {
            class: combined_classes,
            type: button_type,
            id: @id
          }

          attrs[:disabled] = true if @disabled
          attrs[:data] = @data if @data.present?

          @html_options.except(:class).each do |key, value|
            attrs[key] = value
          end

          attrs
        end

        def link_attributes
          attrs = {
            class: combined_classes,
            id: @id
          }

          attrs[:data] = @data.merge(turbo_method: @method) if @method.present?
          attrs[:data] = @data if @data.present? && !@method.present?
          attrs[:href] = @disabled ? nil : @href
          attrs[:role] = "button"
          attrs[:tabindex] = @disabled ? "-1" : "0"
          attrs[:aria] = { disabled: @disabled } if @disabled

          @html_options.except(:class).each do |key, value|
            attrs[key] = value
          end

          attrs
        end

        def button_type
          @button_type || "button"
        end

        def render_icon(icon_name)
          icon_size = case @size
                      when :xxs then :xxs
                      when :xs then :xs
                      when :sm then :sm
                      when :md then :md
                      when :lg then :lg
                      when :xl then :xl
                      when :xxl then :xxl
                      else :md
                      end

          render BetterUi::General::Icon::Component.new(
            name: icon_name,
            size: icon_size,
            fixed_width: true
          )
        end

        def render?
          @text.present? || @icon.present? || content.present?
        end

        private

        # Override validate_params per aggiungere validazioni custom
        def validate_params
          super # Chiama le validazioni automatiche di configure_attributes
          validate_icon_position
        end

        def validate_icon_position
          unless BUTTON_ICON_POSITION_VALUES.include?(@icon_position)
            raise ArgumentError, "#{self.class.name} - parametro 'icon_position' con valore '#{@icon_position}' non è valido. Deve essere uno tra: #{BUTTON_ICON_POSITION_VALUES.join(', ')}"
          end
        end
      end
    end
  end
end
