module BetterUi
  module General
    class BadgeComponent < ViewComponent::Base
      attr_reader :label, :type, :size, :icon, :icon_position, :rounded, :notification, :outline, :classes, :id

      # Temi di colore disponibili
      BADGE_THEME = {
        default: "bui-badge-default",
        white: "bui-badge-white",
        red: "bui-badge-red",
        rose: "bui-badge-rose",
        orange: "bui-badge-orange",
        green: "bui-badge-green",
        blue: "bui-badge-blue",
        yellow: "bui-badge-yellow",
        violet: "bui-badge-violet",
        gray: "bui-badge-gray"
      }

      # Dimensioni disponibili
      BADGE_SIZES = {
        small: "bui-badge-size-small",
        medium: "bui-badge-size-medium",
        large: "bui-badge-size-large"
      }
      
      # Border radius disponibili
      BADGE_RADIUS = {
        none: "bui-badge-radius-none",
        small: "bui-badge-radius-small",
        medium: "bui-badge-radius-medium",
        large: "bui-badge-radius-large",
        full: "bui-badge-radius-full"
      }
      
      # Stati e varianti
      BADGE_VARIANTS = {
        outline: "bui-badge-outline",
        notification: "bui-badge-notification"
      }

      # Inizializzazione del componente
      def initialize(
        label: nil,
        type: :default,
        size: :medium,
        icon: nil,
        icon_position: :left,
        rounded: :medium,
        notification: false,
        outline: false,
        classes: nil,
        id: nil
      )
        @label = label
        @type = type.to_sym
        @size = size.to_sym
        @icon = icon
        @icon_position = icon_position.to_sym
        @rounded = rounded.to_sym
        @notification = notification
        @outline = outline
        @classes = classes
        @id = id
      end

      # Combina tutte le classi
      def combined_classes
        [
          "bui-badge", # Classe base per tutti i badge
          get_badge_type_class,
          get_badge_size_class,
          get_border_radius_class,
          @outline ? BADGE_VARIANTS[:outline] : "",
          @notification ? BADGE_VARIANTS[:notification] : "",
          @classes
        ].compact.join(" ")
      end
      
      def get_badge_type_class
        BADGE_THEME[@type] || BADGE_THEME[:default]
      end
      
      def get_badge_size_class
        BADGE_SIZES[@size] || BADGE_SIZES[:medium]
      end
      
      def get_border_radius_class
        BADGE_RADIUS[@rounded] || BADGE_RADIUS[:medium]
      end
      
      # Restituisce gli attributi per il badge
      def badge_attributes
        attrs = {
          class: combined_classes,
          id: @id
        }
        
        attrs
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
    end
  end
end 