module BetterUi
  module General
    class BreadcrumbComponent < ViewComponent::Base
      attr_reader :items, :separator, :size, :theme, :classes

      # Temi di colore disponibili
      BREADCRUMB_THEME = {
        default: {
          container: "bui-breadcrumb-default-container",
          separator: "bui-breadcrumb-default-separator"
        },
        white: {
          container: "bui-breadcrumb-white-container",
          separator: "bui-breadcrumb-white-separator"
        },
        red: {
          container: "bui-breadcrumb-red-container",
          separator: "bui-breadcrumb-red-separator"
        },
        rose: {
          container: "bui-breadcrumb-rose-container",
          separator: "bui-breadcrumb-rose-separator"
        },
        orange: {
          container: "bui-breadcrumb-orange-container",
          separator: "bui-breadcrumb-orange-separator"
        },
        green: {
          container: "bui-breadcrumb-green-container",
          separator: "bui-breadcrumb-green-separator"
        },
        blue: {
          container: "bui-breadcrumb-blue-container", 
          separator: "bui-breadcrumb-blue-separator"
        },
        yellow: {
          container: "bui-breadcrumb-yellow-container",
          separator: "bui-breadcrumb-yellow-separator"
        },
        violet: {
          container: "bui-breadcrumb-violet-container",
          separator: "bui-breadcrumb-violet-separator"
        }
      }

      # Dimensioni disponibili
      BREADCRUMB_SIZES = {
        small: "bui-breadcrumb-small",
        medium: "bui-breadcrumb-medium",
        large: "bui-breadcrumb-large"
      }

      # Separatori predefiniti
      BREADCRUMB_SEPARATORS = {
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
        size: :medium,
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
        if BREADCRUMB_SEPARATORS.key?(@separator)
          BREADCRUMB_SEPARATORS[@separator]
        else
          @separator.to_s
        end
      end

      # Genera le classi per il container
      def container_classes
        [
          "bui-breadcrumb-container",
          BREADCRUMB_SIZES.fetch(@size, BREADCRUMB_SIZES[:medium]),
          BREADCRUMB_THEME.fetch(@theme, BREADCRUMB_THEME[:default])[:container],
          @classes
        ].compact.join(" ")
      end

      # Genera le classi per il separatore
      def separator_classes
        [
          "bui-breadcrumb-separator",
          BREADCRUMB_THEME.fetch(@theme, BREADCRUMB_THEME[:default])[:separator]
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