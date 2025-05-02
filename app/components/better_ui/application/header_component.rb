module BetterUi
  module Application
    class HeaderComponent < ViewComponent::Base
      attr_reader :title, :subtitle, :breadcrumbs, :actions, :variant, :fixed, :container_class, :classes, :data, :show_breadcrumbs

      # Varianti di colore disponibili
      VARIANTS = {
        light: {
          bg: "bg-white border-gray-200",
          text: "text-gray-700",
          title: "text-gray-900",
          subtitle: "text-gray-500",
          border: "border-gray-200",
          breadcrumb_text: "text-gray-500",
          breadcrumb_hover: "hover:text-gray-700",
          breadcrumb_active: "text-gray-900",
          breadcrumb_divider: "text-gray-400"
        },
        dark: {
          bg: "bg-gray-800 border-gray-700",
          text: "text-gray-200",
          title: "text-white",
          subtitle: "text-gray-400",
          border: "border-gray-700",
          breadcrumb_text: "text-gray-400",
          breadcrumb_hover: "hover:text-white",
          breadcrumb_active: "text-white",
          breadcrumb_divider: "text-gray-500"
        },
        primary: {
          bg: "bg-orange-600",
          text: "text-white",
          title: "text-white",
          subtitle: "text-orange-100",
          border: "border-orange-500",
          breadcrumb_text: "text-orange-200",
          breadcrumb_hover: "hover:text-white",
          breadcrumb_active: "text-white",
          breadcrumb_divider: "text-orange-300"
        },
        transparent: {
          bg: "bg-transparent",
          text: "text-gray-700",
          title: "text-gray-900",
          subtitle: "text-gray-500",
          border: "border-gray-200",
          breadcrumb_text: "text-gray-500",
          breadcrumb_hover: "hover:text-gray-700",
          breadcrumb_active: "text-gray-900",
          breadcrumb_divider: "text-gray-400"
        },
        modern: {
          bg: "bg-white",
          text: "text-gray-700",
          title: "text-gray-900",
          subtitle: "text-gray-500",
          border: "border-gray-100",
          breadcrumb_text: "text-gray-500",
          breadcrumb_hover: "hover:text-gray-700",
          breadcrumb_active: "text-gray-900",
          breadcrumb_divider: "text-gray-400"
        }
      }

      # Opzioni per la posizione fissa
      FIXED_POSITIONS = {
        top: "sticky top-0 z-40",
        bottom: "sticky bottom-0 z-40"
      }

      # Inizializzazione del componente
      def initialize(
        title:,
        subtitle: nil,
        breadcrumbs: [],
        actions: [],
        variant: :modern,
        fixed: nil,
        container_class: "container mx-auto px-4",
        classes: nil,
        data: {},
        show_breadcrumbs: true
      )
        @title = title
        @subtitle = subtitle
        @breadcrumbs = breadcrumbs || []
        @actions = actions || []
        @variant = variant.to_sym
        @fixed = fixed.to_sym if fixed
        @container_class = container_class
        @classes = classes
        @data = data || {}
        @show_breadcrumbs = show_breadcrumbs
      end

      # Genera le classi per il container del header
      def header_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:modern])
        position_class = @fixed.present? ? FIXED_POSITIONS[@fixed] : nil

        cls = [
          "w-full py-4",
          styles[:bg],
          position_class,
          @classes
        ]

        # Aggiungi il bordo inferiore solo se non è trasparente
        cls << "border-b" unless @variant == :transparent

        cls.compact.join(" ")
      end

      # Genera classi per il titolo
      def title_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:modern])

        [
          "text-xl font-medium leading-6",
          styles[:title]
        ].join(" ")
      end

      # Genera classi per il sottotitolo
      def subtitle_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:modern])

        [
          "mt-1 text-sm",
          styles[:subtitle]
        ].join(" ")
      end

      # Genera classi per il breadcrumb
      def breadcrumb_container_classes
        "flex mb-3"
      end

      # Genera classi per i link del breadcrumb
      def breadcrumb_link_classes(active = false)
        styles = VARIANTS.fetch(@variant, VARIANTS[:modern])
        
        if active
          [
            "text-sm font-medium",
            styles[:breadcrumb_active]
          ].join(" ")
        else
          [
            "text-sm font-medium",
            styles[:breadcrumb_text],
            styles[:breadcrumb_hover]
          ].join(" ")
        end
      end

      # Genera classi per il divisore del breadcrumb
      def breadcrumb_divider_classes
        styles = VARIANTS.fetch(@variant, VARIANTS[:modern])
        
        [
          "mx-2 text-sm",
          styles[:breadcrumb_divider]
        ].join(" ")
      end

      # Genera classi per il contenitore delle azioni
      def actions_container_classes
        "mt-4 md:mt-0 flex flex-shrink-0 md:ml-4"
      end

      # Verifica se il componente deve essere reso
      def render?
        true
      end

      # Ritorna la lista delle azioni
      def action_items
        @actions
      end

      # Ritorna i breadcrumbs
      def has_breadcrumbs?
        @show_breadcrumbs && @breadcrumbs.present? && @breadcrumbs.any?
      end
    end
  end
end 