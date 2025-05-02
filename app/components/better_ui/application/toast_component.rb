module BetterUi
  module Application
    class ToastComponent < ViewComponent::Base
      attr_reader :title, :message, :variant, :icon, :dismissible, :classes, :data, :position, :duration, :auto_hide, :rounded

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
        variant: :default,
        icon: nil, 
        dismissible: true,
        classes: nil,
        data: {},
        position: :"top-right",
        duration: 5000,
        auto_hide: true,
        rounded: :sm
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
        @rounded = rounded.to_sym

        # Aggiungiamo dati per il comportamento del toast
        @data[:controller] = "toast" if @data[:controller].blank?
        @data[:toast_duration_value] = @duration if @auto_hide
        @data[:toast_auto_hide_value] = @auto_hide.to_s
        @data[:toast_position_value] = @position.to_s
      end

      # Genera l'icona in base alla variante se non specificata
      def effective_icon
        return @icon if @icon.present?
        DEFAULT_ICONS[@variant] || DEFAULT_ICONS[:default]
      end

      # Genera le classi per il container
      def container_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:default])
        position_class = POSITIONS.fetch(@position, POSITIONS[:"top-right"])
        
        [
          "fixed z-50 p-4 border shadow-lg",
          get_border_radius_class,
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
          "mr-3 mt-0.5",
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