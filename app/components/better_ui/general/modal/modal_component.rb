module BetterUi
  module General
    module Modal
      class ModalComponent < BetterUi::Component
        attr_reader :title, :backdrop, :closable, :classes, :html_options

        # Delega per rendere disponibile bui_button nel template
        delegate :bui_button, to: :helpers

        # Classi base sempre presenti per il backdrop
        MODAL_BACKDROP_CLASSES = "fixed inset-0 z-50 flex items-center justify-center p-4 bg-black bg-opacity-50"

        # Classi base per il contenitore del modal
        MODAL_CONTAINER_CLASSES = "relative bg-white shadow-xl w-full"

        # Temi dell'header del modal con classi Tailwind dirette
        MODAL_THEME_CLASSES = {
          default: "bg-gray-50 border-b border-gray-200 text-gray-900",
          white: "bg-white border-b border-gray-200 text-gray-900",
          red: "bg-red-50 border-b border-red-200 text-red-900",
          rose: "bg-rose-50 border-b border-rose-200 text-rose-900",
          orange: "bg-orange-50 border-b border-orange-200 text-orange-900",
          green: "bg-green-50 border-b border-green-200 text-green-900",
          blue: "bg-blue-50 border-b border-blue-200 text-blue-900",
          yellow: "bg-yellow-50 border-b border-yellow-200 text-yellow-900",
          violet: "bg-violet-50 border-b border-violet-200 text-violet-900"
        }

        # Dimensioni con classi Tailwind dirette - Sistema uniforme 7 livelli
        MODAL_SIZE_CLASSES = {
          xxs: "max-w-xs",       # Extra extra small
          xs: "max-w-sm",        # Extra small
          sm: "max-w-md",        # Small
          md: "max-w-lg",        # Medium (default)
          lg: "max-w-2xl",       # Large
          xl: "max-w-4xl",       # Extra large
          xxl: "max-w-6xl"       # Extra extra large
        }

        # Border radius con classi Tailwind dirette
        MODAL_ROUNDED_CLASSES = {
          none: "rounded-none",
          small: "rounded-md",
          medium: "rounded-lg",
          large: "rounded-xl",
          full: "rounded-full"
        }

        configure_attributes({
          theme: {
            var: :@theme,
            default: :default,
            constants: [:MODAL_THEME_CLASSES],
            methods: [:get_theme_class]
          },
          size: {
            var: :@size,
            default: :md,
            constants: [:MODAL_SIZE_CLASSES],
            methods: [:get_size_class]
          },
          rounded: {
            var: :@rounded,
            default: :medium,
            constants: [:MODAL_ROUNDED_CLASSES],
            methods: [:get_rounded_class]
          }
        })

        # Inizializzazione del modal component
        def initialize(
          title:,
          theme: :default,
          size: :md,
          rounded: :medium,
          backdrop: true,
          closable: true,
          classes: nil,
          **html_options
        )
          @title = title
          @theme = theme.to_sym
          @size = size.to_sym
          @rounded = rounded.to_sym
          @backdrop = backdrop
          @closable = closable
          @classes = classes
          @html_options = html_options

          validate_params
        end

        # Combina tutte le classi per il backdrop
        def backdrop_classes
          MODAL_BACKDROP_CLASSES
        end

        # Combina tutte le classi per il contenitore
        def container_classes
          [
            MODAL_CONTAINER_CLASSES,
            get_size_class,
            get_rounded_class,
            @classes,
            @html_options[:class]
          ].compact.join(" ")
        end

        # Combina tutte le classi per l'header
        def header_classes
          [
            "flex items-center justify-between p-6",
            get_theme_class
          ].compact.join(" ")
        end

        # Restituisce gli attributi per il backdrop
        def backdrop_attributes
          {
            class: backdrop_classes,
            'data-bui-modal-target': 'backdrop'
          }
        end

        # Restituisce gli attributi per il contenitore
        def container_attributes
          {
            class: container_classes,
            role: "dialog",
            "aria-modal": "true",
            "aria-labelledby": "modal-title",
            'data-bui-modal-target': 'container'
          }
        end

        # Restituisce gli attributi per l'header
        def header_attributes
          {
            class: header_classes
          }
        end

        # Verifica se rendere il componente
        def render?
          @title.present?
        end
      end
    end
  end
end
