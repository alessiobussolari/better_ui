# 🤝 Guida Contribuzione

Questa guida spiega come contribuire al progetto Better UI seguendo le convenzioni e i pattern stabiliti.

## 🎯 **Come Contribuire**

### 1. Setup Ambiente Sviluppo

```bash
# Fork e clone del repository
git clone https://github.com/tuousername/better_ui.git
cd better_ui

# Installa dipendenze
bundle install

# Setup database di test
cd test/dummy
rails db:create db:migrate
cd ../..

# Avvia server di sviluppo
cd test/dummy
rails server
```

### 2. Verifica Setup

```bash
# Test suite
bundle exec rake test

# Lookbook (http://localhost:3000/lookbook)
cd test/dummy && rails server

# Rubocop (linting)
bundle exec rubocop
```

## 🏗️ **Implementare Nuovo Componente**

### 1. Struttura File Obbligatoria

```
app/components/better_ui/[categoria]/[nome]/
├── component.rb
└── component.html.erb

app/helpers/better_ui/[categoria]/components/
├── [nome].rb
└── [nome]/[nome]_helper.rb

test/components/previews/better_ui/[categoria]/[nome]/
├── component_preview.rb
├── component_preview/default.html.erb
└── component_preview/raw.html.erb
```

### 2. Template Componente

```ruby
# app/components/better_ui/general/modal/component.rb
# frozen_string_literal: true

module BetterUi
  module General
    module Modal
      class Component < ViewComponent::Base
        def initialize(title:, size: :medium, backdrop: true, **options)
          @title = title
          @size = size
          @backdrop = backdrop
          @options = options
          
          validate_params
        end

        private

        attr_reader :title, :size, :backdrop, :options

        def validate_params
          validate_size
          validate_backdrop
        end

        def validate_size
          valid_sizes = [:small, :medium, :large]
          return if valid_sizes.include?(size)
          raise ArgumentError, "Invalid size: #{size}. Must be one of #{valid_sizes}"
        end

        def validate_backdrop
          return if [true, false].include?(backdrop)
          raise ArgumentError, "Invalid backdrop: #{backdrop}. Must be boolean"
        end

        def modal_classes
          classes = ['fixed', 'inset-0', 'z-50', 'overflow-auto']
          classes += MODAL_SIZE_CLASSES[size]
          classes.join(' ')
        end

        def backdrop_classes
          return '' unless backdrop
          'fixed inset-0 bg-black bg-opacity-50'
        end

        MODAL_SIZE_CLASSES = {
          small: ['max-w-sm'],
          medium: ['max-w-md'],
          large: ['max-w-lg']
        }.freeze
      end
    end
  end
end
```

### 3. Template ERB

```erb
<!-- app/components/better_ui/general/modal/component.html.erb -->
<div class="<%= modal_classes %>">
  <% if backdrop %>
    <div class="<%= backdrop_classes %>" data-action="click->modal#close"></div>
  <% end %>
  
  <div class="relative bg-white rounded-lg shadow-lg mx-auto my-8 p-6">
    <div class="flex justify-between items-center mb-4">
      <h3 class="text-lg font-semibold"><%= title %></h3>
      <button class="text-gray-400 hover:text-gray-600" data-action="click->modal#close">
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
        </svg>
      </button>
    </div>
    
    <div class="modal-content">
      <%= content %>
    </div>
  </div>
</div>
```

### 4. Helper System

```ruby
# app/helpers/better_ui/general/components/modal.rb
# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Modal
        include BetterUi::General::Components::Modal::ModalHelper
      end
    end
  end
end
```

```ruby
# app/helpers/better_ui/general/components/modal/modal_helper.rb
# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Modal
        module ModalHelper
          ##
          # Renders a modal dialog component
          #
          # @param title [String] The modal title
          # @param size [Symbol] Modal size (:small, :medium, :large)
          # @param backdrop [Boolean] Show backdrop overlay
          # @param **options [Hash] Additional HTML attributes
          # @return [String] Rendered modal HTML
          #
          # @example Basic modal
          #   <%= bui_modal(title: "Conferma") do %>
          #     <p>Sei sicuro?</p>
          #   <% end %>
          #
          # @example Large modal
          #   <%= bui_modal(title: "Dettagli", size: :large) do %>
          #     <!-- Contenuto esteso -->
          #   <% end %>
          #
          # @example Modal senza backdrop
          #   <%= bui_modal(title: "Info", backdrop: false) do %>
          #     <p>Informazioni importanti</p>
          #   <% end %>
          #
          def bui_modal(title:, size: :medium, backdrop: true, **options, &block)
            render BetterUi::General::Modal::Component.new(
              title: title,
              size: size,
              backdrop: backdrop,
              **options
            ), &block
          end
        end
      end
    end
  end
end
```

### 5. Preview Lookbook

```ruby
# test/components/previews/better_ui/general/modal/component_preview.rb
# frozen_string_literal: true

module BetterUi
  module General
    module Modal
      class ComponentPreview < ViewComponent::Preview
        # @notes
        #
        # ## Utilizzo Base
        # Modal per conferme, form e visualizzazione contenuti in overlay
        #
        # ## Casi d'Uso Comuni
        # - Conferme eliminazione: per richiedere conferma prima di azioni irreversibili
        # - Form in overlay: per modifica dati senza cambiare pagina
        # - Dettagli elementi: per mostrare informazioni aggiuntive
        # - Gallerie immagini: per visualizzazione contenuti multimediali
        #
        # ## Variabili Principali
        # - **title**: titolo mostrato nell'header del modal
        # - **size**: dimensioni del modal (small, medium, large)
        # - **backdrop**: mostra/nasconde overlay di sfondo
        #
        # ## Esempi Codice
        # ```erb
        # <%= bui_modal(title: "Conferma") do %>
        #   <p>Contenuto modal</p>
        # <% end %>
        # <%= bui_modal(title: "Dettagli", size: :large) %>
        # ```

        # @param title text
        # @param size select { choices: [small, medium, large] }
        # @param backdrop toggle
        def default(title: "Titolo Modal", size: :medium, backdrop: true)
          normalized = normalize_params!(title: title, size: size.to_sym, backdrop: backdrop)
          render_with_template(locals: normalized)
        end

        # @param title text
        # @param size select { choices: [small, medium, large] }
        # @param backdrop toggle
        def raw(title: "Titolo Modal", size: :medium, backdrop: true)
          normalized = normalize_params!(title: title, size: size.to_sym, backdrop: backdrop)
          render BetterUi::General::Modal::Component.new(**normalized) do
            content_tag :p, "Contenuto del modal di esempio"
          end
        end

        private

        def normalize_params!(title:, size:, backdrop:, **options)
          {
            title: title,
            size: size,
            backdrop: backdrop,
            **options
          }
        end
      end
    end
  end
end
```

## 📋 **Convenzioni Obbligatorie**

### 1. Naming e Struttura

- **Prefisso helper**: sempre `bui_`
- **Namespace**: `BetterUi::[Categoria]::[Nome]`
- **Costanti**: prefisso specifico (es. `MODAL_SIZE_CLASSES`)
- **File**: snake_case, struttura gerarchica

### 2. Validazioni

```ruby
# SEMPRE implementare validate_params
def validate_params
  validate_size
  validate_theme
  # validate altri parametri...
end

def validate_size
  valid_sizes = [:small, :medium, :large]
  return if valid_sizes.include?(size)
  raise ArgumentError, "Invalid size: #{size}. Must be one of #{valid_sizes}"
end
```

### 3. Costanti CSS

```ruby
# SEMPRE usare costanti hash, MAI metodi condizionali
MODAL_SIZE_CLASSES = {
  small: ['max-w-sm', 'p-4'],
  medium: ['max-w-md', 'p-6'],
  large: ['max-w-lg', 'p-8']
}.freeze

# ✅ Corretto
classes += MODAL_SIZE_CLASSES[size]

# ❌ VIETATO
def size_classes
  case size
  when :small then 'max-w-sm p-4'
  when :medium then 'max-w-md p-6'
  end
end
```

### 4. Documentazione YARD

```ruby
##
# Descrizione breve del metodo
#
# @param nome [Tipo] Descrizione parametro
# @param opzionale [Tipo] Descrizione (default: valore)
# @return [String] Descrizione ritorno
#
# @example Esempio base
#   <%= bui_component(param: "valore") %>
#
# @example Esempio avanzato
#   <%= bui_component(param: "valore", theme: :blue) %>
#
def bui_component(nome:, opzionale: :default, **options)
  # implementazione...
end
```

## 🧪 **Testing**

### 1. Test Componente

```ruby
# test/components/better_ui/general/modal_component_test.rb
require "test_helper"

class BetterUi::General::ModalComponentTest < ViewComponent::TestCase
  test "renders with required parameters" do
    render_inline(BetterUi::General::Modal::Component.new(title: "Test"))
    
    assert_selector "div[class*='fixed']"
    assert_text "Test"
  end

  test "validates size parameter" do
    assert_raises(ArgumentError) do
      BetterUi::General::Modal::Component.new(title: "Test", size: :invalid)
    end
  end

  test "applies size classes correctly" do
    render_inline(BetterUi::General::Modal::Component.new(title: "Test", size: :large))
    
    assert_selector "div[class*='max-w-lg']"
  end
end
```

### 2. Test Helper

```ruby
# test/helpers/better_ui/general/modal_helper_test.rb
require "test_helper"

class BetterUi::General::ModalHelperTest < ActionView::TestCase
  include BetterUi::General::Components::Modal::ModalHelper

  test "bui_modal renders correctly" do
    result = bui_modal(title: "Test") { "Content" }
    
    assert_includes result, "Test"
    assert_includes result, "Content"
  end
end
```

## 📝 **Pull Request Process**

### 1. Preparazione

```bash
# Crea branch feature
git checkout -b feature/modal-component

# Implementa componente seguendo convenzioni
# ...

# Test e linting
bundle exec rake test
bundle exec rubocop

# Commit semantico
git commit -m "feat: add modal component

- Add modal component with size variants
- Include helper with full YARD documentation  
- Add Lookbook previews with examples
- Include comprehensive test coverage"
```

### 2. PR Template

```markdown
## 🎯 Tipo di Contributo
- [ ] Nuovo componente
- [ ] Bug fix
- [ ] Miglioramento esistente
- [ ] Documentazione

## 📋 Checklist Completamento
- [ ] Componente implementato con validazioni
- [ ] Helper con documentazione YARD completa
- [ ] Preview Lookbook funzionanti (default + raw)
- [ ] Test copertura >90%
- [ ] Rubocop passa senza errori
- [ ] Note utilizzo nelle preview

## 🔍 Testing
Testato su:
- [ ] Chrome
- [ ] Firefox  
- [ ] Safari
- [ ] Mobile

## 📸 Screenshots
<!-- Aggiungi screenshot Lookbook -->
```

### 3. Review Criteria

I manutentori verificheranno:

1. **Architettura**: rispetto convenzioni Better UI
2. **Codice**: qualità, validazioni, costanti
3. **Documentazione**: YARD completa, note utilizzo
4. **Test**: copertura, edge cases
5. **Preview**: funzionali e ben documentate

## 🔄 **Workflow Contribuzione**

### 1. Discussione (Issue)

Prima di implementare, apri un issue per discutere:
- Utilità del componente
- API e parametri
- Casi d'uso principali

### 2. Implementazione

Segui rigorosamente:
- Convenzioni naming
- Struttura file obbligatoria  
- Pattern validazioni
- Documentazione completa

### 3. Review e Feedback

Aspettati feedback su:
- Design API
- Implementazione tecnica
- Documentazione
- Test coverage

### 4. Release

I componenti approvati entrano nella prossima release seguendo [semantic versioning](https://semver.org/).

---

## 💡 **Risorse Utili**

- [ViewComponent Guide](https://viewcomponent.org/)
- [Tailwind CSS Docs](https://tailwindcss.com/docs)
- [YARD Documentation](https://yardoc.org/)
- [Better UI Architecture](../components/architecture.md)

---
**Ultima revisione:** Gennaio 2025 | **Guidelines Version:** 1.0
