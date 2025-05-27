module BetterUi
  module General
    module Components
      module Container
        module ContainerHelper
          # Genera un container usando BetterUi::General::Container::Component
          #
          # @param html_content [String] contenuto HTML del container (opzionale)
          # @param fluid [Boolean] se il container deve essere fluid (full width)
          # @param max_width [Symbol] larghezza massima del container (:sm, :md, :lg, :xl, :xxl)
          # @param padding [Symbol] padding interno (:none, :small, :medium, :large)
          # @param background [Symbol] colore di sfondo (:white, :light, :dark, :transparent)
          # @param html_options [Hash] opzioni HTML aggiuntive
          # @return [String] HTML del container renderizzato
          #
          # @example Uso base
          #   bui_container(html_content: "Contenuto del container")
          #
          # @example Container fluid
          #   bui_container(
          #     html_content: "Contenuto full width",
          #     fluid: true
          #   )
          #
          # @example Container con larghezza massima
          #   bui_container(
          #     html_content: "Contenuto limitato",
          #     max_width: :lg,
          #     padding: :large
          #   )
          #
          # @example Con contenuto block
          #   bui_container(background: :light) do
          #     "<div>Il mio contenuto</div>".html_safe
          #   end
          def bui_container(
            html_content: nil,
            fluid: false,
            max_width: :lg,
            padding: :medium,
            background: :white,
            border: false,
            **html_options,
            &block
          )
            render BetterUi::General::Container::Component.new(
              html_content: html_content,
              fluid: fluid,
              max_width: max_width,
              padding: padding,
              background: background,
              border: border,
              **html_options
            ), &block
          end
        end
      end
    end
  end
end
