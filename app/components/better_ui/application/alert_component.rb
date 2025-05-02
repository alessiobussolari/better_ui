module BetterUi
  module Application
    class AlertComponent < ViewComponent::Base
      attr_reader :title, :message, :variant, :icon, :dismissible, :classes, :data, :icon_position, :outline

      # Varianti di colore disponibili
      VARIANTS = {
        primary: {
          bg: "bg-orange-50",
          border: "border-orange-300",
          title: "text-orange-800",
          text: "text-orange-700",
          icon: "text-orange-500",
          close: "text-orange-500 hover:bg-orange-100",
          outline_bg: "bg-white",
          outline_text: "text-orange-700"
        },
        info: {
          bg: "bg-blue-50",
          border: "border-blue-300",
          title: "text-blue-800",
          text: "text-blue-700",
          icon: "text-blue-500",
          close: "text-blue-500 hover:bg-blue-100",
          outline_bg: "bg-white",
          outline_text: "text-blue-700"
        },
        success: {
          bg: "bg-green-50",
          border: "border-green-300",
          title: "text-green-800",
          text: "text-green-700",
          icon: "text-green-500",
          close: "text-green-500 hover:bg-green-100",
          outline_bg: "bg-white",
          outline_text: "text-green-700"
        },
        warning: {
          bg: "bg-yellow-50",
          border: "border-yellow-300",
          title: "text-yellow-800",
          text: "text-yellow-700",
          icon: "text-yellow-500",
          close: "text-yellow-500 hover:bg-yellow-100",
          outline_bg: "bg-white",
          outline_text: "text-yellow-700"
        },
        danger: {
          bg: "bg-red-50",
          border: "border-red-300",
          title: "text-red-800",
          text: "text-red-700",
          icon: "text-red-500",
          close: "text-red-500 hover:bg-red-100",
          outline_bg: "bg-white",
          outline_text: "text-red-700"
        },
        dark: {
          bg: "bg-gray-800",
          border: "border-gray-700",
          title: "text-white",
          text: "text-gray-300",
          icon: "text-gray-400",
          close: "text-gray-400 hover:bg-gray-700",
          outline_bg: "bg-white",
          outline_text: "text-gray-800"
        },
        simple: {
          bg: "bg-white",
          border: "border-gray-200",
          title: "text-gray-800 font-semibold",
          text: "text-gray-600",
          icon: "text-gray-500",
          close: "text-gray-500 hover:bg-gray-100",
          outline_bg: "bg-white",
          outline_text: "text-gray-700"
        }
      }

      # Icone predefinite per ciascuna variante
      DEFAULT_ICONS = {
        primary: "bell",
        info: "info-circle",
        success: "check-circle",
        warning: "exclamation-triangle",
        danger: "exclamation-circle",
        dark: "shield-exclamation",
        simple: "info-circle"
      }

      # Posizioni possibili per le icone
      ICON_POSITIONS = [:left, :top]

      # Inizializzazione del componente
      def initialize(
        title: nil,
        message: nil,
        variant: :simple,
        icon: nil, 
        dismissible: false,
        classes: nil,
        data: {},
        icon_position: :left,
        outline: false
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
      end

      # Genera l'icona in base alla variante se non specificata
      def effective_icon
        return @icon if @icon.present?
        DEFAULT_ICONS[@variant]
      end

      # Genera le classi per il container
      def container_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:simple])
        
        base_classes = ["p-4 mb-4 flex"]
        
        if @variant == :simple
          base_classes << "border rounded-md"
        else
          base_classes << "rounded-lg border"
        end
        
        [
          *base_classes,
          @outline ? styles[:outline_bg] : styles[:bg],
          styles[:border],
          @icon_position == :top ? "flex-col" : "items-start",
          @classes
        ].compact.join(" ")
      end

      # Genera le classi per il titolo
      def title_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:simple])
        
        [
          @variant == :simple ? "font-semibold" : "font-medium",
          @outline ? styles[:outline_text] : styles[:title]
        ].compact.join(" ")
      end

      # Genera le classi per il messaggio
      def message_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:simple])
        
        [
          "mt-1",
          @outline ? styles[:outline_text] : styles[:text]
        ].compact.join(" ")
      end

      # Genera le classi per l'icona
      def icon_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:simple])
        
        [
          "flex-shrink-0",
          @icon_position == :left ? "mr-3 mt-0.5" : "mb-3",
          styles[:icon]
        ].compact.join(" ")
      end

      # Genera le classi per il pulsante di chiusura
      def close_button_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:simple])
        
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