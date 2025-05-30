# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Input
        module Radio
          # Helper specifico per radio button Better UI
          module RadioHelper
            # Genera un radio button con stili Better UI
            #
            # @param name [String] Nome del campo radio (obbligatorio)
            # @param value [String] Valore del radio button (obbligatorio)
            # @param checked [Boolean] Se il radio è selezionato
            # @param required [Boolean] Se il campo è obbligatorio
            # @param disabled [Boolean] Se il campo è disabilitato
            # @param label [String, nil] Testo della label associata al radio
            # @param label_position [Symbol] Posizione della label (:left, :right)
            # @param theme [Symbol] Tema del componente (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
            # @param size [Symbol] Dimensione del componente (:small, :medium, :large)
            # @param rounded [Symbol] Border radius (:none, :small, :medium, :large, :full)
            # @param classes [String] Classi CSS aggiuntive
            # @param form [ActionView::Helpers::FormBuilder, nil] Form builder Rails opzionale
            # @param options [Hash] Opzioni aggiuntive per l'input
            # @return [String] HTML del radio button renderizzato
            #
            # @example Gruppo radio base - Selezione genere (STESSO name, value DIVERSI)
            #   bui_input_radio(name: "gender", value: "male", label: "Maschio")
            #   bui_input_radio(name: "gender", value: "female", label: "Femmina") 
            #   bui_input_radio(name: "gender", value: "other", label: "Altro")
            #
            # @example Gruppo radio con temi diversi - Priorità task
            #   bui_input_radio(name: "priority", value: "low", label: "Bassa", theme: :green)
            #   bui_input_radio(name: "priority", value: "medium", label: "Media", theme: :yellow)
            #   bui_input_radio(name: "priority", value: "high", label: "Alta", theme: :red, size: :large)
            #
            # @example Gruppo radio con Rails form builder
            #   <%= form_with model: @user do |form| %>
            #     <%= bui_input_radio(name: :role, value: "admin", label: "Amministratore", form: form) %>
            #     <%= bui_input_radio(name: :role, value: "user", label: "Utente", form: form) %>
            #     <%= bui_input_radio(name: :role, value: "guest", label: "Ospite", form: form) %>
            #   <% end %>
            #
            # @example Gruppo radio con selezione dinamica e validazione
            #   current_method = @user&.payment_method
            #   bui_input_radio(name: "payment", value: "card", label: "Carta", checked: current_method == "card", required: true)
            #   bui_input_radio(name: "payment", value: "bank", label: "Bonifico", checked: current_method == "bank", required: true)
            #   bui_input_radio(name: "payment", value: "cash", label: "Contrassegno", checked: current_method == "cash", required: true)
            #
            # @example Gruppo radio con attributi HTML personalizzati
            #   bui_input_radio(name: "notification", value: "email", label: "Email", theme: :blue, data: { action: "change->form#updateNotification" })
            #   bui_input_radio(name: "notification", value: "sms", label: "SMS", theme: :blue, data: { action: "change->form#updateNotification" })
            #   bui_input_radio(name: "notification", value: "push", label: "Push", theme: :blue, data: { action: "change->form#updateNotification" })
            #
            def bui_input_radio(name:, value:, checked: false, required: false, disabled: false, 
                               label: nil, label_position: :right, theme: :default, 
                               size: :medium, rounded: :full, classes: '', form: nil, **options)
              render BetterUi::General::Input::Radio::Component.new(
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
                classes: classes,
                form: form,
                **options
              )
            end
          end
        end
      end
    end
  end
end
