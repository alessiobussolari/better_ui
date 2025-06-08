# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Radio
        class ComponentPreview < ViewComponent::Preview
          # @!group Esempi Base

          # @label Con Helper
          # @param name text "Nome del gruppo radio"
          # @param value text "Valore del radio button"
          # @param checked toggle "Radio button selezionato"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del componente"
          # @param classes text "Classi CSS aggiuntive"

          #
          # ## Utilizzo Base
          # Il componente Radio è un elemento di input per selezioni esclusive.
          # Supporta diverse configurazioni: temi, dimensioni, stati e attributi HTML.
          #
          # ## Casi d'Uso Comuni
          # - Selezioni esclusive in form e questionari
          # - Scelta tra opzioni multiple (uno solo)
          # - Preferenze utente con opzioni limitate
          # - Filtri con selezione singola
          # - Configurazioni con valori mutuamente esclusivi
          #
          # ## Variabili Principali
          # - **name**: nome del gruppo radio (obbligatorio)
          # - **value**: valore del radio button
          # - **checked**: se il radio è selezionato
          # - **required**: se il campo è obbligatorio
          # - **disabled**: se il campo è disabilitato
          # - **theme**: tema colore (default, white, red, rose, orange, green, blue, yellow, violet)
          # - **size**: dimensione (xxs, xs, sm, md, lg, xl, xxl)
          # - **classes**: classi CSS aggiuntive
          #
          # ## Esempi Codice
          # ```erb
          # <!-- Uso standalone -->
          # <%= bui_input_radio(name: 'size', value: 'small') %>
          # <%= bui_input_radio(name: 'size', value: 'medium', theme: :blue, size: :lg) %>
          # <%= bui_input_radio(name: 'size', value: 'large', checked: true, theme: :green) %>
          # <%= bui_input_radio(name: 'disabled_option', disabled: true) %>
          #
          # <!-- Con Rails form builder -->
          # <%= form_with model: @product do |form| %>
          #   <%= bui_input_radio(name: :size, value: 'S', form: form, theme: :blue) %>
          #   <%= bui_input_radio(name: :size, value: 'M', form: form) %>
          #   <%= bui_input_radio(name: :size, value: 'L', form: form) %>
          # <% end %>
          # ```
          
          def default(
            name: "radio_group",
            value: "option1",
            checked: false,
            required: false,
            disabled: false,
            theme: :default,
            size: :md,
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
              classes: classes
            )

            render_with_template(locals: normalized)
          end

          # @label Istanziazione Diretta
          # @param name text "Nome del gruppo radio"
          # @param value text "Valore del radio button"
          # @param checked toggle "Radio button selezionato"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del componente"
          # @param classes text "Classi CSS aggiuntive"
          def raw(
            name: "radio_group",
            value: "option1",
            checked: false,
            required: false,
            disabled: false,
            theme: :default,
            size: :md,
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
              classes: classes
            )

            render BetterUi::General::Input::Radio::Component.new(**normalized)
          end

          # @!endgroup

          private

          def normalize_params!(options)
            # Normalizzazione parametri
            options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
            options[:size] = options[:size].to_sym if options[:size].is_a?(String)

            # Pulizia valori vuoti
            options[:value] = "option1" if options[:value].is_a?(String) && options[:value].strip.empty?
            options[:classes] = '' if options[:classes].is_a?(String) && options[:classes].strip.empty?

            options
          end
        end
      end
    end
  end
end
