module BetterUi
  module Application
    module Card
      # @label Card
      class ComponentPreview < ViewComponent::Preview
        # @!group Esempi Base
        
        # @notes
        #
        # ## Utilizzo Base
        # Il componente Card è specificamente progettato per visualizzare metriche e statistiche in dashboard applicative.
        # Supporta trend con icone direzionali e colori personalizzabili.
        #
        # ## Casi d'Uso Comuni
        # - Metriche dashboard: vendite, utenti attivi, conversioni
        # - KPI aziendali: revenue, performance, crescita
        # - Statistiche real-time: traffico, engagement, feedback
        # - Indicatori di trend: aumenti/diminuzioni con percentuali
        #
        # ## Variabili Principali
        # - **title**: etichetta/descrizione della metrica
        # - **value**: valore principale da evidenziare
        # - **trend**: direzione (:up, :down) per mostrare frecce
        # - **change**: valore del cambiamento (es. "+12%", "-5%")
        # - **color**: colore del trend (green, red, blue, yellow, purple, indigo, gray)
        # - **theme**: tema card (default, white, red, rose, orange, green, blue, yellow, violet, purple)
        # - **size**: dimensioni (small, medium, large)
        # - **rounded**: arrotondamento (none, small, medium, large, full)
        # - **shadow**: ombra (none, small, medium, large)
        #
        # ## Esempi Codice
        # ```erb
        # <%= bui_card(title: "Utenti Attivi", value: "1.234") %>
        # <%= bui_card(title: "Vendite", value: "€ 45.231", trend: :up, change: "+12%", color: :green) %>
        # <%= bui_card(title: "Conversioni", value: "2.8%", trend: :down, change: "-5%", color: :red) %>
        # <%= bui_card(title: "Revenue", value: "$89,432", theme: :primary, size: :large) %>
        # <%= bui_card(title: "Performance", value: "98.5%", classes: "hover:shadow-lg") %>
        # ```
        
        # @label Con Helper
        # @param title text "Titolo della metrica"
        # @param value text "Valore principale"
        # @param trend select { choices: [nil, up, down] } "Direzione del trend"
        # @param change text "Valore del cambiamento (es. +12%)"
        # @param color select { choices: [green, red, blue, yellow, purple, indigo, gray] } "Colore del trend"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, purple] } "Tema della card"
        # @param size select { choices: [small, medium, large] } "Dimensione della card"
        # @param rounded select { choices: [none, small, medium, large, full] } "Arrotondamento degli angoli"
        # @param shadow select { choices: [none, small, medium, large] } "Tipo di ombra"
        # @param classes text "Classi CSS aggiuntive (opzionale)"
        def default(
          title: "Vendite Totali",
          value: "€ 45.231",
          trend: :up,
          change: "+12%",
          color: :green,
          theme: :default,
          size: :medium,
          rounded: :medium,
          shadow: :small,
          classes: ""
        )
          normalized = normalize_params!(
            title: title,
            value: value,
            trend: trend,
            change: change,
            color: color,
            theme: theme,
            size: size,
            rounded: rounded,
            shadow: shadow,
            classes: classes
          )

          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param title text "Titolo della metrica"
        # @param value text "Valore principale"
        # @param trend select { choices: [nil, up, down] } "Direzione del trend"
        # @param change text "Valore del cambiamento (es. +12%)"
        # @param color select { choices: [green, red, blue, yellow, purple, indigo, gray] } "Colore del trend"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, purple] } "Tema della card"
        # @param size select { choices: [small, medium, large] } "Dimensione della card"
        # @param rounded select { choices: [none, small, medium, large, full] } "Arrotondamento degli angoli"
        # @param shadow select { choices: [none, small, medium, large] } "Tipo di ombra"
        # @param classes text "Classi CSS aggiuntive (opzionale)"
        def raw(
          title: "Vendite Totali",
          value: "€ 45.231",
          trend: :up,
          change: "+12%",
          color: :green,
          theme: :default,
          size: :medium,
          rounded: :medium,
          shadow: :small,
          classes: ""
        )
          normalized = normalize_params!(
            title: title,
            value: value,
            trend: trend,
            change: change,
            color: color,
            theme: theme,
            size: size,
            rounded: rounded,
            shadow: shadow,
            classes: classes
          )

          render BetterUi::Application::Card::Component.new(**normalized)
        end

        # @!endgroup

        private

        def normalize_params!(options)
          # Normalizzazione parametri
          options[:trend] = options[:trend].to_sym if options[:trend].is_a?(String) && options[:trend] != ""
          options[:trend] = nil if options[:trend] == "" || options[:trend] == "nil"
          options[:color] = options[:color].to_sym if options[:color].is_a?(String)
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:size] = options[:size].to_sym if options[:size].is_a?(String)
          options[:rounded] = options[:rounded].to_sym if options[:rounded].is_a?(String)
          options[:shadow] = options[:shadow].to_sym if options[:shadow].is_a?(String)

          # Pulizia valori vuoti
          options[:classes] = nil if options[:classes].is_a?(String) && options[:classes].strip.empty?
          options[:change] = nil if options[:change].is_a?(String) && options[:change].strip.empty?

          options
        end
      end
    end
  end
end
