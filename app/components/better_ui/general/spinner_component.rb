module BetterUi
  module General
    class SpinnerComponent < ViewComponent::Base
      attr_reader :size, :theme, :fullscreen, :label, :classes, :id

      # Temi di colore disponibili
      SPINNER_THEME = {
        default: "bui-spinner--default",
        white: "bui-spinner--white",
        red: "bui-spinner--red",
        rose: "bui-spinner--rose",
        orange: "bui-spinner--orange",
        green: "bui-spinner--green",
        blue: "bui-spinner--blue",
        yellow: "bui-spinner--yellow",
        violet: "bui-spinner--violet",
        gray: "bui-spinner--gray"
      }

      # Dimensioni disponibili
      SPINNER_SIZE = {
        small: "bui-spinner--small",
        medium: "bui-spinner--medium",
        large: "bui-spinner--large"
      }

      # Orientamenti disponibili
      SPINNER_ORIENTATION = {
        horizontal: "bui-spinner--horizontal",
        vertical: "bui-spinner--vertical"
      }

      # Stili disponibili
      SPINNER_STYLE = {
        default: "bui-spinner--style-default",
        outline: "bui-spinner--style-outline",
        filled: "bui-spinner--style-filled",
        dotted: "bui-spinner--style-dotted"
      }

      # Stati e comportamenti dello spinner
      SPINNER_STATE = {
        fullscreen: "bui-spinner--fullscreen"
      }

      # Inizializzazione del componente
      def initialize(
        size: :medium,
        theme: :default,
        orientation: :horizontal,
        style: :default,
        fullscreen: false,
        label: nil,
        **html_options
      )
        @size = size.to_sym
        @theme = theme.to_sym
        @orientation = orientation.to_sym
        @style = style.to_sym
        @fullscreen = fullscreen
        @label = label
        @html_options = html_options
        
        validate_params
      end

      # Combina tutte le classi
      def combined_classes
        [
          "bui-spinner", # Classe base per tutti gli spinner
          get_theme_class,
          get_size_class,
          get_orientation_class,
          get_style_class,
          @fullscreen ? SPINNER_STATE[:fullscreen] : nil,
          @html_options[:class]
        ].compact.join(" ")
      end
      
      def get_theme_class
        SPINNER_THEME[@theme] || SPINNER_THEME[:default]
      end
      
      def get_size_class
        SPINNER_SIZE[@size] || SPINNER_SIZE[:medium]
      end
      
      def get_orientation_class
        SPINNER_ORIENTATION[@orientation] || SPINNER_ORIENTATION[:horizontal]
      end
      
      def get_style_class
        SPINNER_STYLE[@style] || SPINNER_STYLE[:default]
      end
      
      # Restituisce gli attributi per lo spinner
      def spinner_attributes
        attrs = @html_options.except(:class)
        attrs[:class] = combined_classes
        attrs[:role] = "status"
        attrs
      end
      
      private
      
      def validate_params
        validate_theme
        validate_size
        validate_orientation
        validate_style
      end
      
      def validate_theme
        unless SPINNER_THEME.keys.include?(@theme)
          raise ArgumentError, "Il tema deve essere uno tra: #{SPINNER_THEME.keys.join(', ')}"
        end
      end
      
      def validate_size
        unless SPINNER_SIZE.keys.include?(@size)
          raise ArgumentError, "La dimensione deve essere una tra: #{SPINNER_SIZE.keys.join(', ')}"
        end
      end
      
      def validate_orientation
        unless SPINNER_ORIENTATION.keys.include?(@orientation)
          raise ArgumentError, "L'orientamento deve essere uno tra: #{SPINNER_ORIENTATION.keys.join(', ')}"
        end
      end
      
      def validate_style
        unless SPINNER_STYLE.keys.include?(@style)
          raise ArgumentError, "Lo stile deve essere uno tra: #{SPINNER_STYLE.keys.join(', ')}"
        end
      end
    end
  end
end 