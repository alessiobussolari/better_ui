# Personalizzazione

Questa guida ti mostrerà come personalizzare i componenti UI di BetterUI per adattarli al design della tua applicazione.

## Personalizzazione dei componenti

### Sovrascrivere gli stili CSS

Il modo più semplice per personalizzare l'aspetto dei componenti è sovrascrivere le classi CSS predefinite nel foglio di stile della tua applicazione.

Ad esempio, per personalizzare il pulsante primario:

```css
/* app/assets/stylesheets/custom_better_ui.css */
.better-ui-button-primary {
  background-color: #8b5cf6; /* Viola invece di blu */
  border-color: #8b5cf6;
  color: #ffffff;
}

.better-ui-button-primary:hover {
  background-color: #7c3aed;
  border-color: #7c3aed;
}
```

### Configurazione tramite inizializzatore

Puoi configurare alcuni comportamenti predefiniti di BetterUI attraverso un inizializzatore Rails.

Crea un file `config/initializers/better_ui.rb`:

```ruby
BetterUi.configure do |config|
  # Configura le opzioni predefinite per i componenti
  config.button_defaults = {
    class: 'rounded-lg text-sm', # Aggiunge classi a tutti i pulsanti
    data: { turbo: false }       # Disabilita Turbo per i pulsanti
  }
  
  config.alert_defaults = {
    dismissible: true            # Rende tutti gli alert chiudibili di default
  }
end
```

### Estendere i componenti

Se hai bisogno di estendere la funzionalità di un componente, puoi creare un helper personalizzato che estende quello fornito da BetterUI.

Ad esempio, per aggiungere un nuovo tipo di pulsante "outline":

```ruby
# app/helpers/application_helper.rb
module ApplicationHelper
  def outline_button(text, options = {})
    options[:class] = "#{options[:class]} better-ui-button-outline"
    better_ui_button(text, options)
  end
end
```

Poi aggiungi lo stile corrispondente:

```css
.better-ui-button-outline {
  background-color: transparent;
  border: 1px solid #007bff;
  color: #007bff;
}

.better-ui-button-outline:hover {
  background-color: #007bff;
  color: white;
}
```

## Personalizzazione avanzata

### Creare nuovi componenti View

Per componenti più complessi, puoi creare nuovi componenti ViewComponent che si integrano con quelli di BetterUI.

Ad esempio, per creare un componente card con avatar:

```ruby
# app/components/avatar_card_component.rb
class AvatarCardComponent < ViewComponent::Base
  def initialize(title:, description:, avatar_url:)
    @title = title
    @description = description
    @avatar_url = avatar_url
  end
end
```

E il corrispondente template:

```erb
<%# app/components/avatar_card_component.html.erb %>
<%= better_ui_card do %>
  <div class="avatar-card-header">
    <img src="<%= @avatar_url %>" class="avatar-card-image" alt="<%= @title %>">
    <%= better_ui_card_header(@title) %>
  </div>
  <%= better_ui_card_body do %>
    <%= @description %>
  <% end %>
<% end %>
```

### Utilizzare temi

Puoi creare temi diversi per i tuoi componenti definendo set di classi che possono essere utilizzati in diverse parti dell'applicazione.

Ad esempio, per avere un tema chiaro e uno scuro:

```css
/* Tema chiaro (default) */
:root {
  --better-ui-background: #ffffff;
  --better-ui-text: #333333;
  --better-ui-primary: #4a7bff;
  --better-ui-secondary: #6c757d;
  --better-ui-success: #28a745;
  --better-ui-danger: #dc3545;
}

/* Tema scuro */
.dark-theme {
  --better-ui-background: #1a1a1a;
  --better-ui-text: #f5f5f5;
  --better-ui-primary: #5b8aff;
  --better-ui-secondary: #8c8c8c;
  --better-ui-success: #48c774;
  --better-ui-danger: #f14668;
}

/* Usa le variabili nei componenti */
.better-ui-button-primary {
  background-color: var(--better-ui-primary);
  color: var(--better-ui-background);
}

.better-ui-card {
  background-color: var(--better-ui-background);
  color: var(--better-ui-text);
}
```

Poi puoi applicare il tema scuro a determinate parti della tua applicazione:

```erb
<div class="dark-theme">
  <%= better_ui_card do %>
    <%= better_ui_card_header("Card in tema scuro") %>
    <%= better_ui_card_body do %>
      <p>Questo è un esempio di card con tema scuro.</p>
    <% end %>
  <% end %>
</div>
```

## Personalizzazione dei layout

Se desideri personalizzare il layout della documentazione, puoi sovrascrivere i template di BetterUI nella tua applicazione.

Crea un file `app/views/layouts/better_ui/application.html.erb` nella tua applicazione per sovrascrivere il layout predefinito.

## Contribuire alla personalizzazione

Se hai creato personalizzazioni utili che potrebbero essere utili ad altri, considera la possibilità di contribuire al progetto attraverso una pull request su GitHub.

## Migliori pratiche

1. **Mantieni la coerenza**: Assicurati che i componenti personalizzati mantengano un'estetica coerente.
2. **Evita la sovrascrittura eccessiva**: Cerca di estendere i componenti piuttosto che sovrascriverli completamente.
3. **Usa variabili CSS**: Utilizza variabili CSS per gestire colori, spaziature e altre proprietà di base.
4. **Testa su diversi browser**: Assicurati che le tue personalizzazioni funzionino su tutti i browser supportati.
5. **Considera l'accessibilità**: Mantieni un buon contrasto e altri aspetti dell'accessibilità quando personalizzi i componenti. 