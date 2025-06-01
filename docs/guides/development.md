# 🛠️ Guida Sviluppo

Questa guida ti aiuterà a sviluppare e personalizzare Better UI nel tuo progetto Rails.

## 🎯 **Utilizzo Base**

### 1. Importare Helper

Gli helper Better UI sono automaticamente disponibili nei tuoi views:

```erb
<!-- app/views/pages/home.html.erb -->
<div class="p-8">
  <%= bui_heading(text: "Dashboard", level: 1, size: :large) %>
  <%= bui_button(text: "Nuova Azione", theme: :blue, size: :medium) %>
</div>
```

### 2. Composizione Componenti

Combina più componenti per creare interfacce complesse:

```erb
<!-- Card con contenuto strutturato -->
<%= bui_application_card do %>
  <div class="space-y-4">
    <%= bui_heading(text: "Impostazioni Utente", level: 2) %>
    <%= bui_divider %>
    
    <div class="grid grid-cols-2 gap-4">
      <%= bui_input_text(name: "name", placeholder: "Nome") %>
      <%= bui_input_text(name: "email", placeholder: "Email") %>
    </div>
    
    <div class="flex justify-end space-x-2">
      <%= bui_button(text: "Annulla", theme: :gray) %>
      <%= bui_button(text: "Salva", theme: :green) %>
    </div>
  </div>
<% end %>
```

## 📝 **Form Avanzati**

### 1. Utilizzo con Rails Form Builder

```erb
<%= form_with model: @user, local: true do |form| %>
  <div class="space-y-4">
    <%= bui_input_text(
      name: "user[name]", 
      value: @user.name,
      placeholder: "Nome completo",
      required: true,
      form: form
    ) %>
    
    <%= bui_input_text(
      name: "user[email]", 
      value: @user.email,
      placeholder: "Email",
      type: "email",
      form: form
    ) %>
    
    <%= bui_input_textarea(
      name: "user[bio]",
      value: @user.bio,
      placeholder: "Biografia",
      rows: 4,
      form: form
    ) %>
    
    <%= bui_button(text: "Salva Utente", type: "submit", theme: :blue) %>
  </div>
<% end %>
```

### 2. Gestione Errori

```erb
<%= form_with model: @user, local: true do |form| %>
  <div class="space-y-4">
    <% if @user.errors[:name].any? %>
      <%= bui_alert(
        text: @user.errors[:name].first,
        theme: :red,
        dismissable: true
      ) %>
    <% end %>
    
    <%= bui_input_text(
      name: "user[name]",
      value: @user.name,
      placeholder: "Nome",
      classes: @user.errors[:name].any? ? "border-red-500" : ""
    ) %>
  </div>
<% end %>
```

## 🎨 **Personalizzazione Temi**

### 1. Override Variabili CSS

```scss
// app/assets/stylesheets/application.scss
:root {
  /* Personalizza colori Better UI */
  --bui-blue-500: #3b82f6;
  --bui-blue-600: #2563eb;
  --bui-green-500: #10b981;
  --bui-red-500: #ef4444;
}
```

### 2. Classi Custom

```erb
<!-- Aggiungi classi Tailwind personalizzate -->
<%= bui_button(
  text: "Pulsante Custom",
  theme: :blue,
  classes: "shadow-lg hover:shadow-xl transform hover:scale-105 transition-all"
) %>
```

### 3. Attributi HTML Aggiuntivi

```erb
<!-- Aggiungi attributi HTML personalizzati -->
<%= bui_input_text(
  name: "search",
  placeholder: "Cerca...",
  'data-controller': "search",
  'data-action': "input->search#filter",
  'autocomplete': "off"
) %>
```

## 🔧 **Integrazione con Stimulus**

### 1. Controller Stimulus

```javascript
// app/javascript/controllers/dropdown_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "trigger"]
  
  connect() {
    this.isOpen = false
  }
  
  toggle() {
    this.isOpen = !this.isOpen
    this.menuTarget.classList.toggle("hidden", !this.isOpen)
  }
  
  close() {
    this.isOpen = false
    this.menuTarget.classList.add("hidden")
  }
}
```

### 2. Utilizzo con Better UI

```erb
<div data-controller="dropdown" class="relative">
  <%= bui_button(
    text: "Menu",
    'data-action': "click->dropdown#toggle",
    'data-dropdown-target': "trigger"
  ) %>
  
  <div data-dropdown-target="menu" class="hidden absolute top-full left-0 mt-2">
    <%= bui_panel(theme: :white, shadow: :medium) do %>
      <div class="py-2">
        <%= bui_link(text: "Profilo", href: "/profile") %>
        <%= bui_link(text: "Impostazioni", href: "/settings") %>
        <%= bui_divider %>
        <%= bui_link(text: "Logout", href: "/logout") %>
      </div>
    <% end %>
  </div>
</div>
```

## 📱 **Layout Responsivi**

### 1. Dashboard Mobile-First

```erb
<!-- Layout responsivo con Better UI -->
<div class="min-h-screen bg-gray-50">
  <!-- Mobile Navbar -->
  <div class="lg:hidden">
    <%= bui_application_navbar(brand: "App", sticky: true) do %>
      <%= bui_button(text: "Menu", size: :small, 'data-action': "click->sidebar#toggle") %>
    <% end %>
  </div>
  
  <div class="flex">
    <!-- Sidebar -->
    <div class="hidden lg:block lg:w-64">
      <%= bui_application_sidebar(position: :left) do %>
        <!-- Menu items -->
      <% end %>
    </div>
    
    <!-- Main Content -->
    <%= bui_application_main(padding: :large, classes: "flex-1") do %>
      <div class="max-w-7xl mx-auto">
        <%= yield %>
      </div>
    <% end %>
  </div>
</div>
```

### 2. Grid Responsiva

```erb
<!-- Grid responsiva con componenti -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
  <% @cards.each do |card| %>
    <%= bui_application_card(header: card.title) do %>
      <div class="space-y-3">
        <p class="text-gray-600"><%= card.description %></p>
        <%= bui_progress(value: card.completion, theme: :blue) %>
        
        <div class="flex justify-between items-center">
          <%= bui_badge(text: card.status, theme: card.status_color) %>
          <%= bui_button(text: "Dettagli", size: :small, variant: :outline) %>
        </div>
      </div>
    <% end %>
  <% end %>
</div>
```

## 🔄 **Interazioni Dinamiche**

### 1. Aggiornamenti con Turbo

```erb
<!-- Pulsante con azione Turbo -->
<%= bui_button(
  text: "Aggiorna Status",
  theme: :blue,
  'data-turbo-method': :patch,
  'data-turbo-confirm': "Confermi l'aggiornamento?",
  href: update_status_path(@item)
) %>

<!-- Frame Turbo per aggiornamenti parziali -->
<%= turbo_frame_tag "status_#{@item.id}" do %>
  <%= bui_badge(text: @item.status, theme: @item.status_color) %>
<% end %>
```

### 2. Stream Updates

```ruby
# app/controllers/items_controller.rb
def update
  @item.update(item_params)
  
  respond_to do |format|
    format.turbo_stream do
      render turbo_stream: turbo_stream.replace(
        "status_#{@item.id}",
        partial: "items/status",
        locals: { item: @item }
      )
    end
  end
end
```

## 🧪 **Testing Componenti**

### 1. Test Helper

```ruby
# test/test_helper.rb
class ActiveSupport::TestCase
  include BetterUi::General::Components::Button::ButtonHelper
  include BetterUi::General::Components::Alert::AlertHelper
  # Include altri helper necessari
end
```

### 2. Test Integrazione

```ruby
# test/integration/dashboard_test.rb
class DashboardTest < ActionDispatch::IntegrationTest
  test "dashboard renders correctly" do
    user = users(:john)
    sign_in user
    
    get dashboard_path
    
    assert_response :success
    assert_select ".bui-button", minimum: 1
    assert_select ".bui-card", minimum: 3
    assert_includes response.body, bui_heading(text: "Dashboard", level: 1)
  end
end
```

## 📊 **Performance e Ottimizzazione**

### 1. Lazy Loading Componenti

```erb
<!-- Carica componenti solo quando necessario -->
<%= content_for :javascript do %>
  <script>
    // Carica componenti pesanti solo al bisogno
    import("./heavy_component").then(module => {
      module.initializeComponent();
    });
  </script>
<% end %>
```

### 2. Cache Fragment

```erb
<!-- Cache componenti costosi -->
<% cache [@user, "user_dashboard"] do %>
  <%= bui_application_card(header: "Statistiche") do %>
    <!-- Contenuto costoso da calcolare -->
    <% @user.statistics.each do |stat| %>
      <%= bui_progress(value: stat.value, label: stat.name) %>
    <% end %>
  <% end %>
<% end %>
```

## 🛡️ **Sicurezza**

### 1. Sanitizzazione Input

```erb
<!-- Sanitizza sempre input utente -->
<%= bui_alert(
  text: sanitize(@user_message),
  theme: :blue
) %>
```

### 2. CSRF Protection

```erb
<!-- Form con protezione CSRF -->
<%= form_with model: @model, local: true, authenticity_token: true do |form| %>
  <%= bui_input_text(name: "model[name]", form: form) %>
  <%= bui_button(text: "Salva", type: "submit") %>
<% end %>
```

## 📚 **Best Practices**

### 1. Struttura Coerente

- Usa sempre prefisso `bui_` per i metodi helper
- Mantieni coerenza nei nomi dei parametri
- Documenta componenti custom

### 2. Accessibilità

```erb
<!-- Sempre includere attributi di accessibilità -->
<%= bui_button(
  text: "Elimina",
  theme: :red,
  'aria-label': "Elimina elemento #{@item.name}",
  'aria-describedby': "delete-help-text"
) %>

<p id="delete-help-text" class="sr-only">
  Questa azione non può essere annullata
</p>
```

### 3. Mantenibilità

```erb
<!-- Estrai logica complessa in helper -->
<% # app/helpers/application_helper.rb %>
<% def user_status_badge(user) %>
<%   theme = user.active? ? :green : :gray %>
<%   text = user.active? ? "Attivo" : "Inattivo" %>
<%   bui_badge(text: text, theme: theme) %>
<% end %>

<!-- Uso nel view -->
<%= user_status_badge(@user) %>
```

---
**Ultima revisione:** Gennaio 2025 | **Versione Better UI:** 0.1.1
