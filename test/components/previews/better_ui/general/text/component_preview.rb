# frozen_string_literal: true

module BetterUi
  module General
    module Text
      class ComponentPreview < ViewComponent::Preview
        # @notes
        #
        # ## Utilizzo Base
        # Il componente `bui_text` permette di renderizzare testo con styling consistente.
        # Supporta sia testo passato come parametro che contenuto tramite blocco Ruby.
        #
        # ## Casi d'Uso Comuni
        # - **Testo semplice**: Sostituire tag `<p>`, `<span>` e testo normale
        # - **Messaggi di stato**: Errori, avvisi, successi con colori appropriati
        # - **Contenuto dinamico**: Testo generato da variabili o blocchi complessi
        # - **Tipografia consistente**: Mantenere stili uniformi nell'applicazione
        # - **Testo descrittivo**: Sottotitoli, didascalie, note esplicative
        #
        # ## Variabili Principali
        # - **text**: Testo da mostrare (String, opzionale se si usa blocco)
        # - **theme**: Colori disponibili (default, white, red, blue, green, yellow, violet, purple, gray, muted)
        # - **size**: Dimensioni disponibili (xs, small, medium, large, xl, 2xl)
        # - **align**: Allineamento testo (left, center, right, justify)
        # - **weight**: Peso font (thin, light, normal, medium, semibold, bold, extrabold)
        # - **style**: Stile tipografico (normal, italic, underline, line_through)
        # - **classes**: Classi CSS aggiuntive (String)
        #
        # ## Esempi Codice
        # ```erb
        # <%= bui_text("Testo semplice") %>
        # <%= bui_text("Importante", theme: :blue, weight: :bold) %>
        # <%= bui_text("Centrato", align: :center, size: :large) %>
        # <%= bui_text("Errore", theme: :red, size: :small) %>
        # <%= bui_text(theme: :green) { "Contenuto #{dynamic_var}" } %>
        # ```

        # @param text [String] Testo da mostrare
        # @param theme [Symbol] select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, purple, gray, muted] }
        # @param size [Symbol] select { choices: [xs, small, medium, large, xl, "2xl"] }
        # @param align [Symbol] select { choices: [left, center, right, justify] }
        # @param weight [Symbol] select { choices: [thin, light, normal, medium, semibold, bold, extrabold] }
        # @param style [Symbol] select { choices: [normal, italic, underline, line_through] }
        # @param classes [String] Classi CSS aggiuntive
        def default(
          text: "Questo è un testo di esempio",
          theme: :default,
          size: :medium,
          align: :left,
          weight: :normal,
          style: :normal,
          classes: ""
        )
          normalized = normalize_params!(
            text: text,
            theme: theme,
            size: size,
            align: align,
            weight: weight,
            style: style,
            classes: classes
          )
          render_with_template(locals: normalized)
        end

        # @param text [String] Testo da mostrare
        # @param theme [Symbol] select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, purple, gray, muted] }
        # @param size [Symbol] select { choices: [xs, small, medium, large, xl, "2xl"] }
        # @param align [Symbol] select { choices: [left, center, right, justify] }
        # @param weight [Symbol] select { choices: [thin, light, normal, medium, semibold, bold, extrabold] }
        # @param style [Symbol] select { choices: [normal, italic, underline, line_through] }
        # @param classes [String] Classi CSS aggiuntive
        def raw(
          text: "Questo è un testo di esempio",
          theme: :default,
          size: :medium,
          align: :left,
          weight: :normal,
          style: :normal,
          classes: ""
        )
          normalized = normalize_params!(
            text: text,
            theme: theme,
            size: size,
            align: align,
            weight: weight,
            style: style,
            classes: classes
          )
          render_with_template(locals: normalized)
        end

        private

        def normalize_params!(**params)
          # Converte parametri per compatibilità
          params[:theme] = params[:theme].to_sym if params[:theme]
          params[:size] = params[:size].to_sym if params[:size]
          params[:align] = params[:align].to_sym if params[:align]
          params[:weight] = params[:weight].to_sym if params[:weight]
          params[:style] = params[:style].to_sym if params[:style]
          params
        end
      end
    end
  end
end
