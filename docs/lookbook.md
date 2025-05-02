# Utilizzo di Lookbook con BetterUI 

BetterUI integra [Lookbook](https://github.com/allmarkedup/lookbook) per fornire un'esperienza di sviluppo avanzata con preview interattive dei componenti.

## Funzionalità abilitate

- **Preview dei componenti**: Visualizza e interagisci con i componenti in isolamento
- **Live reload**: Ricarica automatica delle preview quando modifichi i file dei componenti
- **Esplorazione del codice**: Visualizza il codice sorgente dei componenti e i template ERB
- **Gruppi e categorizzazione**: I componenti sono organizzati per categorie (General, Application, Website)

## Accesso a Lookbook

Quando integri BetterUI nella tua applicazione Rails, Lookbook sarà disponibile nei seguenti percorsi:

- **In fase di sviluppo della gemma**: `http://localhost:3000/components`
- **Nella tua applicazione**: `http://localhost:3000/better_ui/lookbook`

## Dipendenze aggiuntive

Per garantire il funzionamento ottimale di tutte le funzionalità, BetterUI richiede le seguenti dipendenze in ambiente di sviluppo:

```ruby
# Nel Gemfile della tua applicazione
group :development do
  gem "listen"  # Per il rilevamento delle modifiche ai file
  gem "actioncable"  # Per la comunicazione WebSocket in tempo reale
end
```

Queste dipendenze sono già incluse in BetterUI come dipendenze di sviluppo, ma se riscontri problemi puoi aggiungerle esplicitamente nel Gemfile della tua applicazione.

## Personalizzazione

Puoi personalizzare la configurazione di Lookbook creando un initializer nella tua applicazione:

```ruby
# config/initializers/lookbook.rb
if defined?(Lookbook)
  Lookbook.configure do |config|
    # Personalizza il titolo della pagina
    config.page_title = 'La Mia UI - Catalogo Componenti'
    
    # Personalizza i nomi visualizzati delle categorie
    config.preview_display_names = {
      'BetterUi::General' => 'Componenti Base',
      'BetterUi::Application' => 'Componenti Applicativi'
    }
    
    # Altre opzioni di personalizzazione...
  end
end
```

## Troubleshooting

Se riscontri problemi con Lookbook:

1. **Assicurati che tutte le dipendenze siano installate**: Esegui `bundle install` per installare tutte le dipendenze necessarie.
2. **Verifica l'ambiente**: Lookbook è disponibile solo negli ambienti di sviluppo e test.
3. **Riavvia il server**: Alcuni cambiamenti richiedono un riavvio del server Rails per essere applicati.
4. **Pulisci la cache**: Se le modifiche non si riflettono, prova `bin/rails tmp:clear`.

Per ulteriori informazioni, consulta la [documentazione ufficiale di Lookbook](https://lookbook.build). 