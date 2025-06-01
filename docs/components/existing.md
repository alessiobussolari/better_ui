# ✅ Componenti Esistenti

Questa pagina elenca tutti i componenti attualmente implementati in Better UI, organizzati per categoria.

## 🎨 **GENERAL** - Componenti Base

### **Alert** ✅
**Descrizione:** Messaggi di notifica e avvisi per l'utente
**Helper:** `bui_alert`
**Variabili:** `theme`, `size`, `dismissable`
```erb
<%= bui_alert(text: "Operazione completata!", theme: :green) %>
<%= bui_alert(text: "Attenzione!", theme: :yellow, dismissable: true) %>
```

### **Avatar** ✅
**Descrizione:** Immagini profilo utente circolari o quadrate
**Helper:** `bui_avatar`
**Variabili:** `src`, `alt`, `size`, `rounded`
```erb
<%= bui_avatar(src: "user.jpg", alt: "Mario Rossi", size: :large) %>
<%= bui_avatar(initials: "MR", theme: :blue, size: :medium) %>
```

### **Badge** ✅
**Descrizione:** Etichette colorate per stati, notifiche e contatori
**Helper:** `bui_badge`
**Variabili:** `theme`, `size`, `rounded`, `variant`
```erb
<%= bui_badge(text: "Nuovo", theme: :green) %>
<%= bui_badge(text: "3", theme: :red, variant: :solid) %>
```

### **Breadcrumb** ✅
**Descrizione:** Navigazione gerarchica per mostrare la posizione corrente
**Helper:** `bui_breadcrumb`
**Variabili:** `items`, `separator`, `theme`
```erb
<%= bui_breadcrumb(items: [
  { text: "Home", href: "/" },
  { text: "Prodotti", href: "/products" },
  { text: "Dettaglio", current: true }
]) %>
```

### **Button** ✅
**Descrizione:** Pulsanti per azioni utente con diversi stili e stati
**Helper:** `bui_button`
**Variabili:** `theme`, `size`, `variant`, `disabled`, `loading`
```erb
<%= bui_button(text: "Salva", theme: :blue, size: :large) %>
<%= bui_button(text: "Elimina", theme: :red, variant: :outline) %>
```

### **Divider** ✅
**Descrizione:** Separatori visivi tra contenuti
**Helper:** `bui_divider`
**Variabili:** `orientation`, `theme`, `size`
```erb
<%= bui_divider %>
<%= bui_divider(orientation: :vertical, theme: :gray) %>
```

### **Heading** ✅
**Descrizione:** Intestazioni semantiche da H1 a H6
**Helper:** `bui_heading`
**Variabili:** `level`, `size`, `theme`, `weight`
```erb
<%= bui_heading(text: "Titolo Principale", level: 1, size: :large) %>
<%= bui_heading(text: "Sottotitolo", level: 2, theme: :gray) %>
```

### **Icon** ✅
**Descrizione:** Icone vettoriali Font Awesome
**Helper:** `bui_icon`
**Variabili:** `name`, `size`, `theme`, `variant`
```erb
<%= bui_icon(name: "home", size: :medium) %>
<%= bui_icon(name: "star", theme: :yellow, variant: :solid) %>
```

### **Input Text** ✅
**Descrizione:** Campo di input testuale
**Helper:** `bui_input_text`
**Variabili:** `name`, `value`, `placeholder`, `theme`, `size`, `required`, `disabled`
```erb
<%= bui_input_text(name: "email", placeholder: "Email", required: true) %>
<%= bui_input_text(name: "search", theme: :blue, size: :large) %>
```

### **Input Textarea** ✅
**Descrizione:** Area di testo multi-riga
**Helper:** `bui_input_textarea`
**Variabili:** `name`, `value`, `placeholder`, `rows`, `theme`, `size`
```erb
<%= bui_input_textarea(name: "description", rows: 4, placeholder: "Descrizione") %>
```

### **Input Checkbox** ✅
**Descrizione:** Caselle di controllo per selezioni multiple
**Helper:** `bui_input_checkbox`
**Variabili:** `name`, `value`, `checked`, `theme`, `size`
```erb
<%= bui_input_checkbox(name: "terms", value: "accepted") %>
<%= bui_input_checkbox(name: "newsletter", checked: true, theme: :green) %>
```

### **Input Radio** ✅
**Descrizione:** Pulsanti radio per selezioni singole
**Helper:** `bui_input_radio`
**Variabili:** `name`, `value`, `checked`, `theme`, `size`
```erb
<%= bui_input_radio(name: "gender", value: "male") %>
<%= bui_input_radio(name: "size", value: "large", theme: :blue) %>
```

### **Input Select** ✅
**Descrizione:** Menu a tendina per selezioni
**Helper:** `bui_input_select`
**Variabili:** `name`, `options`, `selected`, `theme`, `size`
```erb
<%= bui_input_select(name: "country", options: countries_options) %>
```

### **Link** ✅
**Descrizione:** Collegamenti ipertestuali stilizzati
**Helper:** `bui_link`
**Variabili:** `href`, `theme`, `size`, `underline`, `external`
```erb
<%= bui_link(text: "Vai al sito", href: "https://example.com", external: true) %>
<%= bui_link(text: "Link interno", href: "/page", theme: :blue) %>
```

### **Panel** ✅
**Descrizione:** Contenitori per raggruppare contenuti correlati
**Helper:** `bui_panel`
**Variabili:** `theme`, `rounded`, `shadow`, `padding`
```erb
<%= bui_panel(theme: :white, shadow: :medium) do %>
  <p>Contenuto del panel</p>
<% end %>
```

### **Progress** ✅
**Descrizione:** Barre di progresso per indicare completamento
**Helper:** `bui_progress`
**Variabili:** `value`, `max`, `theme`, `size`, `label`
```erb
<%= bui_progress(value: 75, max: 100, theme: :green) %>
<%= bui_progress(value: 30, label: "30% completato") %>
```

### **Spinner** ✅
**Descrizione:** Indicatori di caricamento animati
**Helper:** `bui_spinner`
**Variabili:** `size`, `theme`, `speed`
```erb
<%= bui_spinner(size: :medium, theme: :blue) %>
<%= bui_spinner(size: :large, speed: :fast) %>
```

### **Table** ✅
**Descrizione:** Tabelle complete con header, body, footer
**Helper:** `bui_table`, `bui_table_thead`, `bui_table_tbody`, `bui_table_tfoot`, `bui_table_tr`, `bui_table_th`, `bui_table_td`
**Variabili:** `striped`, `bordered`, `hoverable`, `size`
```erb
<%= bui_table(striped: true, bordered: true) do %>
  <%= bui_table_thead do %>
    <%= bui_table_tr do %>
      <%= bui_table_th(text: "Nome") %>
      <%= bui_table_th(text: "Email") %>
    <% end %>
  <% end %>
<% end %>
```

### **Tag** ✅
**Descrizione:** Etichette per categorizzazione e filtering
**Helper:** `bui_tag`
**Variabili:** `theme`, `size`, `removable`, `rounded`
```erb
<%= bui_tag(text: "Rails", theme: :red) %>
<%= bui_tag(text: "JavaScript", theme: :yellow, removable: true) %>
```

### **Tooltip** ✅
**Descrizione:** Suggerimenti contestuali al passaggio del mouse
**Helper:** `bui_tooltip`
**Variabili:** `text`, `position`, `theme`, `delay`
```erb
<%= bui_tooltip(text: "Clicca per salvare", position: :top) do %>
  <%= bui_button(text: "Salva") %>
<% end %>
```

## 🏗️ **APPLICATION** - Componenti Layout

### **Card** ✅
**Descrizione:** Contenitori per informazioni strutturate
**Helper:** `bui_application_card`
**Variabili:** `header`, `footer`, `theme`, `shadow`
```erb
<%= bui_application_card(header: "Titolo Card") do %>
  <p>Contenuto della card</p>
<% end %>
```

### **Main** ✅
**Descrizione:** Area principale del contenuto
**Helper:** `bui_application_main`
**Variabili:** `padding`, `max_width`, `center`
```erb
<%= bui_application_main(padding: :large, center: true) do %>
  <!-- Contenuto principale -->
<% end %>
```

### **Navbar** ✅
**Descrizione:** Barra di navigazione principale
**Helper:** `bui_application_navbar`
**Variabili:** `brand`, `items`, `theme`, `sticky`
```erb
<%= bui_application_navbar(brand: "My App", sticky: true) do %>
  <!-- Menu items -->
<% end %>
```

### **Sidebar** ✅
**Descrizione:** Barra laterale per navigazione secondaria
**Helper:** `bui_application_sidebar`
**Variabili:** `collapsible`, `position`, `width`, `theme`
```erb
<%= bui_application_sidebar(collapsible: true, position: :left) do %>
  <!-- Menu laterale -->
<% end %>
```

---

## 📊 **Statistiche Componenti**

| Categoria | Componenti | Completati |
|-----------|------------|------------|
| **General** | 18 | ✅ 18/18 |
| **Application** | 4 | ✅ 4/4 |
| **Form** | 0 | - |
| **TOTALE** | **22** | **✅ 22/22** |

---
**Ultimo aggiornamento:** Gennaio 2025 | **Versione:** 0.1.1
