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
          # @param rounded select { choices: [none, xs, sm, md, lg, xl, full] } "Border radius"
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
          # - **type**: tipo di input (text, password, email, tel, url, number, search, date, time, datetime_local, month, week, color)
          # - **theme**: tema colore (default, white, red, rose, orange, green, blue, yellow, violet)
          # - **size**: dimensione (xxs, xs, sm, md, lg, xl, xxl)
          # - **rounded**: border radius (none, xs, sm, md, lg, xl, full)
          # - **classes**: classi CSS aggiuntive
          #
          # ## Esempi Codice Base
          # ```erb
          # <!-- Uso standalone -->
          # <%= bui_input_text(name: 'username', placeholder: 'Inserisci username') %>
          # <%= bui_input_text(name: 'search', theme: :blue, size: :lg, rounded: :full) %>
          # <%= bui_input_text(name: 'required_field', required: true, theme: :green) %>
          # <%= bui_input_text(name: 'error_field', theme: :red, 'aria-invalid': 'true') %>
          #
          # <!-- Con Rails form builder -->
          # <%= form_with model: @user do |form| %>
          #   <%= bui_input_text(name: :email, form: form, theme: :blue, placeholder: 'Email utente') %>
          #   <%= bui_input_text(name: :username, form: form, required: true) %>
          # <% end %>
          # ```
          #
          # ## Esempi con Tipi Diversi
          # ```erb
          # <!-- Password -->
          # <%= bui_input_text(name: 'password', type: :password, placeholder: 'Password', theme: :red) %>
          # 
          # <!-- Email con validazione -->
          # <%= bui_input_text(name: 'email', type: :email, placeholder: 'Email', theme: :blue, required: true) %>
          # 
          # <!-- Telefono -->
          # <%= bui_input_text(name: 'phone', type: :tel, placeholder: '+39 123 456 7890', theme: :green) %>
          # 
          # <!-- URL -->
          # <%= bui_input_text(name: 'website', type: :url, placeholder: 'https://example.com', theme: :violet) %>
          # 
          # <!-- Numero -->
          # <%= bui_input_text(name: 'age', type: :number, placeholder: 'Età', theme: :orange, min: 18, max: 99) %>
          # 
          # <!-- Ricerca -->
          # <%= bui_input_text(name: 'query', type: :search, placeholder: 'Cerca...', theme: :blue, rounded: :full) %>
          # 
          # <!-- Data -->
          # <%= bui_input_text(name: 'birthday', type: :date, theme: :rose) %>
          # 
          # <!-- Colore -->
          # <%= bui_input_text(name: 'color', type: :color, theme: :yellow, size: :sm) %>
          # ```
          #
          # ## Helper Specializzati Disponibili
          # Per comodità, sono disponibili helper specifici per ogni tipo di input che utilizzano automaticamente
          # il tipo corretto. Questi helper hanno la stessa API del `bui_input_text` ma senza il parametro `type`:
          #
          # ```erb
          # <!-- Helper specializzati -->
          # <%= bui_input_password(name: 'password', placeholder: 'Password', theme: :red) %>
          # <%= bui_input_email(name: 'email', placeholder: 'Email', theme: :blue, required: true) %>
          # <%= bui_input_tel(name: 'phone', placeholder: 'Telefono', theme: :green) %>
          # <%= bui_input_url(name: 'website', placeholder: 'URL', theme: :violet) %>
          # <%= bui_input_number(name: 'age', placeholder: 'Età', theme: :orange) %>
          # <%= bui_input_search(name: 'query', placeholder: 'Cerca...', theme: :blue) %>
          # <%= bui_input_color(name: 'color', theme: :yellow) %>
          # ```
          #
          # **Lista completa helper disponibili:**
          # - `bui_input_password` - Input per password (type: :password)
          # - `bui_input_email` - Input per email (type: :email)
          # - `bui_input_tel` - Input per numeri di telefono (type: :tel)
          # - `bui_input_url` - Input per URL (type: :url)
          # - `bui_input_number` - Input numerico (type: :number)
          # - `bui_input_search` - Input per ricerca (type: :search)
          # - `bui_input_color` - Color picker (type: :color)
          #
          # Tutti questi helper supportano gli stessi parametri di `bui_input_text` eccetto `type` che è predefinito.
          
          def default(
            name: "input_field",
            value: "",
            placeholder: "Inserisci testo...",
            required: false,
            disabled: false,
            type: :text,
            theme: :default,
            size: :md,
            rounded: :md,
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
          # @param type select { choices: [text, password, email, tel, url, number, search, date, time, datetime_local, month, week, color] } "Tipo del campo input"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del componente"
          # @param rounded select { choices: [none, xs, sm, md, lg, xl, full] } "Border radius"
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
            rounded: :md,
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
