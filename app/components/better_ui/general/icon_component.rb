module BetterUi
  module General
    class IconComponent < ViewComponent::Base
      # Dimensioni disponibili
      ICON_SIZES = {
        xsmall: "bui-icon--xs",
        tiny: "bui-icon--xs",
        small: "bui-icon--sm",
        medium: "bui-icon--md",
        large: "bui-icon--lg",
        xlarge: "bui-icon--xl"
      }

      # Colori disponibili
      ICON_THEMES = {
        default: "bui-icon--default",
        white: "bui-icon--white",
        red: "bui-icon--red",
        rose: "bui-icon--rose",
        orange: "bui-icon--orange",
        green: "bui-icon--green",
        blue: "bui-icon--blue",
        yellow: "bui-icon--yellow",
        violet: "bui-icon--violet"
      }

      # Inizializzazione del componente
      def initialize(
        name:,
        size: :medium,
        color: :default,
        fixed_width: false,
        spin: false,
        pulse: false,
        solid: false,
        solid_color: false,
        classes: nil
      )
        @name = name.to_s.gsub('_', '-') # Convertiamo da snake_case a kebab-case per Font Awesome
        @size = size.to_sym
        @color = color.to_sym
        @fixed_width = fixed_width
        @spin = spin
        @pulse = pulse
        @solid = solid
        @solid_color = solid_color
        @classes = classes
      end

      # Classe CSS per il colore
      def color_class
        ICON_THEMES[@color] || ICON_THEMES[:default]
      end

      # Classe CSS per la dimensione
      def size_class
        ICON_SIZES[@size] || ICON_SIZES[:medium]
      end

      # Combinazione di tutte le classi
      def combined_classes
        [
          "bui-icon",
          "fa-#{@name}", # Questa classe deve rimanere specifica di Font Awesome
          size_class,
          color_class,
          @fixed_width ? "bui-icon--fixed-width" : nil,
          @spin ? "bui-icon--spin" : nil,
          @pulse ? "bui-icon--pulse" : nil,
          @solid ? "bui-icon--solid" : nil,
          @solid_color ? "bui-icon--solid-primary" : nil,
          @classes
        ].reject(&:blank?).join(" ")
      end
    end
  end
end 