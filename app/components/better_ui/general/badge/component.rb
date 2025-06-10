module BetterUi
  module General
    module Badge
      class Component < BetterUi::Component
        attr_reader :label, :theme, :size, :shape, :style, :variant, :icon, :icon_position, :classes, :id

        # Classi base sempre presenti
        BADGE_BASE_CLASSES = "inline-flex items-center justify-center font-medium"

        # Classi per elementi interni
        BADGE_ICON_LEFT_CLASSES = "flex-shrink-0 -ml-0.5 mr-1.5"
        BADGE_ICON_RIGHT_CLASSES = "flex-shrink-0 -mr-0.5 ml-1.5"
        BADGE_TEXT_CLASSES = "whitespace-nowrap"
        BADGE_DOT_CLASSES = "h-2 w-2 rounded-full mr-1.5"

        # Temi di badge con stile FILLED - classi Tailwind dirette
        BADGE_THEME_FILLED_CLASSES = {
          default: "bg-black text-white",
          white: "bg-white text-black",
          red: "bg-red-500 text-white",
          rose: "bg-rose-500 text-white",
          orange: "bg-orange-500 text-white",
          green: "bg-green-500 text-white",
          blue: "bg-blue-500 text-white",
          yellow: "bg-yellow-500 text-black",
          violet: "bg-violet-500 text-white",
          gray: "bg-gray-500 text-white"
        }

        # Temi di badge con stile OUTLINE - classi Tailwind dirette
        BADGE_THEME_OUTLINE_CLASSES = {
          default: "border border-black text-black bg-transparent",
          white: "border border-gray-300 text-gray-700 bg-transparent",
          red: "border border-red-500 text-red-500 bg-transparent",
          rose: "border border-rose-500 text-rose-500 bg-transparent",
          orange: "border border-orange-500 text-orange-500 bg-transparent",
          green: "border border-green-500 text-green-500 bg-transparent",
          blue: "border border-blue-500 text-blue-500 bg-transparent",
          yellow: "border border-yellow-500 text-yellow-500 bg-transparent",
          violet: "border border-violet-500 text-violet-500 bg-transparent",
          gray: "border border-gray-500 text-gray-500 bg-transparent"
        }

        # Dimensioni con classi Tailwind dirette - Sistema uniforme 7 livelli
        BADGE_SIZE_CLASSES = {
          xxs: "text-xs px-1 py-0.5",        # Extra extra small
          xs: "text-xs px-1.5 py-0.5",       # Extra small  
          sm: "text-xs px-2 py-0.5",         # Small
          md: "text-sm px-2.5 py-0.5",       # Medium (default)
          lg: "text-sm px-3 py-1",           # Large
          xl: "text-base px-4 py-1.5",       # Extra large
          xxl: "text-lg px-5 py-2"           # Extra extra large
        }

        # Forme con classi Tailwind dirette
        BADGE_SHAPE_CLASSES = {
          square: "rounded-md",
          rounded: "rounded-full"
        }

        # Stili per la validazione
        BADGE_STYLE_CLASSES = {
          filled: "filled",
          outline: "outline"
        }

        # Varianti per la validazione
        BADGE_VARIANT_CLASSES = {
          notification: "notification",
          counter: "counter",
          dot: "dot"
        }

        # Posizioni icona per la validazione
        BADGE_ICON_POSITION_CLASSES = {
          left: "left",
          right: "right"
        }

        # Colori dot per ogni tema
        BADGE_DOT_COLOR_CLASSES = {
          default: "bg-gray-500",
          white: "bg-gray-400",
          red: "bg-red-700",
          rose: "bg-rose-700",
          orange: "bg-orange-700",
          green: "bg-green-700",
          blue: "bg-blue-700",
          yellow: "bg-yellow-700",
          violet: "bg-violet-700",
          gray: "bg-gray-700"
        }

        # Configurazione degli attributi
        configure_attributes({
          theme: {
            var: :@theme,
            default: :white,
            constants: [:BADGE_THEME_FILLED_CLASSES],
            methods: [:get_theme_class]
          },
          size: {
            var: :@size,
            default: :md,
            constants: [:BADGE_SIZE_CLASSES],
            methods: [:get_size_class]
          },
          shape: {
            var: :@shape,
            default: :rounded,
            constants: [:BADGE_SHAPE_CLASSES],
            methods: [:get_shape_class]
          },
          style: {
            var: :@style,
            default: :filled,
            constants: [:BADGE_STYLE_CLASSES],
            methods: [:get_style_class]
          },
          icon_position: {
            var: :@icon_position,
            default: :left,
            constants: [:BADGE_ICON_POSITION_CLASSES],
            methods: [:get_icon_position_class]
          }
        })

        # @param label [String] Testo del badge
        # @param theme [Symbol] default, white, red, rose, orange, green, blue, yellow, violet, gray
        # @param size [Symbol] xxs, xs, sm, md, lg, xl, xxl
        # @param shape [Symbol] square, rounded
        # @param style [Symbol] filled, outline
        # @param variant [Symbol] nil, notification, counter, dot
        # @param icon [String] Nome icona (opzionale)
        # @param icon_position [Symbol] left, right
        # @param html_options [Hash] Opzioni HTML aggiuntive
        def initialize(
          label: nil,
          theme: :white,
          size: :md,
          shape: :rounded,
          style: :filled,
          variant: nil,
          icon: nil,
          icon_position: :left,
          classes: nil,
          id: nil,
          **html_options
        )
          @label = label
          @theme = theme.to_sym
          @size = size.to_sym
          @shape = shape.to_sym
          @style = style.to_sym
          @variant = variant.present? ? variant.to_sym : nil
          @icon = icon
          @icon_position = icon_position.to_sym
          @classes = classes
          @id = id
          @html_options = html_options

          validate_params
          validate_variant if @variant
        end

        # Override del metodo get_theme_class per gestire filled/outline
        def get_theme_class
          if @style == :outline
            BADGE_THEME_OUTLINE_CLASSES[@theme] || BADGE_THEME_OUTLINE_CLASSES[:white]
          else
            BADGE_THEME_FILLED_CLASSES[@theme] || BADGE_THEME_FILLED_CLASSES[:white]
          end
        end

        # Combina tutte le classi
        def combined_classes
          [
            BADGE_BASE_CLASSES,
            get_theme_class,
            get_size_class,
            get_shape_class,
            @classes,
            @html_options[:class]
          ].compact.join(" ")
        end

        # Restituisce gli attributi per il badge
        def badge_attributes
          attrs = {
            class: combined_classes,
            id: @id
          }

          # Aggiungi altri attributi HTML se presenti
          @html_options.except(:class).each do |key, value|
            attrs[key] = value
          end

          attrs
        end

        def icon_classes
          if @icon_position == :left
            BADGE_ICON_LEFT_CLASSES
          else
            BADGE_ICON_RIGHT_CLASSES
          end
        end

        def text_classes
          BADGE_TEXT_CLASSES
        end

        def dot_classes
          [
            BADGE_DOT_CLASSES,
            get_dot_color_class
          ].compact.join(" ")
        end

        def get_dot_color_class
          BADGE_DOT_COLOR_CLASSES[@theme] || BADGE_DOT_COLOR_CLASSES[:white]
        end

        # Helper per renderizzare le icone
        def render_icon(icon_name)
          # Mappa le dimensioni del badge alle dimensioni dell'icona
          icon_size = case @size
          when :lg
                       :sm
          when :sm
                       :tiny
          else
                       :tiny
          end

          # Utilizziamo il componente Icon
          render BetterUi::General::IconComponent.new(
            name: icon_name,
            size: icon_size,
            fixed_width: true
          )
        end

        private

        def validate_variant
          return if @variant.nil?

          valid_variants = [:notification, :counter, :dot]
          unless valid_variants.include?(@variant)
            raise ArgumentError, "La variante deve essere una tra: #{valid_variants.join(', ')}"
          end
        end
      end
    end
  end
end
