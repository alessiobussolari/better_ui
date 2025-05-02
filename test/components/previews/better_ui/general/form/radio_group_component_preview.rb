module BetterUi
  module General
    module Form
      class RadioGroupComponentPreview < Lookbook::Preview
        # @!group Default
        
        # @label Default
        # @param required select [false, true]
        # @param disabled select [false, true]
        def default(required: false, disabled: false)
          render BetterUi::General::Form::RadioGroupComponent.new(
            name: "genere",
            legend: "Genere",
            options: [
              { text: "Maschio", value: "maschio" },
              { text: "Femmina", value: "femmina" },
              { text: "Non binario", value: "non_binario" },
              { text: "Preferisco non specificare", value: "non_specificato" }
            ],
            required: required,
            disabled: disabled
          )
        end
        
        # @!endgroup
        
        # @!group Esempi Specifici
        
        # @label Con Valore Selezionato
        def with_selected
          render BetterUi::General::Form::RadioGroupComponent.new(
            name: "metodo_pagamento",
            legend: "Metodo di pagamento",
            options: [
              { text: "Carta di credito", value: "carta" },
              { text: "PayPal", value: "paypal" },
              { text: "Bonifico bancario", value: "bonifico" },
              { text: "Contrassegno", value: "contrassegno" }
            ],
            selected: "paypal"
          )
        end
        
        # @label Con Opzioni Disabilitate
        def with_disabled_options
          render BetterUi::General::Form::RadioGroupComponent.new(
            name: "spedizione",
            legend: "Metodo di spedizione",
            options: [
              { text: "Standard (3-5 giorni)", value: "standard" },
              { text: "Express (1-2 giorni)", value: "express" },
              { text: "Same-day (oggi)", value: "same_day", disabled: true, hint: "Non disponibile per il tuo CAP" }
            ]
          )
        end
        
        # @label Con Suggerimento
        def with_hint
          render BetterUi::General::Form::RadioGroupComponent.new(
            name: "preferenza_contatto",
            legend: "Preferenza di contatto",
            options: [
              { text: "Email", value: "email" },
              { text: "Telefono", value: "telefono" },
              { text: "SMS", value: "sms" }
            ],
            hint: "Scegli come preferisci essere contattato"
          )
        end
        
        # @label Con Errore
        def with_error
          render BetterUi::General::Form::RadioGroupComponent.new(
            name: "privacy",
            legend: "Informativa sulla privacy",
            options: [
              { text: "Accetto", value: "accetto" },
              { text: "Non accetto", value: "non_accetto" }
            ],
            error: "Devi accettare l'informativa sulla privacy per continuare",
            required: true
          )
        end
        
        # @label Con Hint per Singole Opzioni
        def with_option_hints
          render BetterUi::General::Form::RadioGroupComponent.new(
            name: "piano",
            legend: "Piano di abbonamento",
            options: [
              { text: "Base", value: "base", hint: "Accesso limitato - €9.99/mese" },
              { text: "Premium", value: "premium", hint: "Accesso completo - €19.99/mese" },
              { text: "Enterprise", value: "enterprise", hint: "Per team e aziende - €49.99/mese" }
            ]
          )
        end
        
        # @!endgroup
      end
    end
  end
end 