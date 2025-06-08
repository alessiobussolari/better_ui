# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Select
        class ComponentPreview < ViewComponent::Preview
          # @!group Esempi Base

          # @label Con Helper
          # @param name text "Nome del campo select"
          # @param options text "Opzioni (JSON array)"
          # @param value text "Valore selezionato"
          # @param prompt text "Prompt iniziale"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param multiple toggle "Selezione multipla"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del componente"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
          # @param classes text "Classi CSS aggiuntive"

          #
          # ## Utilizzo Base
          # Il componente Select è un dropdown per selezioni da liste di opzioni.
          # Supporta selezione singola, multipla, temi, dimensioni e stati.
          #
          # ## Casi d'Uso Comuni
          # - Selezione paese, regione, città in form
          # - Scelta categorie e tag in content management
          # - Filtri con opzioni predefinite
          # - Selezione multipla per preferenze utente
          # - Dropdown di navigazione e menu
          #
          # ## Variabili Principali
          # - **name**: nome del campo select (obbligatorio)
          # - **options**: array di opzioni [value, label]
          # - **value**: valore/i selezionato/i
          # - **prompt**: testo prompt iniziale
          # - **multiple**: selezione multipla
          # - **theme**: tema colore (default, white, red, rose, orange, green, blue, yellow, violet)
          # - **size**: dimensione (xxs, xs, sm, md, lg, xl, xxl)
          # - **rounded**: border radius (none, small, medium, large, full)
          #
          # ## Esempi Codice
          # ```erb
          # <%= bui_input_select(name: 'country', options: [['IT', 'Italia'], ['US', 'USA']]) %>
          # <%= bui_input_select(name: 'category', options: @categories, theme: :blue, size: :lg) %>
          # <%= bui_input_select(name: 'tags', options: @tags, multiple: true, theme: :green) %>
          # ```
          
          def default(
            name: "select_field",
            options: '[["option1", "Opzione 1"], ["option2", "Opzione 2"], ["option3", "Opzione 3"]]',
            value: "",
            prompt: "Seleziona un'opzione",
            required: false,
            disabled: false,
            multiple: false,
            theme: :default,
            size: :md,
            rounded: :medium,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              options: options,
              value: value,
              prompt: prompt,
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
          # @param options text "Opzioni (JSON array)"
          # @param value text "Valore selezionato"
          # @param prompt text "Prompt iniziale"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param multiple toggle "Selezione multipla"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del componente"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
          # @param classes text "Classi CSS aggiuntive"
          def raw(
            name: "select_field",
            options: '[["option1", "Opzione 1"], ["option2", "Opzione 2"], ["option3", "Opzione 3"]]',
            value: "",
            prompt: "Seleziona un'opzione",
            required: false,
            disabled: false,
            multiple: false,
            theme: :default,
            size: :md,
            rounded: :medium,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              options: options,
              value: value,
              prompt: prompt,
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

            # Parse options JSON
            if options[:options].is_a?(String)
              begin
                options[:options] = JSON.parse(options[:options])
              rescue JSON::ParserError
                options[:options] = [["option1", "Opzione 1"], ["option2", "Opzione 2"]]
              end
            end

            # Pulizia valori vuoti
            options[:classes] = '' if options[:classes].is_a?(String) && options[:classes].strip.empty?

            options
          end
        end
      end
    end
  end
end
