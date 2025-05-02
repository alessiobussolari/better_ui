module BetterUi
  module General
    module Form
      class TextareaComponentPreview < Lookbook::Preview
        # @!group Default
        
        # @label Default
        # @param required select [false, true]
        # @param disabled select [false, true]
        # @param rows select [3, 4, 5, 6, 8, 10]
        def default(required: false, disabled: false, rows: 4)
          render BetterUi::General::Form::TextareaComponent.new(
            name: "descrizione",
            label: "Descrizione",
            placeholder: "Inserisci una descrizione",
            rows: rows,
            required: required,
            disabled: disabled
          )
        end
        
        # @!endgroup
        
        # @!group Esempi Specifici
        
        # @label Con Valore
        def with_value
          render BetterUi::General::Form::TextareaComponent.new(
            name: "biografia",
            label: "Biografia",
            value: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.",
            rows: 5
          )
        end
        
        # @label Con Errore
        def with_error
          render BetterUi::General::Form::TextareaComponent.new(
            name: "note",
            label: "Note",
            value: "Testo troppo breve",
            error: "Inserisci almeno 20 caratteri"
          )
        end
        
        # @label Con Suggerimento
        def with_hint
          render BetterUi::General::Form::TextareaComponent.new(
            name: "messaggio",
            label: "Messaggio",
            hint: "Il messaggio verrà inviato a tutti gli utenti registrati"
          )
        end
        
        # @label Con Lunghezza Limitata
        def with_maxlength
          render BetterUi::General::Form::TextareaComponent.new(
            name: "riassunto",
            label: "Riassunto",
            maxlength: 150,
            hint: "Massimo 150 caratteri"
          )
        end
        
        # @label Readonly
        def readonly_textarea
          render BetterUi::General::Form::TextareaComponent.new(
            name: "termini",
            label: "Termini e condizioni",
            value: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna. Nunc viverra imperdiet enim.",
            readonly: true
          )
        end
        
        # @!endgroup
      end
    end
  end
end 