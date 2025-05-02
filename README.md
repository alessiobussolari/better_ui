# BetterUI 🎨

[![Gem Version](https://badge.fury.io/rb/better_ui.svg)](https://badge.fury.io/rb/better_ui)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

> Componenti UI eleganti, coerenti e facilmente integrabili per le tue applicazioni Rails

BetterUI è una gemma Rails che fornisce componenti UI riutilizzabili con documentazione integrata. Progettata per essere leggera, personalizzabile e facile da usare, ti aiuta a costruire interfacce belle e consistenti senza JavaScript.

## ✨ Caratteristiche principali

- **Design puro** - Componenti UI eleganti e completamente CSS, senza JavaScript
- **Facile integrazione** - Engine Rails montabile che si integra perfettamente con la tua app
- **Documentazione integrata** - Visualizza esempi e documentazione direttamente nel browser
- **Altamente personalizzabile** - Adatta facilmente lo stile al tuo brand
- **Componenti modulari** - Usa solo ciò di cui hai bisogno
- **Preview dei componenti** - Visualizza e interagisci con i componenti usando Lookbook

## 📦 Componenti disponibili

| Componente | Descrizione |
|------------|-------------|
| **Button** | Pulsanti stilizzati con varianti primary, secondary, success, danger |
| **Alert** | Messaggi informativi, successi, avvisi ed errori |
| **Card** | Contenitori flessibili con header, body e footer |
| **Modal** | Finestre di dialogo modali |
| **Tabs** | Navigazione a schede |
| **Navbar** | Barra di navigazione responsive con supporto per menu dropdown |
| **Sidebar** | Menu laterale con supporto per navigazione gerarchica |
| **Toast** | Notifiche temporanee con timer e animazioni |
| **Header** | Intestazioni di pagina con titolo, sottotitolo, breadcrumb e azioni |
| **Form Elements** | Campi di input stilizzati (in arrivo) |

## 🚀 Installazione

Aggiungi questa riga al Gemfile della tua applicazione:

```ruby
gem 'better_ui', '~> 0.1.0'
```

E poi esegui:

```bash
$ bundle install
```

## ⚙️ Configurazione

### Monta l'engine

Aggiungi questo al tuo file `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  mount BetterUi::Engine => '/better_ui'
  
  # ... altre tue route
end
```

### Includi gli assets

In `app/assets/stylesheets/application.css`:

```css
/*
 *= require better_ui/application
 */
```

## 🎮 Utilizzo

Una volta installato, puoi iniziare ad usare i componenti:

```erb
<%# Button %>
<%= better_ui_button("Salva", type: "primary") %>

<%# Alert %>
<%= better_ui_alert("Operazione completata", type: "success") %>

<%# Card %>
<%= better_ui_card do %>
  <%= better_ui_card_header("Titolo Card") %>
  <%= better_ui_card_body do %>
    <p>Contenuto della card...</p>
  <% end %>
<% end %>

<%# Header con breadcrumb %>
<%= render BetterUi::Application::HeaderComponent.new(
  title: "Dashboard",
  subtitle: "Gestisci tutto da qui",
  breadcrumbs: [
    { text: "Home", url: "/" },
    { text: "Dashboard" }
  ],
  actions: [
    { content: button_html("Nuovo", "primary") }
  ]
) %>
```

Visita `/better_ui` nella tua applicazione per vedere la documentazione completa e gli esempi.

### Il componente Header

Il componente Header è progettato per creare intestazioni di pagina complete con numerose funzionalità:

```erb
<%= render BetterUi::Application::HeaderComponent.new(
  title: {
    text: "Impostazioni",
    icon: "settings"
  },
  subtitle: "Configura le preferenze del sistema",
  breadcrumbs: [
    { text: "Home", url: "/" },
    { text: "Admin", url: "/admin" },
    { text: "Impostazioni" }
  ],
  variant: :modern,
  fixed: :top,
  show_breadcrumbs: true,
  actions: [
    { content: button_html("Salva", "primary") },
    { content: button_html("Annulla", "secondary") }
  ]
) %>
```

Il componente supporta:
- Titolo con opzionale icona integrata
- Sottotitolo descrittivo
- Breadcrumbs completi con link di navigazione
- Azioni contestuali (pulsanti, menu, ecc.)
- Varianti di stile: modern, light, dark, primary, transparent
- Posizionamento fisso (in alto o in basso)
- Controllo della visibilità dei breadcrumb

### Preview dei componenti con Lookbook

BetterUI integra [Lookbook](https://github.com/allmarkedup/lookbook) per visualizzare in anteprima i componenti UI:

1. Accedi a `/better_ui/lookbook` nella tua applicazione per visualizzare il catalogo componenti
2. Esplora le varianti e le configurazioni disponibili per ogni componente
3. Visualizza il codice sorgente e il markup generato
4. Interagisci con i componenti in tempo reale

Lookbook è disponibile solo negli ambienti di sviluppo e test.

## 🎮 Personalizzazione

### Genera un foglio di stile personalizzato

BetterUI include un generator per creare un foglio di stile base per personalizzare i componenti:

```bash
# Genera un foglio di stile con il prefisso predefinito "custom"
rails generate better_ui:stylesheet

# Genera un foglio di stile con un prefisso personalizzato
rails generate better_ui:stylesheet --prefix=my_theme
```

Questo creerà un file CSS con variabili e classi per tutti i componenti della gemma, che potrai facilmente personalizzare secondo le esigenze del tuo progetto.

### Usa l'inizializzatore

Crea un file `config/initializers/better_ui.rb`:

```ruby
BetterUi.configure do |config|
  config.button_defaults = {
    class: 'rounded-lg text-sm'
  }
  
  config.alert_defaults = {
    dismissible: true
  }
end
```

### Personalizza gli stili

Sovrascrivi gli stili CSS nel tuo foglio di stile:

```css
.better-ui-button-primary {
  background-color: #8b5cf6; /* Viola personalizzato */
  border-color: #8b5cf6;
}
```

## 🛠 Sviluppo

BetterUI utilizza una app dummy integrata per lo sviluppo e i test. Ecco come iniziare:

### Setup iniziale

```bash
# Clona il repository
git clone https://github.com/alessiobussolari/better_ui.git
cd better_ui

# Installa le dipendenze
bin/setup
```

### Avvia l'applicazione di test

Per vedere i componenti in azione e lavorare sulla documentazione:

```bash
# Avvia il server di test
cd test/dummy
bin/rails server

# Oppure dalla directory principale
bin/rails server -b 0.0.0.0
```

Visita `http://localhost:3000/better_ui` nel tuo browser per vedere la documentazione e testare i componenti.

### Flusso di sviluppo

1. **Crea un branch**: `git checkout -b feature/nuovo-componente`
2. **Implementa il componente**: Aggiungi helper in `app/helpers/better_ui/application_helper.rb`
3. **Aggiungi CSS**: Inserisci gli stili in `app/assets/stylesheets/better_ui/application.css`
4. **Documenta**: Crea file Markdown in `docs/components/`
5. **Testa**: Verifica nell'app dummy che tutto funzioni correttamente
6. **Esegui i test**: `rake test`

### Build e rilascio

Per buildare la gemma localmente:

```bash
bundle exec rake build
```

Per installare la versione in sviluppo:

```bash
bundle exec rake install
```

## 🤝 Contribuire

I contributi sono benvenuti e apprezzati! Ecco come puoi aiutare:

1. **Fork** il repository su GitHub
2. **Clona** il tuo fork: `git clone https://github.com/TUO-USERNAME/better_ui.git`
3. **Crea** un branch per la tua feature: `git checkout -b feature/incredibile-miglioramento`
4. **Committa** i tuoi cambiamenti: `git commit -am 'Aggiunge una funzionalità incredibile'`
5. **Pusha** al branch: `git push origin feature/incredibile-miglioramento`
6. Invia una **Pull Request**

### Linee guida

- Segui lo stile di codice esistente
- Scrivi test per le nuove funzionalità
- Aggiorna la documentazione
- Crea componenti che funzionano senza JavaScript

## 📄 Licenza

BetterUI è disponibile come open source sotto i termini della [Licenza MIT](https://opensource.org/licenses/MIT).

---

Realizzato con ❤️ da [Alessio Bussolari](https://github.com/alessiobussolari)
