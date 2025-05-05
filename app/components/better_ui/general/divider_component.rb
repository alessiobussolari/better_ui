module BetterUi
  module General
    class DividerComponent < ViewComponent::Base
      # Temi di divider disponibili con classi CSS personalizzate
      DIVIDER_THEME = {
        default: "bui-divider--default",
        white: "bui-divider--white",
        red: "bui-divider--red",
        rose: "bui-divider--rose",
        orange: "bui-divider--orange",
        green: "bui-divider--green",
        blue: "bui-divider--blue",
        yellow: "bui-divider--yellow",
        violet: "bui-divider--violet",
        gray: "bui-divider--gray"
      }
      
      # Orientamento del divider
      DIVIDER_ORIENTATION = {
        horizontal: "bui-divider--horizontal",
        vertical: "bui-divider--vertical"
      }
      
      # Stili di linea del divider
      DIVIDER_STYLE = {
        solid: "bui-divider--solid",
        dashed: "bui-divider--dashed",
        dotted: "bui-divider--dotted",
        double: "bui-divider--double"
      }
      
      # Varianti di dimensione
      DIVIDER_SIZE = {
        thin: "bui-divider--thin",
        medium: "bui-divider--medium",
        thick: "bui-divider--thick"
      }
      
      # @param theme [Symbol] tema del divider (:default, :white, etc.)
      # @param orientation [Symbol] orientamento del divider (:horizontal, :vertical)
      # @param style [Symbol] stile della linea (:solid, :dashed, :dotted, :double)
      # @param size [Symbol] dimensione della linea (:thin, :medium, :thick)
      # @param label [String] testo opzionale da mostrare al centro del divider
      # @param height [String] altezza per divider verticale (es. "100px", "100%")
      # @param classes [String] classi CSS aggiuntive
      # @param html_options [Hash] opzioni HTML per il container
      def initialize(
        theme: :default,
        orientation: :horizontal,
        style: :solid,
        size: :medium,
        label: nil,
        height: nil,
        classes: nil,
        **html_options
      )
        @theme = theme.to_sym
        @orientation = orientation.to_sym
        @style = style.to_sym
        @size = size.to_sym
        @label = label
        @height = height
        @classes = classes
        @html_options = html_options
        
        validate_params
      end
      
      # Combina tutte le classi
      def combined_classes
        [
          "bui-divider", # Classe base per tutti i divider
          get_theme_class,
          get_orientation_class,
          get_style_class,
          get_size_class,
          @label.present? ? "bui-divider--with-label" : nil,
          @classes,
          @html_options[:class]
        ].compact.join(" ")
      end
      
      # Genera gli attributi di stile inline necessari
      def inline_styles
        return nil unless @orientation == :vertical && @height.present?
        "height: #{@height};"
      end
      
      # Restituisce gli attributi per il divider
      def divider_attributes
        attrs = { 
          class: combined_classes
        }
        
        # Aggiungi stile inline se presente
        attrs[:style] = inline_styles if inline_styles.present?
        
        # Aggiungi altri attributi HTML se presenti
        @html_options.except(:class).each do |key, value|
          attrs[key] = value
        end
        
        attrs
      end
      
      private
      
      def get_theme_class
        DIVIDER_THEME[@theme] || DIVIDER_THEME[:default]
      end
      
      def get_orientation_class
        DIVIDER_ORIENTATION[@orientation] || DIVIDER_ORIENTATION[:horizontal]
      end
      
      def get_style_class
        DIVIDER_STYLE[@style] || DIVIDER_STYLE[:solid]
      end
      
      def get_size_class
        DIVIDER_SIZE[@size] || DIVIDER_SIZE[:medium]
      end
      
      def validate_params
        validate_theme
        validate_orientation
        validate_style
        validate_size
      end
      
      def validate_theme
        unless DIVIDER_THEME.keys.include?(@theme)
          raise ArgumentError, "Il tema deve essere uno tra: #{DIVIDER_THEME.keys.join(', ')}"
        end
      end
      
      def validate_orientation
        unless DIVIDER_ORIENTATION.keys.include?(@orientation)
          raise ArgumentError, "L'orientamento deve essere uno tra: #{DIVIDER_ORIENTATION.keys.join(', ')}"
        end
      end
      
      def validate_style
        unless DIVIDER_STYLE.keys.include?(@style)
          raise ArgumentError, "Lo stile deve essere uno tra: #{DIVIDER_STYLE.keys.join(', ')}"
        end
      end
      
      def validate_size
        unless DIVIDER_SIZE.keys.include?(@size)
          raise ArgumentError, "La dimensione deve essere una tra: #{DIVIDER_SIZE.keys.join(', ')}"
        end
      end
    end
  end
end
