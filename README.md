# BetterUI

Una libreria completa di componenti UI per applicazioni Rails costruita con ViewComponent e Tailwind CSS. Include 26 componenti con un sistema di design unificato e documentazione interattiva.

- 🎨 **Componenti Eleganti**: Componenti UI pre-costruiti con styling Tailwind CSS
- 📖 **Documentazione Interattiva**: Preview Lookbook integrate per tutti i componenti
- 🔧 **Altamente Personalizzabile**: Opzioni di configurazione flessibili per ogni componente
- 🚀 **Production Ready**: Componenti testati che seguono le best practices
- 📱 **Responsive**: Tutti i componenti sono mobile-first e responsive
- ♿ **Accessibile**: Costruiti pensando all'accessibilità

## Panoramica

Better UI è una gem Rails che fornisce una collezione di componenti UI riutilizzabili costruiti con ViewComponent e Tailwind CSS. Include un sistema di design unificato con tematizzazione consistente e gestione completa dei form.

### Caratteristiche Principali

- **Solo TailwindCSS**: Approccio puro Tailwind senza file CSS/SCSS personalizzati
- **26 Componenti**: Libreria completa organizzata per scopo
- **Sistema Input Unificato**: Componenti input supportano 14+ tipi (text, email, password, number, date, time, etc.)
- **Documentazione Interattiva**: Integrazione Lookbook con preview live
- **Sistema Helper**: Helper Rails-friendly con integrazione form builder
- **Tematizzazione Consistente**: 9 temi standard (default, white, red, rose, orange, green, blue, yellow, violet)
- **Dimensionamento Flessibile**: 3 dimensioni standard (small, medium, large) con 5 opzioni border radius
- **Accessibilità**: Componenti progettati seguendo le best practices di accessibilità

## Installazione

Aggiungi questa riga al Gemfile della tua applicazione:

```ruby
gem "better_ui"
```

Per lo sviluppo con documentazione Lookbook:

```ruby
gem "better_ui"
gem "lookbook", group: :development
```

Quindi esegui:

```bash
$ bundle install
```

## Setup

### 1. Mount Engine (Opzionale)

Se vuoi accedere alle route interne di BetterUI, monta l'engine in `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  mount BetterUi::Engine => "/better_ui"
  # le tue altre route...
end
```

### 2. Setup Lookbook (Raccomandato per Development)

Per accedere alla documentazione interattiva dei componenti durante lo sviluppo, monta Lookbook in `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  # Monta Lookbook solo in development
  mount Lookbook::Engine => "/lookbook" if Rails.env.development?

  # le tue altre route...
end
```

**Fatto!** I componenti BetterUI e le loro preview sono automaticamente disponibili in Lookbook.

### 3. Includi Tailwind CSS

Assicurati che la tua applicazione includa Tailwind CSS, dato che i componenti BetterUI si basano sulle classi Tailwind. Se non hai Tailwind CSS installato, segui la [guida ufficiale di installazione Tailwind CSS](https://tailwindcss.com/docs/guides/ruby-on-rails).

## Utilizzo

I componenti Better UI possono essere utilizzati in due modi: istanziazione diretta o metodi helper.

### Metodi Helper (Raccomandato)

```erb
<%# Input di testo con validazione %>
<%= bui_input_text(
  name: 'email',
  value: @user.email,
  type: :email,
  theme: :blue,
  size: :large,
  required: true
) %>

<%# Button con theme e size %>
<%= bui_button(
  'Invia Form',
  theme: :green,
  size: :large,
  type: :submit
) %>

<%# Card con blocco di contenuto %>
<%= bui_card(title: 'Profilo Utente', theme: :white) do %>
  <p>Contenuto informazioni utente qui</p>
<% end %>

<%# Integrazione con form %>
<%= form_with model: @user do |form| %>
  <%= bui_input_text(name: 'name', form: form, required: true) %>
  <%= bui_input_text(name: 'email', type: :email, form: form) %>
  <%= bui_button('Salva', type: :submit, theme: :blue) %>
<% end %>
```

### Istanziazione Diretta

```erb
<%# Rendering diretto del componente %>
<%= render BetterUi::General::Input::Text::Component.new(
  name: 'username',
  type: :text,
  theme: :default,
  size: :medium
) %>

<%# Componente button %>
<%= render BetterUi::General::Button::Component.new(
  'Cliccami',
  theme: :blue,
  size: :large
) %>
```

### Sistema di Tematizzazione

Tutti i componenti supportano tematizzazione consistente:

- **9 Temi Standard**: default, white, red, rose, orange, green, blue, yellow, violet
- **3 Dimensioni Standard**: small, medium, large
- **5 Opzioni Border Radius**: none, small, medium, large, full

### Approccio Styling

Better UI usa un approccio TailwindCSS puro con costanti per styling manutenibile:

```ruby
# Le costanti del componente definiscono le opzioni di styling
BUTTON_THEME_CLASSES = {
  default: 'bg-gray-100 text-gray-900 hover:bg-gray-200',
  blue: 'bg-blue-600 text-white hover:bg-blue-700',
  green: 'bg-green-600 text-white hover:bg-green-700'
}.freeze

BUTTON_SIZE_CLASSES = {
  small: 'px-3 py-1.5 text-sm',
  medium: 'px-4 py-2 text-base',
  large: 'px-6 py-3 text-lg'
}.freeze
```

## Componenti Disponibili

Better UI include 26 componenti organizzati in tre categorie:

### Componenti Application (4)

Componenti di layout e navigazione per interfacce applicative:

- **Card**: Container di contenuto con supporto header e azioni
- **Main**: Area contenuto principale dell'applicazione con layout responsive
- **Navbar**: Barra di navigazione superiore con supporto contenuto flessibile
- **Sidebar**: Navigazione laterale collassabile

### Componenti General (22)

Elementi UI core per costruire interfacce:

**Display & Feedback**

- **Alert**: Messaggi di notifica con temi multipli e opzioni dismissible
- **Avatar**: Immagini profilo utente con supporto fallback
- **Badge**: Indicatori di stato e etichette
- **Progress**: Barre di progresso e indicatori di caricamento
- **Spinner**: Animazioni di caricamento
- **Tooltip**: Overlay di aiuto contestuale e informazioni

**Navigazione & Struttura**

- **Breadcrumb**: Indicatori di percorso di navigazione
- **Divider**: Separatori di contenuto visivi
- **Heading**: Intestazioni con tipografia consistente
- **Icon**: Sistema icone SVG con libreria estesa
- **Link**: Elementi anchor potenziati con supporto theme
- **Panel**: Sezioni di contenuto organizzate
- **Table**: Tabelle dati con sorting e funzionalità responsive
- **Tag**: Elementi di categorizzazione ed etichettatura

**Form & Input**

- **Button**: Button azione con varianti multiple e stati
- **Field**: Wrapper campo form con supporto label e validazione
- **Input**: Sistema input unificato che supporta 14+ tipi:
  - **Text**: text, email, password, search, url, tel
  - **Number**: number, range
  - **Date/Time**: date, datetime-local, time, month, week
  - **File**: upload file
  - **Color**: color picker
  - **Checkbox**: Opzioni multi-selezione
  - **Radio**: Opzioni selezione singola
  - **Select**: Selezioni dropdown
  - **Textarea**: Input testo multi-riga

### Componenti Form (0)

Riservati per futuri componenti form specializzati e widget form complessi.

## Personalizzazione e Styling

I componenti BetterUI usano classi Tailwind CSS. Puoi:

1. **Sovrascrivere classi**: Passa classi personalizzate tramite il parametro `classes`
2. **Estendere componenti**: Crea i tuoi componenti che ereditano da BetterUI
3. **Personalizzazione theme**: Modifica la configurazione Tailwind per tematizzazione consistente

```erb
<!-- Aggiungi classi personalizzate -->
<%= render BetterUi::General::Button::Component.new(
  label: "Button Personalizzato",
  classes: "my-custom-class hover:scale-105"
) %>
```

Better UI è progettato per essere altamente personalizzabile mantenendo consistenza:

1. **Personalizzazione Theme**: Modifica le costanti dei componenti per cambiare lo styling di default
2. **Configurazione Componenti**: Configura opzioni di default in `config/initializers/better_ui.rb`
3. **Integrazione TailwindCSS**: Tutto lo styling usa classi TailwindCSS per massima flessibilità
4. **Estensioni Componenti**: Estendi componenti esistenti o crea i tuoi seguendo i pattern stabiliti

## Testing

I componenti Better UI sono testati completamente. Puoi eseguire la test suite con:

```bash
bin/rails test
```

## Supporto Browser

I componenti BetterUI supportano tutti i browser moderni che supportano:

- CSS Grid e Flexbox
- Funzionalità JavaScript ES6+
- Tailwind CSS

## Contributing

1. Forka il repository
2. Crea il tuo branch feature (`git checkout -b feature/componente-fantastico`)
3. Aggiungi il tuo componente con test e preview Lookbook
4. Committa le tue modifiche (`git commit -am 'Aggiungi componente fantastico'`)
5. Pusha al branch (`git push origin feature/componente-fantastico`)
6. Crea una Pull Request

### Setup Development

```bash
git clone https://github.com/alessiobussolari/better_ui.git
cd better_ui
bundle install
cd test/dummy
bundle exec rails server
```

Visita `http://localhost:3000/lookbook` per vedere la documentazione dei componenti.

## Roadmap

- 🎯 Componenti form avanzati (input complessi, validazioni)
- 📊 Componenti chart e visualizzazione dati
- 🎭 Componenti animazione e transizione
- 🌙 Supporto dark mode
- 📱 Componenti specifici mobile
- 🔧 Tool di configurazione e generatori

## License

La gem è disponibile come open source sotto i termini della [MIT License](https://opensource.org/licenses/MIT).

## Support

- 📖 [Documentazione](https://github.com/alessiobussolari/better_ui)
- 🐛 [Issue Tracker](https://github.com/alessiobussolari/better_ui/issues)
- 💬 [Discussioni](https://github.com/alessiobussolari/better_ui/discussions)

---

Costruito con ❤️ da [PanDev](https://github.com/alessiobussolari)
