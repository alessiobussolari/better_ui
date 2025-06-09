# frozen_string_literal: true

module BetterUi
  module General
    module Accordion
      class ComponentPreview < ViewComponent::Preview
        # @notes
        #
        # ## Utilizzo Base
        # L'Accordion è un componente per organizzare contenuti in sezioni collassabili/espandibili.
        # Perfetto per FAQ, documentazione, menu di navigazione complessi e qualsiasi contenuto che beneficia di essere organizzato gerarchicamente.
        #
        # ## Casi d'Uso Comuni
        # - **FAQ**: Domande frequenti con risposte collassabili
        # - **Documentazione**: Sezioni di aiuto organizzate per categoria
        # - **Impostazioni**: Gruppi di configurazioni organizzate per area
        # - **Menu navigazione**: Navigation tree con sottosezioni
        # - **Form complessi**: Raggruppamento di campi correlati
        # - **Dashboard**: Organizzazione di widget informativi
        #
        # ## Variabili Principali
        # - **multiple**: permette multipli item aperti contemporaneamente (default: false)
        # - **theme**: colori del componente (default, white, blue, red, green, yellow, violet, orange, rose)
        # - **variant**: stile visivo (minimal, bordered, separated)
        # - **size**: dimensioni testo e padding (xxs, xs, sm, md, lg, xl, xxl)
        # - **title**: testo dell'header cliccabile per ogni item
        # - **expanded**: se l'item è inizialmente aperto (default: false)
        # - **disabled**: se l'item non è cliccabile (default: false)
        # - **icon**: icona personalizzata per l'header (default: chevron-down)
        #
        # ## Esempi Codice
        # ```erb
        # <!-- Accordion base -->
        # <%= bui_accordion do |accordion| %>
        #   <%= accordion.with_item(title: "Domanda 1") do %>
        #     <p>Risposta alla prima domanda</p>
        #   <% end %>
        # <% end %>
        #
        # <!-- Accordion multiplo con temi -->
        # <%= bui_accordion(multiple: true, theme: :blue, size: :large) do |accordion| %>
        #   <%= accordion.with_item(title: "FAQ 1", expanded: true) do %>
        #     <p>Contenuto della prima FAQ</p>
        #   <% end %>
        #   <%= accordion.with_item(title: "FAQ 2") do %>
        #     <p>Contenuto della seconda FAQ</p>
        #   <% end %>
        # <% end %>
        #
        # <!-- Accordion con varianti stilistiche -->
        # <%= bui_accordion(variant: :separated, theme: :green) do |accordion| %>
        #   <%= accordion.with_item(title: "Sezione 1") do %>
        #     <div>Contenuto complesso con HTML</div>
        #   <% end %>
        # <% end %>
        # ```

        # @!group Esempi Base

        # @label Con Helper
        # @param multiple toggle
        # @param theme select { choices: [default, white, blue, red, green, yellow, violet, orange, rose] }
        # @param variant select { choices: [minimal, bordered, separated] }
        # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] }
        # @param classes text
        def default(multiple: false, theme: :default, variant: :bordered, size: :md, classes: '')
          normalized = normalize_params!(
            multiple: multiple,
            theme: theme,
            variant: variant,
            size: size,
            classes: classes
          )
          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param multiple toggle
        # @param theme select { choices: [default, white, blue, red, green, yellow, violet, orange, rose] }
        # @param variant select { choices: [minimal, bordered, separated] }
        # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] }
        # @param classes text
        def raw(multiple: false, theme: :default, variant: :bordered, size: :md, classes: '')
          normalized = normalize_params!(
            multiple: multiple,
            theme: theme,
            variant: variant,
            size: size,
            classes: classes
          )
          render_with_template(locals: normalized)
        end

        # @!endgroup

        private

        def normalize_params!(**params)
          params
        end
      end
    end
  end
end
