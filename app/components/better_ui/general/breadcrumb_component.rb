module BetterUi
  module General
    class BreadcrumbComponent < ViewComponent::Base
      attr_reader :items, :separator, :size, :variant, :classes, :inverse

      # Varianti di colore disponibili
      VARIANTS = {
        default: {
          container: "text-gray-600",
          item: "text-gray-500 hover:text-gray-700",
          active: "text-gray-900 font-medium",
          separator: "text-gray-400"
        },
        primary: {
          container: "text-orange-600",
          item: "text-orange-500 hover:text-orange-700",
          active: "text-orange-800 font-medium",
          separator: "text-orange-300"
        },
        light: {
          container: "text-gray-100",
          item: "text-gray-200 hover:text-white",
          active: "text-white font-medium",
          separator: "text-gray-300"
        }
      }

      # Dimensioni disponibili
      SIZES = {
        sm: "text-xs",
        md: "text-sm",
        lg: "text-base"
      }

      # Separatori predefiniti
      SEPARATORS = {
        slash: "/",
        chevron: "›",
        arrow: "→",
        dot: "•",
        pipe: "|"
      }

      # Inizializzazione del componente
      def initialize(
        items: [],
        separator: :chevron, 
        size: :md,
        variant: :default,
        classes: nil,
        inverse: false
      )
        @items = items || []
        @separator = separator.to_sym
        @size = size.to_sym
        @variant = variant.to_sym
        @classes = classes
        @inverse = inverse
      end

      # Restituisce il separatore come stringa
      def separator_text
        if SEPARATORS.key?(@separator)
          SEPARATORS[@separator]
        else
          @separator.to_s
        end
      end

      # Genera le classi per il container
      def container_classes
        [
          "flex items-center flex-wrap",
          SIZES.fetch(@size, SIZES[:md]),
          VARIANTS.fetch(@variant, VARIANTS[:default])[:container],
          @inverse ? "bg-gray-800 p-2 rounded" : "",
          @classes
        ].compact.join(" ")
      end

      # Genera le classi per un elemento
      def item_classes(active = false)
        variant_classes = VARIANTS.fetch(@variant, VARIANTS[:default])
        
        if active
          variant_classes[:active]
        else
          variant_classes[:item]
        end
      end

      # Genera le classi per il separatore
      def separator_classes
        [
          "mx-2",
          VARIANTS.fetch(@variant, VARIANTS[:default])[:separator]
        ].compact.join(" ")
      end

      # Verifica se un item è l'ultimo (attivo)
      def last_item?(index)
        index == @items.length - 1
      end

      # Formatta il testo dell'item
      def item_text(item)
        item.is_a?(Hash) ? item[:label] : item.to_s
      end

      # Restituisce l'URL dell'item
      def item_url(item)
        item.is_a?(Hash) ? item[:url] : nil
      end

      # Restituisce l'icona dell'item se presente
      def item_icon(item)
        return nil unless item.is_a?(Hash) && item[:icon].present?
        
        if item[:icon].is_a?(String)
          render BetterUi::General::IconComponent.new(name: item[:icon])
        else
          item[:icon] # Assumiamo che sia già un componente renderizzato
        end
      end

      # Verifica se rendere il componente
      def render?
        @items.present? && @items.length > 0
      end
    end
  end
end 