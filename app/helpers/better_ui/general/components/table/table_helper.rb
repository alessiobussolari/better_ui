module BetterUi
  module General
    module Components
      module Table
        module TableHelper

          # Renderizza un componente Table per visualizzare dati strutturati in formato tabellare.
          #
          # @param headers [Array<String>] Intestazioni delle colonne della tabella
          # @param rows [Array<Array>] Dati delle righe della tabella
          # @param striped [Boolean] Applica righe alternate con colori diversi
          # @param bordered [Boolean] Aggiunge bordi alla tabella
          # @param hover [Boolean] Aggiunge effetto hover sulle righe
          # @param responsive [Boolean] Rende la tabella responsiva (scrollabile orizzontalmente)
          # @param compact [Boolean] Riduce la spaziatura interna
          # @param theme [Symbol] Tema della tabella (:default, :white, :gray)
          # @param size [Symbol] Dimensione della tabella (:small, :medium, :large)
          # @param rounded [Symbol] Arrotondamento degli angoli (:none, :small, :medium, :large)
          # @param classes [String] Classi CSS aggiuntive
          # @param options [Hash] Attributi HTML aggiuntivi
          #
          # @return [String] HTML della tabella renderizzata
          #
          # @example Tabella base con intestazioni e righe
          #   <%= bui_table(headers: ['Nome', 'Email'], rows: [['Mario Rossi', 'mario@example.com']]) %>
          #
          # @example Tabella con righe alternate e bordi
          #   <%= bui_table(headers: ['ID', 'Prodotto', 'Prezzo'], 
          #                rows: [[1, 'Scarpe', '€80'], [2, 'Camicia', '€40']], 
          #                striped: true, bordered: true) %>
          #
          # @example Tabella con stile personalizzato
          #   <%= bui_table(headers: ['Data', 'Evento'], 
          #                rows: [['10/01/2023', 'Riunione'], ['15/01/2023', 'Scadenza']], 
          #                theme: :blue, size: :large, hover: true) %>
          #
          # @example Tabella responsiva per dispositivi mobili
          #   <%= bui_table(headers: ['Prodotto', 'Descrizione', 'Prezzo', 'Disponibilità'], 
          #                rows: [...], 
          #                responsive: true) %>
          #
          # @example Tabella con attributi HTML personalizzati
          #   <%= bui_table(headers: ['Nome', 'Email'], 
          #                rows: [['Mario Rossi', 'mario@example.com']], 
          #                id: 'users-table', 'data-sortable': true) %>
          def bui_table(**options, &block)
            render BetterUi::General::Table::Component.new(**options), &block
          end
        end
      end
    end
  end
end
