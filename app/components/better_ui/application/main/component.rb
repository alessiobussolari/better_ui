# frozen_string_literal: true

module BetterUi
  module Application
    module Main
      class Component < BetterUi::Component
        attr_reader :padding, :inner_padding, :with_sidebar, :classes
        
        # Classi CSS per l'arrotondamento (necessita validazione)
        MAIN_ROUNDED_CLASSES = {
          none: "",
          sm: "rounded-lg",
          md: "rounded-xl",
          lg: "rounded-2xl",
          xl: "rounded-3xl",
          full: "rounded-full"
        }.freeze

        # Classi CSS per le ombre (necessita validazione)
        MAIN_SHADOW_CLASSES = {
          none: "",
          sm: "shadow-sm",
          md: "shadow-md",
          lg: "shadow-lg",
          xl: "shadow-xl"
        }.freeze

        # Larghezze sidebar disponibili (necessita validazione)
        MAIN_SIDEBAR_WIDTHS = {
          sm: "pl-48",
          md: "pl-64",
          lg: "pl-72",
          xl: "pl-80"
        }.freeze

        # Solo gli attributi che necessitano validazione e getter automatici
        configure_attributes({
          rounded: {
            var: :@rounded,
            default: :sm,
            constants: [:MAIN_ROUNDED_CLASSES],
            methods: [:get_rounded_class]
          },
          shadow: {
            var: :@shadow,
            default: :md,
            constants: [:MAIN_SHADOW_CLASSES],
            methods: [:get_shadow_class]
          },
          sidebar_width: {
            var: :@sidebar_width,
            default: :md,
            constants: [:MAIN_SIDEBAR_WIDTHS],
            methods: [:get_sidebar_width_class]
          }
        })

        def initialize(
          padding: true,
          inner_padding: true,
          rounded: :sm,
          shadow: :md,
          with_sidebar: true,
          sidebar_width: :md,
          classes: nil,
          **html_options
        )
          # Attributi semplici (non necessitano validazione)
          @padding = padding
          @inner_padding = inner_padding
          @with_sidebar = with_sidebar
          @classes = classes
          
          # Attributi configurabili (gestiti da configure_attributes)
          @rounded = rounded.to_sym
          @shadow = shadow.to_sym
          @sidebar_width = sidebar_width.to_sym
          @html_options = html_options

          validate_params
        end

        # Genera le classi CSS per il contenitore principale
        def main_classes
          [
            "min-h-screen bg-gray-50",
            layout_class,
            padding_class,
            @classes
          ].compact.join(" ")
        end

        # Genera le classi CSS per il contenitore interno
        def inner_classes
          [
            "h-[calc(100vh-81px)] p-4"
          ].compact.join(" ")
        end

        # Genera le classi CSS per il contenuto
        def content_classes
          [
            "h-full w-full bg-white overflow-y-auto",
            inner_padding_class,
            get_rounded_class,    # Metodo generato automaticamente
            get_shadow_class      # Metodo generato automaticamente
          ].compact.join(" ")
        end

        private

        # Classe per il layout con/senza sidebar
        def layout_class
          if @with_sidebar
            get_sidebar_width_class  # Metodo generato automaticamente
          else
            ""
          end
        end

        # Classe per il padding principale
        def padding_class
          @padding ? "p-6" : "p-0"
        end

        # Classe per il padding interno
        def inner_padding_class
          @inner_padding ? "p-6" : "p-0"
        end
      end
    end
  end
end
