module BetterUi
  module General
    class TableComponentPreview < ViewComponent::Preview
      # Tabella configurabile
      #
      # @param caption text "Didascalia della tabella (opzionale)"
      # @param variant select { choices: [default, primary, success, warning, danger, info] } "Variante di colore"
      # @param striped toggle "Righe alternate"
      # @param hoverable toggle "Effetto hover sulle righe"
      # @param bordered toggle "Mostra bordi"
      # @param compact toggle "Stile compatto"
      # @param data_type select { choices: [array, hash] } "Tipo di dati da mostrare"
      # @param row_count select { choices: [3, 5] } "Numero di righe"
      def default(
        caption: "Esempio Tabella",
        variant: :default,
        striped: false,
        hoverable: false,
        bordered: true,
        compact: false,
        data_type: :array,
        row_count: 3
      )
        # Conversione dei tipi
        variant = variant.to_sym if variant.is_a?(String)
        data_type = data_type.to_sym if data_type.is_a?(String)
        striped = striped == true || striped == "true"
        hoverable = hoverable == true || hoverable == "true"
        bordered = bordered == true || bordered == "true" 
        compact = compact == true || compact == "true"
        row_count = row_count.to_i if row_count.is_a?(String)
        
        # Validazione
        valid_variants = [:default, :primary, :success, :warning, :danger, :info]
        valid_data_types = [:array, :hash]
        valid_row_counts = [3, 5]
        
        variant = :default unless valid_variants.include?(variant)
        data_type = :array unless valid_data_types.include?(data_type)
        row_count = 3 unless valid_row_counts.include?(row_count)
        
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
          compact: compact
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
          variant: :primary
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
          hoverable: true
        )
      end
      
      # @!endgroup
    end
  end
end 