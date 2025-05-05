module BetterUi
  module General
    class TooltipComponent < ViewComponent::Base
      # Temi di tooltip disponibili
      TOOLTIP_THEME = {
        default: "bui-tooltip--default",
        white: "bui-tooltip--white",
        red: "bui-tooltip--red",
        rose: "bui-tooltip--rose",
        orange: "bui-tooltip--orange",
        green: "bui-tooltip--green",
        blue: "bui-tooltip--blue",
        yellow: "bui-tooltip--yellow",
        violet: "bui-tooltip--violet",
        gray: "bui-tooltip--gray"
      }

      # Posizioni disponibili
      TOOLTIP_POSITION = {
        top: "bui-tooltip--top",
        right: "bui-tooltip--right",
        bottom: "bui-tooltip--bottom",
        left: "bui-tooltip--left"
      }

      # Orientamenti disponibili
      TOOLTIP_ORIENTATION = {
        horizontal: "bui-tooltip--horizontal",
        vertical: "bui-tooltip--vertical"
      }

      # Stili disponibili
      TOOLTIP_STYLE = {
        filled: "bui-tooltip--filled",
        outline: "bui-tooltip--outline",
        light: "bui-tooltip--light",
        flat: "bui-tooltip--flat",
        ghost: "bui-tooltip--ghost"
      }

      # Dimensioni disponibili
      TOOLTIP_SIZE = {
        small: "bui-tooltip--small",
        medium: "bui-tooltip--medium",
        large: "bui-tooltip--large"
      }

      # Parametri del componente
      # @param tooltip_text [String] contenuto del tooltip
      # @param theme [Symbol] default, white, red, rose, orange, green, blue, yellow, violet, gray
      # @param position [Symbol] top, right, bottom, left
      # @param orientation [Symbol] horizontal, vertical
      # @param style [Symbol] filled, outline, light, flat, ghost
      # @param size [Symbol] small, medium, large
      # @param html_options [Hash] opzioni HTML per il container
      def initialize(
        tooltip_text:,
        theme: :default,
        position: :top,
        orientation: :horizontal,
        style: :filled,
        size: :medium,
        **html_options
      )
        @tooltip_text = tooltip_text
        @theme = theme.to_sym
        @position = position.to_sym
        @orientation = orientation.to_sym
        @style = style.to_sym
        @size = size.to_sym
        @html_options = html_options
        
        validate_params
      end
      
      # Combina tutte le classi
      def combined_classes
        [
          "bui-tooltip", # Classe base per tutti i tooltip
          get_theme_class,
          get_position_class,
          get_orientation_class,
          get_style_class,
          get_size_class,
          @html_options[:class]
        ].compact.join(" ")
      end
      
      # Restituisce gli attributi HTML per il tooltip
      def tooltip_attributes
        attrs = @html_options.except(:class)
        attrs[:class] = combined_classes
        attrs
      end
      
      private
      
      def get_theme_class
        TOOLTIP_THEME[@theme] || TOOLTIP_THEME[:default]
      end
      
      def get_position_class
        TOOLTIP_POSITION[@position] || TOOLTIP_POSITION[:top]
      end
      
      def get_orientation_class
        TOOLTIP_ORIENTATION[@orientation] || TOOLTIP_ORIENTATION[:horizontal]
      end
      
      def get_style_class
        TOOLTIP_STYLE[@style] || TOOLTIP_STYLE[:filled]
      end
      
      def get_size_class
        TOOLTIP_SIZE[@size] || TOOLTIP_SIZE[:medium]
      end
      
      def validate_params
        validate_theme
        validate_position
        validate_orientation
        validate_style
        validate_size
      end
      
      def validate_theme
        unless TOOLTIP_THEME.keys.include?(@theme)
          raise ArgumentError, "Il tema deve essere uno tra: #{TOOLTIP_THEME.keys.join(', ')}"
        end
      end
      
      def validate_position
        unless TOOLTIP_POSITION.keys.include?(@position)
          raise ArgumentError, "La posizione deve essere una tra: #{TOOLTIP_POSITION.keys.join(', ')}"
        end
      end
      
      def validate_orientation
        unless TOOLTIP_ORIENTATION.keys.include?(@orientation)
          raise ArgumentError, "L'orientamento deve essere uno tra: #{TOOLTIP_ORIENTATION.keys.join(', ')}"
        end
      end
      
      def validate_style
        unless TOOLTIP_STYLE.keys.include?(@style)
          raise ArgumentError, "Lo stile deve essere uno tra: #{TOOLTIP_STYLE.keys.join(', ')}"
        end
      end
      
      def validate_size
        unless TOOLTIP_SIZE.keys.include?(@size)
          raise ArgumentError, "La dimensione deve essere una tra: #{TOOLTIP_SIZE.keys.join(', ')}"
        end
      end
    end
  end
end
