# REGOLE BETTER UI COMPONENTS

## 📂 Categorizzazione Componenti

- **GENERAL**: Elementi semplici riutilizzabili (button, input, alert) → `app/components/better_ui/general/`
- **APPLICATION**: Elementi per dashboard/layout (navbar, sidebar, main) → `app/components/better_ui/application/`  
- **FORM**: Elementi specifici per form → `app/components/better_ui/form/`

## 🎨 NO CSS/SCSS - Solo Tailwind Inline

**REGOLA ASSOLUTA**: NON creare MAI file CSS, SCSS o stili personalizzati.
Usare ESCLUSIVAMENTE classi Tailwind direttamente in template HTML (`.html.erb`) o costanti Ruby.

## ⚙️ Sistema Variabili Componenti

Le variabili standard **RACCOMANDATE** sono:

- **THEME**: `default`, `white`, `red`, `rose`, `orange`, `green`, `blue`, `yellow`, `violet` (9 standard)
- **SIZE**: `small`, `medium`, `large` (3 standard)  
- **ROUNDED**: `none`, `small`, `medium`, `large`, `full` (5 standard)

**IMPORTANTE**: Ogni componente PUÒ avere variabili diverse in base alle sue esigenze:
- Alcuni componenti possono avere SOLO theme (es. alert)
- Altri possono avere variabili aggiuntive (es. orientation, variant, state)
- Altri ancora possono NON avere alcune variabili standard (es. componenti senza size)
- La scelta dipende dalla funzionalità e dal design del componente specifico

## 🏷️ Naming Costanti 

**SEMPRE** prefisso specifico per evitare clash: `TEXT_INPUT_THEME`, `BUTTON_SIZE`, `ICON_VARIANT`
**VIETATO**: `INPUT_THEME`, `SIZE`, `THEME` (troppo generico)

## 🛠️ Creazione Componenti - MANUALE

**NON** usare CLI o generator Rails.
Creare **MANUALMENTE** tutti i file seguendo la struttura standard.

## 📁 Struttura File Obbligatoria

### Componente:
- `app/components/better_ui/[categoria]/[nome]/component.rb`
- `app/components/better_ui/[categoria]/[nome]/component.html.erb`

### Helper:
- `app/helpers/better_ui/[categoria]/components/[nome].rb` (file principale)
- `app/helpers/better_ui/[categoria]/components/[nome]/[nome]_helper.rb` (helper specifico)

### Preview:
- `test/components/previews/better_ui/[categoria]/[nome]/component_preview.rb`
- `test/components/previews/better_ui/[categoria]/[nome]/component_preview/default.html.erb`
- `test/components/previews/better_ui/[categoria]/[nome]/component_preview/raw.html.erb`

## 📋 STRUTTURA FILE PREVIEW - REGOLE OBBLIGATORIE

### Header e Namespace

```ruby
# frozen_string_literal: true

module BetterUi
  module [Categoria]
    module [Nome]
      # @label [Nome Componente]
      class ComponentPreview < ViewComponent::Preview
        # VIETATO: include di moduli helper
```

### Documentazione @notes - OBBLIGATORIA

```ruby
# @notes
#
# ## Utilizzo Base
# Descrizione breve dell'uso principale del componente
#
# ## Casi d'Uso Comuni
# - Caso d'uso 1: descrizione
# - Caso d'uso 2: descrizione
# - Caso d'uso 3: descrizione
#
# ## Variabili Principali
# - **theme**: colori disponibili (default, blue, red, etc.)
# - **size**: dimensioni disponibili (small, medium, large)
# - **altre_variabili**: descrizioni specifiche
#
# ## Esempi Codice
# ```erb
# <%= bui_component_name %>
# <%= bui_component_name(theme: :blue, size: :large) %>
# ```
```

### Raggruppamento Lookbook - OBBLIGATORIO

```ruby
# @!group Esempi Base

# @label Con Helper
def default(...)
  # metodo con helper
end

# @label Istanziazione Diretta  
def raw(...)
  # metodo con render diretto
end

# @!endgroup
```

### Pattern Metodi Standard

```ruby
# @label Con Helper
# @param [tutti i parametri con documentazione]
def default(**params)
  normalized = normalize_params!(**params)
  render_with_template(locals: normalized)
end

# @label Istanziazione Diretta
# @param [tutti i parametri con documentazione]
def raw(**params)
  normalized = normalize_params!(**params)
  render ComponentClass.new(**normalized)
end

private

def normalize_params!(**params)
  {
    # normalizzazione parametri con .to_sym dove necessario
  }
end
```

## 🔧 Helper - Pattern Flessibile

Il metodo helper principale deve includere le variabili specifiche del componente:

```ruby
def bui_component_name(theme: :default, size: :medium, variant: :solid, **options, &block)
  # Adattare i parametri alle esigenze del componente specifico
end
```

## ✅ Initialize Flessibile

```ruby
def initialize(theme: :default, size: :medium, altre_variabili_specifiche:, **options)
  # SEMPRE validare i parametri implementati con validate_params
end
```

## 🔍 Validazione Obbligatoria

**SEMPRE** implementare validazioni per le variabili usate dal componente (`validate_theme`, `validate_size`, `validate_variant`, etc.)

## 📱 Preview Lookbook - PATTERN PARAMETRI

### REGOLA CRITICA: NO local_assigns

**VIETATO ASSOLUTO:** NON usare mai `local_assigns[:nome]` nei template ERB delle preview.

### PATTERN CORRETTO:

#### File component_preview.rb:

```ruby
def default(name: "campo", value: "", theme: :default, **params)
  normalized = normalize_params!(name: name, value: value, theme: theme, **params)
  render_with_template(locals: normalized)  # ← PASSAGGIO CORRETTO
end

def raw(name: "campo", value: "", theme: :default, **params)
  normalized = normalize_params!(name: name, value: value, theme: theme, **params)
  render ComponentName.new(**normalized)   # ← ISTANZIAZIONE DIRETTA
end
```

#### File default.html.erb:

```erb
<%= bui_component_name(
  name: name,           ← ACCESSO DIRETTO alla variabile locale
  value: value,         ← NO local_assigns[:value]
  theme: theme,
  classes: classes
) %>
```

#### File raw.html.erb:

```erb
<%= render ComponentName.new(
  name: name,           ← ACCESSO DIRETTO alla variabile locale  
  value: value,         ← NO local_assigns[:value]
  theme: theme,
  classes: classes
) %>
```

### MECCANISMO:

1. `render_with_template(locals: hash)` rende le chiavi dell'hash disponibili come variabili locali nei template
2. I template accedono direttamente a `name`, `value`, ecc. (NON a `local_assigns[:name]`)
3. Questo è il pattern consolidato in TUTTI i componenti esistenti

## 📝 Preview Lookbook - NUOVE REGOLE

**SOLO 2 file**: `default.html.erb` e `raw.html.erb`

### **default.html.erb:**
- UNA SOLA istanza del componente
- Richiamo tramite helper method (es. `bui_button`, `bui_input_text`)  
- SOLO valori di default del componente
- Le variazioni fornite tramite params di Lookbook, NON stampate visivamente

### **raw.html.erb:**
- UNA SOLA istanza del componente
- Richiamo con istanziazione diretta del componente
- SOLO valori di default del componente
- Nessuna variazione visiva

L'utente deve testare le variazioni tramite i controlli params di Lookbook, NON vedere tutte le varianti stampate a schermo.

## 🏗️ Sistema Helper - PATTERN OBBLIGATORIO

### Struttura File Helper Standard

#### File Principale (es. `app/helpers/better_ui/general/components/input/text.rb`)

```ruby
# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Input
        module Text
          include BetterUi::General::Components::Input::Text::TextHelper
        end
      end
    end
  end
end
```

#### File Helper Specifico (es. `app/helpers/better_ui/general/components/input/text/text_helper.rb`)

```ruby
# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Input
        module Text
          module TextHelper
            # Documentazione YARD COMPLETA obbligatoria
            def bui_input_text(name:, value: nil, **options)
              render ComponentClass.new(**options)
            end
          end
        end
      end
    end
  end
end
```

### Regole Helper System

#### NAMING OBBLIGATORIO:

- **File principale**: sempre `[nome].rb` con include del modulo specifico
- **File specifico**: sempre `[nome]/[nome]_helper.rb` con modulo `[Nome]Helper` 
- **Metodo helper**: sempre prefisso `bui_` + path completo (es. `bui_input_text`, `bui_input_checkbox`)
- **Moduli**: sempre namespace completo `BetterUi::Categoria::Components::Nome::[Nome]Helper`

#### PATTERN INCLUDE:

- **VIETATO**: `require_relative` con path relativo
- **VIETATO**: include di moduli senza namespace completo
- **OBBLIGATORIO**: `include BetterUi::General::Components::Input::Text::TextHelper` (namespace completo)

#### DOCUMENTAZIONE YARD OBBLIGATORIA:

- **@param** per OGNI parametro con tipo, descrizione, valori possibili
- **@return** con tipo di ritorno
- **@example** con almeno 5 esempi d'uso:
  - Uso base standalone
  - Con validazione e attributi
  - Con temi e dimensioni
  - Con attributi HTML aggiuntivi
  - Con Rails form builder (parametro `form:`)

#### SIGNATURE METODO STANDARD:

```ruby
def bui_component_name(name:, value: nil, required: false, disabled: false,
                       theme: :default, size: :medium, rounded: :medium, 
                       classes: '', form: nil, **options)
```

#### SUPPORT RAILS FORM BUILDER:

- **SEMPRE** includere parametro `form: nil`
- **SEMPRE** supportare `**options` per attributi HTML aggiuntivi
- **SEMPRE** documentare l'uso con form builder negli esempi

#### ISTANZIAZIONE COMPONENTE:

- **SEMPRE** passare tutti i parametri al componente
- **SEMPRE** usare `render ComponentClass.new(**params)`
- **MAI** logica business nell'helper, solo passaggio parametri

## 🚫 VIETATO: Metodi Condizionali per Classi CSS

**REGOLA CRITICA: MAI USARE METODI CONDIZIONALI PER SELEZIONE CLASSI CSS**

### ❌ VIETATO ASSOLUTO:

```ruby
def get_size_class
  case @size
  when :small then 'text-sm'
  when :medium then 'text-base'
  when :large then 'text-lg'
  end
end
```

### ✅ PATTERN OBBLIGATORIO:

```ruby
COMPONENT_SIZE_TEXT = {
  small: 'text-sm',
  medium: 'text-base',
  large: 'text-lg'
}.freeze

# Uso diretto: COMPONENT_SIZE_TEXT[@size]
```

## 🔴 VIETATO ASSOLUTO

- **Include di moduli helper nelle preview**
- **Metodi con case/when o if/else per selezione classi CSS**
- Logica condizionale per generare stringhe di classi Tailwind**
- File CSS, SCSS o stili custom
- CLI Rails generator per componenti
- Nomenclatura BEM
- Label dentro componenti input (usare Field component)
- Costanti senza prefisso specifico
- Componenti senza preview complete
- Helper senza documentazione YARD
- Più di 2 file preview
- Preview con multiple istanze del componente
- Variazioni visive nelle preview (usare params Lookbook)
- Metodi helper senza prefisso `bui_`
- Hardcodare classi senza costanti
- Preview senza note di utilizzo (`@notes`)
- **USO di `local_assigns` nei template ERB delle preview**
- **Template che non seguono il pattern di accesso diretto alle variabili locali**
- **Helper con `require_relative` o include parziali**
- **Helper senza namespace completo nei moduli**
- **Metodi helper senza documentazione YARD completa**
- **Helper senza supporto Rails form builder**
- **Preview senza raggruppamento `@!group/@!endgroup`**
- **Preview senza `@label` sui metodi**
- **Preview senza `@notes` complete**