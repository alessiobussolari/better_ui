# Button

Il componente Button fornisce pulsanti stilizzati per la tua applicazione Rails. I pulsanti sono elementi fondamentali di qualsiasi interfaccia utente e vengono utilizzati per attivare azioni, inviare moduli o navigare tra le pagine.

## Utilizzo

Per utilizzare il componente Button nella tua applicazione, puoi utilizzare l'helper `better_ui_button` fornito dalla gemma:

```erb
<%= better_ui_button("Testo del pulsante", options) %>
```

## Opzioni

Il componente Button accetta le seguenti opzioni:

| Opzione | Tipo | Default | Descrizione |
|---------|------|---------|-------------|
| `type` | `String` | `"primary"` | Definisce lo stile del pulsante. Valori possibili: `"primary"`, `"secondary"`, `"success"`, `"danger"`. |
| `class` | `String` | `nil` | Classi CSS aggiuntive da applicare al pulsante. |
| `disabled` | `Boolean` | `false` | Se `true`, il pulsante sarà disabilitato. |

Oltre a queste opzioni specifiche, il metodo `better_ui_button` accetta tutte le opzioni standard per il metodo `button_tag` di Rails, come `id`, `data`, ecc.

## Esempi

### Pulsante primario

```erb
<%= better_ui_button("Salva", type: "primary") %>
```

### Pulsante secondario

```erb
<%= better_ui_button("Annulla", type: "secondary") %>
```

### Pulsante di successo

```erb
<%= better_ui_button("Conferma", type: "success") %>
```

### Pulsante di pericolo

```erb
<%= better_ui_button("Elimina", type: "danger") %>
```

### Pulsante disabilitato

```erb
<%= better_ui_button("Non disponibile", disabled: true) %>
```

### Pulsante con classi aggiuntive

```erb
<%= better_ui_button("Personalizzato", class: "my-custom-class") %>
```

### Pulsante con attributi data

```erb
<%= better_ui_button("Apri modale", data: { action: "click->modal#open", target: "my-modal" }) %>
```

## Personalizzazione

Per personalizzare l'aspetto dei pulsanti, puoi sovrascrivere le classi CSS `.better-ui-button` e `.better-ui-button-*` nel tuo foglio di stile. Ad esempio:

```css
.better-ui-button-primary {
  background-color: #8b5cf6; /* Colore viola per il pulsante primario */
  border-color: #8b5cf6;
}
```

Puoi anche creare il tuo tipo di pulsante aggiungendo una nuova classe e utilizzandola con l'opzione `class`:

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

E poi utilizzarlo così:

```erb
<%= better_ui_button("Pulsante Outline", class: "better-ui-button-outline") %>
``` 