module BetterUi
  module General
    module Form
      class RadioComponentPreview < Lookbook::Preview
        # @!group Default
        
        # @label Default
        # @param required select [false, true]
        # @param disabled select [false, true]
        # @param checked select [false, true]
        def default(required: false, disabled: false, checked: false)
          render BetterUi::General::Form::RadioComponent.new(
            name: "genere",
            value: "maschio",
            label: "Maschio",
            checked: checked,
            required: required,
            disabled: disabled
          )
        end
        
        # @!endgroup
        
        # @!group Esempi Specifici
        
        # @label Con Suggerimento
        def with_hint
          render BetterUi::General::Form::RadioComponent.new(
            name: "preferenza_contatto",
            value: "email",
            label: "Email",
            hint: "Preferisco essere contattato via email",
            checked: true
          )
        end
        
        # @label Con Errore
        def with_error
          render BetterUi::General::Form::RadioComponent.new(
            name: "metodo_pagamento",
            value: "carta",
            label: "Carta di credito",
            error: "Seleziona un metodo di pagamento valido",
            required: true
          )
        end
        
        # @label Disabilitato Selezionato
        def disabled_checked
          render BetterUi::General::Form::RadioComponent.new(
            name: "categoria",
            value: "standard",
            label: "Utente standard",
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