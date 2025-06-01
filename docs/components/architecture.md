# 🏗️ Architettura Better UI

Questa documentazione spiega l'architettura, le convenzioni e i pattern di sviluppo di Better UI.

## 🎯 **Principi Fondamentali**

### 1. Architettura Modulare

Better UI segue un'architettura modulare con tre categorie principali:

- **🎨 GENERAL**: Componenti base riutilizabili (button, input, alert, etc.)
- **🏗️ APPLICATION**: Componenti specifici per layout applicazioni (navbar, sidebar, main)
- **📝 FORM**: Componenti specializzati per form e validazione (future)

### 2. Tecnologie Core

- **ViewComponent**: Framework per componenti Ruby
- **Tailwind CSS**: Framework CSS utility-first
- **Lookbook**: Ambiente di sviluppo e preview componenti
- **YARD**: Documentazione automatica

### 3. Filosofia Design

- **Consistency First**: Tutti i componenti seguono pattern consistenti
- **Developer Experience**: API intuitive e documentazione completa
- **Flexibility**: Personalizzazione attraverso parametri e classi
- **Performance**: Componenti ottimizzati e cacheable

## 📁 **Struttura File System**

### 1. Organizzazione Componenti

```
app/components/better_ui/
├── general/                 # Componenti base
│   ├── button/
│   │   ├── component.rb
│   │   └── component.html.erb
│   ├── input/
│   │   ├── text/
│   │   ├── textarea/
│   │   └── checkbox/
│   └── table/
│       ├── component.rb
│       ├── component.html.erb
│       ├── thead_component.rb
│       └── tbody_component.rb
├── application/             # Layout components
│   ├── navbar/
│   ├── sidebar/
│   └── main/
└── form/                    # Form components (future)
    ├── field/
    └── group/
```

### 2. Sistema Helper

```
app/helpers/better_ui/
├── [categoria]/components/
│   ├── [componente].rb          # File principale con include
│   └── [componente]/
│       └── [componente]_helper.rb  # Helper specifico
```

### 3. Preview Lookbook

```
test/components/previews/better_ui/
├── [categoria]/[componente]/
│   ├── component_preview.rb        # Logica preview
│   ├── component_preview/
│   │   ├── default.html.erb        # Preview helper
│   │   └── raw.html.erb            # Preview componente diretto
```

## 🏛️ **Pattern Architetturali**

### 1. Componente ViewComponent

```ruby
# Pattern standard per ogni componente
module BetterUi
  module [Categoria]
    module [Nome]
      class Component < ViewComponent::Base
        def initialize(param_required:, param_optional: :default, **options)
          @param_required = param_required
          @param_optional = param_optional
          @options = options
          
          validate_params
        end

        private

        attr_reader :param_required, :param_optional, :options

        def validate_params
          validate_param_required
          validate_param_optional
        end

        def validate_param_required
          # Validazione parametri obbligatori
        end

        def component_classes
          classes = ['base', 'classes']
          classes += CONSTANT_CLASSES[param_optional]
          classes.join(' ')
        end

        # SEMPRE usare costanti per classi CSS
        CONSTANT_CLASSES = {
          option1: ['class1', 'class2'],
          option2: ['class3', 'class4']
        }.freeze
      end
    end
  end
end
```

### 2. Sistema Helper Dual

```ruby
# File principale: app/helpers/better_ui/general/components/button.rb
module BetterUi
  module General
    module Components
      module Button
        include BetterUi::General::Components::Button::ButtonHelper
      end
    end
  end
end

# File specifico: app/helpers/better_ui/general/components/button/button_helper.rb
module BetterUi
  module General
    module Components
      module Button
        module ButtonHelper
          ##
          # Documentazione YARD completa
          def bui_button(text:, theme: :default, **options)
            render Component.new(text: text, theme: theme, **options)
          end
        end
      end
    end
  end
end
```

### 3. Preview Lookbook

```ruby
# Pattern standard per preview
class ComponentPreview < ViewComponent::Preview
  # @notes - Documentazione obbligatoria
  
  # @param parametro tipo
  def default(parametro: "valore_default")
    normalized = normalize_params!(parametro: parametro)
    render_with_template(locals: normalized)
  end
  
  def raw(parametro: "valore_default")
    normalized = normalize_params!(parametro: parametro)
    render Component.new(**normalized)
  end

  private

  def normalize_params!(parametro:, **options)
    { parametro: parametro, **options }
  end
end
```

## 🎨 **Sistema Design**

### 1. Variabili Standard

Ogni componente DOVREBBE supportare queste variabili quando appropriato:

```ruby
# Variabili raccomandate (non obbligatorie per tutti)
STANDARD_VARIABLES = {
  theme: [:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet],
  size: [:small, :medium, :large],
  rounded: [:none, :small, :medium, :large, :full]
}
```

### 2. Naming Costanti

```ruby
# SEMPRE usare prefisso specifico
BUTTON_THEME_CLASSES = { ... }     # ✅ Corretto
BUTTON_SIZE_CLASSES = { ... }      # ✅ Corretto

THEME_CLASSES = { ... }            # ❌ Troppo generico
SIZE_CLASSES = { ... }             # ❌ Rischio clash
```

### 3. Classi CSS Pattern

```ruby
# Pattern per costruzione classi
def component_classes
  classes = ['base-class-1', 'base-class-2']
  classes += COMPONENT_THEME_CLASSES[theme]
  classes += COMPONENT_SIZE_CLASSES[size] if size
  classes += custom_classes if options[:classes]
  classes.join(' ')
end

private

def custom_classes
  options[:classes].split(' ')
end
```

## 🔧 **Convenzioni Obbligatorie**

### 1. Naming

- **Metodi helper**: prefisso `bui_` + nome_componente
- **Namespace moduli**: `BetterUi::[Categoria]::[Nome]`
- **File**: snake_case, struttura gerarchica
- **Costanti**: prefisso specifico per evitare clash

### 2. Validazioni

```ruby
# SEMPRE implementare validate_params
def validate_params
  validate_required_params
  validate_optional_params
end

def validate_theme
  valid_themes = [:default, :blue, :red, :green]
  return if valid_themes.include?(theme)
  raise ArgumentError, "Invalid theme: #{theme}. Must be one of #{valid_themes}"
end
```

### 3. Documentazione YARD

```ruby
##
# Breve descrizione del componente
#
# @param param1 [Type] Descrizione parametro obbligatorio
# @param param2 [Type] Descrizione parametro opzionale (default: valore)
# @param **options [Hash] Attributi HTML aggiuntivi
# @return [String] HTML renderizzato del componente
#
# @example Utilizzo base
#   <%= bui_component(param1: "valore") %>
#
# @example Con parametri opzionali
#   <%= bui_component(param1: "valore", param2: :option) %>
#
# @example Con attributi HTML
#   <%= bui_component(param1: "valore", class: "custom", id: "unique") %>
#
# @example Con form builder Rails
#   <%= form_with model: @user do |form| %>
#     <%= bui_component(param1: "valore", form: form) %>
#   <% end %>
#
# @example Con blocco di contenuto
#   <%= bui_component(param1: "valore") do %>
#     Contenuto personalizzato
#   <% end %>
#
def bui_component(param1:, param2: :default, **options, &block)
  # implementazione...
end
```

## 🚫 **Anti-Pattern Vietati**

### 1. Metodi Condizionali CSS

```ruby
# ❌ VIETATO ASSOLUTO
def theme_classes
  case theme
  when :blue then 'bg-blue-500 text-white'
  when :red then 'bg-red-500 text-white'
  end
end

# ✅ PATTERN CORRETTO
COMPONENT_THEME_CLASSES = {
  blue: ['bg-blue-500', 'text-white'],
  red: ['bg-red-500', 'text-white']
}.freeze

def theme_classes
  COMPONENT_THEME_CLASSES[theme]
end
```

### 2. CSS/SCSS Custom

```ruby
# ❌ VIETATO: Non creare file CSS custom
# app/assets/stylesheets/components/button.scss

# ✅ CORRETTO: Solo classi Tailwind
BUTTON_THEME_CLASSES = {
  blue: ['bg-blue-500', 'hover:bg-blue-600', 'text-white']
}.freeze
```

### 3. Preview Multiple Varianti

```erb
<!-- ❌ VIETATO: Multiple istanze in preview -->
<div class="space-y-4">
  <%= bui_button(text: "Small", size: :small) %>
  <%= bui_button(text: "Medium", size: :medium) %>
  <%= bui_button(text: "Large", size: :large) %>
</div>

<!-- ✅ CORRETTO: Una sola istanza, variazioni via Lookbook params -->
<%= bui_button(text: text, size: size, theme: theme) %>
```

## 🧪 **Testing Strategy**

### 1. Livelli di Test

```ruby
# Component Test - Comportamento ViewComponent
class ComponentTest < ViewComponent::TestCase
  test "renders with required parameters"
  test "validates parameters correctly"
  test "applies CSS classes correctly"
end

# Helper Test - Interfaccia helper
class HelperTest < ActionView::TestCase
  test "helper method renders component"
  test "helper passes parameters correctly"
end

# Integration Test - Comportamento in app Rails
class IntegrationTest < ActionDispatch::IntegrationTest
  test "component works in real views"
  test "component integrates with forms"
end
```

### 2. Test Pattern

```ruby
# Pattern standard per test componenti
test "renders with required parameters" do
  render_inline(Component.new(required_param: "value"))
  
  assert_selector "expected_selector"
  assert_text "expected_text"
end

test "validates parameters" do
  assert_raises(ArgumentError) do
    Component.new(required_param: "value", invalid_param: :invalid)
  end
end

test "applies theme classes correctly" do
  render_inline(Component.new(required_param: "value", theme: :blue))
  
  assert_selector "[class*='bg-blue-500']"
end
```

## 🔄 **Versioning e Evoluzione**

### 1. Semantic Versioning

- **MAJOR**: Breaking changes API componenti
- **MINOR**: Nuovi componenti, nuove feature
- **PATCH**: Bug fix, miglioramenti minori

### 2. Deprecation Strategy

```ruby
# Pattern per deprecare parametri
def initialize(old_param: nil, new_param: nil, **options)
  if old_param
    warn "[DEPRECATION] `old_param` is deprecated. Use `new_param` instead."
    @new_param = old_param
  else
    @new_param = new_param
  end
end
```

### 3. Migration Guide

Ogni breaking change deve includere:
- Documenta migration path
- Esempi before/after
- Timeline deprecation
- Backward compatibility temporanea

## 📈 **Performance Guidelines**

### 1. ViewComponent Optimization

```ruby
# Cache costosi calcoli
def expensive_classes
  @expensive_classes ||= calculate_complex_classes
end

# Evita logica complessa nei template
def prepared_data
  @prepared_data ||= complex_data_preparation
end
```

### 2. CSS Class Building

```ruby
# Efficiente: pre-calculate classes
THEME_CLASSES = {
  blue: ['bg-blue-500', 'hover:bg-blue-600'].freeze
}.freeze

# Evita: string concatenation in hot paths
def classes
  THEME_CLASSES[theme].join(' ')
end
```

---
**Ultima revisione:** Gennaio 2025 | **Versione Architettura:** 1.0
