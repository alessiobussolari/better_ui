module BetterUi
  module General
    class IconComponent < ViewComponent::Base
      # Dimensioni disponibili
      SIZE_CLASSES = {
        xs: "fa-xs",
        sm: "fa-sm",
        md: "", # Default di Font Awesome
        lg: "fa-lg",
        xl: "fa-xl",
        "2xl": "fa-2xl"
      }

      # Stili disponibili
      STYLE_CLASSES = {
        solid: "fas",
        regular: "far",
        light: "fal",
        brands: "fab",
        duotone: "fad"
      }

      # Inizializzazione del componente
      def initialize(
        name:,
        size: :md,
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
        STYLE_CLASSES[@style] || STYLE_CLASSES[:solid]
      end

      # Classe CSS per la dimensione
      def size_class
        SIZE_CLASSES[@size] || SIZE_CLASSES[:md]
      end

      # Classe per rotazione
      def rotation_class
        return "" unless @rotation
        "fa-rotate-#{@rotation}"
      end

      # Classe per rovesciamento
      def flip_class
        return "" unless @flip
        "fa-flip-#{@flip}"
      end

      # Classi per animazioni
      def animation_classes
        classes = []
        classes << "fa-spin" if @spin
        classes << "fa-pulse" if @pulse
        classes.join(" ")
      end

      # Classi per caratteristiche aggiuntive
      def feature_classes
        classes = []
        classes << "fa-fw" if @fixed_width
        classes << "fa-border" if @border
        classes.join(" ")
      end

      # Combinazione di tutte le classi
      def combined_classes
        [
          style_class,
          "fa-#{@name}",
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