module BetterUi
  module General
    class BreadcrumbComponent < ViewComponent::Base
      attr_reader :items, :separator, :size, :theme, :classes

      # Temi di colore disponibili
      THEMES = {
        default: {
          container: "text-white",
          separator: "text-gray-500"
        },
        white: {
          container: "text-black",
          separator: "text-gray-400"
        },
        red: {
          container: "text-white",
          separator: "text-red-300"
        },
        rose: {
          container: "text-white",
          separator: "text-rose-300"
        },
        orange: {
          container: "text-white",
          separator: "text-orange-300"
        },
        green: {
          container: "text-white",
          separator: "text-green-300"
        },
        blue: {
          container: "text-white", 
          separator: "text-blue-300"
        },
        yellow: {
          container: "text-black",
          separator: "text-yellow-600"
        },
        violet: {
          container: "text-white",
          separator: "text-violet-300"
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
        theme: :default,
        classes: nil
      )
        @items = items || []
        @separator = separator.to_sym
        @size = size.to_sym
        @theme = theme.to_sym
        @classes = classes
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
          THEMES.fetch(@theme, THEMES[:default])[:container],
          @classes
        ].compact.join(" ")
      end

      # Genera le classi per il separatore
      def separator_classes
        [
          "mx-2",
          THEMES.fetch(@theme, THEMES[:default])[:separator]
        ].compact.join(" ")
      end

      # Verifica se un item è l'ultimo (attivo)
      def last_item?(index)
        index == @items.length - 1
      end

      # Crea un componente link per l'item
      def link_for_item(item, active: false)
        label = item.is_a?(Hash) ? item[:label] : item.to_s
        href = item.is_a?(Hash) ? item[:url] : nil
        icon = item.is_a?(Hash) ? item[:icon] : nil
        
        BetterUi::General::LinkComponent.new(
          label: label,
          href: href,
          theme: @theme,
          icon: icon,
          active: active
        )
      end
      
      # Verifica se rendere il componente
      def render?
        @items.present? && @items.length > 0
      end
    end
  end
end 