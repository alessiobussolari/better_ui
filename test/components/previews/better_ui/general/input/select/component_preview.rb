# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Select
        # @label Select Input
        class ComponentPreview < ViewComponent::Preview
          #
          # ## Utilizzo Base
          # Il componente Select è un elemento di selezione avanzato per elenchi di opzioni.
          # Supporta selezione singola e multipla, temi, dimensioni e placeholder personalizzabili.
          #
          # ## Casi d'Uso Comuni
          # - Selezione di un valore da una lista predefinita
          # - Campi di scelta in form di registrazione o configurazione
          # - Menu a tendina per filtri o ordinamenti
          # - Selezione multipla per tag, categorie o preferenze
          # - Form con validazione e stato obbligatorio
          #
          # ## Variabili Principali
          # - **name**: nome del campo (obbligatorio)
          # - **options**: array di opzioni [{value: 'val', label: 'testo'}, ...]
          # - **selected**: valore o array di valori selezionati
          # - **multiple**: consente selezione multipla
          # - **theme**: tema colore (default, white, red, rose, orange, green, blue, yellow, violet)
          # - **size**: dimensione (small, medium, large)
          # - **rounded**: border radius (none, small, medium, large, full)
          # - **placeholder**: testo placeholder (crea un'opzione vuota)
          #
          # ## Esempi Codice
          # ```erb
          # <%= bui_input_select(name: 'country', options: countries) %>
          # <%= bui_input_select(name: 'role', options: roles, selected: 'admin') %>
          # <%= bui_input_select(name: 'languages[]', options: languages, multiple: true) %>
          # <%= bui_input_select(name: 'priority', options: priorities, theme: :blue, size: :large) %>
          # <%= bui_input_select(name: 'category_id', options: categories, form: form, required: true) %>
          # ```
          # @!group Esempi Base

          # @label Con Helper
          # @param name text "Nome del campo select"
          # @param placeholder text "Placeholder (opzionale)"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param multiple toggle "Selezione multipla"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [small, medium, large] } "Dimensione del componente"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
          # @param classes text "Classi CSS aggiuntive"
          def default(
            name: "select_field",
            placeholder: "Seleziona un'opzione...",
            required: false,
            disabled: false,
            multiple: false,
            theme: :default,
            size: :medium,
            rounded: :medium,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              placeholder: placeholder,
              required: required,
              disabled: disabled,
              multiple: multiple,
              theme: theme,
              size: size,
              rounded: rounded,
              classes: classes
            )

            render_with_template(locals: normalized)
          end

          # @label Istanziazione Diretta
          # @param name text "Nome del campo select"
          # @param placeholder text "Placeholder (opzionale)"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param multiple toggle "Selezione multipla"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [small, medium, large] } "Dimensione del componente"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
          # @param classes text "Classi CSS aggiuntive"
          def raw(
            name: "select_field",
            placeholder: "Seleziona un'opzione...",
            required: false,
            disabled: false,
            multiple: false,
            theme: :default,
            size: :medium,
            rounded: :medium,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              placeholder: placeholder,
              required: required,
              disabled: disabled,
              multiple: multiple,
              theme: theme,
              size: size,
              rounded: rounded,
              classes: classes
            )

            render BetterUi::General::Input::Select::Component.new(**normalized)
          end

          # @!endgroup

          private

          def normalize_params!(options)
            # Normalizzazione parametri
            options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
            options[:size] = options[:size].to_sym if options[:size].is_a?(String)
            options[:rounded] = options[:rounded].to_sym if options[:rounded].is_a?(String)

            # Pulizia valori vuoti
            options[:placeholder] = nil if options[:placeholder].is_a?(String) && options[:placeholder].strip.empty?
            options[:classes] = '' if options[:classes].is_a?(String) && options[:classes].strip.empty?

            # Aggiungi le opzioni di esempio
            sample_options = [
              { value: 'option1', label: 'Opzione 1' },
              { value: 'option2', label: 'Opzione 2' },
              { value: 'option3', label: 'Opzione 3' },
              { value: 'option4', label: 'Opzione 4' }
            ]
            options[:options] = sample_options
            
            options
          end
        end
      end
    end
  end
end