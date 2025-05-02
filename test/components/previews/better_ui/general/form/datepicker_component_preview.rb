module BetterUi
  module General
    module Form
      class DatepickerComponentPreview < ViewComponent::Preview
        # Datepicker configurabile
        #
        # @param label text "Etichetta del campo"
        # @param placeholder text "Placeholder del campo"
        # @param required toggle "Campo obbligatorio"
        # @param disabled toggle "Campo disabilitato"
        # @param readonly toggle "Campo in sola lettura"
        # @param auto_focus toggle "Focus automatico"
        def default(
          label: "Data di nascita",
          placeholder: "",
          required: false,
          disabled: false,
          readonly: false,
          auto_focus: false
        )
          # Conversione dei valori
          required = required == true || required == "true"
          disabled = disabled == true || disabled == "true"
          readonly = readonly == true || readonly == "true"
          auto_focus = auto_focus == true || auto_focus == "true"
          
          render BetterUi::General::Form::DatepickerComponent.new(
            name: "birth_date",
            form: nil,
            label: label,
            placeholder: placeholder,
            required: required,
            disabled: disabled,
            readonly: readonly,
            auto_focus: auto_focus
          )
        end

        # @!group Esempi Specifici
        
        # @label Con errore
        def with_error(preview_params = {})
          render BetterUi::General::Form::DatepickerComponent.new(
            name: "birth_date",
            form: nil,
            label: "Data di nascita",
            required: true,
            error_messages: ["La data non è valida", "Seleziona una data nel passato"]
          )
        end

        # @label Con suggerimento
        def with_hint(preview_params = {})
          render BetterUi::General::Form::DatepickerComponent.new(
            name: "event_date",
            form: nil,
            label: "Data dell'evento",
            hint: "Seleziona una data compresa tra oggi e i prossimi 30 giorni"
          )
        end

        # @label Con valore predefinito
        def with_value(preview_params = {})
          render BetterUi::General::Form::DatepickerComponent.new(
            name: "publication_date",
            form: nil,
            label: "Data di pubblicazione",
            value: Date.today.strftime("%Y-%m-%d")
          )
        end

        # @label Con range di date
        def with_date_range(preview_params = {})
          render BetterUi::General::Form::DatepickerComponent.new(
            name: "booking_date",
            form: nil,
            label: "Data di prenotazione",
            min: Date.today.strftime("%Y-%m-%d"),
            max: (Date.today + 30).strftime("%Y-%m-%d"),
            hint: "Seleziona una data nei prossimi 30 giorni"
          )
        end
        # @!endgroup
      end
    end
  end
end 