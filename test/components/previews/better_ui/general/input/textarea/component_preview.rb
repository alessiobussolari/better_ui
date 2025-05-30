# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Textarea
        class ComponentPreview < ViewComponent::Preview
          # @!group Esempi Base

          # @label Con Helper
          # @param name text "Nome del campo textarea"
          # @param value text "Valore del campo"
          # @param placeholder text "Placeholder del campo"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param rows number "Numero di righe"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [small, medium, large] } "Dimensione del componente"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
          # @param classes text "Classi CSS aggiuntive"

          #
          # ## Utilizzo Base
          # Il componente Textarea è un campo di input multiriga per la raccolta di testi lunghi.
          # Supporta diverse configurazioni: temi, dimensioni, numero di righe, stati di validazione e attributi HTML.
          #
          # ## Casi d'Uso Comuni
          # - Campi di input per messaggi e commenti
          # - Aree di testo per descrizioni e contenuti lunghi
          # - Input per feedback e recensioni
          # - Campi textarea con stati di errore/successo
          # - Textarea disabled per visualizzazione read-only
          #
          # ## Variabili Principali
          # - **name**: nome del campo textarea (obbligatorio)
          # - **value**: valore predefinito del campo
          # - **placeholder**: testo placeholder
          # - **required**: se il campo è obbligatorio
          # - **disabled**: se il campo è disabilitato
          # - **rows**: numero di righe della textarea (default: 3)
          # - **theme**: tema colore (default, white, red, rose, orange, green, blue, yellow, violet)
          # - **size**: dimensione (small, medium, large)
          # - **rounded**: border radius (none, small, medium, large, full)
          # - **classes**: classi CSS aggiuntive
          #
          # ## Esempi Codice
          # ```erb
          # <!-- Uso standalone -->
          # <%= bui_input_textarea(name: 'description', placeholder: 'Inserisci descrizione') %>
          # <%= bui_input_textarea(name: 'message', theme: :blue, rows: 5, size: :large) %>
          # <%= bui_input_textarea(name: 'content', required: true, theme: :green, rows: 6) %>
          # <%= bui_input_textarea(name: 'error_field', theme: :red, 'aria-invalid': 'true') %>
          #
          # <!-- Con Rails form builder -->
          # <%= form_with model: @post do |form| %>
          #   <%= bui_input_textarea(name: :content, form: form, theme: :blue, rows: 8) %>
          #   <%= bui_input_textarea(name: :description, form: form, required: true, rows: 4) %>
          # <% end %>
          # ```
          
          def default(
            name: "textarea_field",
            value: "",
            placeholder: "Inserisci il tuo testo...",
            required: false,
            disabled: false,
            rows: 3,
            theme: :default,
            size: :medium,
            rounded: :medium,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              placeholder: placeholder,
              required: required,
              disabled: disabled,
              rows: rows,
              theme: theme,
              size: size,
              rounded: rounded,
              classes: classes
            )

            render_with_template(locals: normalized)
          end

          # @label Istanziazione Diretta
          # @param name text "Nome del campo textarea"
          # @param value text "Valore del campo"
          # @param placeholder text "Placeholder del campo"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param rows number "Numero di righe"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [small, medium, large] } "Dimensione del componente"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
          # @param classes text "Classi CSS aggiuntive"
          def raw(
            name: "textarea_field",
            value: "",
            placeholder: "Inserisci il tuo testo...",
            required: false,
            disabled: false,
            rows: 3,
            theme: :default,
            size: :medium,
            rounded: :medium,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              placeholder: placeholder,
              required: required,
              disabled: disabled,
              rows: rows,
              theme: theme,
              size: size,
              rounded: rounded,
              classes: classes
            )

            render BetterUi::General::Input::Textarea::Component.new(**normalized)
          end

          # @!endgroup

          private

          def normalize_params!(options)
            # Normalizzazione parametri
            options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
            options[:size] = options[:size].to_sym if options[:size].is_a?(String)
            options[:rounded] = options[:rounded].to_sym if options[:rounded].is_a?(String)

            # Pulizia valori vuoti
            options[:value] = nil if options[:value].is_a?(String) && options[:value].strip.empty?
            options[:placeholder] = nil if options[:placeholder].is_a?(String) && options[:placeholder].strip.empty?
            options[:classes] = '' if options[:classes].is_a?(String) && options[:classes].strip.empty?

            # Validazione rows
            options[:rows] = 3 if !options[:rows].is_a?(Integer) || options[:rows] <= 0

            options
          end
        end
      end
    end
  end
end
