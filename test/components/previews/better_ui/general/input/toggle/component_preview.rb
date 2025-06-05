# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Toggle
        # @label Toggle/Switch
        class ComponentPreview < ViewComponent::Preview

          #
          # ## Utilizzo Base
          # Componente toggle/switch moderno che sostituisce i checkbox tradizionali con un'interfaccia
          # visivamente più accattivante e intuitiva. Mantiene la stessa logica funzionale del checkbox.
          #
          # ## Funzionalità Principali
          # - **Design moderno**: Track orizzontale con thumb che scorre
          # - **Animazioni smooth**: Transizioni fluide CSS-only con Tailwind
          # - **Compatibilità checkbox**: Stesso comportamento logico (true/false)
          # - **Accessibilità**: Screen reader friendly con input checkbox nascosto
          # - **Form integration**: Compatibile con Rails form builder
          #
          # ## Casi d'Uso Comuni
          # - **Impostazioni UI**: Dark mode, notifiche, preferenze utente
          # - **Feature flags**: Abilitazione/disabilitazione funzionalità
          # - **Configurazioni**: Impostazioni di sistema on/off
          # - **Consensi**: Privacy, marketing, cookies
          # - **Stati binari**: Attivo/inattivo, pubblico/privato
          #
          # ## Variabili Principali
          # - **name**: nome del campo (obbligatorio)
          # - **checked**: stato iniziale del toggle
          # - **label**: testo opzionale accanto al toggle
          # - **label_position**: posizione label (left, right)
          # - **theme**: colori disponibili (default, white, red, rose, orange, green, blue, yellow, violet)
          # - **size**: dimensioni disponibili (small, medium, large)
          # - **value**: valore quando attivo (default: "1")
          # - **disabled**: stato disabilitato
          #
          # ## Esempi Codice
          # ```erb
          # <%# Toggle base %>
          # <%= bui_input_toggle(name: 'notifications') %>
          #
          # <%# Con label e stato iniziale %>
          # <%= bui_input_toggle(name: 'dark_mode', label: 'Modalità scura', checked: true) %>
          #
          # <%# Con tema e dimensioni %>
          # <%= bui_input_toggle(name: 'premium', label: 'Account Premium', theme: :green, size: :large) %>
          #
          # <%# Con Rails form builder %>
          # <%= form_with model: @user do |form| %>
          #   <%= bui_input_toggle(name: :email_notifications, form: form, label: 'Notifiche email') %>
          # <% end %>
          #
          # <%# Disabilitato con label a sinistra %>
          # <%= bui_input_toggle(name: 'maintenance', label: 'Modalità manutenzione', label_position: :left, disabled: true) %>
          # ```

          # @!group Esempi Base

          # @label Con Helper
          # @param name text "Nome del campo"
          # @param value text "Valore quando attivo"
          # @param label text "Testo della label"
          # @param label_position select { choices: [left, right] } "Posizione label"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema colore"
          # @param size select { choices: [small, medium, large] } "Dimensione"
          # @param checked toggle "Stato iniziale attivo"
          # @param required toggle "Obbligatorio"
          # @param disabled toggle "Disabilitato"
          # @param classes text "Classi CSS aggiuntive"
          def default(
            name: "demo_toggle",
            value: "1",
            label: "Abilita funzionalità",
            label_position: :right,
            theme: :default,
            size: :medium,
            checked: false,
            required: false,
            disabled: false,
            classes: ''
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              label: label,
              label_position: label_position,
              theme: theme,
              size: size,
              checked: checked,
              required: required,
              disabled: disabled,
              classes: classes
            )
            render_with_template(locals: normalized)
          end

          # @label Istanziazione Diretta
          # @param name text "Nome del campo"
          # @param value text "Valore quando attivo"
          # @param label text "Testo della label"
          # @param label_position select { choices: [left, right] } "Posizione label"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema colore"
          # @param size select { choices: [small, medium, large] } "Dimensione"
          # @param checked toggle "Stato iniziale attivo"
          # @param required toggle "Obbligatorio"
          # @param disabled toggle "Disabilitato"
          # @param classes text "Classi CSS aggiuntive"
          def raw(
            name: "demo_toggle",
            value: "1",
            label: "Abilita funzionalità",
            label_position: :right,
            theme: :default,
            size: :medium,
            checked: false,
            required: false,
            disabled: false,
            classes: ''
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              label: label,
              label_position: label_position,
              theme: theme,
              size: size,
              checked: checked,
              required: required,
              disabled: disabled,
              classes: classes
            )
            render BetterUi::General::Input::Toggle::Component.new(**normalized)
          end

          # @!endgroup

          private

          def normalize_params!(**params)
            {
              name: params[:name],
              value: params[:value],
              label: params[:label],
              label_position: params[:label_position].to_sym,
              theme: params[:theme].to_sym,
              size: params[:size].to_sym,
              checked: params[:checked],
              required: params[:required],
              disabled: params[:disabled],
              classes: params[:classes]
            }
          end
        end
      end
    end
  end
end
