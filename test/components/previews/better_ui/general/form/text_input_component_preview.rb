module BetterUi
  module General
    module Form
      class TextInputComponentPreview < Lookbook::Preview
        # @!group Default
        
        # @label Default
        # @param required select [false, true]
        # @param disabled select [false, true]
        def default(required: false, disabled: false)
          render BetterUi::General::Form::TextInputComponent.new(
            name: "nome",
            label: "Nome",
            placeholder: "Inserisci il tuo nome",
            required: required,
            disabled: disabled
          )
        end
        
        # @!endgroup
        
        # @!group Esempi Specifici
        
        # @label Con Valore
        def with_value
          render BetterUi::General::Form::TextInputComponent.new(
            name: "email",
            label: "Email",
            value: "mario.rossi@example.com",
            type: "email"
          )
        end
        
        # @label Con Errore
        def with_error
          render BetterUi::General::Form::TextInputComponent.new(
            name: "email",
            label: "Email",
            value: "mario.rossi",
            type: "email",
            error: "Inserisci un indirizzo email valido"
          )
        end
        
        # @label Con Suggerimento
        def with_hint
          render BetterUi::General::Form::TextInputComponent.new(
            name: "password",
            label: "Password",
            type: "password",
            hint: "La password deve contenere almeno 8 caratteri, una lettera maiuscola e un numero"
          )
        end
        
        # @label Numerico
        def number_input
          render BetterUi::General::Form::TextInputComponent.new(
            name: "eta",
            label: "Età",
            type: "number",
            min: 18,
            max: 100,
            step: 1,
            hint: "Inserisci un valore tra 18 e 100"
          )
        end
        
        # @label Data
        def date_input
          render BetterUi::General::Form::TextInputComponent.new(
            name: "data_nascita",
            label: "Data di nascita",
            type: "date",
            hint: "Seleziona la tua data di nascita"
          )
        end
        
        # @label Readonly
        def readonly_input
          render BetterUi::General::Form::TextInputComponent.new(
            name: "codice_fiscale",
            label: "Codice Fiscale",
            value: "RSSMRA80A01H501R",
            readonly: true
          )
        end
        
        # @label Con Pattern
        def with_pattern
          render BetterUi::General::Form::TextInputComponent.new(
            name: "codice_fiscale",
            label: "Codice Fiscale",
            pattern: "[A-Z]{6}[0-9]{2}[A-Z][0-9]{2}[A-Z][0-9]{3}[A-Z]",
            hint: "Inserisci un codice fiscale valido (formato: RSSMRA80A01H501R)"
          )
        end
        
        # @!endgroup
      end
    end
  end
end 