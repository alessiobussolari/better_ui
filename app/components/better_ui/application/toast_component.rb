module BetterUi
  module Application
    class ToastComponent < ViewComponent::Base
      attr_reader :title, :message, :variant, :icon, :dismissible, :classes, :data, :position, :duration, :auto_hide

      # Varianti di colore disponibili
      VARIANTS = {
        primary: {
          bg: "bg-orange-50",
          border: "border-orange-300",
          title: "text-orange-800",
          text: "text-orange-700",
          icon: "text-orange-500",
          close: "text-orange-500 hover:bg-orange-100"
        },
        info: {
          bg: "bg-blue-50",
          border: "border-blue-300",
          title: "text-blue-800",
          text: "text-blue-700",
          icon: "text-blue-500",
          close: "text-blue-500 hover:bg-blue-100"
        },
        success: {
          bg: "bg-green-50",
          border: "border-green-300",
          title: "text-green-800",
          text: "text-green-700",
          icon: "text-green-500",
          close: "text-green-500 hover:bg-green-100"
        },
        warning: {
          bg: "bg-yellow-50",
          border: "border-yellow-300",
          title: "text-yellow-800",
          text: "text-yellow-700",
          icon: "text-yellow-500",
          close: "text-yellow-500 hover:bg-yellow-100"
        },
        danger: {
          bg: "bg-red-50",
          border: "border-red-300",
          title: "text-red-800",
          text: "text-red-700",
          icon: "text-red-500",
          close: "text-red-500 hover:bg-red-100"
        },
        dark: {
          bg: "bg-gray-800",
          border: "border-gray-700",
          title: "text-white",
          text: "text-gray-300",
          icon: "text-gray-400",
          close: "text-gray-400 hover:bg-gray-700"
        }
      }

      # Icone predefinite per ciascuna variante
      DEFAULT_ICONS = {
        primary: "bell",
        info: "info-circle",
        success: "check-circle",
        warning: "exclamation-triangle",
        danger: "exclamation-circle",
        dark: "shield-exclamation"
      }

      # Posizioni possibili per i toast
      POSITIONS = {
        "top-right": "top-right",
        "top-left": "top-left",
        "bottom-right": "bottom-right",
        "bottom-left": "bottom-left",
        "top-center": "top-center",
        "bottom-center": "bottom-center"
      }

      # Inizializzazione del componente
      def initialize(
        title: nil,
        message: nil,
        variant: :info,
        icon: nil, 
        dismissible: true,
        classes: nil,
        data: {},
        position: :"top-right",
        duration: 5000,
        auto_hide: true
      )
        @title = title
        @message = message
        @variant = variant.to_sym
        @icon = icon
        @dismissible = dismissible
        @classes = classes
        @data = data || {}
        @position = position.to_sym
        @duration = duration
        @auto_hide = auto_hide

        # Aggiungiamo dati per il comportamento del toast
        @data[:controller] = "toast" if @data[:controller].blank?
        @data[:toast_duration_value] = @duration if @auto_hide
        @data[:toast_auto_hide_value] = @auto_hide.to_s
        @data[:toast_position_value] = @position.to_s
      end

      # Genera l'icona in base alla variante se non specificata
      def effective_icon
        return @icon if @icon.present?
        DEFAULT_ICONS[@variant]
      end

      # Genera le classi per il container
      def container_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:info])
        position_class = POSITIONS.fetch(@position, POSITIONS[:"top-right"])
        
        [
          "fixed z-50 rounded-lg p-4 border shadow-lg",
          "transform transition-transform duration-300",
          "data-toast-enter-from-class='translate-y-2 opacity-0'",
          "data-toast-enter-to-class='translate-y-0 opacity-100'",
          "data-toast-leave-from-class='translate-y-0 opacity-100'",
          "data-toast-leave-to-class='translate-y-2 opacity-0'",
          styles[:bg],
          styles[:border],
          position_class,
          "min-w-[20rem] max-w-sm",
          "flex items-start",
          @classes
        ].compact.join(" ")
      end

      # Genera le classi per il titolo
      def title_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:info])
        
        [
          "font-medium",
          styles[:title]
        ].compact.join(" ")
      end

      # Genera le classi per il messaggio
      def message_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:info])
        
        [
          "mt-1",
          styles[:text]
        ].compact.join(" ")
      end

      # Genera le classi per l'icona
      def icon_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:info])
        
        [
          "flex-shrink-0",
          "mr-3 mt-0.5",
          styles[:icon]
        ].compact.join(" ")
      end

      # Genera le classi per il pulsante di chiusura
      def close_button_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:info])
        
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