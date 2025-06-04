# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Select
        # @label Select
        class ComponentPreview < ViewComponent::Preview

          #
          # ## Utilizzo Base
          # Componente select personalizzato con ricerca, animazioni e multi-selezione. Sostituisce completamente
          # il select HTML nativo con un'interfaccia moderna e interattiva gestita da Stimulus.
          #
          # ## Funzionalità Principali
          # - **Ricerca real-time**: Filtraggio istantaneo delle opzioni
          # - **Multi-selezione**: Con badge removibili per ogni opzione selezionata
          # - **Animazioni smooth**: Transizioni fluide per apertura/chiusura
          # - **Navigazione da tastiera**: Arrow keys, Enter, Escape
          # - **Click outside**: Chiusura automatica
          #
          # ## Casi d'Uso Comuni
          # - **Selezione singola**: Paesi, categorie, utenti
          # - **Multi-selezione**: Tag, skills, permessi
          # - **Con ricerca**: Liste lunghe di opzioni
          # - **Form integration**: Compatibile con Rails form builder
          #
          # ## Variabili Principali
          # - **name**: nome del campo (obbligatorio)
          # - **options**: array di opzioni nel formato [{value: 'val', label: 'Label'}, ...]
          # - **multiple**: abilita selezione multipla
          # - **searchable**: abilita campo di ricerca
          # - **theme**: colori disponibili (default, white, red, rose, orange, green, blue, yellow, violet)
          # - **size**: dimensioni disponibili (small, medium, large)
          # - **rounded**: border radius (none, small, medium, large, full)
          # - **selected**: valore/i preselezionato/i
          #
          # ## Esempi Codice
          # ```erb
          # <%# Selezione singola base %>
          # <%= bui_input_select(name: 'country', options: countries_options) %>
          #
          # <%# Multi-selezione con ricerca %>
          # <%= bui_input_select(name: 'skills', multiple: true, searchable: true, options: skills_options) %>
          #
          # <%# Con selezione preimpostata %>
          # <%= bui_input_select(name: 'category', options: categories, selected: 'tech') %>
          #
          # <%# Con Rails form builder %>
          # <%= form_with model: @user do |form| %>
          #   <%= bui_input_select(name: :role, form: form, options: role_options) %>
          # <% end %>
          #
          # <%# Personalizzato con tema %>
          # <%= bui_input_select(name: 'priority', theme: :red, size: :large, options: priorities) %>
          # ```

          # @!group Esempi Base

          # @label Con Helper
          # @param name text "Nome del campo"
          # @param options textarea "Opzioni JSON"
          # @param selected text "Valore selezionato"
          # @param multiple toggle "Selezione multipla"
          # @param searchable toggle "Ricerca abilitata"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema colore"
          # @param size select { choices: [small, medium, large] } "Dimensione"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
          # @param required toggle "Obbligatorio"
          # @param disabled toggle "Disabilitato"
          # @param placeholder text "Placeholder"
          # @param search_placeholder text "Placeholder ricerca"
          # @param max_height text "Altezza massima dropdown"
          # @param classes text "Classi CSS aggiuntive"
          def default(
            name: "demo_select",
            options: default_options_json,
            selected: "",
            multiple: false,
            searchable: true,
            theme: :default,
            size: :medium,
            rounded: :medium,
            required: false,
            disabled: false,
            placeholder: "",
            search_placeholder: "",
            max_height: "300px",
            classes: ''
          )
            normalized = normalize_params!(
              name: name,
              options: parse_options(options),
              selected: parse_selected(selected, multiple),
              multiple: multiple,
              searchable: searchable,
              theme: theme,
              size: size,
              rounded: rounded,
              required: required,
              disabled: disabled,
              placeholder: placeholder.present? ? placeholder : nil,
              search_placeholder: search_placeholder.present? ? search_placeholder : nil,
              max_height: max_height,
              classes: classes
            )
            render_with_template(locals: normalized)
          end

          # @label Istanziazione Diretta
          # @param name text "Nome del campo"
          # @param options textarea "Opzioni JSON"
          # @param selected text "Valore selezionato"
          # @param multiple toggle "Selezione multipla"
          # @param searchable toggle "Ricerca abilitata"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema colore"
          # @param size select { choices: [small, medium, large] } "Dimensione"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
          # @param required toggle "Obbligatorio"
          # @param disabled toggle "Disabilitato"
          # @param placeholder text "Placeholder"
          # @param search_placeholder text "Placeholder ricerca"
          # @param max_height text "Altezza massima dropdown"
          # @param classes text "Classi CSS aggiuntive"
          def raw(
            name: "demo_select",
            options: default_options_json,
            selected: "",
            multiple: false,
            searchable: true,
            theme: :default,
            size: :medium,
            rounded: :medium,
            required: false,
            disabled: false,
            placeholder: "",
            search_placeholder: "",
            max_height: "300px",
            classes: ''
          )
            normalized = normalize_params!(
              name: name,
              options: parse_options(options),
              selected: parse_selected(selected, multiple),
              multiple: multiple,
              searchable: searchable,
              theme: theme,
              size: size,
              rounded: rounded,
              required: required,
              disabled: disabled,
              placeholder: placeholder.present? ? placeholder : nil,
              search_placeholder: search_placeholder.present? ? search_placeholder : nil,
              max_height: max_height,
              classes: classes
            )
            render BetterUi::General::Input::Select::Component.new(**normalized)
          end

          # @!endgroup

          private

          def normalize_params!(**params)
            {
              name: params[:name],
              options: params[:options],
              selected: params[:selected],
              multiple: params[:multiple],
              searchable: params[:searchable],
              theme: params[:theme].to_sym,
              size: params[:size].to_sym,
              rounded: params[:rounded].to_sym,
              required: params[:required],
              disabled: params[:disabled],
              placeholder: params[:placeholder],
              search_placeholder: params[:search_placeholder],
              max_height: params[:max_height],
              classes: params[:classes]
            }
          end

          def default_options_json
            [
              { value: 'ruby', label: 'Ruby' },
              { value: 'rails', label: 'Ruby on Rails' },
              { value: 'javascript', label: 'JavaScript' },
              { value: 'typescript', label: 'TypeScript' },
              { value: 'python', label: 'Python' },
              { value: 'golang', label: 'Go' },
              { value: 'rust', label: 'Rust' },
              { value: 'elixir', label: 'Elixir' }
            ].to_json
          end

          def parse_options(options_param)
            if options_param.is_a?(String)
              JSON.parse(options_param, symbolize_names: true)
            else
              options_param
            end
          rescue JSON::ParserError
            [
              { value: 'option1', label: 'Opzione 1' },
              { value: 'option2', label: 'Opzione 2' }
            ]
          end

          def parse_selected(selected_param, multiple)
            return nil if selected_param.blank?
            
            if multiple
              selected_param.is_a?(String) ? selected_param.split(',').map(&:strip) : selected_param
            else
              selected_param.is_a?(Array) ? selected_param.first : selected_param
            end
          end
        end
      end
    end
  end
end
