module BetterUi
  module General
    module Form
      class SelectComponentPreview < Lookbook::Preview
        # @!group Default
        
        # @label Default
        # @param required select [false, true]
        # @param disabled select [false, true]
        # @param include_prompt select [true, false]
        def default(required: false, disabled: false, include_prompt: true)
          render BetterUi::General::Form::SelectComponent.new(
            name: "provincia",
            label: "Provincia",
            options: province_options,
            prompt: include_prompt ? "Seleziona una provincia" : nil,
            required: required,
            disabled: disabled
          )
        end
        
        # @!endgroup
        
        # @!group Esempi Specifici
        
        # @label Con Valore Selezionato
        def with_selected
          render BetterUi::General::Form::SelectComponent.new(
            name: "provincia",
            label: "Provincia",
            options: province_options,
            selected: "MI",
            prompt: "Seleziona una provincia"
          )
        end
        
        # @label Con Opzioni Raggruppate
        def with_grouped_options
          render BetterUi::General::Form::SelectComponent.new(
            name: "regione_provincia",
            label: "Regione e Provincia",
            options: [
              ["--- Lombardia ---", "", { disabled: true }],
              ["Milano", "MI"],
              ["Bergamo", "BG"],
              ["Brescia", "BS"],
              ["--- Lazio ---", "", { disabled: true }],
              ["Roma", "RM"],
              ["Frosinone", "FR"],
              ["--- Campania ---", "", { disabled: true }],
              ["Napoli", "NA"],
              ["Salerno", "SA"]
            ],
            prompt: "Seleziona una provincia"
          )
        end
        
        # @label Multiplo
        def multiple_select
          render BetterUi::General::Form::SelectComponent.new(
            name: "interessi",
            label: "Interessi",
            options: [
              ["Sport", "sport"],
              ["Musica", "musica"],
              ["Cinema", "cinema"],
              ["Viaggi", "viaggi"],
              ["Lettura", "lettura"],
              ["Cucina", "cucina"]
            ],
            multiple: true,
            size: 5,
            hint: "Seleziona uno o più interessi"
          )
        end
        
        # @label Con Errore
        def with_error
          render BetterUi::General::Form::SelectComponent.new(
            name: "provincia",
            label: "Provincia",
            options: province_options,
            error: "Seleziona una provincia valida",
            prompt: "Seleziona una provincia"
          )
        end
        
        # @label Con Suggerimento
        def with_hint
          render BetterUi::General::Form::SelectComponent.new(
            name: "provincia",
            label: "Provincia",
            options: province_options,
            hint: "La provincia verrà utilizzata per il calcolo delle spese di spedizione",
            prompt: "Seleziona una provincia"
          )
        end
        
        # @label Con Opzioni Hash
        def with_hash_options
          render BetterUi::General::Form::SelectComponent.new(
            name: "priorita",
            label: "Priorità",
            options: [
              { text: "Alta", value: "alta" },
              { text: "Media", value: "media" },
              { text: "Bassa", value: "bassa" },
              { text: "Non disponibile", value: "non_disponibile", disabled: true }
            ],
            prompt: "Seleziona una priorità"
          )
        end
        
        # @!endgroup
        
        private
        
        def province_options
          [
            ["Milano", "MI"],
            ["Roma", "RM"],
            ["Napoli", "NA"],
            ["Torino", "TO"],
            ["Palermo", "PA"],
            ["Genova", "GE"],
            ["Bologna", "BO"],
            ["Firenze", "FI"],
            ["Bari", "BA"],
            ["Catania", "CT"]
          ]
        end
      end
    end
  end
end 