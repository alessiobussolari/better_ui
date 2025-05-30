module BetterUi
  module General
    module Badge
      class Component < ViewComponent::Base
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

        # Dimensioni con classi Tailwind dirette
        BADGE_SIZE_CLASSES = {
          small: "text-xs px-2 py-0.5",
          medium: "text-sm px-2.5 py-0.5",
          large: "text-sm px-3 py-1"
        }

        # Forme con classi Tailwind dirette
        BADGE_SHAPE_CLASSES = {
          square: "rounded-md",
          rounded: "rounded-full"
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

        # @param label [String] Testo del badge
        # @param theme [Symbol] default, white, red, rose, orange, green, blue, yellow, violet, gray
        # @param size [Symbol] small, medium, large
        # @param shape [Symbol] square, rounded
        # @param style [Symbol] filled, outline
        # @param variant [Symbol] nil, notification, counter, dot
        # @param icon [String] Nome icona (opzionale)
        # @param icon_position [Symbol] left, right
        # @param html_options [Hash] Opzioni HTML aggiuntive
        def initialize(
          label: nil,
          theme: :white,
          size: :medium,
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

        def get_theme_class
          if @style == :outline
            BADGE_THEME_OUTLINE_CLASSES[@theme] || BADGE_THEME_OUTLINE_CLASSES[:white]
          else
            BADGE_THEME_FILLED_CLASSES[@theme] || BADGE_THEME_FILLED_CLASSES[:white]
          end
        end

        def get_size_class
          BADGE_SIZE_CLASSES[@size] || BADGE_SIZE_CLASSES[:medium]
        end

        def get_shape_class
          BADGE_SHAPE_CLASSES[@shape] || BADGE_SHAPE_CLASSES[:rounded]
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
          when :large
                       :small
          when :small
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

        def validate_params
          validate_theme
          validate_size
          validate_shape
          validate_style
          validate_variant
          validate_icon_position
        end

        def validate_theme
          unless BADGE_THEME_FILLED_CLASSES.keys.include?(@theme)
            raise ArgumentError, "Il tema deve essere uno tra: #{BADGE_THEME_FILLED_CLASSES.keys.join(', ')}"
          end
        end

        def validate_size
          unless BADGE_SIZE_CLASSES.keys.include?(@size)
            raise ArgumentError, "La dimensione deve essere una tra: #{BADGE_SIZE_CLASSES.keys.join(', ')}"
          end
        end

        def validate_shape
          unless BADGE_SHAPE_CLASSES.keys.include?(@shape)
            raise ArgumentError, "La forma deve essere una tra: #{BADGE_SHAPE_CLASSES.keys.join(', ')}"
          end
        end

        def validate_style
          valid_styles = [ :filled, :outline ]
          unless valid_styles.include?(@style)
            raise ArgumentError, "Lo stile deve essere uno tra: #{valid_styles.join(', ')}"
          end
        end

        def validate_variant
          return if @variant.nil?

          valid_variants = [ :notification, :counter, :dot ]
          unless valid_variants.include?(@variant)
            raise ArgumentError, "La variante deve essere una tra: #{valid_variants.join(', ')}"
          end
        end

        def validate_icon_position
          valid_positions = [ :left, :right ]
          unless valid_positions.include?(@icon_position)
            raise ArgumentError, "La posizione dell'icona deve essere una tra: #{valid_positions.join(', ')}"
          end
        end
      end
    end
  end
end
