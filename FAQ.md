# FAQ - Domande Frequenti

Questa sezione contiene le risposte alle domande più frequenti riguardo l'utilizzo di Better UI.

## Indice

- [Generale](#generale)
- [Installazione](#installazione)
- [Componenti](#componenti)
- [Personalizzazione](#personalizzazione)
- [Integrazione](#integrazione)
- [Troubleshooting](#troubleshooting)
- [Performance](#performance)

## Generale

### Cos'è Better UI?

Better UI è una libreria di componenti UI per Ruby on Rails, costruita utilizzando ViewComponent e Tailwind CSS. È progettata per fornire componenti riutilizzabili, personalizzabili e ben documentati che seguono la metodologia BEM.

### Quale versione di Rails è supportata?

Better UI è compatibile con Rails 6.1 e versioni successive.

### Better UI utilizza JavaScript?

No, Better UI è una libreria puramente presentazionale e non include JavaScript. Se hai bisogno di aggiungere interattività, puoi utilizzare Hotwire (Turbo + Stimulus) con i componenti di Better UI.

## Installazione

### Come si installa Better UI?

Aggiungi la gemma al tuo Gemfile:

```ruby
gem 'better_ui'
```

Esegui:

```bash
bundle install
rails better_ui:install
```

Per maggiori dettagli, consulta il documento [INSTALLATION.md](INSTALLATION.md).

### Devo installare Tailwind CSS separatamente?

Sì, Better UI presuppone che tu abbia già installato e configurato Tailwind CSS nel tuo progetto. Consulta la [documentazione di Tailwind CSS](https://tailwindcss.com/docs/installation) per istruzioni.

### Come verifico che l'installazione sia avvenuta correttamente?

Dopo l'installazione, dovresti trovare:
- File di override nella directory `app/assets/stylesheets/better_ui`
- Configurazione di ViewComponent
- Riferimenti a Better UI nel tuo `application.scss`

Puoi verificare che tutto funzioni rendendo un componente di base:

```erb
<%= render BetterUi::General::ButtonComponent.new(label: 'Test') %>
```

## Componenti

### Come si utilizzano i componenti di Better UI?

Puoi rendere un componente nel tuo view utilizzando:

```erb
<%= render BetterUi::General::ButtonComponent.new(parametri) %>
```

Per esempi dettagliati, consulta [USAGE.md](USAGE.md).

### Quali categorie di componenti sono disponibili?

I componenti sono organizzati in tre categorie:
- **General**: Componenti base come bottoni, badge, icone
- **Application**: Componenti complessi come card, alert, sidebar
- **Website**: Componenti specifici per siti web (in sviluppo)

### Come posso vedere tutti i componenti disponibili e i loro parametri?

Puoi utilizzare Lookbook per visualizzare tutti i componenti. Avvia il server con `rails s` e visita `/lookbook` nel browser. Qui troverai tutti i componenti con esempi e documentazione sui parametri.

## Personalizzazione

### Come posso personalizzare l'aspetto dei componenti?

Better UI utilizza un sistema di override che ti permette di personalizzare i componenti senza modificare i file sorgente. Modifica i file con suffisso `_overrides.scss` nella directory `app/assets/stylesheets/better_ui`.

### Posso cambiare il prefisso 'bui-' delle classi CSS?

No, il prefisso 'bui-' è parte integrante della libreria e non dovrebbe essere modificato per garantire la compatibilità con future versioni.

### Come creo varianti personalizzate di un componente?

Per creare una variante personalizzata di un componente:

1. Modifica il file `_overrides.scss` del componente
2. Aggiungi le tue varianti seguendo la nomenclatura BEM
3. Utilizza la variante nel tuo componente con il parametro `variant`

Esempio:

```scss
// app/assets/stylesheets/better_ui/components/button_overrides.scss
.bui-button {
  // Classi base
  
  &--custom-variant {
    @apply bg-purple-500 text-white;
    
    &:hover {
      @apply bg-purple-600;
    }
  }
}
```

```erb
<%= render BetterUi::General::ButtonComponent.new(
  label: 'Azione speciale',
  variant: 'custom-variant'
) %>
```

## Integrazione

### Come integro Better UI con Hotwire (Turbo + Stimulus)?

Better UI è compatibile con Hotwire. Puoi utilizzare gli attributi `data` per integrare i componenti con i controller Stimulus:

```erb
<%= render BetterUi::General::ButtonComponent.new(
  label: 'Toggle menu',
  data: {
    controller: 'menu',
    action: 'click->menu#toggle',
    menu_target: 'button'
  }
) %>
```

### Posso usare Better UI con SimpleForm?

Sì, puoi integrare Better UI con SimpleForm utilizzando un wrapper personalizzato. Consulta il documento [INTEGRATION.md](INTEGRATION.md) per maggiori dettagli.

## Troubleshooting

### I miei stili personalizzati non vengono applicati

Verifica che:
1. I file di override siano nel percorso corretto
2. Il tuo `application.scss` importi i file di Better UI
3. Il tuo webpacker/asset pipeline sia configurato correttamente
4. I nomi delle classi seguano la convenzione BEM corretta

### Ricevo un errore "Component not found"

Assicurati di:
1. Utilizzare il namespace completo del componente (es. `BetterUi::General::ButtonComponent`)
2. Aver eseguito correttamente l'installazione
3. Riavviare il server dopo l'installazione

## Performance

### Better UI influisce sulle performance della mia applicazione?

Better UI è progettato per essere leggero e performante. Tuttavia, come con qualsiasi libreria:
1. Utilizza solo i componenti necessari
2. Considera l'uso di frammenti di cache per componenti che non cambiano frequentemente
3. Per applicazioni molto grandi, valuta la possibilità di impacchettare solo i componenti utilizzati

### Come posso ottimizzare le performance quando uso Better UI?

Per ottimizzare le performance:
1. Utilizza la cache di frammenti di Rails
2. Configura PurgeCSS per rimuovere classi CSS inutilizzate in produzione
3. Considera l'uso di Propshaft al posto di Sprockets per asset pipeline
4. Sfrutta lo stream response di Turbo per migliorare TTFB (Time To First Byte) 