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
        violet: "bui-spinner--violet"
      }

      # Dimensioni disponibili
      SPINNER_SIZES = {
        small: "bui-spinner--small",
        medium: "bui-spinner--medium",
        large: "bui-spinner--large"
      }

      # Stati e comportamenti dello spinner
      SPINNER_STATES = {
        fullscreen: "bui-spinner--fullscreen"
      }

      # Inizializzazione del componente
      def initialize(
        size: :medium,
        theme: :default,
        fullscreen: false,
        label: nil,
        classes: nil,
        id: nil
      )
        @size = size.to_sym
        @theme = theme.to_sym
        @fullscreen = fullscreen
        @label = label
        @classes = classes
        @id = id
      end

      # Combina tutte le classi
      def combined_classes
        [
          "bui-spinner", # Classe base per tutti gli spinner
          get_spinner_theme_class,
          get_spinner_size_class,
          @fullscreen ? SPINNER_STATES[:fullscreen] : "",
          @classes
        ].compact.join(" ")
      end
      
      def get_spinner_theme_class
        SPINNER_THEME[@theme] || SPINNER_THEME[:default]
      end
      
      def get_spinner_size_class
        SPINNER_SIZES[@size] || SPINNER_SIZES[:medium]
      end
      
      # Restituisce gli attributi per lo spinner
      def spinner_attributes
        attrs = {
          class: combined_classes,
          id: @id,
          role: "status"
        }
        
        attrs
      end
    end
  end
end 