module BetterUi
  module General
    module Components
      module Container
        module ContainerHelper
          # Genera un container usando BetterUi::General::Container::Component
          #
          # @param html_content [String] contenuto HTML del container (opzionale)
          # @param fluid [Boolean] se il container deve essere fluid (full width)
          # @param size [Symbol] dimensione del container (:xxs, :xs, :sm, :md, :lg, :xl, :xxl)
          # @param padding [Symbol] padding interno (:none, :xxs, :xs, :sm, :md, :lg, :xl, :xxl)
          # @param theme [Symbol] tema colore (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
          # @param border [Boolean] se aggiungere il bordo
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
          # @example Container con dimensione specifica
          #   bui_container(
          #     html_content: "Contenuto limitato",
          #     size: :lg,
          #     padding: :lg
          #   )
          #
          # @example Con contenuto block e tema
          #   bui_container(theme: :blue, border: true) do
          #     "<div>Il mio contenuto</div>".html_safe
          #   end
          def bui_container(
            html_content: nil,
            fluid: false,
            size: :lg,
            padding: :md,
            theme: :white,
            border: false,
            **html_options,
            &block
          )
            render BetterUi::General::Container::Component.new(
              html_content: html_content,
              fluid: fluid,
              size: size,
              padding: padding,
              theme: theme,
              border: border,
              **html_options
            ), &block
          end
        end
      end
    end
  end
end
