module BetterUi
  module General
    module Modal
      class ModalComponent < ViewComponent::Base
        attr_reader :title, :theme, :size, :backdrop, :closable, :classes, :html_options

        # Classi base sempre presenti per il backdrop
        MODAL_BACKDROP_CLASSES = "fixed inset-0 z-50 flex items-center justify-center p-4 bg-black bg-opacity-50"

        # Classi base per il contenitore del modal
        MODAL_CONTAINER_CLASSES = "relative bg-white shadow-xl w-full"

        # Temi dell'header del modal con classi Tailwind dirette
        MODAL_THEME = {
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

        # Dimensioni con classi Tailwind dirette
        MODAL_SIZES = {
          small: "max-w-sm",
          medium: "max-w-md",
          large: "max-w-2xl"
        }

        # Border radius con classi Tailwind dirette
        MODAL_ROUNDED = {
          none: "rounded-none",
          small: "rounded-md",
          medium: "rounded-lg",
          large: "rounded-xl",
          full: "rounded-full"
        }

        # Inizializzazione del modal component
        def initialize(
          title:,
          theme: :default,
          size: :medium,
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
            get_modal_size_classes,
            get_modal_rounded_classes,
            @classes,
            @html_options[:class]
          ].compact.join(" ")
        end

        # Combina tutte le classi per l'header
        def header_classes
          [
            "flex items-center justify-between p-6",
            get_modal_theme_classes
          ].compact.join(" ")
        end

        def get_modal_theme_classes
          MODAL_THEME[@theme] || MODAL_THEME[:default]
        end

        def get_modal_size_classes
          MODAL_SIZES[@size] || MODAL_SIZES[:medium]
        end

        def get_modal_rounded_classes
          MODAL_ROUNDED[@rounded] || MODAL_ROUNDED[:medium]
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

        private

        def validate_params
          validate_theme
          validate_size
          validate_rounded
        end

        def validate_theme
          unless MODAL_THEME.keys.include?(@theme)
            raise ArgumentError, "Il tema deve essere uno tra: #{MODAL_THEME.keys.join(', ')}"
          end
        end

        def validate_size
          unless MODAL_SIZES.keys.include?(@size)
            raise ArgumentError, "La dimensione deve essere una tra: #{MODAL_SIZES.keys.join(', ')}"
          end
        end

        def validate_rounded
          unless MODAL_ROUNDED.keys.include?(@rounded)
            raise ArgumentError, "Il border radius deve essere uno tra: #{MODAL_ROUNDED.keys.join(', ')}"
          end
        end
      end
    end
  end
end
