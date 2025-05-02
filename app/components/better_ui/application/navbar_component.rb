module BetterUi
  module Application
    class NavbarComponent < ViewComponent::Base
      attr_reader :brand, :variant, :fixed, :container_class, :data, :classes, :items, :actions, :mobile_breakpoint

      # Varianti di colore disponibili
      VARIANTS = {
        light: {
          navbar: "bg-white border-gray-200 shadow-sm",
          text: "text-gray-700",
          hover: "hover:text-orange-500",
          active: "text-orange-600 border-orange-500",
          dropdown_bg: "bg-white",
          dropdown_hover: "hover:bg-gray-100",
          mobile_bg: "bg-white",
          mobile_divider: "border-gray-100"
        },
        dark: {
          navbar: "bg-gray-800 border-gray-700",
          text: "text-gray-200",
          hover: "hover:text-white",
          active: "text-white border-orange-500",
          dropdown_bg: "bg-gray-700",
          dropdown_hover: "hover:bg-gray-600",
          mobile_bg: "bg-gray-800",
          mobile_divider: "border-gray-700"
        },
        primary: {
          navbar: "bg-orange-600 border-orange-700",
          text: "text-white",
          hover: "hover:text-white hover:bg-orange-700",
          active: "text-white bg-orange-700 border-white",
          dropdown_bg: "bg-orange-700",
          dropdown_hover: "hover:bg-orange-800",
          mobile_bg: "bg-orange-600",
          mobile_divider: "border-orange-500"
        },
        transparent: {
          navbar: "bg-transparent",
          text: "text-gray-700",
          hover: "hover:text-orange-500",
          active: "text-orange-600 border-orange-500",
          dropdown_bg: "bg-white bg-opacity-90 backdrop-blur-sm",
          dropdown_hover: "hover:bg-gray-100",
          mobile_bg: "bg-white bg-opacity-90 backdrop-blur-sm",
          mobile_divider: "border-gray-100"
        }
      }

      # Opzioni per la posizione fissa
      FIXED_POSITIONS = {
        top: "fixed top-0 left-0 right-0 z-40",
        bottom: "fixed bottom-0 left-0 right-0 z-40"
      }

      # Opzioni per il breakpoint mobile
      MOBILE_BREAKPOINTS = [:sm, :md, :lg, :xl, :xxl]

      # Inizializzazione del componente
      def initialize(
        brand: nil,
        variant: :light,
        fixed: nil,
        container_class: "container mx-auto px-4",
        classes: nil,
        data: {},
        items: [],
        actions: [],
        mobile_breakpoint: :lg
      )
        @brand = brand
        @variant = variant.to_sym
        @fixed = fixed.to_sym if fixed
        @container_class = container_class
        @classes = classes
        @data = data || {}
        @items = items || []
        @actions = actions || []
        @mobile_breakpoint = mobile_breakpoint.to_sym

        # Aggiungiamo il controller Stimulus per la gestione del menu mobile
        @data[:controller] = "navbar" if @data[:controller].blank?
      end

      # Genera le classi per il container della navbar
      def navbar_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:light])
        position_class = @fixed.present? ? FIXED_POSITIONS[@fixed] : nil

        [
          "w-full",
          styles[:navbar],
          position_class,
          "border-b",
          @classes
        ].compact.join(" ")
      end

      # Genera classi per i link della navbar
      def nav_link_classes(active = false)
        styles = VARIANTS.fetch(@variant, VARIANTS[:light])

        base_classes = "block py-2 px-3 rounded md:p-0 md:hover:bg-transparent"
        
        if active
          [
            base_classes,
            styles[:active],
            "md:border-b-2 md:bg-transparent"
          ].join(" ")
        else
          [
            base_classes,
            styles[:text],
            styles[:hover]
          ].join(" ")
        end
      end

      # Genera classi per il dropdown
      def dropdown_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:light])

        [
          "absolute z-10 mt-2 rounded-lg shadow-lg py-1",
          styles[:dropdown_bg],
          "hidden group-hover:block"
        ].join(" ")
      end

      # Genera classi per i link nel dropdown
      def dropdown_link_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:light])

        [
          "block px-4 py-2 text-sm",
          styles[:text],
          styles[:dropdown_hover]
        ].join(" ")
      end

      # Genera la classe per il pulsante del menu mobile
      def mobile_toggle_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:light])

        [
          "inline-flex items-center p-2 ml-3 rounded-lg md:hidden",
          styles[:text],
          styles[:hover]
        ].join(" ")
      end

      # Genera classi per il menu mobile
      def mobile_menu_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:light])

        [
          "w-full md:flex md:w-auto",
          "hidden md:block", # Nascosto di default su mobile, visibile su desktop
          styles[:mobile_bg]
        ].join(" ")
      end

      # Genera la classe per il breakpoint mobile
      def mobile_breakpoint_class
        "md"
      end

      # Verifica se il componente deve essere reso
      def render?
        true
      end

      # Ritorna la lista degli elementi di navigazione
      def navigation_items
        @items
      end

      # Ritorna la lista delle azioni (es. pulsanti, ricerca)
      def action_items
        @actions
      end

      # Determina se un elemento dovrebbe essere considerato attivo
      def active_item?(item)
        item[:active] == true
      end

      # Verifica se un elemento ha un dropdown
      def has_dropdown?(item)
        item[:dropdown].present? && item[:dropdown].is_a?(Array) && item[:dropdown].any?
      end
    end
  end
end 