module BetterUi
  module General
    class TooltipComponent < ViewComponent::Base
      # Temi di tooltip disponibili
      TOOLTIP_THEME = {
        default: "bui-tooltip--default",
        light: "bui-tooltip--light",
        red: "bui-tooltip--red",
        rose: "bui-tooltip--rose",
        orange: "bui-tooltip--orange",
        green: "bui-tooltip--green",
        blue: "bui-tooltip--blue",
        yellow: "bui-tooltip--yellow",
        violet: "bui-tooltip--violet"
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
        xs: "bui-tooltip--xs",
        sm: "bui-tooltip--sm",
        md: "bui-tooltip--md",
        lg: "bui-tooltip--lg"
      }

      # Supporto multilinea
      TOOLTIP_MULTILINE = {
        true: "bui-tooltip--multiline"
      }

      # Opzioni di ritardo
      TOOLTIP_DELAY = {
        short: "bui-tooltip--delay-short",
        medium: "bui-tooltip--delay-medium",
        long: "bui-tooltip--delay-long"
      }

      # Supporto per dispositivi touch
      TOOLTIP_TOUCH = {
        true: "bui-tooltip--touch-enabled"
      }

      # Opzioni di raggio del bordo
      TOOLTIP_RADIUS = {
        none: "bui-tooltip--radius-none",
        small: "bui-tooltip--radius-small",
        medium: "bui-tooltip--radius-medium",
        large: "bui-tooltip--radius-large",
        full: "bui-tooltip--radius-full"
      }

      # Opzioni di animazione
      TOOLTIP_ANIMATION = {
        fade: "bui-tooltip--fade",
        scale: "bui-tooltip--scale"
      }

      # Opzioni di z-index
      TOOLTIP_Z_INDEX = {
        low: "bui-tooltip--z-low",
        medium: "bui-tooltip--z-medium",
        high: "bui-tooltip--z-high"
      }

      # Parametri del componente
      # @param tooltip_text [String] contenuto del tooltip
      # @param theme [Symbol] default, light, red, rose, orange, green, blue, yellow, violet
      # @param position [Symbol] top, right, bottom, left
      # @param orientation [Symbol] horizontal, vertical
      # @param style [Symbol] filled, outline, light, flat, ghost
      # @param size [Symbol] xs, sm, md, lg
      # @param multiline [Boolean] se true, il tooltip può contenere testo su più righe
      # @param delay [Symbol] short, medium, long - ritardo nell'apparizione/scomparsa
      # @param touch_enabled [Boolean] se true, il tooltip è ottimizzato per dispositivi touch
      # @param radius [Symbol] none, small, medium, large, full - raggio del bordo
      # @param animation [Symbol] fade, scale - tipo di animazione
      # @param z_index [Symbol] low, medium, high - livello di z-index
      # @param html_options [Hash] opzioni HTML per il container
      def initialize(
        tooltip_text:,
        theme: :default,
        position: :top,
        orientation: :horizontal,
        style: :filled,
        size: :md,
        multiline: false,
        delay: nil,
        touch_enabled: false,
        radius: :medium,
        animation: nil,
        z_index: :medium,
        **html_options
      )
        @tooltip_text = tooltip_text
        @theme = theme.to_sym
        @position = position.to_sym
        @orientation = orientation.to_sym
        @style = style.to_sym
        @size = size.to_sym
        @multiline = multiline
        @delay = delay&.to_sym
        @touch_enabled = touch_enabled
        @radius = radius.to_sym
        @animation = animation&.to_sym
        @z_index = z_index.to_sym
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
          get_multiline_class,
          get_delay_class,
          get_touch_enabled_class,
          get_radius_class,
          get_animation_class,
          get_z_index_class,
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
        TOOLTIP_SIZE[@size] || TOOLTIP_SIZE[:md]
      end

      def get_multiline_class
        @multiline ? TOOLTIP_MULTILINE[:true] : nil
      end

      def get_delay_class
        TOOLTIP_DELAY[@delay] if @delay
      end

      def get_touch_enabled_class
        @touch_enabled ? TOOLTIP_TOUCH[:true] : nil
      end

      def get_radius_class
        TOOLTIP_RADIUS[@radius] || TOOLTIP_RADIUS[:medium]
      end

      def get_animation_class
        TOOLTIP_ANIMATION[@animation] if @animation
      end

      def get_z_index_class
        TOOLTIP_Z_INDEX[@z_index] || TOOLTIP_Z_INDEX[:medium]
      end

      def validate_params
        validate_theme
        validate_position
        validate_orientation
        validate_style
        validate_size
        validate_delay if @delay
        validate_radius
        validate_animation if @animation
        validate_z_index
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

      def validate_delay
        unless TOOLTIP_DELAY.keys.include?(@delay)
          raise ArgumentError, "Il ritardo deve essere uno tra: #{TOOLTIP_DELAY.keys.join(', ')}"
        end
      end

      def validate_radius
        unless TOOLTIP_RADIUS.keys.include?(@radius)
          raise ArgumentError, "Il raggio del bordo deve essere uno tra: #{TOOLTIP_RADIUS.keys.join(', ')}"
        end
      end

      def validate_animation
        unless TOOLTIP_ANIMATION.keys.include?(@animation)
          raise ArgumentError, "L'animazione deve essere una tra: #{TOOLTIP_ANIMATION.keys.join(', ')}"
        end
      end

      def validate_z_index
        unless TOOLTIP_Z_INDEX.keys.include?(@z_index)
          raise ArgumentError, "Il z-index deve essere uno tra: #{TOOLTIP_Z_INDEX.keys.join(', ')}"
        end
      end
    end
  end
end
