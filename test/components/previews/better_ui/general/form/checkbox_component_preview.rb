module BetterUi
  module General
    module Form
      class CheckboxComponentPreview < Lookbook::Preview
        # @!group Default
        
        # @label Default
        # @param required select [false, true]
        # @param disabled select [false, true]
        # @param checked select [false, true]
        def default(required: false, disabled: false, checked: false)
          render BetterUi::General::Form::CheckboxComponent.new(
            name: "termini",
            label: "Accetto i termini e le condizioni",
            checked: checked,
            required: required,
            disabled: disabled
          )
        end
        
        # @!endgroup
        
        # @!group Esempi Specifici
        
        # @label Con Suggerimento
        def with_hint
          render BetterUi::General::Form::CheckboxComponent.new(
            name: "newsletter",
            label: "Iscriviti alla newsletter",
            hint: "Riceverai aggiornamenti mensili sui nostri prodotti e servizi",
            checked: true
          )
        end
        
        # @label Con Errore
        def with_error
          render BetterUi::General::Form::CheckboxComponent.new(
            name: "privacy",
            label: "Accetto l'informativa sulla privacy",
            error: "Devi accettare l'informativa sulla privacy per continuare",
            required: true
          )
        end
        
        # @label Con Valore Personalizzato
        def with_custom_value
          render BetterUi::General::Form::CheckboxComponent.new(
            name: "notifiche",
            label: "Abilita notifiche push",
            value: "push_enabled",
            hint: "Riceverai notifiche in tempo reale"
          )
        end
        
        # @label Disabilitato Selezionato
        def disabled_checked
          render BetterUi::General::Form::CheckboxComponent.new(
            name: "default_settings",
            label: "Impostazioni predefinite",
            checked: true,
            disabled: true,
            hint: "Questa opzione non può essere modificata"
          )
        end
        
        # @!endgroup
      end
    end
  end
end 