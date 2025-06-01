# frozen_string_literal: true

module BetterUi
  module General
    module Modal
      class ComponentPreview < ViewComponent::Preview
        # @notes
        #
        # ## Utilizzo Base
        # Il componente Modal fornisce un overlay modale per visualizzare contenuto in primo piano.
        # È progettato per dialoghi di conferma, form modali, o qualsiasi contenuto che richiede l'attenzione dell'utente.
        #
        # ## Casi d'Uso Comuni
        # - **Dialoghi di conferma**: Per confermare azioni distruttive come eliminazioni
        # - **Form modali**: Per inserimento dati senza cambiare pagina
        # - **Messaggi informativi**: Per mostrare dettagli o informazioni importanti
        # - **Gallerie di immagini**: Per visualizzare contenuto multimediale in overlay
        # - **Wizard step-by-step**: Per processi guidati multi-step
        #
        # ## Variabili Principali
        # - **title**: titolo del modal (obbligatorio)
        # - **theme**: tema colore header (default, white, red, rose, orange, green, blue, yellow, violet)
        # - **size**: dimensioni modal (small, medium, large)
        # - **backdrop**: mostra overlay di sfondo cliccabile (true/false)
        # - **closable**: mostra pulsante X di chiusura (true/false)
        #
        # ## Esempi Codice
        # ```erb
        # <%= bui_modal(title: "Conferma azione") do %>
        #   <p>Contenuto del modal</p>
        # <% end %>
        # 
        # <%= bui_modal(title: "Attenzione", theme: :red, size: :large) do %>
        #   <p>Modal con tema rosso e dimensione grande</p>
        # <% end %>
        # 
        # <%= bui_modal(title: "Informazioni", backdrop: false, closable: false) do %>
        #   <p>Modal senza backdrop e non chiudibile</p>
        # <% end %>
        # ```

        # @!group Esempi Base

        # @label Con Helper
        # @param title text "Titolo del modal"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] }
        # @param size select { choices: [small, medium, large] }
        # @param rounded select { choices: [none, small, medium, large, full] }
        # @param backdrop toggle "Mostra overlay di sfondo"
        # @param closable toggle "Mostra pulsante di chiusura"
        # @param classes text "Classi CSS aggiuntive"
        def default(
          title: "Conferma eliminazione",
          theme: :default,
          size: :medium,
          rounded: :medium,
          backdrop: true,
          closable: true,
          classes: ""
        )
          normalized = normalize_params!(
            title: title,
            theme: theme&.to_sym,
            size: size&.to_sym,
            rounded: rounded&.to_sym,
            backdrop: backdrop,
            closable: closable,
            classes: classes
          )
          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param title text "Titolo del modal"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] }
        # @param size select { choices: [small, medium, large] }
        # @param rounded select { choices: [none, small, medium, large, full] }
        # @param backdrop toggle "Mostra overlay di sfondo"
        # @param closable toggle "Mostra pulsante di chiusura"
        # @param classes text "Classi CSS aggiuntive"
        def raw(
          title: "Conferma eliminazione",
          theme: :default,
          size: :medium,
          rounded: :medium,
          backdrop: true,
          closable: true,
          classes: ""
        )
          normalized = normalize_params!(
            title: title,
            theme: theme&.to_sym,
            size: size&.to_sym,
            rounded: rounded&.to_sym,
            backdrop: backdrop,
            closable: closable,
            classes: classes
          )
          render BetterUi::General::Modal::Component.new(**normalized)
        end

        # @!endgroup

        private

        def normalize_params!(title:, theme:, size:, rounded:, backdrop:, closable:, classes:)
          {
            title: title,
            theme: theme,
            size: size,
            rounded: rounded,
            backdrop: backdrop,
            closable: closable,
            classes: classes.presence
          }
        end
      end
    end
  end
end
