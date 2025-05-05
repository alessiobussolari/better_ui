module BetterUi
  module General
    class TagComponent < ViewComponent::Base
      # Temi di tag disponibili
      TAG_THEME = {
        default: "bui-tag--default",
        white: "bui-tag--white",
        red: "bui-tag--red",
        rose: "bui-tag--rose",
        orange: "bui-tag--orange",
        green: "bui-tag--green",
        blue: "bui-tag--blue",
        yellow: "bui-tag--yellow",
        violet: "bui-tag--violet",
        gray: "bui-tag--gray"
      }

      # Orientamenti disponibili
      TAG_ORIENTATION = {
        horizontal: "bui-tag--horizontal",
        vertical: "bui-tag--vertical"
      }

      # Stili disponibili
      TAG_STYLE = {
        filled: "bui-tag--filled",
        outline: "bui-tag--outline",
        light: "bui-tag--light",
        ghost: "bui-tag--ghost",
        flat: "bui-tag--flat",
        bordered: "bui-tag--bordered"
      }

      # Dimensioni disponibili
      TAG_SIZE = {
        small: "bui-tag--small",
        medium: "bui-tag--medium",
        large: "bui-tag--large"
      }

      # Forme disponibili
      TAG_SHAPE = {
        rounded: "bui-tag--rounded",
        square: "bui-tag--square",
        pill: "bui-tag--pill"
      }

      # Parametri del componente
      # @param text [String] testo del tag
      # @param theme [Symbol] default, white, red, rose, orange, green, blue, yellow, violet, gray
      # @param orientation [Symbol] horizontal, vertical
      # @param style [Symbol] filled, outline, light, ghost, flat, bordered
      # @param size [Symbol] small, medium, large
      # @param shape [Symbol] rounded, square, pill
      # @param clickable [Boolean] se il tag può essere cliccato
      # @param selected [Boolean] stato selezionato
      # @param removable [Boolean] se può essere rimosso
      # @param icon [String] icona opzionale
      # @param html_options [Hash] opzioni HTML per il container
      def initialize(
        text:,
        theme: :default,
        orientation: :horizontal,
        style: :filled,
        size: :medium,
        shape: :rounded,
        clickable: false,
        selected: false,
        removable: false,
        icon: nil,
        **html_options
      )
        @text = text
        @theme = theme.to_sym
        @orientation = orientation.to_sym
        @style = style.to_sym
        @size = size.to_sym
        @shape = shape.to_sym
        @clickable = clickable
        @selected = selected
        @removable = removable
        @icon = icon
        @html_options = html_options
        
        validate_params
      end

      # Combina tutte le classi
      def combined_classes
        [
          "bui-tag", # Classe base per tutti i tag
          get_theme_class,
          get_orientation_class,
          get_style_class,
          get_size_class,
          get_shape_class,
          @clickable ? "bui-tag--clickable" : nil,
          @selected ? "bui-tag--selected" : nil,
          @removable ? "bui-tag--removable" : nil,
          @html_options[:class]
        ].compact.join(" ")
      end
      
      # Restituisce gli attributi HTML per il tag
      def tag_attributes
        attrs = @html_options.except(:class)
        attrs[:class] = combined_classes
        attrs
      end
      
      private
      
      def get_theme_class
        TAG_THEME[@theme] || TAG_THEME[:default]
      end
      
      def get_orientation_class
        TAG_ORIENTATION[@orientation] || TAG_ORIENTATION[:horizontal]
      end
      
      def get_style_class
        TAG_STYLE[@style] || TAG_STYLE[:filled]
      end
      
      def get_size_class
        TAG_SIZE[@size] || TAG_SIZE[:medium]
      end
      
      def get_shape_class
        TAG_SHAPE[@shape] || TAG_SHAPE[:rounded]
      end
      
      def validate_params
        validate_theme
        validate_orientation
        validate_style
        validate_size
        validate_shape
      end
      
      def validate_theme
        unless TAG_THEME.keys.include?(@theme)
          raise ArgumentError, "Il tema deve essere uno tra: #{TAG_THEME.keys.join(', ')}"
        end
      end
      
      def validate_orientation
        unless TAG_ORIENTATION.keys.include?(@orientation)
          raise ArgumentError, "L'orientamento deve essere uno tra: #{TAG_ORIENTATION.keys.join(', ')}"
        end
      end
      
      def validate_style
        unless TAG_STYLE.keys.include?(@style)
          raise ArgumentError, "Lo stile deve essere uno tra: #{TAG_STYLE.keys.join(', ')}"
        end
      end
      
      def validate_size
        unless TAG_SIZE.keys.include?(@size)
          raise ArgumentError, "La dimensione deve essere una tra: #{TAG_SIZE.keys.join(', ')}"
        end
      end
      
      def validate_shape
        unless TAG_SHAPE.keys.include?(@shape)
          raise ArgumentError, "La forma deve essere una tra: #{TAG_SHAPE.keys.join(', ')}"
        end
      end
    end
  end
end
