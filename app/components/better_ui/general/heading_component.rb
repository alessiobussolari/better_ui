module BetterUi
  module General
    class HeadingComponent < ViewComponent::Base
      # Temi disponibili
      HEADING_THEME = {
        default: "bui-heading--default",
        white: "bui-heading--white",
        red: "bui-heading--red",
        rose: "bui-heading--rose",
        orange: "bui-heading--orange",
        green: "bui-heading--green",
        blue: "bui-heading--blue",
        yellow: "bui-heading--yellow",
        violet: "bui-heading--violet",
        gray: "bui-heading--gray"
      }

      # Allineamenti disponibili
      HEADING_ALIGN = {
        left: "bui-heading--left",
        center: "bui-heading--center",
        right: "bui-heading--right"
      }

      # Dimensioni disponibili
      HEADING_SIZE = {
        small: "bui-heading--small",
        medium: "bui-heading--medium",
        large: "bui-heading--large"
      }

      # Stili disponibili
      HEADING_STYLE = {
        normal: "bui-heading--normal",
        bold: "bui-heading--bold",
        italic: "bui-heading--italic",
        underline: "bui-heading--underline"
      }

      # Parametri del componente
      # @param level [Integer] livello del heading (1-6)
      # @param theme [Symbol] default, white, red, rose, orange, green, blue, yellow, violet, gray
      # @param align [Symbol] left, center, right
      # @param size [Symbol] small, medium, large
      # @param style [Symbol] normal, bold, italic, underline
      # @param icon [String] icona opzionale
      # @param subtitle [String] sottotitolo opzionale
      # @param with_divider [Boolean] mostra linea divisoria
      # @param html_options [Hash] opzioni HTML per il container
      def initialize(
        level: 2,
        theme: :default,
        align: :left,
        size: :medium,
        style: :normal,
        icon: nil,
        subtitle: nil,
        with_divider: false,
        **html_options
      )
        @level = level.to_i.clamp(1, 6)
        @theme = theme.to_sym
        @align = align.to_sym
        @size = size.to_sym
        @style = style.to_sym
        @icon = icon
        @subtitle = subtitle
        @with_divider = with_divider
        @html_options = html_options
        
        validate_params
      end

      # Combina tutte le classi
      def combined_classes
        [
          "bui-heading", # Classe base per tutti gli heading
          "bui-heading--#{@level}",
          get_theme_class,
          get_align_class,
          get_size_class,
          get_style_class,
          @with_divider ? "bui-heading--with-divider" : "",
          @html_options[:class]
        ].compact.join(" ")
      end

      # Restituisce gli attributi HTML per il heading
      def heading_attributes
        attrs = @html_options.except(:class)
        attrs[:class] = combined_classes
        attrs
      end
      
      private
      
      def get_theme_class
        HEADING_THEME[@theme] || HEADING_THEME[:default]
      end
      
      def get_align_class
        HEADING_ALIGN[@align] || HEADING_ALIGN[:left]
      end
      
      def get_size_class
        HEADING_SIZE[@size] || HEADING_SIZE[:medium]
      end
      
      def get_style_class
        HEADING_STYLE[@style] || HEADING_STYLE[:normal]
      end
      
      def validate_params
        validate_theme
        validate_align
        validate_size
        validate_style
      end
      
      def validate_theme
        unless HEADING_THEME.keys.include?(@theme)
          raise ArgumentError, "Il tema deve essere uno tra: #{HEADING_THEME.keys.join(', ')}"
        end
      end
      
      def validate_align
        unless HEADING_ALIGN.keys.include?(@align)
          raise ArgumentError, "L'allineamento deve essere uno tra: #{HEADING_ALIGN.keys.join(', ')}"
        end
      end
      
      def validate_size
        unless HEADING_SIZE.keys.include?(@size)
          raise ArgumentError, "La dimensione deve essere una tra: #{HEADING_SIZE.keys.join(', ')}"
        end
      end
      
      def validate_style
        unless HEADING_STYLE.keys.include?(@style)
          raise ArgumentError, "Lo stile deve essere uno tra: #{HEADING_STYLE.keys.join(', ')}"
        end
      end
    end
  end
end 