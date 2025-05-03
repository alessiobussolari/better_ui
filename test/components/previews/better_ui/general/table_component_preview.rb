module BetterUi
  module General
    class TableComponentPreview < ViewComponent::Preview
      # Tabella configurabile
      #
      # @param caption text "Didascalia della tabella (opzionale)"
      # @param variant select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Variante di colore"
      # @param striped toggle "Righe alternate"
      # @param hoverable toggle "Effetto hover sulle righe"
      # @param bordered toggle "Mostra bordi"
      # @param compact toggle "Stile compatto"
      # @param rounded select { choices: [none, small, medium, large, full] } "Tipo di border-radius"
      # @param data_type select { choices: [array, hash] } "Tipo di dati da mostrare"
      # @param row_count select { choices: [3, 5] } "Numero di righe"
      def default(
        caption: "Esempio Tabella",
        variant: :default,
        striped: false,
        hoverable: false,
        bordered: true,
        compact: false,
        rounded: :small,
        data_type: :array,
        row_count: 3
      )
        # Conversione dei tipi
        variant = variant.to_sym if variant.is_a?(String)
        data_type = data_type.to_sym if data_type.is_a?(String)
        rounded = rounded.to_sym if rounded.is_a?(String)
        striped = striped == true || striped == "true"
        hoverable = hoverable == true || hoverable == "true"
        bordered = bordered == true || bordered == "true" 
        compact = compact == true || compact == "true"
        row_count = row_count.to_i if row_count.is_a?(String)
        
        # Validazione
        valid_variants = [:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet]
        valid_data_types = [:array, :hash]
        valid_row_counts = [3, 5]
        valid_rounded = [:none, :small, :medium, :large, :full]
        
        variant = :default unless valid_variants.include?(variant)
        data_type = :array unless valid_data_types.include?(data_type)
        row_count = 3 unless valid_row_counts.include?(row_count)
        rounded = :small unless valid_rounded.include?(rounded)
        
        # Dati di esempio
        headers = ['Nome', 'Email', 'Ruolo']
        
        array_data = [
          ['Mario Rossi', 'mario.rossi@example.com', 'Amministratore'],
          ['Giulia Bianchi', 'giulia.bianchi@example.com', 'Utente'],
          ['Paolo Verdi', 'paolo.verdi@example.com', 'Moderatore'],
          ['Chiara Neri', 'chiara.neri@example.com', 'Utente'],
          ['Luca Gialli', 'luca.gialli@example.com', 'Moderatore']
        ]
        
        hash_data = [
          { nome: 'Mario Rossi', email: 'mario.rossi@example.com', ruolo: 'Amministratore' },
          { nome: 'Giulia Bianchi', email: 'giulia.bianchi@example.com', ruolo: 'Utente' },
          { nome: 'Paolo Verdi', email: 'paolo.verdi@example.com', ruolo: 'Moderatore' },
          { nome: 'Chiara Neri', email: 'chiara.neri@example.com', ruolo: 'Utente' },
          { nome: 'Luca Gialli', email: 'luca.gialli@example.com', ruolo: 'Moderatore' }
        ]
        
        # Selezione dei dati in base al tipo e al numero di righe
        data = data_type == :array ? array_data : hash_data
        data = data.take(row_count)
        
        # Pulisci valori vuoti
        caption = nil if caption.is_a?(String) && caption.strip.empty?
        
        render BetterUi::General::TableComponent.new(
          headers: data_type == :array ? headers : nil,
          data: data,
          caption: caption,
          variant: variant,
          striped: striped,
          hoverable: hoverable,
          bordered: bordered,
          compact: compact,
          rounded: rounded
        )
      end
      
      # @!group Esempi specifici
      
      # @label Tabella completa
      def complete_table
        render BetterUi::General::TableComponent.new(
          headers: ['Nome', 'Email', 'Ruolo'],
          data: [
            ['Mario Rossi', 'mario.rossi@example.com', 'Amministratore'],
            ['Giulia Bianchi', 'giulia.bianchi@example.com', 'Utente'],
            ['Paolo Verdi', 'paolo.verdi@example.com', 'Moderatore'],
            ['Chiara Neri', 'chiara.neri@example.com', 'Utente'],
            ['Luca Gialli', 'luca.gialli@example.com', 'Moderatore']
          ],
          caption: 'Tabella completa',
          striped: true,
          hoverable: true,
          bordered: true,
          variant: :blue,
          rounded: :medium
        )
      end
      
      # @label Dati strutturati (Hash)
      def table_with_hash_data
        data = [
          { nome: 'Mario Rossi', email: 'mario.rossi@example.com', ruolo: 'Amministratore' },
          { nome: 'Giulia Bianchi', email: 'giulia.bianchi@example.com', ruolo: 'Utente' },
          { nome: 'Paolo Verdi', email: 'paolo.verdi@example.com', ruolo: 'Moderatore' }
        ]
        
        render BetterUi::General::TableComponent.new(
          data: data,
          caption: 'Tabella con dati in formato Hash',
          hoverable: true,
          rounded: :large
        )
      end
      
      # @label Varianti di colore
      def color_variants
        render_with_template(locals: {
          variants: [
            { name: "Default", variant: :default },
            { name: "White", variant: :white },
            { name: "Red", variant: :red },
            { name: "Green", variant: :green },
            { name: "Blue", variant: :blue }
          ]
        })
      end
      
      # @label Varianti di border-radius
      def border_radius_variants
        render_with_template(locals: {
          variants: [
            { name: "Nessun radius", rounded: :none },
            { name: "Small", rounded: :small },
            { name: "Medium", rounded: :medium },
            { name: "Large", rounded: :large },
            { name: "Full", rounded: :full }
          ]
        })
      end
      
      # @!endgroup
    end
  end
end 