module BetterUi
  module General
    module Form
      class TimepickerComponentPreview < ViewComponent::Preview
        # Timepicker configurabile
        #
        # @param label text "Etichetta del campo"
        # @param placeholder text "Placeholder del campo"
        # @param required toggle "Campo obbligatorio"
        # @param disabled toggle "Campo disabilitato"
        # @param readonly toggle "Campo in sola lettura"
        # @param auto_focus toggle "Focus automatico"
        def default(
          label: "Orario",
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
          
          render BetterUi::General::Form::TimepickerComponent.new(
            name: "meeting_time",
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
          render BetterUi::General::Form::TimepickerComponent.new(
            name: "meeting_time",
            form: nil,
            label: "Orario riunione",
            required: true,
            error_messages: ["L'orario deve essere compreso tra le 9:00 e le 18:00"]
          )
        end

        # @label Con suggerimento
        def with_hint(preview_params = {})
          render BetterUi::General::Form::TimepickerComponent.new(
            name: "appointment_time",
            form: nil,
            label: "Orario appuntamento",
            hint: "Gli appuntamenti sono disponibili dalle 9:00 alle 18:00, con incrementi di 30 minuti"
          )
        end

        # @label Con valore predefinito
        def with_value(preview_params = {})
          render BetterUi::General::Form::TimepickerComponent.new(
            name: "start_time",
            form: nil,
            label: "Orario inizio",
            value: "09:00"
          )
        end

        # @label Con step personalizzato
        def with_custom_step(preview_params = {})
          render BetterUi::General::Form::TimepickerComponent.new(
            name: "appointment_time",
            form: nil,
            label: "Orario appuntamento",
            step: 1800, # 30 minuti in secondi
            hint: "Seleziona un orario con incrementi di 30 minuti",
            min: "09:00",
            max: "18:00"
          )
        end
        # @!endgroup
      end
    end
  end
end 