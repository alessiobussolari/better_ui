module BetterUi
  module General
    module Avatar
      class Component < ViewComponent::Base
        attr_reader :name, :src, :size, :shape, :status, :status_position, :theme, :style, :classes, :id

        # Classi base sempre presenti
        AVATAR_BASE_CLASSES = "relative inline-flex items-center justify-center flex-shrink-0 overflow-hidden"

        # Classi per elementi interni
        AVATAR_IMG_CLASSES = "h-full w-full object-cover"
        AVATAR_PLACEHOLDER_BASE_CLASSES = "flex items-center justify-center h-full w-full font-medium"
        AVATAR_STATUS_BASE_CLASSES = "absolute rounded-full border-2 border-white"

        # Dimensioni container con classi Tailwind dirette
        AVATAR_SIZE_CLASSES = {
          xxsmall: "h-5 w-5",
          xsmall: "h-6 w-6",
          small: "h-8 w-8",
          medium: "h-10 w-10",
          large: "h-12 w-12",
          xlarge: "h-16 w-16",
          xxlarge: "h-24 w-24"
        }

        # Dimensioni testo placeholder
        AVATAR_PLACEHOLDER_SIZE_CLASSES = {
          xxsmall: "text-xs",
          xsmall: "text-xs",
          small: "text-sm",
          medium: "text-base",
          large: "text-lg",
          xlarge: "text-xl",
          xxlarge: "text-2xl"
        }

        # Forme con classi Tailwind dirette
        AVATAR_SHAPE_CLASSES = {
          circle: "rounded-full",
          square: "rounded-none",
          rounded: "rounded-lg"
        }

        # Temi placeholder con classi Tailwind dirette
        AVATAR_PLACEHOLDER_THEME_CLASSES = {
          default: "bg-black text-white",
          white: "bg-white text-black border border-gray-300",
          red: "bg-red-500 text-white",
          rose: "bg-rose-500 text-white",
          orange: "bg-orange-500 text-white",
          green: "bg-green-500 text-white",
          blue: "bg-blue-500 text-white",
          yellow: "bg-yellow-500 text-black",
          violet: "bg-violet-500 text-white"
        }

        # Stati online con classi Tailwind dirette
        AVATAR_STATUS_THEME_CLASSES = {
          online: "bg-green-400",
          offline: "bg-gray-400",
          busy: "bg-red-400",
          away: "bg-yellow-400"
        }

        # Dimensioni indicatore stato
        AVATAR_STATUS_SIZE_CLASSES = {
          xxsmall: "h-1 w-1",
          xsmall: "h-1.5 w-1.5",
          small: "h-2 w-2",
          medium: "h-2.5 w-2.5",
          large: "h-3 w-3",
          xlarge: "h-3.5 w-3.5",
          xxlarge: "h-4 w-4"
        }

        # Posizioni dell'indicatore di stato
        AVATAR_STATUS_POSITION_CLASSES = {
          bottom_right: "bottom-0 right-0",
          bottom_left: "bottom-0 left-0",
          top_right: "top-0 right-0",
          top_left: "top-0 left-0"
        }

        # Stili disponibili (mantenuto per compatibilità)
        AVATAR_STYLE_CLASSES = {
          filled: "",
          outline: "border-2 border-gray-300",
          light: "opacity-75"
        }

        def initialize(
          name: nil,
          src: nil,
          size: :medium,
          shape: :circle,
          status: nil,
          status_position: :bottom_right,
          theme: :white,
          style: :filled,
          classes: nil,
          id: nil,
          **html_options
        )
          @name = name
          @src = src
          @size = size.to_sym
          @shape = shape.to_sym
          @status = status.present? ? status.to_sym : nil
          @status_position = status_position.to_sym
          @theme = theme.to_sym
          @style = style.to_sym
          @classes = classes
          @id = id
          @html_options = html_options

          validate_params
        end

        # Combina tutte le classi per il container
        def combined_classes
          [
            AVATAR_BASE_CLASSES,
            get_size_class,
            get_shape_class,
            get_style_class,
            @classes,
            @html_options[:class]
          ].compact.join(" ")
        end

        # Classi per il placeholder
        def placeholder_classes
          [
            AVATAR_PLACEHOLDER_BASE_CLASSES,
            get_placeholder_theme_class,
            get_placeholder_size_class,
            get_shape_class
          ].compact.join(" ")
        end

        # Classi per l'immagine
        def img_classes
          [
            AVATAR_IMG_CLASSES,
            get_shape_class
          ].compact.join(" ")
        end

        # Classi per l'indicatore di stato
        def status_indicator_classes
          [
            AVATAR_STATUS_BASE_CLASSES,
            get_status_theme_class,
            get_status_size_class,
            get_status_position_class
          ].compact.join(" ")
        end

        def get_size_class
          AVATAR_SIZE_CLASSES[@size] || AVATAR_SIZE_CLASSES[:medium]
        end

        def get_shape_class
          AVATAR_SHAPE_CLASSES[@shape] || AVATAR_SHAPE_CLASSES[:circle]
        end

        def get_style_class
          AVATAR_STYLE_CLASSES[@style] || AVATAR_STYLE_CLASSES[:filled]
        end

        def get_placeholder_theme_class
          AVATAR_PLACEHOLDER_THEME_CLASSES[@theme] || AVATAR_PLACEHOLDER_THEME_CLASSES[:white]
        end

        def get_placeholder_size_class
          AVATAR_PLACEHOLDER_SIZE_CLASSES[@size] || AVATAR_PLACEHOLDER_SIZE_CLASSES[:medium]
        end

        def get_status_theme_class
          AVATAR_STATUS_THEME_CLASSES[@status] || ""
        end

        def get_status_size_class
          AVATAR_STATUS_SIZE_CLASSES[@size] || AVATAR_STATUS_SIZE_CLASSES[:medium]
        end

        def get_status_position_class
          AVATAR_STATUS_POSITION_CLASSES[@status_position] || AVATAR_STATUS_POSITION_CLASSES[:bottom_right]
        end

        # Restituisce gli attributi per l'avatar
        def avatar_attributes
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

        # Determina se mostrare l'indicatore di stato
        def show_status?
          @status.present? && AVATAR_STATUS_THEME_CLASSES.key?(@status)
        end

        # Ottiene le iniziali dal nome
        def initials
          return "" unless @name.present?

          words = @name.strip.split(/\s+/)
          if words.size >= 2
            "#{words[0][0]}#{words[1][0]}".upcase
          else
            @name[0..1].upcase
          end
        end

        # Determina se mostrare l'immagine
        def show_image?
          @src.present?
        end

        # Ottiene le dimensioni dell'avatar in pixel (per attributi width/height img)
        def pixel_size
          case @size
          when :xxsmall
            20
          when :xsmall
            24
          when :small
            32
          when :medium
            40
          when :large
            48
          when :xlarge
            64
          when :xxlarge
            96
          else
            40
          end
        end

        private

        def validate_params
          validate_size
          validate_shape
          validate_theme
          validate_style
          validate_status
          validate_status_position
        end

        def validate_size
          unless AVATAR_SIZE_CLASSES.keys.include?(@size)
            raise ArgumentError, "La dimensione deve essere una tra: #{AVATAR_SIZE_CLASSES.keys.join(', ')}"
          end
        end

        def validate_shape
          unless AVATAR_SHAPE_CLASSES.keys.include?(@shape)
            raise ArgumentError, "La forma deve essere una tra: #{AVATAR_SHAPE_CLASSES.keys.join(', ')}"
          end
        end

        def validate_theme
          unless AVATAR_PLACEHOLDER_THEME_CLASSES.keys.include?(@theme)
            raise ArgumentError, "Il tema deve essere uno tra: #{AVATAR_PLACEHOLDER_THEME_CLASSES.keys.join(', ')}"
          end
        end

        def validate_style
          unless AVATAR_STYLE_CLASSES.keys.include?(@style)
            raise ArgumentError, "Lo stile deve essere uno tra: #{AVATAR_STYLE_CLASSES.keys.join(', ')}"
          end
        end

        def validate_status
          return if @status.nil?

          unless AVATAR_STATUS_THEME_CLASSES.keys.include?(@status)
            raise ArgumentError, "Lo stato deve essere uno tra: #{AVATAR_STATUS_THEME_CLASSES.keys.join(', ')}"
          end
        end

        def validate_status_position
          unless AVATAR_STATUS_POSITION_CLASSES.keys.include?(@status_position)
            raise ArgumentError, "La posizione dello stato deve essere una tra: #{AVATAR_STATUS_POSITION_CLASSES.keys.join(', ')}"
          end
        end
      end
    end
  end
end
