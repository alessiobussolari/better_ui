# frozen_string_literal: true

module BetterUi
  module General
    module Dropdown
      class ComponentPreview < ViewComponent::Preview
        # @notes
        #
        # ## Utilizzo Base
        # Il componente Dropdown fornisce menu contestuali interattivi per navigazione e azioni.
        # È perfetto per menu utente, azioni contestuali, filtri avanzati e navigazione mobile.
        #
        # ## Casi d'Uso Comuni
        # - **Menu utente**: Profilo, impostazioni, logout
        # - **Azioni contestuali**: Modifica, elimina, condividi su elementi
        # - **Filtri avanzati**: Opzioni di ordinamento e filtraggio
        # - **Menu navigazione mobile**: Navigazione compatta per dispositivi piccoli
        # - **Selezione multipla**: Menu per scegliere tra diverse opzioni
        #
        # ## Variabili Principali
        # - **trigger**: testo del pulsante trigger (obbligatorio)
        # - **position**: posizione del menu (:bottom, :top, :left, :right)
        # - **theme**: tema colore trigger (default, white, red, rose, orange, green, blue, yellow, violet)
        # - **size**: dimensione trigger (xxs, xs, sm, md, lg, xl, xxl)
        # - **rounded**: border radius (none, xxs, xs, sm, md, lg, xl, xxl, full)
        # - **animation**: tipo animazione (fade, slide, none)
        #
        # ## Esempi Codice
        # ```erb
        # <%= bui_dropdown(trigger: "Azioni") do %>
        #   <%= bui_dropdown_item(text: "Modifica", icon: "edit") %>
        #   <%= bui_dropdown_item(text: "Elimina", icon: "trash", theme: :red) %>
        # <% end %>
        # 
        # <%= bui_dropdown(trigger: "Menu Utente", position: :top, theme: :blue) do %>
        #   <%= bui_dropdown_item(text: "Profilo", icon: "user", href: "/profile") %>
        #   <%= bui_dropdown_divider %>
        #   <%= bui_dropdown_item(text: "Logout", icon: "logout") %>
        # <% end %>
        # 
        # <%= bui_dropdown(trigger: "Opzioni", size: :large, animation: :slide) do %>
        #   <%= bui_dropdown_item(text: "Impostazioni", icon: "cog") %>
        # <% end %>
        # ```

        # @!group Esempi Base

        # @label Con Helper
        # @param trigger text "Testo del pulsante trigger"
        # @param position select { choices: [bottom, top, left, right] }
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] }
        # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] }
        # @param rounded select { choices: [none, xxs, xs, sm, md, lg, xl, xxl, full] }
        # @param animation select { choices: [fade, slide, none] }
        # @param classes text "Classi CSS aggiuntive"
        def default(
          trigger: "Menu Azioni",
          position: :bottom,
          theme: :default,
          size: :md,
          rounded: :md,
          animation: :fade,
          classes: ""
        )
          normalized = normalize_params!(
            trigger: trigger,
            position: position&.to_sym,
            theme: theme&.to_sym,
            size: size&.to_sym,
            rounded: rounded&.to_sym,
            animation: animation&.to_sym,
            classes: classes
          )
          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param trigger text "Testo del pulsante trigger"
        # @param position select { choices: [bottom, top, left, right] }
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] }
        # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] }
        # @param rounded select { choices: [none, xxs, xs, sm, md, lg, xl, xxl, full] }
        # @param animation select { choices: [fade, slide, none] }
        # @param classes text "Classi CSS aggiuntive"
        def raw(
          trigger: "Menu Azioni",
          position: :bottom,
          theme: :default,
          size: :md,
          rounded: :md,
          animation: :fade,
          classes: ""
        )
          normalized = normalize_params!(
            trigger: trigger,
            position: position&.to_sym,
            theme: theme&.to_sym,
            size: size&.to_sym,
            rounded: rounded&.to_sym,
            animation: animation&.to_sym,
            classes: classes
          )
          render BetterUi::General::Dropdown::Component.new(**normalized)
        end

        # @!endgroup

        private

        def normalize_params!(trigger:, position:, theme:, size:, rounded:, animation:, classes:)
          {
            trigger: trigger,
            position: position,
            theme: theme,
            size: size,
            rounded: rounded,
            animation: animation,
            classes: classes.presence
          }
        end
      end
    end
  end
end
