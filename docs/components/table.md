# Table

Il componente Table fornisce un modo semplice ed elegante per visualizzare dati strutturati in formato tabellare con varie opzioni di stile. È ideale per presentare collezioni di dati correlati in modo organizzato e leggibile.

## Utilizzo

Per utilizzare il componente Table nella tua applicazione:

```erb
<%= render BetterUi::TableComponent.new(
  data: [
    { name: "Mario Rossi", email: "mario@example.com", role: "Admin" },
    { name: "Giulia Bianchi", email: "giulia@example.com", role: "Editor" }
  ],
  headers: ["name", "email", "role"]
) %>
```

## Opzioni

Il componente Table accetta le seguenti opzioni:

| Opzione | Tipo | Default | Descrizione |
|---------|------|---------|-------------|
| `data` | `Array` | `[]` | Array di hash o oggetti contenente i dati della tabella. |
| `headers` | `Array` | `nil` | Array di stringhe per le intestazioni. Se omesso, vengono derivate dalle chiavi del primo elemento di data. |
| `caption` | `String` | `nil` | Didascalia opzionale che appare sopra la tabella. |
| `striped` | `Boolean` | `false` | Se true, le righe della tabella avranno colori alternati. |
| `hoverable` | `Boolean` | `false` | Se true, le righe della tabella cambieranno colore quando il mouse ci passerà sopra. |
| `bordered` | `Boolean` | `true` | Se true, aggiungerà bordi alla tabella e alle celle. |
| `compact` | `Boolean` | `false` | Se true, riduce lo spazio tra le celle per creare tabelle più dense. |
| `classes` | `String` | `nil` | Classi CSS aggiuntive da applicare alla tabella. |

## Esempi

### Tabella base

```erb
<%= render BetterUi::TableComponent.new(
  data: [
    { name: "Mario Rossi", email: "mario@example.com", role: "Admin" },
    { name: "Giulia Bianchi", email: "giulia@example.com", role: "Editor" },
    { name: "Luca Verdi", email: "luca@example.com", role: "User" }
  ],
  headers: ["name", "email", "role"]
) %>
```

### Tabella con intestazioni automatiche

```erb
<%= render BetterUi::TableComponent.new(
  data: [
    { name: "Mario Rossi", email: "mario@example.com", role: "Admin" },
    { name: "Giulia Bianchi", email: "giulia@example.com", role: "Editor" },
    { name: "Luca Verdi", email: "luca@example.com", role: "User" }
  ]
) %>
```

### Tabella con didascalia

```erb
<%= render BetterUi::TableComponent.new(
  data: [
    { name: "Mario Rossi", email: "mario@example.com", role: "Admin" },
    { name: "Giulia Bianchi", email: "giulia@example.com", role: "Editor" },
    { name: "Luca Verdi", email: "luca@example.com", role: "User" }
  ],
  headers: ["name", "email", "role"],
  caption: "Elenco degli utenti e relativi ruoli"
) %>
```

### Tabella con righe alternate (striped)

```erb
<%= render BetterUi::TableComponent.new(
  data: [
    { name: "Mario Rossi", email: "mario@example.com", role: "Admin" },
    { name: "Giulia Bianchi", email: "giulia@example.com", role: "Editor" },
    { name: "Luca Verdi", email: "luca@example.com", role: "User" }
  ],
  headers: ["name", "email", "role"],
  striped: true
) %>
```

### Tabella con effetto hover

```erb
<%= render BetterUi::TableComponent.new(
  data: [
    { name: "Mario Rossi", email: "mario@example.com", role: "Admin" },
    { name: "Giulia Bianchi", email: "giulia@example.com", role: "Editor" },
    { name: "Luca Verdi", email: "luca@example.com", role: "User" }
  ],
  headers: ["name", "email", "role"],
  hoverable: true
) %>
```

### Tabella con bordi

```erb
<%= render BetterUi::TableComponent.new(
  data: [
    { name: "Mario Rossi", email: "mario@example.com", role: "Admin" },
    { name: "Giulia Bianchi", email: "giulia@example.com", role: "Editor" },
    { name: "Luca Verdi", email: "luca@example.com", role: "User" }
  ],
  headers: ["name", "email", "role"],
  bordered: true
) %>
```

### Tabella compatta

```erb
<%= render BetterUi::TableComponent.new(
  data: [
    { name: "Mario Rossi", email: "mario@example.com", role: "Admin" },
    { name: "Giulia Bianchi", email: "giulia@example.com", role: "Editor" },
    { name: "Luca Verdi", email: "luca@example.com", role: "User" }
  ],
  headers: ["name", "email", "role"],
  compact: true
) %>
```

### Stili combinati

```erb
<%= render BetterUi::TableComponent.new(
  data: [
    { name: "Mario Rossi", email: "mario@example.com", role: "Admin" },
    { name: "Giulia Bianchi", email: "giulia@example.com", role: "Editor" },
    { name: "Luca Verdi", email: "luca@example.com", role: "User" }
  ],
  headers: ["name", "email", "role"],
  caption: "Elenco utenti",
  striped: true,
  hoverable: true,
  bordered: true,
  compact: false
) %>
```

### Classi personalizzate

```erb
<%= render BetterUi::TableComponent.new(
  data: [
    { name: "Mario Rossi", email: "mario@example.com", role: "Admin" },
    { name: "Giulia Bianchi", email: "giulia@example.com", role: "Editor" },
    { name: "Luca Verdi", email: "luca@example.com", role: "User" }
  ],
  headers: ["name", "email", "role"],
  classes: "my-custom-class text-indigo-600"
) %>
```

## Personalizzazione

Per personalizzare l'aspetto delle tabelle, puoi estendere le classi Tailwind nel tuo file di configurazione o sovrascriverle nel tuo foglio di stile. Ad esempio:

```css
/* Personalizzazione dell'header della tabella */
.bg-gray-50 th {
  background-color: #f0f9ff;
  color: #0369a1;
}

/* Personalizzazione delle righe con hover */
.hover\:bg-gray-50:hover {
  background-color: #f0f9ff;
}

/* Personalizzazione dei bordi */
.border-gray-200 {
  border-color: #e5e7eb;
}
``` 