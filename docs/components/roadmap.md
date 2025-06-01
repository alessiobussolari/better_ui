# 🚀 Roadmap Componenti

Questa pagina elenca i componenti pianificati per future versioni di Better UI, organizzati per priorità e categoria.

## 📝 **Legenda Status**
- 📝 **Pianificato** - Componente progettato, pronto per implementazione
- 🚧 **In sviluppo** - Implementazione in corso
- ✅ **Completato** - Implementazione completata e disponibile

---

## 🎯 **PRIORITÀ ALTA** (v0.2.x)

### **Modal/Dialog** 📝
**Categoria:** General  
**Descrizione:** Finestre modali per conferme, form e visualizzazione dettagli
**Variabili pianificate:** `size`, `backdrop`, `closable`, `theme`, `animation`
**Casi d'uso:**
- Conferme eliminazione
- Form in overlay
- Gallerie immagini
- Dettagli elementi

```erb
<!-- Esempio futuro -->
<%= bui_modal(title: "Conferma eliminazione", size: :medium) do %>
  <p>Sei sicuro di voler eliminare questo elemento?</p>
  <div class="actions">
    <%= bui_button(text: "Annulla", theme: :gray) %>
    <%= bui_button(text: "Elimina", theme: :red) %>
  </div>
<% end %>
```

### **Dropdown/Menu** 📝
**Categoria:** General  
**Descrizione:** Menu contestuali e dropdown per navigazione e azioni
**Variabili pianificate:** `trigger`, `position`, `theme`, `size`, `animation`
**Casi d'uso:**
- Menu utente
- Azioni contestuali
- Filtri avanzati
- Menu navigazione mobile

```erb
<!-- Esempio futuro -->
<%= bui_dropdown(trigger: "Azioni") do %>
  <%= bui_dropdown_item(text: "Modifica", icon: "edit") %>
  <%= bui_dropdown_item(text: "Elimina", icon: "trash", theme: :red) %>
  <%= bui_dropdown_divider %>
  <%= bui_dropdown_item(text: "Condividi", icon: "share") %>
<% end %>
```

### **Field** 📝 NO PER ORA!!!!
**Categoria:** Form  
**Descrizione:** Wrapper per input con label, errori, descrizione e validazione
**Variabili pianificate:** `label`, `required`, `error`, `help_text`, `theme`
**Casi d'uso:**
- Form strutturati
- Validazione in tempo reale
- Messaggi di errore consistenti
- Form guidati

```erb
<!-- Esempio futuro -->
<%= bui_field(label: "Email", required: true, error: @user.errors[:email]) do %>
  <%= bui_input_text(name: "user[email]", placeholder: "esempio@email.com") %>
<% end %>
```

### **Tabs** 📝
**Categoria:** General  
**Descrizione:** Navigazione a schede per organizzare contenuti correlati
**Variabili pianificate:** `orientation`, `variant`, `theme`, `size`
**Casi d'uso:**
- Sezioni profilo utente
- Categorie prodotti
- Dashboard multi-sezione
- Impostazioni organizzate

```erb
<!-- Esempio futuro -->
<%= bui_tabs(variant: :underline) do %>
  <%= bui_tab(text: "Generale", active: true) %>
  <%= bui_tab(text: "Sicurezza") %>
  <%= bui_tab(text: "Notifiche") %>
<% end %>
```

### **Pagination** 📝
**Categoria:** General  
**Descrizione:** Navigazione paginata per liste e tabelle
**Variabili pianificate:** `current_page`, `total_pages`, `per_page`, `theme`, `size`
**Casi d'uso:**
- Tabelle con molti record
- Liste prodotti
- Risultati ricerca
- Feed contenuti

```erb
<!-- Esempio futuro -->
<%= bui_pagination(current_page: 3, total_pages: 10, path: products_path) %>
```

---

## 🔄 **PRIORITÀ MEDIA** (v0.3.x)

### **Accordion** 📝
**Categoria:** General  
**Descrizione:** Contenuto espandibile/collassabile organizzato a fisarmonica
**Variabili pianificate:** `multiple`, `theme`, `size`, `animation`

### **Empty State** 📝
**Categoria:** General  
**Descrizione:** Stati vuoti con illustrazioni e messaggi guidati
**Variabili pianificate:** `illustration`, `title`, `description`, `action`

### **Loading Skeleton** 📝
**Categoria:** General  
**Descrizione:** Placeholder animati durante il caricamento dei contenuti
**Variabili pianificate:** `variant`, `lines`, `animation`, `theme`

### **Toast/Notification** 📝
**Categoria:** General  
**Descrizione:** Notifiche temporanee non intrusive
**Variabili pianificate:** `position`, `duration`, `theme`, `closable`

### **Form Group** 📝
**Categoria:** Form  
**Descrizione:** Raggruppamento logico di campi correlati
**Variabili pianificate:** `title`, `description`, `collapsible`, `theme`

### **File Upload** 📝
**Categoria:** Form  
**Descrizione:** Upload file con drag & drop e preview
**Variabili pianificate:** `multiple`, `accept`, `max_size`, `preview`

### **Date/Time Picker** 📝
**Categoria:** Form  
**Descrizione:** Selezione date e orari con calendario
**Variabili pianificate:** `format`, `min_date`, `max_date`, `locale`

### **Toggle/Switch** 📝
**Categoria:** Form  
**Descrizione:** Interruttori on/off per impostazioni booleane
**Variabili pianificate:** `size`, `theme`, `label_position`, `disabled`

---

## 🔧 **PRIORITÀ BASSA** (v0.4.x+)

### **Range/Slider** 📝
**Categoria:** Form  
**Descrizione:** Selezione valori numerici tramite slider
**Variabili pianificate:** `min`, `max`, `step`, `dual`, `theme`

### **Header/Footer** 📝
**Categoria:** Application  
**Descrizione:** Intestazione e piè di pagina per layout completi
**Variabili pianificate:** `sticky`, `theme`, `height`, `centered`

### **Search Bar** 📝
**Categoria:** Application  
**Descrizione:** Barra di ricerca con filtri e suggerimenti
**Variabili pianificate:** `filters`, `suggestions`, `live_search`, `theme`

### **Stats Card** 📝
**Categoria:** Application  
**Descrizione:** Card per visualizzazione metriche e KPI
**Variabili pianificate:** `value`, `trend`, `icon`, `theme`, `format`

### **Copy to Clipboard** 📝
**Categoria:** Utility  
**Descrizione:** Copia testo/codice negli appunti
**Variabili pianificate:** `text`, `feedback`, `icon`, `theme`

### **Color Picker** 📝
**Categoria:** Form  
**Descrizione:** Selezione colori con palette e input hex
**Variabili pianificate:** `format`, `palette`, `alpha`, `theme`

### **Code Block** 📝
**Categoria:** General  
**Descrizione:** Visualizzazione codice con syntax highlighting
**Variabili pianificate:** `language`, `theme`, `line_numbers`, `copy_button`

---

## 📊 **Progressione Roadmap**

| Versione | Componenti Pianificati | Focus |
|----------|------------------------|-------|
| **v0.2.x** | 5 componenti | Interattività e Form |
| **v0.3.x** | 8 componenti | UX avanzata e Layout |
| **v0.4.x** | 7 componenti | Specializzazione e Utility |

## 🎯 **Milestone Obiettivi**

### **v0.2.0 - "Interactive"** (Q1 2025)
Componenti interattivi essenziali per UX moderne
- ✅ Modal per conferme e form
- ✅ Dropdown per menu e azioni
- ✅ Field per form strutturati
- ✅ Tabs per organizzazione contenuti
- ✅ Pagination per navigazione dati

### **v0.3.0 - "Advanced UX"** (Q2 2025)
Esperienza utente avanzata e stati dell'applicazione
- Focus su stati di caricamento
- Notifiche e feedback
- Form complessi e file upload

### **v0.4.0 - "Complete Suite"** (Q3 2025)
Suite completa per applicazioni enterprise
- Componenti specializzati
- Utility avanzate
- Layout completi

---

## 💡 **Come Contribuire**

Vuoi implementare uno di questi componenti? 
1. Apri un issue su GitHub per discutere l'approccio
2. Segui le [convenzioni BetterUI](architecture.md)
3. Crea una pull request con la tua implementazione

---
**Ultimo aggiornamento:** Gennaio 2025 | **Prossima review:** Marzo 2025
