module BetterUi
  module General
    class IconComponent < ViewComponent::Base
      # Dimensioni disponibili
      ICON_SIZES = {
        xsmall: "bui-icon-xsmall",
        small: "bui-icon-small",
        medium: "bui-icon-medium",
        large: "bui-icon-large",
        xlarge: "bui-icon-xlarge"
      }

      # Stili disponibili
      ICON_STYLES = {
        solid: "bui-icon-solid",
        regular: "bui-icon-regular",
        light: "bui-icon-light",
        brands: "bui-icon-brands",
        duotone: "bui-icon-duotone"
      }

      # Inizializzazione del componente
      def initialize(
        name:,
        size: :medium,
        style: :solid,
        fixed_width: false,
        spin: false,
        pulse: false,
        border: false,
        flip: nil,
        rotation: nil,
        classes: nil
      )
        @name = name.to_s.gsub('_', '-') # Convertiamo da snake_case a kebab-case per Font Awesome
        @size = size.to_sym
        @style = style.to_sym
        @fixed_width = fixed_width
        @spin = spin
        @pulse = pulse
        @border = border
        @flip = flip
        @rotation = rotation
        @classes = classes
      end

      # Classe CSS per lo stile dell'icona
      def style_class
        ICON_STYLES[@style] || ICON_STYLES[:solid]
      end

      # Classe CSS per la dimensione
      def size_class
        ICON_SIZES[@size] || ICON_SIZES[:medium]
      end

      # Classe per rotazione
      def rotation_class
        return "" unless @rotation
        "bui-icon-rotate-#{@rotation}"
      end

      # Classe per rovesciamento
      def flip_class
        return "" unless @flip
        "bui-icon-flip-#{@flip}"
      end

      # Classi per animazioni
      def animation_classes
        classes = []
        classes << "bui-icon-spin" if @spin
        classes << "bui-icon-pulse" if @pulse
        classes.join(" ")
      end

      # Classi per caratteristiche aggiuntive
      def feature_classes
        classes = []
        classes << "bui-icon-fw" if @fixed_width
        classes << "bui-icon-border" if @border
        classes.join(" ")
      end

      # Combinazione di tutte le classi
      def combined_classes
        [
          style_class,
          "fa-#{@name}", # Questa classe deve rimanere specifica di Font Awesome
          size_class,
          rotation_class,
          flip_class,
          animation_classes,
          feature_classes,
          @classes
        ].reject(&:blank?).join(" ")
      end
    end
  end
end 