# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Text
        class ComponentPreview < ViewComponent::Preview
          # @!group Esempi Base

          # @label Con Helper
          # @param name text "Nome del campo input"
          # @param value text "Valore del campo"
          # @param placeholder text "Placeholder del campo"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param type select { choices: [text, password, email, tel, url, number, search, date, time, datetime_local, month, week, color] } "Tipo del campo input"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del componente"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
          # @param classes text "Classi CSS aggiuntive"

          #
          # ## Utilizzo Base
          # Il componente Text Input è un campo di input testuale fondamentale per la raccolta dati.
          # Supporta diverse configurazioni: temi, dimensioni, stati di validazione e attributi HTML.
          #
          # ## Casi d'Uso Comuni
          # - Campi di input in form di registrazione e login
          # - Campi di ricerca con stili personalizzati
          # - Input per dati utente con validazione (email, username)
          # - Campi di testo con stati di errore/successo
          # - Input disabled per visualizzazione read-only
          #
          # ## Variabili Principali
          # - **name**: nome del campo input (obbligatorio)
          # - **value**: valore predefinito del campo
          # - **placeholder**: testo placeholder
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
          # <%= bui_input_text(name: 'email', placeholder: 'Inserisci email') %>
          # <%= bui_input_text(name: 'search', theme: :blue, size: :lg, rounded: :full) %>
          # <%= bui_input_text(name: 'username', required: true, theme: :green) %>
          # <%= bui_input_text(name: 'error_field', theme: :red, 'aria-invalid': 'true') %>
          #
          # <!-- Con Rails form builder -->
          # <%= form_with model: @user do |form| %>
          #   <%= bui_input_text(name: :email, form: form, theme: :blue, placeholder: 'Email utente') %>
          #   <%= bui_input_text(name: :username, form: form, required: true) %>
          # <% end %>
          # ```
          
          def default(
            name: "input_field",
            value: "",
            placeholder: "Inserisci testo...",
            required: false,
            disabled: false,
            type: :text,
            theme: :default,
            size: :md,
            rounded: :medium,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              placeholder: placeholder,
              required: required,
              disabled: disabled,
              type: type,
              theme: theme,
              size: size,
              rounded: rounded,
              classes: classes
            )

            render_with_template(locals: normalized)
          end

          # @label Istanziazione Diretta
          # @param name text "Nome del campo input"
          # @param value text "Valore del campo"
          # @param placeholder text "Placeholder del campo"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del componente"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
          # @param classes text "Classi CSS aggiuntive"
          def raw(
            name: "input_field",
            value: "",
            placeholder: "Inserisci testo...",
            required: false,
            disabled: false,
            type: :text,
            theme: :default,
            size: :md,
            rounded: :medium,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              placeholder: placeholder,
              required: required,
              disabled: disabled,
              type: type,
              theme: theme,
              size: size,
              rounded: rounded,
              classes: classes
            )

            render BetterUi::General::Input::Text::Component.new(**normalized)
          end

          # @!endgroup

          private

          def normalize_params!(options)
            # Normalizzazione parametri
            options[:type] = options[:type].to_sym if options[:type].is_a?(String)
            options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
            options[:size] = options[:size].to_sym if options[:size].is_a?(String)
            options[:rounded] = options[:rounded].to_sym if options[:rounded].is_a?(String)

            # Pulizia valori vuoti
            options[:value] = nil if options[:value].is_a?(String) && options[:value].strip.empty?
            options[:placeholder] = nil if options[:placeholder].is_a?(String) && options[:placeholder].strip.empty?
            options[:classes] = '' if options[:classes].is_a?(String) && options[:classes].strip.empty?

            options
          end
        end
      end
    end
  end
end
