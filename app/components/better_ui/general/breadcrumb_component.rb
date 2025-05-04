module BetterUi
  module General
    class BreadcrumbComponent < ViewComponent::Base
      attr_reader :items, :separator, :size, :theme, :classes

      # Temi di colore disponibili
      BREADCRUMB_THEME = {
        default: {
          container: "bui-breadcrumb--default",
          separator: "bui-breadcrumb__separator--default"
        },
        white: {
          container: "bui-breadcrumb--white",
          separator: "bui-breadcrumb__separator--white"
        },
        red: {
          container: "bui-breadcrumb--red",
          separator: "bui-breadcrumb__separator--red"
        },
        rose: {
          container: "bui-breadcrumb--rose",
          separator: "bui-breadcrumb__separator--rose"
        },
        orange: {
          container: "bui-breadcrumb--orange",
          separator: "bui-breadcrumb__separator--orange"
        },
        green: {
          container: "bui-breadcrumb--green",
          separator: "bui-breadcrumb__separator--green"
        },
        blue: {
          container: "bui-breadcrumb--blue", 
          separator: "bui-breadcrumb__separator--blue"
        },
        yellow: {
          container: "bui-breadcrumb--yellow",
          separator: "bui-breadcrumb__separator--yellow"
        },
        violet: {
          container: "bui-breadcrumb--violet",
          separator: "bui-breadcrumb__separator--violet"
        }
      }

      # Dimensioni disponibili
      BREADCRUMB_SIZES = {
        small: "bui-breadcrumb--small",
        medium: "bui-breadcrumb--medium",
        large: "bui-breadcrumb--large"
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
          "bui-breadcrumb",
          BREADCRUMB_SIZES.fetch(@size, BREADCRUMB_SIZES[:medium]),
          BREADCRUMB_THEME.fetch(@theme, BREADCRUMB_THEME[:default])[:container],
          @classes
        ].compact.join(" ")
      end

      # Genera le classi per il separatore
      def separator_classes
        [
          "bui-breadcrumb__separator",
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