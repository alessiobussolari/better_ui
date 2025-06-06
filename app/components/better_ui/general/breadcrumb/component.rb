module BetterUi
  module General
    module Breadcrumb
      class Component < ViewComponent::Base
        attr_reader :items, :separator, :size, :theme, :classes, :html_options

        # Classi base sempre presenti
        BREADCRUMB_BASE_CLASSES = "flex items-center flex-wrap"

        # Classi per lista e items
        BREADCRUMB_LIST_CLASSES = "flex flex-wrap items-center"
        BREADCRUMB_ITEM_CLASSES = "flex items-center"

        # Temi di breadcrumb con classi Tailwind dirette
        BREADCRUMB_THEME_CLASSES = {
          default: "text-white",
          white: "text-black",
          red: "text-white",
          rose: "text-white",
          orange: "text-white",
          green: "text-white",
          blue: "text-white",
          yellow: "text-black",
          violet: "text-white",
          gray: "text-gray-900"
        }

        # Classi per separatori con temi
        BREADCRUMB_SEPARATOR_THEME_CLASSES = {
          default: "text-gray-500",
          white: "text-gray-400",
          red: "text-red-300",
          rose: "text-rose-300",
          orange: "text-orange-300",
          green: "text-green-300",
          blue: "text-blue-300",
          yellow: "text-yellow-600",
          violet: "text-violet-300",
          gray: "text-gray-500"
        }

        # Dimensioni con classi Tailwind dirette
        BREADCRUMB_SIZE_CLASSES = {
          extra_small: "text-[0.65rem]",
          small: "text-xs",
          medium: "text-sm",
          large: "text-base"
        }

        # Separatori predefiniti
        BREADCRUMB_SEPARATOR_TYPES = {
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
          theme: :white,
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
          if BREADCRUMB_SEPARATOR_TYPES.key?(@separator)
            BREADCRUMB_SEPARATOR_TYPES[@separator]
          else
            @separator.to_s
          end
        end

        # Genera le classi per il container
        def container_classes
          [
            BREADCRUMB_BASE_CLASSES,
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

          BetterUi::General::Link::Component.new(
            label: label,
            href: href,
            theme: @theme,
            size: @size,
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
          [
            "mx-2",
            get_separator_theme_class
          ].compact.join(" ")
        end

        def get_separator_theme_class
          BREADCRUMB_SEPARATOR_THEME_CLASSES[@theme] || BREADCRUMB_SEPARATOR_THEME_CLASSES[:white]
        end

        # Verifica se rendere il componente
        def render?
          @items.present? && @items.length > 0
        end

        private

        def get_theme_class
          BREADCRUMB_THEME_CLASSES[@theme] || BREADCRUMB_THEME_CLASSES[:white]
        end

        def get_size_class
          BREADCRUMB_SIZE_CLASSES[@size] || BREADCRUMB_SIZE_CLASSES[:medium]
        end

        def validate_params
          validate_theme
          validate_size
          validate_separator
        end

        def validate_theme
          unless BREADCRUMB_THEME_CLASSES.keys.include?(@theme)
            raise ArgumentError, "Il tema deve essere uno tra: #{BREADCRUMB_THEME_CLASSES.keys.join(', ')}"
          end
        end

        def validate_size
          unless BREADCRUMB_SIZE_CLASSES.keys.include?(@size)
            raise ArgumentError, "La dimensione deve essere una tra: #{BREADCRUMB_SIZE_CLASSES.keys.join(', ')}"
          end
        end

        def validate_separator
          return if !@separator.is_a?(Symbol) || BREADCRUMB_SEPARATOR_TYPES.keys.include?(@separator)

          raise ArgumentError, "Il separatore predefinito deve essere uno tra: #{BREADCRUMB_SEPARATOR_TYPES.keys.join(', ')}"
        end
      end
    end
  end
end
