# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Checkbox
        class ComponentPreview < ViewComponent::Preview

          
          # @!group Con Helpers
        
          # @label Con Helper
          # @param name text "Nome del campo checkbox"
          # @param value text "Valore del checkbox"
          # @param checked toggle "Checkbox selezionato"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param label text "Testo della label"
          # @param label_position select { choices: [left, right] } "Posizione della label"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del componente"
          # @param rounded select { choices: [none, xs, sm, md, lg, xl, full] } "Border radius"
          # @param classes text "Classi CSS aggiuntive"
          #
          # ## Utilizzo Base
          # Il componente Checkbox è un elemento di input per selezioni multiple.
          # Supporta diverse configurazioni: temi, dimensioni, stati e attributi HTML.
          #
          # ## Casi d'Uso Comuni
          # - Selezioni multiple in form e filtri
          # - Accettazione termini e condizioni
          # - Preferenze utente e impostazioni
          # - Liste di controllo e task management
          # - Consensi privacy e marketing
          #
          # ## Variabili Principali
          # - **name**: nome del campo checkbox (obbligatorio)
          # - **value**: valore del checkbox
          # - **checked**: se il checkbox è selezionato
          # - **required**: se il campo è obbligatorio
          # - **disabled**: se il campo è disabilitato
          # - **label**: testo della label (opzionale)
          # - **label_position**: posizione della label (:left, :right)
          # - **theme**: tema colore (default, white, red, rose, orange, green, blue, yellow, violet)
          # - **size**: dimensione (xxs, xs, sm, md, lg, xl, xxl)
          # - **rounded**: border radius (none, xs, sm, md, lg, xl, full)
          # - **classes**: classi CSS aggiuntive
          #
          # ## Esempi Codice
          # ```erb
          # <!-- Uso standalone -->
          # <%= bui_input_checkbox(name: 'terms', value: '1', label: 'Accetto') %>
          # <%= bui_input_checkbox(name: 'newsletter', value: '1', theme: :blue, size: :lg, label: 'Newsletter') %>
          # <%= bui_input_checkbox(name: 'privacy', value: '1', required: true, theme: :green, label: 'Privacy') %>
          # <%= bui_input_checkbox(name: 'disabled_option', disabled: true, label: 'Opzione disabilitata') %>
          #
          # <!-- Con posizione label -->
          # <%= bui_input_checkbox(name: 'left_label', label: 'Label a sinistra', label_position: :left) %>
          # <%= bui_input_checkbox(name: 'right_label', label: 'Label a destra', label_position: :right) %>
          #
          # <!-- Con Rails form builder -->
          # <%= form_with model: @user do |form| %>
          #   <%= bui_input_checkbox(name: :newsletter, form: form, theme: :blue, label: 'Newsletter') %>
          #   <%= bui_input_checkbox(name: :terms, form: form, required: true, label: 'Termini') %>
          # <% end %>
          # ```

          def default(
            name: "checkbox_field",
            value: "1",
            checked: false,
            required: false,
            disabled: false,
            label: "Accetto i termini e condizioni",
            label_position: :right,
            theme: :default,
            size: :md,
            rounded: :md,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              checked: checked,
              required: required,
              disabled: disabled,
              label: label,
              label_position: label_position,
              theme: theme,
              size: size,
              rounded: rounded,
              classes: classes
            )

            render_with_template(locals: normalized)
          end
          # @!endgroup
          # @!group Raw
          # @label Istanziazione Diretta
          def raw(
            name: "checkbox_field",
            value: "1",
            checked: false,
            required: false,
            disabled: false,
            label: "Accetto i termini e condizioni",
            label_position: :right,
            theme: :default,
            size: :md,
            rounded: :md,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              checked: checked,
              required: required,
              disabled: disabled,
              label: label,
              label_position: label_position,
              theme: theme,
              size: size,
              rounded: rounded,
              classes: classes
            )

            render BetterUi::General::Input::Checkbox::Component.new(**normalized)
          end

          # @!endgroup

          private

          def normalize_params!(options)
            # Normalizzazione parametri
            options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
            options[:size] = options[:size].to_sym if options[:size].is_a?(String)
            options[:rounded] = options[:rounded].to_sym if options[:rounded].is_a?(String)
            options[:label_position] = options[:label_position].to_sym if options[:label_position].is_a?(String)

            # Pulizia valori vuoti
            options[:value] = "1" if options[:value].is_a?(String) && options[:value].strip.empty?
            options[:classes] = '' if options[:classes].is_a?(String) && options[:classes].strip.empty?
            options[:label] = nil if options[:label].is_a?(String) && options[:label].strip.empty?

            options
          end
        end
      end
    end
  end
end
