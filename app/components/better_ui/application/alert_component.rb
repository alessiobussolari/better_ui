module BetterUi
  module Application
    class AlertComponent < ViewComponent::Base
      attr_reader :title, :message, :variant, :icon, :dismissible, :classes, :data, :icon_position, :outline, :rounded

      # Varianti di colore disponibili
      VARIANTS = {
        default: {
          bg: "bg-black",
          border: "border-gray-900",
          title: "text-white",
          text: "text-white",
          icon: "text-white",
          close: "text-white hover:bg-gray-800"
        },
        white: {
          bg: "bg-white",
          border: "border-gray-200",
          title: "text-black",
          text: "text-black",
          icon: "text-black",
          close: "text-black hover:bg-gray-100"
        },
        red: {
          bg: "bg-red-500",
          border: "border-red-600",
          title: "text-white",
          text: "text-white",
          icon: "text-white",
          close: "text-white hover:bg-red-600"
        },
        rose: {
          bg: "bg-rose-500",
          border: "border-rose-600",
          title: "text-white",
          text: "text-white",
          icon: "text-white",
          close: "text-white hover:bg-rose-600"
        },
        orange: {
          bg: "bg-orange-500",
          border: "border-orange-600",
          title: "text-white",
          text: "text-white",
          icon: "text-white",
          close: "text-white hover:bg-orange-600"
        },
        green: {
          bg: "bg-green-500",
          border: "border-green-600",
          title: "text-white",
          text: "text-white",
          icon: "text-white",
          close: "text-white hover:bg-green-600"
        },
        blue: {
          bg: "bg-blue-500",
          border: "border-blue-600",
          title: "text-white",
          text: "text-white",
          icon: "text-white",
          close: "text-white hover:bg-blue-600"
        },
        yellow: {
          bg: "bg-yellow-500",
          border: "border-yellow-600",
          title: "text-black",
          text: "text-black",
          icon: "text-black",
          close: "text-black hover:bg-yellow-600"
        },
        violet: {
          bg: "bg-violet-500",
          border: "border-violet-600",
          title: "text-white",
          text: "text-white",
          icon: "text-white",
          close: "text-white hover:bg-violet-600"
        }
      }

      # Icone predefinite per ciascuna variante
      DEFAULT_ICONS = {
        default: "bell",
        white: "info-circle",
        red: "exclamation-circle",
        rose: "exclamation-circle",
        orange: "bell",
        green: "check-circle",
        blue: "info-circle",
        yellow: "exclamation-triangle",
        violet: "shield-exclamation"
      }

      # Posizioni possibili per le icone
      ICON_POSITIONS = [:left, :top]

      # Inizializzazione del componente
      def initialize(
        title: nil,
        message: nil,
        variant: :default,
        icon: nil, 
        dismissible: false,
        classes: nil,
        data: {},
        icon_position: :left,
        outline: false,
        rounded: :sm
      )
        @title = title
        @message = message
        @variant = variant.to_sym
        @icon = icon
        @dismissible = dismissible
        @classes = classes
        @data = data
        @icon_position = icon_position.to_sym
        @outline = outline
        @rounded = rounded.to_sym
      end

      # Genera l'icona in base alla variante se non specificata
      def effective_icon
        return @icon if @icon.present?
        DEFAULT_ICONS[@variant] || DEFAULT_ICONS[:default]
      end

      # Genera le classi per il container
      def container_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:default])
        
        base_classes = ["p-4 mb-4 flex border"]
        base_classes << get_border_radius_class
        
        [
          *base_classes,
          styles[:bg],
          styles[:border],
          @icon_position == :top ? "flex-col" : "items-start",
          @classes
        ].compact.join(" ")
      end

      # Genera il border-radius
      def get_border_radius_class
        ThemeHelper::BORDER_RADIUS[@rounded] || ThemeHelper::BORDER_RADIUS[:sm]
      end

      # Genera le classi per il titolo
      def title_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:default])
        
        [
          "font-medium",
          styles[:title]
        ].compact.join(" ")
      end

      # Genera le classi per il messaggio
      def message_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:default])
        
        [
          "mt-1",
          styles[:text]
        ].compact.join(" ")
      end

      # Genera le classi per l'icona
      def icon_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:default])
        
        [
          "flex-shrink-0",
          @icon_position == :left ? "mr-3 mt-0.5" : "mb-3",
          styles[:icon]
        ].compact.join(" ")
      end

      # Genera le classi per il pulsante di chiusura
      def close_button_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:default])
        
        [
          "ml-auto -mr-1.5 -mt-1.5 inline-flex h-8 w-8 rounded-lg p-1.5 focus:ring-2 focus:ring-gray-400",
          styles[:close]
        ].compact.join(" ")
      end

      # Genera le classi per il contenuto
      def content_classes
        "flex-1"
      end

      # Verifica se il componente deve essere reso
      def render?
        @title.present? || @message.present? || content.present?
      end
    end
  end
end 