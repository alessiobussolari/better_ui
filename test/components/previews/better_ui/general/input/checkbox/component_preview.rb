# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Checkbox
        class ComponentPreview < ViewComponent::Preview
          # @!group Esempi Base

          # @label Con Helper
          # @param name text "Nome del campo checkbox"
          # @param value text "Valore del checkbox"
          # @param checked toggle "Checkbox selezionato"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del componente"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
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
          # - **theme**: tema colore (default, white, red, rose, orange, green, blue, yellow, violet)
          # - **size**: dimensione (xxs, xs, sm, md, lg, xl, xxl)
          # - **rounded**: border radius (none, small, medium, large, full)
          # - **classes**: classi CSS aggiuntive
          #
          # ## Esempi Codice
          # ```erb
          # <!-- Uso standalone -->
          # <%= bui_input_checkbox(name: 'terms', value: '1') %>
          # <%= bui_input_checkbox(name: 'newsletter', value: '1', theme: :blue, size: :lg) %>
          # <%= bui_input_checkbox(name: 'privacy', value: '1', required: true, theme: :green) %>
          # <%= bui_input_checkbox(name: 'disabled_option', disabled: true) %>
          #
          # <!-- Con Rails form builder -->
          # <%= form_with model: @user do |form| %>
          #   <%= bui_input_checkbox(name: :newsletter, form: form, theme: :blue) %>
          #   <%= bui_input_checkbox(name: :terms, form: form, required: true) %>
          # <% end %>
          # ```
          
          def default(
            name: "checkbox_field",
            value: "1",
            checked: false,
            required: false,
            disabled: false,
            theme: :default,
            size: :md,
            rounded: :small,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              checked: checked,
              required: required,
              disabled: disabled,
              theme: theme,
              size: size,
              rounded: rounded,
              classes: classes
            )

            render_with_template(locals: normalized)
          end

          # @label Istanziazione Diretta
          # @param name text "Nome del campo checkbox"
          # @param value text "Valore del checkbox"
          # @param checked toggle "Checkbox selezionato"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del componente"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
          # @param classes text "Classi CSS aggiuntive"
          def raw(
            name: "checkbox_field",
            value: "1",
            checked: false,
            required: false,
            disabled: false,
            theme: :default,
            size: :md,
            rounded: :small,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              checked: checked,
              required: required,
              disabled: disabled,
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

            # Pulizia valori vuoti
            options[:value] = "1" if options[:value].is_a?(String) && options[:value].strip.empty?
            options[:classes] = '' if options[:classes].is_a?(String) && options[:classes].strip.empty?

            options
          end
        end
      end
    end
  end
end
