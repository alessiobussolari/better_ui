module BetterUi
  module General
    class BreadcrumbComponent < ViewComponent::Base
      attr_reader :items, :separator, :size, :theme, :classes, :html_options

      # Temi di breadcrumb disponibili
      BREADCRUMB_THEME = {
        default: "bui-breadcrumb--default",
        white: "bui-breadcrumb--white",
        red: "bui-breadcrumb--red",
        rose: "bui-breadcrumb--rose",
        orange: "bui-breadcrumb--orange",
        green: "bui-breadcrumb--green",
        blue: "bui-breadcrumb--blue",
        yellow: "bui-breadcrumb--yellow",
        violet: "bui-breadcrumb--violet",
        gray: "bui-breadcrumb--gray"
      }

      # Dimensioni disponibili
      BREADCRUMB_SIZE = {
        small: "bui-breadcrumb--small",
        medium: "bui-breadcrumb--medium",
        large: "bui-breadcrumb--large"
      }

      # Separatori predefiniti
      BREADCRUMB_SEPARATOR = {
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
        theme: :default,
        size: :medium,
        classes: nil,
        **html_options
      )
        @items = items || []
        @separator = separator.to_sym
        @theme = theme.to_sym
        @size = size.to_sym
        @classes = classes
        @html_options = html_options

        validate_params
      end

      # Restituisce il separatore come stringa
      def separator_text
        if BREADCRUMB_SEPARATOR.key?(@separator)
          BREADCRUMB_SEPARATOR[@separator]
        else
          @separator.to_s
        end
      end

      # Genera le classi per il container
      def container_classes
        [
          "bui-breadcrumb", # Classe base
          get_theme_class,
          get_size_class,
          @classes,
          @html_options[:class]
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

      # Restituisce gli attributi per il breadcrumb
      def breadcrumb_attributes
        attrs = { 
          "aria-label": "Breadcrumb",
          class: container_classes
        }

        # Aggiungi altri attributi HTML se presenti
        @html_options.except(:class).each do |key, value|
          attrs[key] = value
        end

        attrs
      end

      # Restituisce le classi CSS per il separatore
      def separator_classes
        "bui-breadcrumb__separator"
      end

      # Verifica se rendere il componente
      def render?
        @items.present? && @items.length > 0
      end

      private

      def get_theme_class
        BREADCRUMB_THEME[@theme] || BREADCRUMB_THEME[:default]
      end

      def get_size_class
        BREADCRUMB_SIZE[@size] || BREADCRUMB_SIZE[:medium]
      end


      def validate_params
        validate_theme
        validate_size
        validate_separator
      end

      def validate_theme
        unless BREADCRUMB_THEME.keys.include?(@theme)
          raise ArgumentError, "Il tema deve essere uno tra: #{BREADCRUMB_THEME.keys.join(', ')}"
        end
      end

      def validate_size
        unless BREADCRUMB_SIZE.keys.include?(@size)
          raise ArgumentError, "La dimensione deve essere una tra: #{BREADCRUMB_SIZE.keys.join(', ')}"
        end
      end


      def validate_separator
        return if !@separator.is_a?(Symbol) || BREADCRUMB_SEPARATOR.keys.include?(@separator)

        raise ArgumentError, "Il separatore predefinito deve essere uno tra: #{BREADCRUMB_SEPARATOR.keys.join(', ')}"
      end
    end
  end
end 
