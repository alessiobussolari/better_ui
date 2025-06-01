# 🚀 Guida Installazione

Questa guida ti aiuterà ad installare e configurare Better UI nel tuo progetto Rails.

## 📋 **Prerequisiti**

- **Ruby**: >= 3.0.0
- **Rails**: >= 7.0.0
- **Node.js**: >= 16.0.0 (per Tailwind CSS)
- **Yarn** o **npm** per gestione dipendenze frontend

## 🔧 **Installazione Gemma**

### 1. Aggiungi al Gemfile

```ruby
# Gemfile
gem 'better_ui', '~> 0.1.1'
```

### 2. Installa le dipendenze

```bash
bundle install
```

### 3. Esegui il generatore (se disponibile)

```bash
# Al momento non disponibile - configurazione manuale
rails generate better_ui:install
```

## 🎨 **Configurazione Tailwind CSS**

Better UI richiede Tailwind CSS per il funzionamento corretto dei componenti.

### 1. Installa Tailwind CSS

```bash
# Con Rails 7+
./bin/bundle add tailwindcss-rails
./bin/rails tailwindcss:install
```

### 2. Configura Tailwind

Aggiungi i path di Better UI alla configurazione:

```javascript
// tailwind.config.js
module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    // Aggiungi Better UI paths
    './vendor/bundle/ruby/*/gems/better_ui-*/app/components/**/*.html.erb',
    './vendor/bundle/ruby/*/gems/better_ui-*/app/helpers/**/*.rb'
  ],
  theme: {
    extend: {
      // Configurazioni aggiuntive se necessarie
    },
  },
  plugins: [],
}
```

### 3. Importa gli stili

```scss
// app/assets/stylesheets/application.tailwind.css
@tailwind base;
@tailwind components;
@tailwind utilities;

/* Importa Better UI styles se necessario */
@import 'better_ui';
```

## 🔗 **Configurazione ViewComponent**

Better UI utilizza ViewComponent per i componenti.

### 1. Verifica ViewComponent

ViewComponent dovrebbe essere installato automaticamente come dipendenza:

```ruby
# Gemfile (già incluso con better_ui)
gem 'view_component', '~> 3.22'
```

### 2. Configurazione Rails

```ruby
# config/application.rb
module YourApp
  class Application < Rails::Application
    # ViewComponent configuration
    config.view_component.preview_paths << BetterUi::Engine.root.join("test/components/previews")
  end
end
```

## 📖 **Configurazione Lookbook (Opzionale)**

Per visualizzare i componenti in sviluppo:

### 1. Aggiungi Lookbook

```ruby
# Gemfile
group :development do
  gem 'lookbook', '~> 2.3'
end
```

### 2. Configura Lookbook

```ruby
# config/initializers/lookbook.rb
if Rails.env.development?
  Lookbook.configure do |config|
    config.project_name = "Better UI - #{Rails.application.class.module_parent_name}"
    config.preview_paths = [
      Rails.root.join("test/components/previews"),
      BetterUi::Engine.root.join("test/components/previews")
    ]
  end
end
```

### 3. Accedi a Lookbook

```
http://localhost:3000/lookbook
```

## 🎯 **Primo Utilizzo**

### 1. Include gli helper

Better UI dovrebbe essere automaticamente disponibile. Testa con:

```erb
<!-- app/views/layouts/application.html.erb -->
<%= bui_button(text: "Test Better UI", theme: :blue) %>
```

### 2. Verifica Font Awesome

Se utilizzi componenti con icone:

```erb
<!-- app/views/layouts/application.html.erb -->
<%= stylesheet_link_tag 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css' %>
```

Oppure installa localmente:

```bash
yarn add @fortawesome/fontawesome-free
```

## ⚙️ **Configurazione Avanzata**

### 1. Personalizza i temi

```ruby
# config/initializers/better_ui.rb
BetterUi.configure do |config|
  config.default_theme = :blue
  config.enable_dark_mode = true
  # Altre configurazioni future
end
```

### 2. Override componenti

Puoi sovrascrivere i componenti creando la stessa struttura:

```
app/components/better_ui/general/button/component.rb
app/components/better_ui/general/button/component.html.erb
```

## 🔍 **Verifica Installazione**

### 1. Test console

```bash
rails console
```

```ruby
# In console
BetterUi::VERSION
# => "0.1.1"

# Test helper
include BetterUi::General::Components::Button::ButtonHelper
bui_button(text: "Test")
```

### 2. Test in view

```erb
<!-- test/views/test.html.erb -->
<div class="p-8 space-y-4">
  <h1 class="text-2xl font-bold">Better UI Test</h1>
  
  <%= bui_button(text: "Primary", theme: :blue) %>
  <%= bui_button(text: "Secondary", theme: :gray) %>
  <%= bui_button(text: "Success", theme: :green) %>
  
  <%= bui_alert(text: "Better UI installato correttamente!", theme: :green) %>
</div>
```

## 🐛 **Risoluzione Problemi**

### Errore: "undefined method bui_button"

1. Verifica che la gemma sia installata: `bundle list | grep better_ui`
2. Riavvia il server Rails
3. Controlla che ViewComponent sia configurato

### Errore: Stili non applicati

1. Verifica configurazione Tailwind CSS
2. Controlla che i path Better UI siano inclusi in `tailwind.config.js`
3. Rigenera CSS: `rails tailwindcss:build`

### Errore: Lookbook non mostra componenti

1. Verifica che `preview_paths` includa Better UI
2. Riavvia server in development
3. Controlla `config/initializers/lookbook.rb`

## 📚 **Prossimi Passi**

Dopo l'installazione:

1. Leggi la [**Guida Sviluppo**](development.md)
2. Esplora i [**Componenti Esistenti**](../components/existing.md)
3. Consulta l'[**Architettura**](../components/architecture.md)

---
**Ultima revisione:** Gennaio 2025 | **Versione Better UI:** 0.1.1
