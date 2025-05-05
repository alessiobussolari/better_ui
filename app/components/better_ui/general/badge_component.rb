module BetterUi
  module General
    class BadgeComponent < ViewComponent::Base
      attr_reader :label, :theme, :size, :shape, :style, :orientation, :variant, :icon, :icon_position, :classes, :id

      # Temi di badge disponibili
      BADGE_THEME = {
        default: "bui-badge--default",
        white: "bui-badge--white",
        red: "bui-badge--red",
        rose: "bui-badge--rose",
        orange: "bui-badge--orange",
        green: "bui-badge--green",
        blue: "bui-badge--blue",
        yellow: "bui-badge--yellow",
        violet: "bui-badge--violet",
        gray: "bui-badge--gray"
      }

      # Dimensioni disponibili
      BADGE_SIZE = {
        small: "bui-badge--small",
        medium: "bui-badge--medium",
        large: "bui-badge--large"
      }
      
      # Border radius disponibili
      BADGE_SHAPE = {
        square: "bui-badge--square",
        rounded: "bui-badge--rounded",
        pill: "bui-badge--pill"
      }
      
      # Stili disponibili
      BADGE_STYLE = {
        filled: "bui-badge--filled",
        outline: "bui-badge--outline",
        light: "bui-badge--light"
      }

      # Orientamenti disponibili
      BADGE_ORIENTATION = {
        horizontal: "bui-badge--horizontal",
        vertical: "bui-badge--vertical"
      }

      # Varianti di badge
      BADGE_VARIANT = {
        notification: "bui-badge--notification",
        counter: "bui-badge--counter",
        dot: "bui-badge--dot"
      }

      # @param label [String] Testo del badge
      # @param theme [Symbol] default, white, red, rose, orange, green, blue, yellow, violet, gray
      # @param size [Symbol] small, medium, large
      # @param shape [Symbol] square, rounded, pill
      # @param style [Symbol] filled, outline, light
      # @param orientation [Symbol] horizontal, vertical
      # @param variant [Symbol] nil, notification, counter, dot
      # @param icon [String] Nome icona (opzionale)
      # @param icon_position [Symbol] left, right
      # @param html_options [Hash] Opzioni HTML aggiuntive
      def initialize(
        label: nil,
        theme: :default,
        size: :medium,
        shape: :rounded,
        style: :filled,
        orientation: :horizontal,
        variant: nil,
        icon: nil,
        icon_position: :left,
        classes: nil,
        id: nil,
        **html_options
      )
        @label = label
        @theme = theme.to_sym
        @size = size.to_sym
        @shape = shape.to_sym
        @style = style.to_sym
        @orientation = orientation.to_sym
        @variant = variant&.to_sym
        @icon = icon
        @icon_position = icon_position.to_sym
        @classes = classes
        @id = id
        @html_options = html_options
        
        validate_params
      end

      # Combina tutte le classi
      def combined_classes
        [
          "bui-badge", # Classe base per tutti i badge
          get_theme_class,
          get_size_class,
          get_shape_class,
          get_style_class,
          get_orientation_class,
          get_variant_class,
          @classes,
          @html_options[:class]
        ].compact.join(" ")
      end
      
      def get_theme_class
        BADGE_THEME[@theme] || BADGE_THEME[:default]
      end
      
      def get_size_class
        BADGE_SIZE[@size] || BADGE_SIZE[:medium]
      end
      
      def get_shape_class
        BADGE_SHAPE[@shape] || BADGE_SHAPE[:rounded]
      end
      
      def get_style_class
        BADGE_STYLE[@style] || BADGE_STYLE[:filled]
      end
      
      def get_orientation_class
        BADGE_ORIENTATION[@orientation] || BADGE_ORIENTATION[:horizontal]
      end
      
      def get_variant_class
        @variant ? BADGE_VARIANT[@variant] : nil
      end
      
      # Restituisce gli attributi per il badge
      def badge_attributes
        attrs = {
          class: combined_classes,
          id: @id
        }
        
        # Aggiungi altri attributi HTML se presenti
        @html_options.except(:class).each do |key, value|
          attrs[key] = value
        end
        
        attrs
      end
      
      def icon_classes
        if @icon_position == :left
          "bui-badge__icon bui-badge__icon--left"
        else
          "bui-badge__icon bui-badge__icon--right"
        end
      end
      
      def text_classes
        "bui-badge__text"
      end
      
      # Helper per renderizzare le icone
      def render_icon(icon_name)
        # Mappa le dimensioni del badge alle dimensioni dell'icona
        icon_size = case @size
                   when :large
                     :small
                   when :small
                     :tiny
                   else
                     :tiny
                   end
        
        # Utilizziamo il componente Icon
        render BetterUi::General::IconComponent.new(
          name: icon_name,
          size: icon_size,
          fixed_width: true
        )
      end

      private

      def validate_params
        validate_theme
        validate_size
        validate_shape
        validate_style
        validate_orientation
        validate_variant
        validate_icon_position
      end

      def validate_theme
        unless BADGE_THEME.keys.include?(@theme)
          raise ArgumentError, "Il tema deve essere uno tra: #{BADGE_THEME.keys.join(', ')}"
        end
      end

      def validate_size
        unless BADGE_SIZE.keys.include?(@size)
          raise ArgumentError, "La dimensione deve essere una tra: #{BADGE_SIZE.keys.join(', ')}"
        end
      end

      def validate_shape
        unless BADGE_SHAPE.keys.include?(@shape)
          raise ArgumentError, "La forma deve essere una tra: #{BADGE_SHAPE.keys.join(', ')}"
        end
      end

      def validate_style
        unless BADGE_STYLE.keys.include?(@style)
          raise ArgumentError, "Lo stile deve essere uno tra: #{BADGE_STYLE.keys.join(', ')}"
        end
      end

      def validate_orientation
        unless BADGE_ORIENTATION.keys.include?(@orientation)
          raise ArgumentError, "L'orientamento deve essere uno tra: #{BADGE_ORIENTATION.keys.join(', ')}"
        end
      end

      def validate_variant
        return if @variant.nil?
        
        unless BADGE_VARIANT.keys.include?(@variant)
          raise ArgumentError, "La variante deve essere una tra: #{BADGE_VARIANT.keys.join(', ')}"
        end
      end

      def validate_icon_position
        valid_positions = [:left, :right]
        unless valid_positions.include?(@icon_position)
          raise ArgumentError, "La posizione dell'icona deve essere una tra: #{valid_positions.join(', ')}"
        end
      end
    end
  end
end 