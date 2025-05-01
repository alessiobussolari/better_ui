# Modal

Il componente Modal fornisce finestre di dialogo che si aprono sopra la pagina corrente. I modal sono utili per mostrare informazioni aggiuntive, confermare azioni o raccogliere input dall'utente senza cambiare pagina.

> **Nota importante**: Questa versione dei Modal è puramente presentazionale. Per funzionalità interattive complete, dovrai integrare il tuo JavaScript personalizzato.

## Utilizzo

Per utilizzare il componente Modal nella tua applicazione, puoi utilizzare gli helper forniti dalla gemma:

```erb
<%= better_ui_modal_trigger("Apri Modal", "my-modal") %>

<%= better_ui_modal("my-modal") do %>
  <%= better_ui_modal_header("Titolo del Modal") %>
  <%= better_ui_modal_body do %>
    <p>Contenuto del modal...</p>
  <% end %>
  <%= better_ui_modal_footer do %>
    <%= better_ui_button("Salva", type: "primary") %>
    <%= better_ui_button("Annulla", type: "secondary") %>
  <% end %>
<% end %>
```

## Helper disponibili

### better_ui_modal

```erb
<%= better_ui_modal(id, options = {}, &block) %>
```

Crea un container per il modal.

**Parametri:**
- `id` (String): ID univoco per il modal
- `options` (Hash): Opzioni aggiuntive

**Opzioni:**
- `class` (String): Classi CSS aggiuntive

### better_ui_modal_header

```erb
<%= better_ui_modal_header(title, options = {}) %>
```

Crea l'intestazione del modal con titolo e pulsante di chiusura.

**Parametri:**
- `title` (String): Titolo del modal
- `options` (Hash): Opzioni aggiuntive

**Opzioni:**
- `class` (String): Classi CSS aggiuntive

### better_ui_modal_body

```erb
<%= better_ui_modal_body(options = {}, &block) %>
```

Crea il corpo del modal.

**Parametri:**
- `options` (Hash): Opzioni aggiuntive
- `&block`: Contenuto del corpo

**Opzioni:**
- `class` (String): Classi CSS aggiuntive

### better_ui_modal_footer

```erb
<%= better_ui_modal_footer(options = {}, &block) %>
```

Crea il footer del modal, tipicamente con pulsanti di azione.

**Parametri:**
- `options` (Hash): Opzioni aggiuntive
- `&block`: Contenuto del footer

**Opzioni:**
- `class` (String): Classi CSS aggiuntive

### better_ui_modal_trigger

```erb
<%= better_ui_modal_trigger(text, modal_id, options = {}) %>
```

Crea un pulsante che apre il modal specificato.

**Parametri:**
- `text` (String): Testo del pulsante
- `modal_id` (String): ID del modal da aprire
- `options` (Hash): Opzioni aggiuntive

**Opzioni:**
- `type` (String): Tipo di pulsante (primary, secondary, success, danger)
- `class` (String): Classi CSS aggiuntive

## Funzionalità interattive

Per funzionalità interattive complete (chiusura del modal, gestione degli eventi, ecc.), dovrai aggiungere il tuo JavaScript personalizzato. Ecco un esempio di come potresti implementare queste funzionalità:

```javascript
// Esempio di codice JavaScript per implementare la funzionalità del modal
document.addEventListener('DOMContentLoaded', function() {
  // Chiudi il modal quando si fa clic sul pulsante di chiusura
  document.querySelectorAll('.better-ui-modal-close').forEach(function(button) {
    button.addEventListener('click', function() {
      const modal = this.closest('.better-ui-modal');
      if (modal) modal.style.display = 'none';
    });
  });
  
  // Chiudi il modal quando si fa clic sullo sfondo
  document.querySelectorAll('.better-ui-modal-background').forEach(function(background) {
    background.addEventListener('click', function(e) {
      if (e.target === this) {
        const modal = this.closest('.better-ui-modal');
        if (modal) modal.style.display = 'none';
      }
    });
  });
  
  // Chiudi il modal quando si preme ESC
  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
      const openModals = document.querySelectorAll('.better-ui-modal[style*="display: flex"]');
      openModals.forEach(function(modal) {
        modal.style.display = 'none';
      });
    }
  });
});
```

## Esempi

### Modal di conferma

```erb
<%= better_ui_modal_trigger("Elimina elemento", "confirm-delete-modal", type: "danger") %>

<%= better_ui_modal("confirm-delete-modal") do %>
  <%= better_ui_modal_header("Conferma eliminazione") %>
  <%= better_ui_modal_body do %>
    <p>Sei sicuro di voler eliminare questo elemento? Questa azione non può essere annullata.</p>
  <% end %>
  <%= better_ui_modal_footer do %>
    <%= better_ui_button("Elimina", type: "danger", onclick: "document.getElementById('confirm-delete-modal').style.display='none'") %>
    <%= better_ui_button("Annulla", type: "secondary", onclick: "document.getElementById('confirm-delete-modal').style.display='none'") %>
  <% end %>
<% end %>
```

### Modal con form

```erb
<%= better_ui_modal_trigger("Aggiungi elemento", "add-item-modal") %>

<%= better_ui_modal("add-item-modal") do %>
  <%= better_ui_modal_header("Aggiungi nuovo elemento") %>
  <%= better_ui_modal_body do %>
    <%= form_with(model: @item, id: "new-item-form") do |f| %>
      <div class="form-group">
        <%= f.label :name, "Nome" %>
        <%= f.text_field :name, class: "form-control" %>
      </div>
      <div class="form-group">
        <%= f.label :description, "Descrizione" %>
        <%= f.text_area :description, class: "form-control" %>
      </div>
    <% end %>
  <% end %>
  <%= better_ui_modal_footer do %>
    <%= better_ui_button("Salva", type: "primary", form: "new-item-form") %>
    <%= better_ui_button("Annulla", type: "secondary", onclick: "document.getElementById('add-item-modal').style.display='none'") %>
  <% end %>
<% end %>
```

## Personalizzazione

Per personalizzare l'aspetto dei modal, puoi sovrascrivere le classi CSS definite dalla gemma:

```css
.better-ui-modal-dialog {
  max-width: 800px; /* Modal più largo */
}

.better-ui-modal-header {
  background-color: #f8f9fa; /* Sfondo grigio chiaro per l'intestazione */
}

.better-ui-modal-title {
  color: #4a5568; /* Colore del titolo personalizzato */
}
```

## Accessibilità

Per migliorare l'accessibilità dei modal, considera di implementare le seguenti funzionalità con il tuo JavaScript personalizzato:

- Aggiungere attributi ARIA appropriati
- Gestire la navigazione con tastiera
- Focalizzare automaticamente il primo elemento interattivo
- Implementare la chiusura con il tasto ESC
- Prevenire lo scorrimento della pagina di sfondo quando il modal è aperto 