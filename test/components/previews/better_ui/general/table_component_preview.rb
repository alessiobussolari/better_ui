module BetterUi
  module General
    class TableComponentPreview < ViewComponent::Preview
      # @!group Default
      
      # @label Con Helper
      # @param caption text "Didascalia della tabella (opzionale)"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema di colore"
      # @param orientation select { choices: [horizontal, vertical] } "Orientamento"
      # @param style select { choices: [default, bordered, striped, compact, minimal] } "Stile della tabella"
      # @param radius select { choices: [none, small, medium, large, full] } "Tipo di border-radius"
      # @param striped toggle "Righe alternate"
      # @param hoverable toggle "Effetto hover sulle righe"
      # @param bordered toggle "Mostra bordi"
      # @param compact toggle "Stile compatto"
      # @param data_type select { choices: [array, hash] } "Tipo di dati da mostrare"
      # @param row_count select { choices: [3, 5] } "Numero di righe"
      # @param has_footer toggle "Mostra footer"
      def default(
        caption: "Esempio Tabella",
        theme: :default,
        orientation: :horizontal,
        style: :default,
        radius: :small,
        striped: false,
        hoverable: false,
        bordered: true,
        compact: false,
        data_type: :array,
        row_count: 3,
        has_footer: false
      )
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
        
        # Prepara il footer se richiesto
        footer = nil
        if has_footer
          if data_type == :array
            footer = ['Totale', "#{row_count} utenti", '']
          else
            footer = ['Totale', "#{row_count} utenti", '']
          end
        end
        
        render_with_template(locals: {
          data: data,
          headers: data_type == :array ? headers : nil,
          caption: caption,
          theme: theme,
          orientation: orientation,
          style: style,
          radius: radius,
          striped: striped,
          hoverable: hoverable,
          bordered: bordered,
          compact: compact,
          footer: footer
        })
      end
      
      # @label Istanziazione Diretta
      # @param caption text "Didascalia della tabella (opzionale)"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema di colore"
      # @param orientation select { choices: [horizontal, vertical] } "Orientamento"
      # @param style select { choices: [default, bordered, striped, compact, minimal] } "Stile della tabella"
      # @param radius select { choices: [none, small, medium, large, full] } "Tipo di border-radius"
      # @param striped toggle "Righe alternate"
      # @param hoverable toggle "Effetto hover sulle righe"
      # @param bordered toggle "Mostra bordi"
      # @param compact toggle "Stile compatto"
      # @param data_type select { choices: [array, hash] } "Tipo di dati da mostrare"
      # @param row_count select { choices: [3, 5] } "Numero di righe"
      # @param has_footer toggle "Mostra footer"
      def raw(
        caption: "Esempio Tabella",
        theme: :default,
        orientation: :horizontal,
        style: :default,
        radius: :small,
        striped: false,
        hoverable: false,
        bordered: true,
        compact: false,
        data_type: :array,
        row_count: 3,
        has_footer: false
      )
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
        
        # Prepara il footer se richiesto
        footer = nil
        if has_footer
          if data_type == :array
            footer = ['Totale', "#{row_count} utenti", '']
          else
            footer = ['Totale', "#{row_count} utenti", '']
          end
        end
        
        render BetterUi::General::TableComponent.new(
          data: data,
          headers: data_type == :array ? headers : nil,
          caption: caption,
          theme: theme,
          orientation: orientation,
          style: style,
          radius: radius,
          striped: striped,
          hoverable: hoverable,
          bordered: bordered,
          compact: compact,
          footer: footer
        )
      end
      
      # @!endgroup
    end
  end
end 