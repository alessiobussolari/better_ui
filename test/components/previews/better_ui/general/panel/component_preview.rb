module BetterUi
  module General
    module Panel
      class ComponentPreview < ViewComponent::Preview
        #
        # ## Utilizzo Base
        # Il componente Panel è un contenitore versatile per raggruppare contenuti correlati.
        # Supporta header, body e footer personalizzabili con diversi stili e temi.
        #
        # ## Casi d'Uso Comuni
        # - Contenitori per sezioni di contenuto in dashboard
        # - Card informative con titolo e contenuto
        # - Box con bordi e ombreggiature personalizzate
        # - Contenitori di form con intestazione e pulsanti nel footer
        # - Pannelli informativi con diversi livelli di enfasi
        #
        # ## Variabili Principali
        # - **title**: titolo opzionale del pannello
        # - **body**: contenuto principale
        # - **header**: contenuto personalizzato per l'header
        # - **footer**: contenuto per il footer
        # - **theme**: tema colore (default, white, red, rose, orange, green, blue, yellow, violet)
        # - **style**: stile del pannello (default, flat, raised, bordered)
        # - **padding**: dimensione del padding interno (none, small, medium, large)
        # - **radius**: border radius (none, small, medium, large, full)
        #
        # ## Esempi Codice
        # ```erb
        # <%= bui_panel(title: 'Informazioni utente', body: 'Contenuto del pannello') %>
        # <%= bui_panel(title: 'Statistiche', theme: :blue, style: :raised) %>
        # <%= bui_panel(title: 'Form', footer: '<button>Salva</button>', padding: :large) %>
        # <%= bui_panel do |p| %>
        #   <% p.with_header do %>Intestazione personalizzata<% end %>
        #   <% p.with_body do %>Contenuto principale<% end %>
        #   <% p.with_footer do %>Pulsanti e azioni<% end %>
        # <% end %>
        # ```
        # @!group Esempi Base

        # @label Con Helper
        # @param title text "Titolo del pannello (opzionale)"
        # @param body text "Contenuto del pannello (opzionale)"
        # @param header text "Header personalizzato (opzionale)"
        # @param footer text "Footer del pannello (opzionale)"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema di colore"
        # @param style select { choices: [default, flat, raised, bordered] } "Stile del pannello"
        # @param padding select { choices: [none, small, medium, large] } "Dimensione del padding interno"
        # @param radius select { choices: [none, small, medium, large, full] } "Raggio dei bordi"
        def default(
          title: "Titolo Pannello",
          body: "Questo è il contenuto del pannello.",
          header: "",
          footer: "",
          theme: :white,
          style: :default,
          padding: :medium,
          radius: :small
        )
          normalized = normalize_params!(
            title: title,
            body: body,
            header: header,
            footer: footer,
            theme: theme,
            style: style,
            padding: padding,
            radius: radius
          )

          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param title text "Titolo del pannello (opzionale)"
        # @param body text "Contenuto del pannello (opzionale)"
        # @param header text "Header personalizzato (opzionale)"
        # @param footer text "Footer del pannello (opzionale)"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema di colore"
        # @param style select { choices: [default, flat, raised, bordered] } "Stile del pannello"
        # @param padding select { choices: [none, small, medium, large] } "Dimensione del padding interno"
        # @param radius select { choices: [none, small, medium, large, full] } "Raggio dei bordi"
        def raw(
          title: "Titolo Pannello",
          body: "Questo è il contenuto del pannello.",
          header: "",
          footer: "",
          theme: :white,
          style: :default,
          padding: :medium,
          radius: :small
        )
          normalized = normalize_params!(
            title: title,
            body: body,
            header: header,
            footer: footer,
            theme: theme,
            style: style,
            padding: padding,
            radius: radius
          )

          render BetterUi::General::Panel::Component.new(
            title: normalized[:title],
            body: normalized[:body],
            header: normalized[:header],
            footer: normalized[:footer],
            theme: normalized[:theme],
            style: normalized[:style],
            padding: normalized[:padding],
            radius: normalized[:radius]
          )
        end

        # @!endgroup

        private

        def normalize_params!(options)
          # Normalizzazione parametri
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:style] = options[:style].to_sym if options[:style].is_a?(String)
          options[:padding] = options[:padding].to_sym if options[:padding].is_a?(String)
          options[:radius] = options[:radius].to_sym if options[:radius].is_a?(String)

          # Pulizia valori vuoti
          options[:title] = nil if options[:title].is_a?(String) && options[:title].strip.empty?
          options[:body] = nil if options[:body].is_a?(String) && options[:body].strip.empty?
          options[:header] = nil if options[:header].is_a?(String) && options[:header].strip.empty?
          options[:footer] = nil if options[:footer].is_a?(String) && options[:footer].strip.empty?

          options
        end
      end
    end
  end
end
