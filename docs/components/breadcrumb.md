# Componente Breadcrumb

Il componente `BreadcrumbComponent` permette di visualizzare percorsi di navigazione in modo chiaro e coerente.

## Utilizzo di Base

```erb
<%= render BetterUi::General::BreadcrumbComponent.new(
  items: [
    { label: "Home", url: "/" },
    { label: "Prodotti", url: "/prodotti" },
    "Dettaglio prodotto"
  ]
) %>
```

## Parametri Principali

| Parametro | Tipo | Default | Descrizione |
|-----------|------|---------|-------------|
| `items` | Array | `[]` | Elenco di elementi del breadcrumb. Può essere un array di stringhe o hash con `label` e `url`. |
| `variant` | Symbol | `:default` | Variante di colore. Opzioni: `:default`, `:primary`, `:light`. |
| `separator` | Symbol | `:chevron` | Tipo di separatore. Opzioni: `:chevron`, `:slash`, `:arrow`, `:dot`, `:pipe`. |
| `size` | Symbol | `:md` | Dimensione del testo. Opzioni: `:sm`, `:md`, `:lg`. |
| `inverse` | Boolean | `false` | Se `true`, applica uno stile per sfondi scuri. |
| `classes` | String | `nil` | Classi CSS aggiuntive da applicare al container. |

## Esempi

### Varianti di Colore

```erb
<%# Default %>
<%= render BetterUi::General::BreadcrumbComponent.new(
  items: [
    { label: "Home", url: "#" },
    { label: "Prodotti", url: "#" },
    "Dettaglio prodotto"
  ]
) %>

<%# Primary %>
<%= render BetterUi::General::BreadcrumbComponent.new(
  items: [
    { label: "Home", url: "#" },
    { label: "Prodotti", url: "#" },
    "Dettaglio prodotto"
  ],
  variant: :primary
) %>

<%# Light (per sfondi scuri) %>
<div class="bg-gray-800 p-4">
  <%= render BetterUi::General::BreadcrumbComponent.new(
    items: [
      { label: "Home", url: "#" },
      { label: "Prodotti", url: "#" },
      "Dettaglio prodotto"
    ],
    variant: :light
  ) %>
</div>
```

### Vari Tipi di Separatori

```erb
<%# Chevron (default) %>
<%= render BetterUi::General::BreadcrumbComponent.new(
  items: [
    { label: "Home", url: "#" },
    { label: "Prodotti", url: "#" },
    "Dettaglio prodotto"
  ],
  separator: :chevron
) %>

<%# Slash %>
<%= render BetterUi::General::BreadcrumbComponent.new(
  items: [
    { label: "Home", url: "#" },
    { label: "Prodotti", url: "#" },
    "Dettaglio prodotto"
  ],
  separator: :slash
) %>
```

### Con Icone

```erb
<%= render BetterUi::General::BreadcrumbComponent.new(
  items: [
    { label: "Home", url: "#", icon: "home" },
    { label: "Prodotti", url: "#", icon: "box" },
    { label: "Dettaglio", icon: "info-circle" }
  ]
) %>
```

## Best Practices

- Usa il breadcrumb per aiutare l'utente a capire dove si trova nella gerarchia del sito
- L'ultimo elemento dovrebbe rappresentare la pagina corrente e non essere cliccabile
- Mantieni il testo di ogni elemento conciso
- Considera l'uso delle icone per rafforzare il significato di ogni elemento
- Usa la variante `light` su sfondi scuri per garantire leggibilità

## Accessibilità

Il componente breadcrumb è implementato seguendo le migliori pratiche di accessibilità:

- Utilizza il tag semantico `<nav>` con attributo `aria-label="Breadcrumb"`
- L'ultimo elemento ha l'attributo `aria-current="page"`
- I separatori sono nascosti agli screen reader con `aria-hidden="true"` 