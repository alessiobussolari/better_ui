module BetterUi
  module General
    module Components
      module Alert
        module AlertHelper
          # Renderizza un componente Alert per comunicare messaggi importanti all'utente.
          #
          # @param title [String, nil] Titolo dell'alert (opzionale)
          # @param message [String] Contenuto dell'alert
          # @param theme [Symbol] Tema dell'alert (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
          # @param icon [String, nil] Nome dell'icona (se vuoto usa l'icona predefinita in base al tema)
          # @param icon_position [Symbol] Posizione dell'icona (:left, :right)
          # @param dismissible [Boolean] Se l'alert può essere chiuso dall'utente
          # @param rounded [Symbol] Arrotondamento degli angoli (:none, :small, :medium, :large, :full)
          # @param importance [Symbol] Livello di importanza per accessibilità (:high, :medium, :low)
          # @param html_content [Boolean] Se il messaggio contiene HTML
          # @param classes [String] Classi CSS aggiuntive
          # @param options [Hash] Attributi HTML aggiuntivi
          #
          # @return [String] HTML del componente Alert renderizzato
          #
          # @example Alert base
          #   <%= bui_alert(message: 'Operazione completata con successo') %>
          #
          # @example Alert con titolo e tema
          #   <%= bui_alert(title: 'Errore', message: 'Impossibile completare', theme: :red) %>
          #
          # @example Alert con icona personalizzata
          #   <%= bui_alert(message: 'Avviso importante', icon: 'bell') %>
          #
          # @example Alert con pulsante per chiudere
          #   <%= bui_alert(message: 'Notifica temporanea', dismissible: true) %>
          #
          # @example Alert con HTML nel messaggio
          #   <%= bui_alert(message: '<strong>Attenzione!</strong> Controlla i dati.', html_content: true) %>
          def bui_alert(title: nil, message: nil, theme: :default, icon: nil, icon_position: :left, 
                       dismissible: false, rounded: :medium, importance: :medium, html_content: false, 
                       classes: nil, **options)
            render BetterUi::General::Alert::Component.new(
              title: title,
              message: message,
              theme: theme,
              icon: icon,
              icon_position: icon_position,
              dismissible: dismissible,
              rounded: rounded,
              importance: importance,
              html_content: html_content,
              classes: classes,
              **options
            )
          end
        end
      end
    end
  end
end
