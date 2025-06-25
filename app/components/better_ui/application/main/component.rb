# frozen_string_literal: true

module BetterUi
  module Application
    module Main
      class Component < BetterUi::Component
        attr_reader :sidebar, :navbar, :classes
        
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
          }
        })

        def initialize(
          rounded: :sm,
          shadow: :md,
          sidebar: true,
          navbar: true,
          classes: nil,
          **html_options
        )
          # Attributi semplici boolean
          @sidebar = sidebar
          @navbar = navbar
          @classes = classes
          
          # Attributi configurabili (gestiti da configure_attributes)
          @rounded = rounded.to_sym
          @shadow = shadow.to_sym
          @html_options = html_options

          validate_params
        end

        # Genera le classi CSS per il contenitore principale
        def main_classes
          [
            "min-h-screen bg-gray-50",
            layout_class,
            @classes
          ].compact.join(" ")
        end

        # Genera le classi CSS per il contenitore interno
        def inner_classes
          [
            navbar_class
          ].compact.join(" ")
        end

        # Genera le classi CSS per il contenuto
        def content_classes
          [
            "h-full w-full bg-white overflow-y-auto p-6",
            get_rounded_class,    # Metodo generato automaticamente
            get_shadow_class      # Metodo generato automaticamente
          ].compact.join(" ")
        end

        private

        # Classe per il layout con/senza sidebar
        def layout_class
          @sidebar ? "pl-64" : ""
        end

        # Classe per la navbar
        def navbar_class
          @navbar ? "h-[calc(100vh-77px)] p-4" : "h-screen p-4"
        end
      end
    end
  end
end
