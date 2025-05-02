module BetterUi
  module Application
    class SidebarComponent < ViewComponent::Base
      attr_reader :title, :variant, :items, :footer, :classes, :data, :collapsible, :collapsed_default, :position, :width, :overlay_on_mobile

      # Varianti di colore disponibili
      VARIANTS = {
        light: {
          bg: "bg-white",
          border: "border-gray-200",
          text: "text-gray-700",
          active_bg: "bg-gray-100",
          active_text: "text-orange-600",
          hover: "hover:bg-gray-50 hover:text-orange-500",
          divider: "border-gray-200",
          shadow: "shadow-md",
          icon: "text-gray-500",
          chevron: "text-gray-400"
        },
        dark: {
          bg: "bg-gray-800",
          border: "border-gray-700",
          text: "text-gray-200",
          active_bg: "bg-gray-700",
          active_text: "text-white",
          hover: "hover:bg-gray-700 hover:text-white",
          divider: "border-gray-700",
          shadow: "shadow-lg",
          icon: "text-gray-400",
          chevron: "text-gray-500"
        },
        primary: {
          bg: "bg-orange-600",
          border: "border-orange-700",
          text: "text-white",
          active_bg: "bg-orange-700",
          active_text: "text-white",
          hover: "hover:bg-orange-700",
          divider: "border-orange-500",
          shadow: "shadow-lg",
          icon: "text-orange-300",
          chevron: "text-orange-400"
        },
        blue: {
          bg: "bg-blue-800",
          border: "border-blue-700",
          text: "text-gray-100",
          active_bg: "bg-blue-700",
          active_text: "text-white",
          hover: "hover:bg-blue-700 hover:text-white",
          divider: "border-blue-700",
          shadow: "shadow-lg",
          icon: "text-blue-300",
          chevron: "text-blue-400"
        }
      }

      # Dimensioni disponibili per la sidebar
      WIDTHS = {
        narrow: "w-64",
        medium: "w-72",
        wide: "w-80",
        custom: "" # La larghezza custom viene specificata nelle classi aggiuntive
      }

      # Posizioni disponibili
      POSITIONS = {
        left: "left-0",
        right: "right-0"
      }

      # Inizializzazione del componente
      def initialize(
        title: nil,
        variant: :light,
        items: [],
        footer: nil,
        classes: nil,
        data: {},
        collapsible: true,
        collapsed_default: false,
        position: :left,
        width: :medium,
        overlay_on_mobile: true
      )
        @title = title
        @variant = variant.to_sym
        @items = items || []
        @footer = footer
        @classes = classes
        @data = data || {}
        @collapsible = collapsible
        @collapsed_default = collapsed_default
        @position = position.to_sym
        @width = width.to_sym
        @overlay_on_mobile = overlay_on_mobile

        # Aggiungiamo controller Stimulus per la gestione della sidebar
        @data[:controller] = "sidebar" if @data[:controller].blank?
        @data[:sidebar_position_value] = @position.to_s
        @data[:sidebar_collapsed_value] = @collapsed_default.to_s
        @data[:sidebar_overlay_on_mobile_value] = @overlay_on_mobile.to_s
      end

      # Genera le classi per il container della sidebar
      def container_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:light])
        width_class = WIDTHS.fetch(@width, WIDTHS[:medium])
        position_class = POSITIONS.fetch(@position, POSITIONS[:left])

        [
          "h-screen relative z-40",
          styles[:bg],
          styles[:border],
          @position == :left ? "border-r" : "border-l",
          styles[:shadow],
          width_class,
          position_class,
          @classes,
          "transition-transform duration-300 ease-in-out transform",
          "flex flex-col"
        ].compact.join(" ")
      end

      # Genera le classi per l'overlay
      def overlay_classes
        [
          "fixed inset-0 bg-black bg-opacity-50 z-30",
          "transition-opacity duration-300 ease-in-out",
          "hidden"
        ].join(" ")
      end

      # Genera le classi per il pulsante del toggle
      def toggle_button_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:light])
        position_class = @position == :left ? "right-0 -mr-3" : "left-0 -ml-3"

        [
          "absolute top-16",
          position_class,
          "z-50 flex items-center justify-center",
          "w-6 h-12 rounded-lg",
          styles[:bg],
          styles[:border],
          "cursor-pointer shadow-lg",
          "transform transition-transform duration-300 ease-in-out"
        ].compact.join(" ")
      end

      # Genera le classi per l'intestazione
      def header_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:light])

        [
          "px-4 py-4 flex items-center justify-between",
          styles[:border],
          "border-b"
        ].join(" ")
      end

      # Genera le classi per i link nel menu
      def menu_item_classes(active = false, nested = false, has_children = false)
        styles = VARIANTS.fetch(@variant, VARIANTS[:light])
        
        padding_left = nested ? "pl-10" : "pl-4"
        
        if active
          [
            "flex items-center py-2 px-4 #{padding_left} pr-4",
            styles[:active_bg],
            styles[:active_text],
            "font-medium"
          ].join(" ")
        else
          [
            "flex items-center py-2 px-4 #{padding_left} pr-4",
            styles[:text],
            styles[:hover],
            has_children ? "cursor-pointer" : ""
          ].join(" ")
        end
      end

      # Genera le classi per i separatori
      def divider_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:light])
        
        [
          "my-2 border-t",
          styles[:divider]
        ].join(" ")
      end

      # Genera le classi per il footer
      def footer_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:light])
        
        [
          "mt-auto px-4 py-4",
          styles[:border],
          "border-t"
        ].join(" ")
      end

      # Genera le classi per le icone
      def icon_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:light])
        
        [
          "mr-3",
          styles[:icon]
        ].join(" ")
      end

      # Genera le classi per la label della voce di menu
      def item_label_classes
        [
          "flex-1"
        ].join(" ")
      end

      # Genera le classi per il badge nella voce di menu
      def badge_classes(type = :default)
        badge_types = {
          default: "bg-gray-200 text-gray-800",
          primary: "bg-orange-100 text-orange-800",
          success: "bg-green-100 text-green-800",
          warning: "bg-yellow-100 text-yellow-800",
          danger: "bg-red-100 text-red-800",
          info: "bg-blue-100 text-blue-800"
        }
        
        [
          "px-2 py-0.5 text-xs rounded-full",
          badge_types.fetch(type.to_sym, badge_types[:default])
        ].join(" ")
      end

      # Genera le classi per icona chevron
      def chevron_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:light])
        
        [
          "ml-auto",
          styles[:chevron]
        ].join(" ")
      end

      # Verifica se la sidebar deve essere resa
      def render?
        true
      end

      # Determina se un elemento dovrebbe essere considerato attivo
      def active_item?(item)
        item[:active] == true
      end

      # Verifica se un elemento ha figli
      def has_children?(item)
        item[:children].present? && item[:children].is_a?(Array) && item[:children].any?
      end

      # Verifica se un elemento ha un badge
      def has_badge?(item)
        item[:badge].present?
      end

      # Ottiene il tipo di badge per un elemento
      def badge_type(item)
        return :default unless item[:badge].is_a?(Hash)
        (item[:badge][:type] || :default).to_sym
      end

      # Ottiene il testo del badge per un elemento
      def badge_text(item)
        return item[:badge].to_s unless item[:badge].is_a?(Hash)
        item[:badge][:text].to_s
      end
    end
  end
end 