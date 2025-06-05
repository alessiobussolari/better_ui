# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Rating
        # @label Input Rating (Stelle)
        class ComponentPreview < ViewComponent::Preview

          #
          # ## Utilizzo Base
          # Componente Rating (Input) interattivo con stelle per valutazioni e feedback. Offre sia modalità
          # interattiva per inserire valutazioni che modalità read-only per visualizzare rating esistenti.
          #
          # ## Funzionalità Principali
          # - **Stelle interattive**: Click per selezionare rating
          # - **Half-stars support**: Supporto per mezze stelle (es. 3.5)
          # - **Hover preview**: Anteprima visiva durante hover
          # - **Read-only mode**: Per visualizzare rating esistenti
          # - **Navigazione da tastiera**: Arrow keys, numeri, Escape
          # - **Form integration**: Compatibile con Rails form builder
          #
          # ## Casi d'Uso Comuni
          # - **Recensioni prodotti**: Valutazione qualità, servizio
          # - **Feedback utenti**: Soddisfazione, esperienza
          # - **Valutazioni contenuti**: Articoli, video, corsi
          # - **Rating app/siti**: Usabilità, design, funzionalità
          # - **Survey e form**: Raccolta opinioni strutturate
          #
          # ## Variabili Principali
          # - **name**: nome del campo (obbligatorio se interattivo)
          # - **value**: rating attuale (0.0 - max_stars)
          # - **max_stars**: numero massimo stelle (default: 5)
          # - **readonly**: modalità sola lettura
          # - **half_stars**: supporto mezze stelle
          # - **theme**: colori disponibili (default, yellow, orange, red, pink, purple, blue, green, gray)
          # - **size**: dimensioni disponibili (small, medium, large)
          # - **show_value**: mostra valore numerico
          #
          # ## Esempi Codice
          # ```erb
          # <%# Rating interattivo base %>
          # <%= bui_input_rating(name: 'review_rating') %>
          #
          # <%# Rating read-only con valore %>
          # <%= bui_input_rating(value: 4.5, readonly: true, show_value: true) %>
          #
          # <%# Con tema e dimensioni %>
          # <%= bui_input_rating(name: 'quality', theme: :orange, size: :large) %>
          #
          # <%# Con Rails form builder %>
          # <%= form_with model: @review do |form| %>
          #   <%= bui_input_rating(name: :rating, form: form, value: @review.rating) %>
          # <% end %>
          #
          # <%# Rating custom con 10 stelle %>
          # <%= bui_input_rating(name: 'detailed_rating', max_stars: 10, theme: :blue) %>
          # ```

          # @!group Esempi Base

          # @label Con Helper
          # @param name text "Nome del campo"
          # @param value number "Valore rating attuale"
          # @param max_stars number "Numero massimo stelle"
          # @param readonly toggle "Solo lettura"
          # @param half_stars toggle "Supporto mezze stelle"
          # @param theme select { choices: [default, yellow, orange, red, pink, purple, blue, green, gray] } "Tema colore"
          # @param size select { choices: [small, medium, large] } "Dimensione"
          # @param show_value toggle "Mostra valore numerico"
          # @param classes text "Classi CSS aggiuntive"
          def default(
            name: "demo_rating",
            value: 0,
            max_stars: 5,
            readonly: false,
            half_stars: true,
            theme: :default,
            size: :medium,
            show_value: false,
            classes: ''
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              max_stars: max_stars,
              readonly: readonly,
              half_stars: half_stars,
              theme: theme,
              size: size,
              show_value: show_value,
              classes: classes
            )
            render_with_template(locals: normalized)
          end

          # @label Istanziazione Diretta
          # @param name text "Nome del campo"
          # @param value number "Valore rating attuale"
          # @param max_stars number "Numero massimo stelle"
          # @param readonly toggle "Solo lettura"
          # @param half_stars toggle "Supporto mezze stelle"
          # @param theme select { choices: [default, yellow, orange, red, pink, purple, blue, green, gray] } "Tema colore"
          # @param size select { choices: [small, medium, large] } "Dimensione"
          # @param show_value toggle "Mostra valore numerico"
          # @param classes text "Classi CSS aggiuntive"
          def raw(
            name: "demo_rating",
            value: 0,
            max_stars: 5,
            readonly: false,
            half_stars: true,
            theme: :default,
            size: :medium,
            show_value: false,
            classes: ''
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              max_stars: max_stars,
              readonly: readonly,
              half_stars: half_stars,
              theme: theme,
              size: size,
              show_value: show_value,
              classes: classes
            )
            render BetterUi::General::Input::Rating::Component.new(**normalized)
          end

          # @!endgroup

          private

          def normalize_params!(**params)
            {
              name: params[:readonly] ? nil : params[:name],
              value: params[:value].to_f,
              max_stars: params[:max_stars].to_i,
              readonly: params[:readonly],
              half_stars: params[:half_stars],
              theme: params[:theme].to_sym,
              size: params[:size].to_sym,
              show_value: params[:show_value],
              classes: params[:classes]
            }
          end
        end
      end
    end
  end
end
