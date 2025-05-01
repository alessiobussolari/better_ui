# Installazione

Questa guida ti mostrerà come installare e configurare la gemma BetterUI nella tua applicazione Rails.

## Requisiti

La gemma BetterUI è compatibile con:

- Ruby 3.0 o superiore
- Rails 7.0 o superiore

## Installazione

Aggiungi questa riga al Gemfile della tua applicazione:

```ruby
gem 'better_ui', '~> 0.1.0'
```

E poi esegui:

```bash
$ bundle install
```

## Configurazione

### Montare l'engine

Per rendere disponibile la documentazione e gli asset, devi montare l'engine nel tuo file `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  # ... altre tue route
  
  mount BetterUi::Engine => '/better_ui'
  
  # ... altre tue route
end
```

Questo renderà la documentazione disponibile all'URL `/better_ui` della tua applicazione.

### Asset

La gemma BetterUI include asset CSS e JavaScript che devono essere inclusi nella tua applicazione. Ci sono diversi modi per farlo, a seconda di come gestisci gli asset nella tua applicazione.

#### Asset Pipeline (Sprockets o Propshaft)

Se stai utilizzando l'asset pipeline standard di Rails, aggiungi queste righe ai tuoi file di manifest:

In `app/assets/stylesheets/application.css` o `app/assets/stylesheets/application.scss`:

```css
/*
 *= require better_ui/application
 */
```

In `app/assets/javascripts/application.js`:

```javascript
//= require better_ui/application
```

#### Importmaps

Se stai utilizzando Importmaps, aggiungi queste righe al tuo file `config/importmap.rb`:

```ruby
pin "better_ui", to: "better_ui/application.js"
```

E includi lo stylesheet nel tuo file di layout:

```erb
<%= stylesheet_link_tag "better_ui/application", media: "all" %>
```

#### Webpack/esbuild

Se stai utilizzando webpack o esbuild, puoi importare gli asset nei tuoi file di entry point:

```javascript
// app/javascript/application.js
import "better_ui"
```

E nel tuo file SCSS:

```scss
// app/assets/stylesheets/application.scss
@import "better_ui/application";
```

### ViewComponent (opzionale)

BetterUI utilizza ViewComponent per alcuni componenti più complessi. Se desideri creare i tuoi componenti basati su ViewComponent, assicurati di configurare ViewComponent nella tua applicazione:

```ruby
# config/application.rb
config.view_component.preview_paths << "#{Rails.root}/spec/components/previews"
```

## Verifica dell'installazione

Per verificare che BetterUI sia stato installato correttamente, puoi accedere alla documentazione tramite il browser all'URL `/better_ui`.

Se vedi la pagina della documentazione con i componenti disponibili, l'installazione è riuscita!

## Risoluzione dei problemi

### Gli stili o gli script non vengono caricati

Verifica che gli asset siano stati inclusi correttamente nei tuoi file di manifest o nei tag HTML.

### Conflitti con altre gemme

Se riscontri conflitti con altre gemme, assicurati che non ci siano conflitti di nomi o di dipendenze.

### Supporto

Se riscontri problemi con l'installazione o l'utilizzo della gemma, puoi:

1. Controllare la [documentazione](/better_ui)
2. Aprire una issue su [GitHub](https://github.com/alessiobussolari/better_ui/issues)
3. Contribuire al progetto con una pull request 