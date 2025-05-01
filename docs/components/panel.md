# Panel

Il componente Panel fornisce un contenitore versatile e personalizzabile per organizzare i contenuti nella tua applicazione Rails. I pannelli sono elementi utili per raggruppare informazioni correlate, creare layout a sezioni o evidenziare contenuti specifici.

## Utilizzo

Per utilizzare il componente Panel nella tua applicazione:

```erb
<%= render BetterUi::PanelComponent.new(
  title: "Titolo del pannello",
  body: "Contenuto del pannello",
  padding: :medium,
  variant: :default
) %>
```

In alternativa, puoi usare le nuove sezioni `header` e `footer`:

```erb
<%= render BetterUi::PanelComponent.new(
  header: "Intestazione del pannello",
  body: "Contenuto principale del pannello",
  footer: "Piè di pagina del pannello",
  padding: :medium,
  variant: :default
) %>
```

Puoi anche usare un blocco per il corpo del pannello:

```erb
<%= render BetterUi::PanelComponent.new(
  header: "Intestazione del pannello",
  footer: "Piè di pagina del pannello",
  padding: :medium,
  variant: :default
) do %>
  Questo è il contenuto del pannello
<% end %>
```

## Opzioni

Il componente Panel accetta le seguenti opzioni:

| Opzione | Tipo | Default | Descrizione |
|---------|------|---------|-------------|
| `title` | `String` | `nil` | Titolo opzionale del pannello (per retrocompatibilità, visualizzato nell'header se non è specificato un header). |
| `body` | `String` | `nil` | Contenuto testuale per il corpo del pannello. In alternativa, puoi passare il contenuto come blocco. |
| `header` | `String` | `nil` | Contenuto HTML o testuale per l'intestazione del pannello. |
| `footer` | `String` | `nil` | Contenuto HTML o testuale per il piè di pagina del pannello. |
| `padding` | `Symbol` | `:medium` | Dimensione del padding interno. Valori possibili: `:none`, `:small`, `:medium`, `:large`. |
| `variant` | `Symbol` | `:default` | Stile visivo del pannello. Valori possibili: `:default`, `:primary`, `:success`, `:warning`, `:danger`, `:info`. |

## Esempi

### Pannello di default

```erb
<%= render BetterUi::PanelComponent.new(
  title: "Informazioni utente",
  body: "Qui puoi visualizzare le informazioni dell'utente."
) %>
```

### Pannello con sezioni header, body e footer

```erb
<%= render BetterUi::PanelComponent.new(
  header: "Questo è l'header del panel",
  body: "Questo è il corpo principale del panel.",
  footer: "Questo è il footer del panel",
  variant: :primary
) %>
```

### Pannello con HTML personalizzato nelle sezioni

```erb
<%= render BetterUi::PanelComponent.new(
  header: '<div class="flex justify-between items-center"><h3 class="font-bold">Dashboard utente</h3><span class="text-sm text-gray-500">Ultimo aggiornamento: Oggi</span></div>',
  body: '<div class="space-y-4"><p>Benvenuto nel tuo pannello di controllo.</p><div class="bg-gray-100 p-3 rounded">Hai 3 notifiche non lette</div></div>',
  footer: '<div class="flex justify-end"><button class="bg-blue-500 text-white px-4 py-2 rounded">Aggiorna</button></div>',
  variant: :default
) %>
```

### Pannello primario

```erb
<%= render BetterUi::PanelComponent.new(
  title: "Avviso importante",
  body: "Questo messaggio richiede attenzione.",
  variant: :primary
) %>
```

### Pannello con variant success

```erb
<%= render BetterUi::PanelComponent.new(
  title: "Operazione completata",
  body: "L'operazione è stata completata con successo.",
  variant: :success
) %>
```

### Pannello con variant warning

```erb
<%= render BetterUi::PanelComponent.new(
  title: "Attenzione",
  body: "Ci sono alcune azioni pendenti da completare.",
  variant: :warning
) %>
```

### Pannello con variant danger

```erb
<%= render BetterUi::PanelComponent.new(
  title: "Errore",
  body: "Si è verificato un errore durante l'operazione.",
  variant: :danger
) %>
```

### Pannello con variant info

```erb
<%= render BetterUi::PanelComponent.new(
  title: "Suggerimento",
  body: "Puoi fare clic qui per maggiori informazioni.",
  variant: :info
) %>
```

### Pannello con padding diverso

```erb
<%= render BetterUi::PanelComponent.new(
  title: "Pannello con padding grande",
  body: "Questo pannello ha un padding più ampio.",
  padding: :large
) %>
```

### Pannello con contenuto HTML complesso

```erb
<%= render BetterUi::PanelComponent.new(
  header: "<h3 class=\"font-bold\">Dashboard utente</h3>",
  footer: "<div class=\"text-right text-sm text-gray-500\">Ultimo aggiornamento: Oggi</div>"
) do %>
  <div class="flex justify-between">
    <div class="stats">
      <h3>Statistiche</h3>
      <p>Visite: 1,234</p>
      <p>Ultimo accesso: 01/06/2023</p>
    </div>
    <div class="actions">
      <button class="btn">Modifica</button>
      <button class="btn">Esporta</button>
    </div>
  </div>
<% end %>
```

## Personalizzazione

Per personalizzare l'aspetto dei pannelli, puoi estendere le classi Tailwind nel tuo file di configurazione o sovrascriverle nel tuo foglio di stile. Ad esempio:

```css
/* Personalizzazione del panel default */
.bg-white.border.border-gray-200 {
  background-color: #f8fafc;
  border-color: #e2e8f0;
}

/* Personalizzazione dell'header del panel */
.panel-header {
  color: #334155;
  letter-spacing: 0.025em;
}

/* Personalizzazione del footer del panel */
.panel-footer {
  background-color: #f8fafc;
}
``` 