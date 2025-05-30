# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Radio
        # @label Radio Button
        class ComponentPreview < ViewComponent::Preview

          #
          # ## Utilizzo Base
          # Componente radio button per creare gruppi di scelte mutuamente esclusive. I radio button funzionano in gruppi
          # dove tutti i radio con lo stesso `name` sono collegati automaticamente per la mutua esclusione.
          #
          # ## ⚠️ IMPORTANTE: Radio Button come Gruppi
          # I radio button devono essere usati SEMPRE in gruppi con lo stesso `name` per funzionare correttamente.
          # Un singolo radio button isolato non ha senso funzionale.
          #
          # ## Casi d'Uso Comuni
          # - **Selezione genere**: maschio, femmina, altro (stesso name="gender")
          # - **Priorità task**: bassa, media, alta (stesso name="priority") 
          # - **Modalità pagamento**: carta, bonifico, contrassegno (stesso name="payment_method")
          # - **Livello esperienza**: principiante, intermedio, avanzato (stesso name="experience")
          # - **Preferenze notifica**: email, sms, push (stesso name="notification_type")
          #
          # ## Variabili Principali
          # - **name**: nome del campo radio (obbligatorio) - STESSO per tutto il gruppo
          # - **value**: valore del radio button (obbligatorio) - DIVERSO per ogni opzione
          # - **theme**: colori disponibili (default, white, red, rose, orange, green, blue, yellow, violet)
          # - **size**: dimensioni disponibili (small, medium, large)
          # - **rounded**: border radius (none, small, medium, large, full)
          # - **label**: testo della label opzionale
          # - **label_position**: posizione label (left, right)
          # - **checked**: se il radio è selezionato
          # - **disabled**: se il campo è disabilitato
          #
          # ## Esempi Codice - Gruppi Radio Completi
          # ```erb
          # <%# Gruppo genere - STESSO name, value DIVERSI %>
          # <%= bui_input_radio(name: "gender", value: "male", label: "Maschio") %>
          # <%= bui_input_radio(name: "gender", value: "female", label: "Femmina") %>
          # <%= bui_input_radio(name: "gender", value: "other", label: "Altro") %>
          #
          # <%# Gruppo priorità con temi diversi %>
          # <%= bui_input_radio(name: "priority", value: "low", label: "Bassa", theme: :green) %>
          # <%= bui_input_radio(name: "priority", value: "medium", label: "Media", theme: :yellow) %>
          # <%= bui_input_radio(name: "priority", value: "high", label: "Alta", theme: :red) %>
          #
          # <%# Con Rails form builder %>
          # <%= form_with model: @user do |form| %>
          #   <%= bui_input_radio(name: :role, value: "admin", label: "Admin", form: form) %>
          #   <%= bui_input_radio(name: :role, value: "user", label: "User", form: form) %>
          #   <%= bui_input_radio(name: :role, value: "guest", label: "Guest", form: form) %>
          # <% end %>
          #
          # <%# Gruppo con selezione dinamica %>
          # <% current_choice = @user&.payment_method %>
          # <%= bui_input_radio(name: "payment", value: "card", label: "Carta", checked: current_choice == "card") %>
          # <%= bui_input_radio(name: "payment", value: "bank", label: "Bonifico", checked: current_choice == "bank") %>
          # <%= bui_input_radio(name: "payment", value: "cash", label: "Contrassegno", checked: current_choice == "cash") %>
          # ```

          # @!group Esempi Base

          # @label Con Helper
          # @param name text "Nome del campo"
          # @param value text "Valore del radio"
          # @param label text "Testo della label"
          # @param label_position select { choices: [left, right] } "Posizione label"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema colore"
          # @param size select { choices: [small, medium, large] } "Dimensione"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
          # @param checked toggle "Selezionato"
          # @param required toggle "Obbligatorio"
          # @param disabled toggle "Disabilitato"
          # @param classes text "Classi CSS aggiuntive"
          def default(
            name: "example_radio",
            value: "option_1", 
            label: "Opzione 1",
            label_position: :right,
            theme: :default,
            size: :medium,
            rounded: :full,
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
              rounded: rounded,
              checked: checked,
              required: required,
              disabled: disabled,
              classes: classes
            )
            render_with_template(locals: normalized)
          end

          # @label Istanziazione Diretta
          # @param name text "Nome del campo"
          # @param value text "Valore del radio"
          # @param label text "Testo della label"
          # @param label_position select { choices: [left, right] } "Posizione label"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema colore"
          # @param size select { choices: [small, medium, large] } "Dimensione"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
          # @param checked toggle "Selezionato"
          # @param required toggle "Obbligatorio"
          # @param disabled toggle "Disabilitato"
          # @param classes text "Classi CSS aggiuntive"
          def raw(
            name: "example_radio",
            value: "option_1",
            label: "Opzione 1", 
            label_position: :right,
            theme: :default,
            size: :medium,
            rounded: :full,
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
              rounded: rounded,
              checked: checked,
              required: required,
              disabled: disabled,
              classes: classes
            )
            render BetterUi::General::Input::Radio::Component.new(**normalized)
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
              rounded: params[:rounded].to_sym,
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
