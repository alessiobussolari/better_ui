# Alert

Il componente Alert fornisce messaggi di feedback all'utente. Gli alert sono utili per comunicare informazioni, successi, avvertimenti o errori.

## Utilizzo

Per utilizzare il componente Alert nella tua applicazione, puoi utilizzare l'helper `better_ui_alert` fornito dalla gemma:

```erb
<%= better_ui_alert("Messaggio di esempio", options) %>
```

## Opzioni

Il componente Alert accetta le seguenti opzioni:

| Opzione | Tipo | Default | Descrizione |
|---------|------|---------|-------------|
| `type` | `String` | `"info"` | Definisce lo stile dell'alert. Valori possibili: `"info"`, `"success"`, `"warning"`, `"danger"`. |
| `class` | `String` | `nil` | Classi CSS aggiuntive da applicare all'alert. |
| `dismissible` | `Boolean` | `false` | Se `true`, l'alert includerà un pulsante per chiuderlo. |

## Esempi

### Alert informativo

```erb
<%= better_ui_alert("Questo è un messaggio informativo.", type: "info") %>
```

### Alert di successo

```erb
<%= better_ui_alert("Operazione completata con successo!", type: "success") %>
```

### Alert di avvertimento

```erb
<%= better_ui_alert("Attenzione: questa azione non può essere annullata.", type: "warning") %>
```

### Alert di errore

```erb
<%= better_ui_alert("Si è verificato un errore durante l'operazione.", type: "danger") %>
```

### Alert chiudibile

```erb
<%= better_ui_alert("Puoi chiudere questo alert.", dismissible: true) %>
```

## Integrazione con Stimulus.js

Per rendere funzionante la chiusura degli alert, devi aggiungere il controller Stimulus corrispondente. Ecco un esempio di controller:

```javascript
// app/javascript/controllers/better_ui_alert_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  close(event) {
    event.preventDefault()
    this.element.remove()
  }
}
```

E assicurati di registrarlo nel tuo file `application.js`:

```javascript
import { Application } from "@hotwired/stimulus"
import BetterUiAlertController from "./controllers/better_ui_alert_controller"

const application = Application.start()
application.register("better-ui-alert", BetterUiAlertController)
```

## Personalizzazione

Per personalizzare l'aspetto degli alert, puoi sovrascrivere le classi CSS `.better-ui-alert` e `.better-ui-alert-*` nel tuo foglio di stile. Ad esempio:

```css
.better-ui-alert-info {
  background-color: #e3f2fd; /* Un blu più chiaro per alert informativi */
  border-color: #90caf9;
  color: #0d47a1;
}
```

Puoi anche creare il tuo tipo di alert aggiungendo una nuova classe e utilizzandola con l'opzione `class`:

```css
.better-ui-alert-neutral {
  background-color: #f5f5f5;
  border-color: #e0e0e0;
  color: #616161;
}
```

E poi utilizzarlo così:

```erb
<%= better_ui_alert("Alert neutro", class: "better-ui-alert-neutral") %>
``` 