# Tabs

Il componente Tabs fornisce una navigazione a schede per organizzare contenuti in sezioni facilmente accessibili. Le tabs sono utili per risparmiare spazio e presentare informazioni correlate ma distinte.

> **Nota importante**: Questa versione del componente Tabs è puramente presentazionale. Per funzionalità interattive complete, dovrai integrare il tuo JavaScript personalizzato.

## Utilizzo

Per utilizzare il componente Tabs nella tua applicazione, puoi utilizzare gli helper forniti dalla gemma:

```erb
<%= better_ui_tabs do %>
  <%= better_ui_tab_list do %>
    <%= better_ui_tab_item("Tab 1", "#tab1", active: true) %>
    <%= better_ui_tab_item("Tab 2", "#tab2") %>
    <%= better_ui_tab_item("Tab 3", "#tab3") %>
  <% end %>
  
  <div class="better-ui-tab-panels">
    <%= better_ui_tab_content(id: 'tab1', class: 'active') do %>
      <p>Contenuto del Tab 1</p>
    <% end %>
    
    <%= better_ui_tab_content(id: 'tab2', style: 'display: none;') do %>
      <p>Contenuto del Tab 2</p>
    <% end %>
    
    <%= better_ui_tab_content(id: 'tab3', style: 'display: none;') do %>
      <p>Contenuto del Tab 3</p>
    <% end %>
  </div>
<% end %>
```

## Helper disponibili

### better_ui_tabs

```erb
<%= better_ui_tabs(options = {}, &block) %>
```

Crea un container per il componente tabs.

**Parametri:**
- `options` (Hash): Opzioni aggiuntive
- `&block`: Contenuto del componente tabs

**Opzioni:**
- `class` (String): Classi CSS aggiuntive

### better_ui_tab_list

```erb
<%= better_ui_tab_list(options = {}, &block) %>
```

Crea il contenitore per gli elementi di tab.

**Parametri:**
- `options` (Hash): Opzioni aggiuntive
- `&block`: Contenuto della lista di tab

**Opzioni:**
- `class` (String): Classi CSS aggiuntive

### better_ui_tab_item

```erb
<%= better_ui_tab_item(text, target, options = {}) %>
```

Crea un singolo elemento di tab.

**Parametri:**
- `text` (String): Testo visualizzato nel tab
- `target` (String): Selettore CSS o ID dell'elemento target
- `options` (Hash): Opzioni aggiuntive

**Opzioni:**
- `active` (Boolean): Se `true`, il tab sarà attivo per default
- `class` (String): Classi CSS aggiuntive

### better_ui_tab_content

```erb
<%= better_ui_tab_content(options = {}, &block) %>
```

Crea il contenitore per il contenuto di un tab.

**Parametri:**
- `options` (Hash): Opzioni aggiuntive
- `&block`: Contenuto del tab

**Opzioni:**
- `id` (String): ID dell'elemento (deve corrispondere al target)
- `class` (String): Classi CSS aggiuntive
- `style` (String): Stili CSS inline

## Funzionalità interattive

Per funzionalità interattive complete, dovrai aggiungere il tuo JavaScript personalizzato. Ecco un esempio di come potresti implementare queste funzionalità:

```javascript
// Esempio di codice JavaScript per implementare la funzionalità dei tabs
document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('.better-ui-tab-item').forEach(function(tab) {
    tab.addEventListener('click', function() {
      // Rimuovi la classe active da tutti i tab
      const tabList = this.closest('.better-ui-tab-list');
      tabList.querySelectorAll('.better-ui-tab-item').forEach(function(t) {
        t.classList.remove('better-ui-tab-active');
        t.setAttribute('aria-selected', 'false');
      });
      
      // Aggiungi la classe active al tab cliccato
      this.classList.add('better-ui-tab-active');
      this.setAttribute('aria-selected', 'true');
      
      // Nascondi tutti i contenuti
      const tabsContainer = this.closest('.better-ui-tabs');
      tabsContainer.querySelectorAll('.better-ui-tab-content').forEach(function(content) {
        content.style.display = 'none';
      });
      
      // Mostra il contenuto corrispondente
      const targetId = this.getAttribute('data-target').replace('#', '');
      const targetContent = tabsContainer.querySelector('#' + targetId);
      if (targetContent) {
        targetContent.style.display = 'block';
      }
    });
  });
});
```

## Esempi

### Tabs orizzontali

```erb
<%= better_ui_tabs do %>
  <%= better_ui_tab_list do %>
    <%= better_ui_tab_item("Prodotti", "#products", active: true) %>
    <%= better_ui_tab_item("Servizi", "#services") %>
    <%= better_ui_tab_item("Contatti", "#contacts") %>
  <% end %>
  
  <div class="better-ui-tab-panels">
    <%= better_ui_tab_content(id: 'products', class: 'active') do %>
      <h3>I nostri prodotti</h3>
      <p>Elenco dei prodotti...</p>
    <% end %>
    
    <%= better_ui_tab_content(id: 'services', style: 'display: none;') do %>
      <h3>I nostri servizi</h3>
      <p>Elenco dei servizi...</p>
    <% end %>
    
    <%= better_ui_tab_content(id: 'contacts', style: 'display: none;') do %>
      <h3>Contattaci</h3>
      <p>Informazioni di contatto...</p>
    <% end %>
  </div>
<% end %>
```

### Tabs con icone

```erb
<%= better_ui_tabs do %>
  <%= better_ui_tab_list do %>
    <%= better_ui_tab_item("<i class='fa fa-home'></i> Home", "#home", active: true) %>
    <%= better_ui_tab_item("<i class='fa fa-user'></i> Profilo", "#profile") %>
    <%= better_ui_tab_item("<i class='fa fa-cog'></i> Impostazioni", "#settings") %>
  <% end %>
  
  <div class="better-ui-tab-panels">
    <%= better_ui_tab_content(id: 'home', class: 'active') do %>
      <p>Contenuto della home...</p>
    <% end %>
    
    <%= better_ui_tab_content(id: 'profile', style: 'display: none;') do %>
      <p>Contenuto del profilo...</p>
    <% end %>
    
    <%= better_ui_tab_content(id: 'settings', style: 'display: none;') do %>
      <p>Contenuto delle impostazioni...</p>
    <% end %>
  </div>
<% end %>
```

## Personalizzazione

Per personalizzare l'aspetto delle tabs, puoi sovrascrivere le classi CSS definite dalla gemma:

```css
.better-ui-tab-list {
  border-bottom: 2px solid #e2e8f0; /* Bordo inferiore più spesso */
}

.better-ui-tab-item {
  padding: 1rem 1.5rem; /* Padding più ampio */
  font-weight: 600; /* Testo in grassetto */
}

.better-ui-tab-active {
  color: #4f46e5; /* Colore viola per il tab attivo */
  border-bottom: 2px solid #4f46e5; /* Indicatore colorato per il tab attivo */
}

.better-ui-tab-content {
  padding: 1.5rem; /* Padding più ampio per il contenuto */
}
```

## Accessibilità

Per migliorare l'accessibilità delle tabs, considera di implementare le seguenti funzionalità con il tuo JavaScript personalizzato:

- Mantenere gli attributi ARIA appropriati (`role`, `aria-selected`, ecc.)
- Implementare la navigazione tra tabs tramite tastiera (tasti freccia)
- Assicurarsi che i tab possano ricevere il focus tramite tastiera
- Applicare `tabindex` appropriati agli elementi delle tabs 