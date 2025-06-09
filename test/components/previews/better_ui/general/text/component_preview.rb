module BetterUi
  module General
    module Text
      class ComponentPreview < ViewComponent::Preview
        # @!group Esempi Base

        # @label Con Helper
        # @param content text "Contenuto del testo"
        # @param tag select { choices: [p, span, div, h1, h2, h3, h4, h5, h6, strong, em] } "Tag HTML"
        # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del testo"
        # @param variant select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Variante colore"
        # @param align select { choices: [left, center, right, justify] } "Allineamento del testo"
        # @param weight select { choices: [normal, medium, semibold, bold] } "Peso del font"
        # @param style select { choices: [normal, italic, underline] } "Stile del testo"
        # @param leading select { choices: [tight, normal, relaxed, loose] } "Interlinea"
        # @param tracking select { choices: [tight, normal, wide] } "Spaziatura caratteri"
        # @param classes text "Classi CSS aggiuntive"

        #
        # ## Utilizzo Base
        # Il componente Text è l'elemento fondamentale per il rendering di contenuti testuali.
        # Supporta diverse configurazioni: dimensioni, colori, pesi, tag HTML semantici.
        #
        # ## Casi d'Uso Comuni
        # - Paragrafi di contenuto principale
        # - Titoli e sottotitoli con tag semantici
        # - Testo evidenziato o enfatizzato
        # - Etichette e descrizioni con diversi pesi
        # - Testo colorato per stati (errore, successo, info)
        #
        # ## Variabili Principali
        # - **content**: contenuto testuale (obbligatorio)
        # - **tag**: tag HTML semantico (p, span, div, h1-h6, strong, em)
        # - **size**: dimensione (xxs, xs, sm, md, lg, xl, xxl)
        # - **variant**: colore/tema (default, white, red, rose, orange, green, blue, yellow, violet)
        # - **weight**: peso del font (normal, medium, semibold, bold)
        # - **leading**: interlinea (tight, normal, relaxed, loose)
        # - **tracking**: spaziatura caratteri (tight, normal, wide)
        # - **classes**: classi CSS aggiuntive
        #
        # ## Esempi Codice
        # ```erb
        # <%= bui_text(content: 'Testo normale') %>
        # <%= bui_text(content: 'Titolo importante', tag: :h2, size: :xl, weight: :bold) %>
        # <%= bui_text(content: 'Messaggio di errore', variant: :red, weight: :medium) %>
        # <%= bui_text(content: 'Testo enfatizzato', tag: :strong, size: :lg) %>
        # <%= bui_text(content: 'Sottotitolo', size: :sm, variant: :blue, leading: :relaxed) %>
        # ```
        
        def default(
          content: "Questo è un testo di esempio",
          tag: :p,
          size: :md,
          variant: :default,
          align: :left,
          weight: :normal,
          style: :normal,
          leading: :normal,
          tracking: :normal,
          classes: ""
        )
          normalized = normalize_params!(
            content: content,
            tag: tag,
            size: size,
            variant: variant,
            align: align,
            weight: weight,
            style: style,
            leading: leading,
            tracking: tracking,
            classes: classes
          )

          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param content text "Contenuto del testo"
        # @param tag select { choices: [p, span, div, h1, h2, h3, h4, h5, h6, strong, em] } "Tag HTML"
        # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del testo"
        # @param variant select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Variante colore"
        # @param align select { choices: [left, center, right, justify] } "Allineamento del testo"
        # @param weight select { choices: [normal, medium, semibold, bold] } "Peso del font"
        # @param style select { choices: [normal, italic, underline] } "Stile del testo"
        # @param leading select { choices: [tight, normal, relaxed, loose] } "Interlinea"
        # @param tracking select { choices: [tight, normal, wide] } "Spaziatura caratteri"
        # @param classes text "Classi CSS aggiuntive"
        def raw(
          content: "Questo è un testo di esempio",
          tag: :p,
          size: :md,
          variant: :default,
          align: :left,
          weight: :normal,
          style: :normal,
          leading: :normal,
          tracking: :normal,
          classes: ""
        )
          normalized = normalize_params!(
            content: content,
            tag: tag,
            size: size,
            variant: variant,
            align: align,
            weight: weight,
            style: style,
            leading: leading,
            tracking: tracking,
            classes: classes
          )

          render BetterUi::General::Text::Component.new(**normalized)
        end

        # @!endgroup

        private

        def normalize_params!(options)
          # Normalizzazione parametri
          options[:tag] = options[:tag].to_sym if options[:tag].is_a?(String)
          options[:size] = options[:size].to_sym if options[:size].is_a?(String)
          options[:variant] = options[:variant].to_sym if options[:variant].is_a?(String)
          options[:align] = options[:align].to_sym if options[:align].is_a?(String)
          options[:weight] = options[:weight].to_sym if options[:weight].is_a?(String)
          options[:style] = options[:style].to_sym if options[:style].is_a?(String)
          options[:leading] = options[:leading].to_sym if options[:leading].is_a?(String)
          options[:tracking] = options[:tracking].to_sym if options[:tracking].is_a?(String)

          # Pulizia valori vuoti
          options[:content] = "Testo di esempio" if options[:content].is_a?(String) && options[:content].strip.empty?
          options[:classes] = '' if options[:classes].is_a?(String) && options[:classes].strip.empty?

          options
        end
      end
    end
  end
end
