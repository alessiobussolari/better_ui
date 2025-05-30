module BetterUi
  module General
    module Container
      class Component < ViewComponent::Base
        attr_reader :html_content, :fluid, :max_width, :padding, :background, :border, :shadow, :classes

        # Classi base sempre presenti
        CONTAINER_BASE_CLASSES = "mx-auto"

        # Larghezze massime con classi Tailwind dirette
        CONTAINER_MAX_WIDTH_CLASSES = {
          sm: "max-w-screen-sm",
          md: "max-w-screen-md",
          lg: "max-w-screen-lg",
          xl: "max-w-screen-xl",
          xxl: "max-w-screen-2xl"
        }

        # Padding con classi Tailwind dirette
        CONTAINER_PADDING_CLASSES = {
          none: "p-0",
          small: "p-2",
          medium: "p-4",
          large: "p-6"
        }

        # Background con classi Tailwind dirette
        CONTAINER_BACKGROUND_CLASSES = {
          white: "bg-white",
          light: "bg-gray-50",
          dark: "bg-gray-900",
          transparent: "bg-transparent"
        }

        # Border con classi Tailwind dirette
        CONTAINER_BORDER_CLASSES = {
          none: "border-0",
          small: "border",
          medium: "border-2",
          large: "border-4"
        }

        # Shadow con classi Tailwind dirette
        CONTAINER_SHADOW_CLASSES = {
          none: "shadow-none",
          small: "shadow-sm",
          medium: "shadow",
          large: "shadow-lg"
        }

        # @param html_content [String] contenuto HTML del container (opzionale)
        # @param fluid [Boolean] se il container deve essere fluid (full width)
        # @param max_width [Symbol] larghezza massima del container (:sm, :md, :lg, :xl, :xxl)
        # @param padding [Symbol] padding interno (:none, :small, :medium, :large)
        # @param background [Symbol] colore di sfondo (:white, :light, :dark, :transparent)
        # @param border [Symbol] bordo del container (:none, :small, :medium, :large)
        # @param shadow [Symbol] ombra del container (:none, :small, :medium, :large)
        # @param html_options [Hash] opzioni HTML aggiuntive
        def initialize(
          html_content: nil,
          fluid: false,
          max_width: :lg,
          padding: :medium,
          background: :white,
          border: false,
          shadow: :none,
          classes: nil,
          **html_options
        )
          @html_content = html_content
          @fluid = fluid
          @max_width = max_width.to_sym
          @padding = padding.to_sym
          @background = background.to_sym
          @border = border
          @shadow = shadow
          @html_options = html_options
          @classes = classes

          validate_params
        end

        # Combina tutte le classi CSS per il container
        def combined_classes
          [
            CONTAINER_BASE_CLASSES,
            get_max_width_class,
            get_padding_class,
            get_background_class,
            get_border_class,
            get_shadow_class,
            @classes,
            @html_options[:class]
          ].compact.join(" ")
        end

        # Restituisce gli attributi HTML per il container
        def container_attributes
          attrs = @html_options.except(:class)
          attrs[:class] = combined_classes
          attrs
        end

        # Determina se il container deve essere renderizzato
        def render?
          @html_content.present? || content.present?
        end

        private

        def get_max_width_class
          return "" if @fluid
          CONTAINER_MAX_WIDTH_CLASSES[@max_width] || CONTAINER_MAX_WIDTH_CLASSES[:lg]
        end

        def get_padding_class
          CONTAINER_PADDING_CLASSES[@padding] || CONTAINER_PADDING_CLASSES[:medium]
        end

        def get_background_class
          CONTAINER_BACKGROUND_CLASSES[@background] || CONTAINER_BACKGROUND_CLASSES[:white]
        end

        def get_border_class
          CONTAINER_BORDER_CLASSES[@border] || CONTAINER_BORDER_CLASSES[:none]
        end

        def get_shadow_class
          CONTAINER_SHADOW_CLASSES[@shadow] || CONTAINER_SHADOW_CLASSES[:none]
        end

        def validate_params
          validate_max_width
          validate_padding
          validate_background
        end

        def validate_max_width
          unless CONTAINER_MAX_WIDTH_CLASSES.keys.include?(@max_width)
            raise ArgumentError, "La larghezza massima deve essere una tra: #{CONTAINER_MAX_WIDTH_CLASSES.keys.join(', ')}"
          end
        end

        def validate_padding
          unless CONTAINER_PADDING_CLASSES.keys.include?(@padding)
            raise ArgumentError, "Il padding deve essere uno tra: #{CONTAINER_PADDING_CLASSES.keys.join(', ')}"
          end
        end

        def validate_background
          unless CONTAINER_BACKGROUND_CLASSES.keys.include?(@background)
            raise ArgumentError, "Il background deve essere uno tra: #{CONTAINER_BACKGROUND_CLASSES.keys.join(', ')}"
          end
        end
      end
    end
  end
end
