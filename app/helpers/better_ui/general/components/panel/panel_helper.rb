module BetterUi
  module General
    module Components
      module Panel
        module PanelHelper
          # Genera un pannello usando BetterUi::General::Panel::Component
          #
          # @param title [String] titolo del pannello (opzionale)
          # @param body [String] contenuto HTML del pannello (opzionale)
          # @param header [String] header personalizzato (opzionale)
          # @param footer [String] footer del pannello (opzionale)
          # @param theme [Symbol] tema del colore (:default, :white, etc.)
          # @param style [Symbol] stile (:default, :flat, :raised, :bordered)
          # @param padding [Symbol] padding interno (:none, :small, :medium, :large)
          # @param radius [Symbol] raggio dei bordi (:none, :small, :medium, :large, :full)
          # @param html_options [Hash] opzioni HTML aggiuntive
          # @return [String] HTML del pannello renderizzato
          #
          # @example Uso base
          #   bui_panel(title: "Dashboard")
          #   bui_panel(body: "Contenuto del pannello")
          #
          # @example Pannello completo
          #   bui_panel(
          #     title: "Impostazioni",
          #     body: "Configura le tue preferenze",
          #     footer: "Ultimo aggiornamento: oggi",
          #     theme: :blue
          #   )
          #
          # @example Con header personalizzato
          #   bui_panel(
          #     header: "<h2>Header Custom</h2>",
          #     body: "Il mio contenuto",
          #     theme: :green,
          #     style: :raised
          #   )
          #
          # @example Pannello con stili avanzati
          #   bui_panel(
          #     title: "Card Premium",
          #     body: "Contenuto speciale",
          #     theme: :violet,
          #     style: :bordered,
          #     padding: :large,
          #     radius: :large,
          #     id: "premium-panel",
          #     class: "special-panel"
          #   )
          #
          # @example Con contenuto block
          #   bui_panel(title: "Lista Utenti", theme: :white) do
          #     "<ul><li>Utente 1</li><li>Utente 2</li></ul>".html_safe
          #   end
          def bui_panel(
            title: nil,
            body: nil,
            header: nil,
            footer: nil,
            theme: :white,
            style: :default,
            padding: :medium,
            radius: :small,
            **html_options,
            &block
          )
            render BetterUi::General::Panel::Component.new(
              title: title,
              body: body,
              header: header,
              footer: footer,
              theme: theme,
              style: style,
              padding: padding,
              radius: radius,
              **html_options
            ), &block
          end
        end
      end
    end
  end
end
