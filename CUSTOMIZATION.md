# Customization Guide

Better UI is designed to be highly customizable to fit your application's design language. This guide explains how to customize components through styles, configuration, and component extension.

## Table of Contents

- [Style Customization](#style-customization)
  - [Using Override Files](#using-override-files)
  - [BEM Methodology](#bem-methodology)
  - [Tailwind Integration](#tailwind-integration)
  - [Custom Themes](#custom-themes)
- [Component Configuration](#component-configuration)
  - [Global Defaults](#global-defaults)
  - [Per-Component Configuration](#per-component-configuration)
- [Component Extension](#component-extension)
  - [Extending Existing Components](#extending-existing-components)
  - [Creating Composite Components](#creating-composite-components)
  - [Implementing Behaviors](#implementing-behaviors)
- [Advanced Customization](#advanced-customization)
  - [Creating Custom Variants](#creating-custom-variants)
  - [Adding New Components](#adding-new-components)
  - [Integrating with Other Libraries](#integrating-with-other-libraries)

## Style Customization

### Using Override Files

Better UI generates override files for each component in your application's `app/assets/stylesheets/components/` directory. These files follow the naming convention `_component_name_overrides.scss`.

To customize a component's appearance:

1. Locate the appropriate override file (e.g., `_button_overrides.scss`)
2. Add your customizations following the BEM structure
3. Maintain the existing class hierarchy

Example of customizing the button component:

```scss
// app/assets/stylesheets/components/_button_overrides.scss
@layer components {
  .bui-button {
    // Base button customizations
    @apply transition-all duration-300;
    
    // Customizing variants
    &--primary {
      @apply bg-indigo-600 hover:bg-indigo-700;
    }
    
    &--secondary {
      @apply bg-gray-200 text-gray-800 hover:bg-gray-300;
    }
    
    // Customizing sizes
    &--small {
      @apply text-xs px-2 py-1;
    }
    
    // Adding new variants
    &--gradient {
      @apply bg-gradient-to-r from-purple-500 to-pink-500 hover:from-purple-600 hover:to-pink-600;
    }
  }
}
```

### BEM Methodology

Better UI uses the BEM (Block Element Modifier) methodology for CSS class naming:

- **Block**: Main component (e.g., `.bui-button`)
- **Element**: Component part (e.g., `.bui-button__icon`)
- **Modifier**: Variation or state (e.g., `.bui-button--primary`)

When customizing styles, maintain this structure:

```scss
.bui-button { /* Block */ }
.bui-button__icon { /* Element */ }
.bui-button--primary { /* Modifier */ }
.bui-button__icon--left { /* Element with modifier */ }
```

### Tailwind Integration

Better UI leverages Tailwind CSS utilities via `@apply` directives. You can use these in your overrides:

```scss
.bui-button {
  @apply shadow-md;
  
  &:focus {
    @apply ring-2 ring-offset-2 ring-indigo-500;
  }
  
  &--primary {
    @apply bg-gradient-to-r from-blue-500 to-indigo-600;
  }
}
```

### Custom Themes

For larger applications, you might want to create custom themes:

1. Create a theme directory structure:

```
app/assets/stylesheets/
├── themes/
│   ├── _default.scss
│   ├── _dark.scss
│   └── _company_brand.scss
└── components/
    └── _button_overrides.scss
```

2. Define theme variables and use them in your overrides:

```scss
// themes/_company_brand.scss
$primary-color: #ff5500;
$secondary-color: #002244;
$success-color: #00aa55;

// _button_overrides.scss
@use '../themes/company_brand' as theme;

.bui-button {
  &--primary {
    background-color: theme.$primary-color;
  }
}
```

## Component Configuration

### Global Defaults

Configure default options for all component instances in `config/initializers/better_ui.rb`:

```ruby
BetterUi.configure do |config|
  # Button configuration
  config.button_defaults = {
    variant: 'primary',     # Default variant for all buttons
    size: 'medium',         # Default size
    radius: 'medium',       # Default corner radius
    icon_position: 'left'   # Default icon position
  }
  
  # Alert configuration
  config.alert_defaults = {
    variant: 'info',
    dismissible: true,
    timeout: 5000
  }
  
  # Card configuration
  config.card_defaults = {
    variant: 'default',
    padding: 'medium'
  }
end
```

### Per-Component Configuration

Each component accepts parameters to configure individual instances:

```erb
<%= render BetterUi::General::ButtonComponent.new(
  label: 'Submit',
  variant: 'success',    # Overrides the default variant
  size: 'large',         # Overrides the default size
  icon_left: 'check',    # Adds an icon
  full_width: true,      # Makes button full width
  data: {
    controller: 'form',
    action: 'form#submit'
  }
) %>
```

## Component Extension

### Extending Existing Components

You can extend Better UI components to add functionality:

```ruby
# app/components/my_app/enhanced_button_component.rb
module MyApp
  class EnhancedButtonComponent < BetterUi::General::ButtonComponent
    def initialize(analytics_id: nil, **options)
      @analytics_id = analytics_id
      super(**options)
    end

    # Override the html_attributes method to add custom attributes
    def html_attributes
      super.merge({
        data: { 
          analytics_id: @analytics_id,
          **(super.dig(:data) || {})
        }
      })
    end
  end
end
```

Then use your extended component:

```erb
<%= render MyApp::EnhancedButtonComponent.new(
  label: 'Click me',
  analytics_id: 'homepage_cta'
) %>
```

### Creating Composite Components

Create custom components composed of Better UI components:

```ruby
# app/components/my_app/search_bar_component.rb
module MyApp
  class SearchBarComponent < ViewComponent::Base
    def initialize(placeholder: 'Search...', button_text: 'Search')
      @placeholder = placeholder
      @button_text = button_text
    end
  end
end
```

```erb
<%# app/components/my_app/search_bar_component.html.erb %>
<div class="flex rounded-md shadow-sm">
  <input type="text" placeholder="<%= @placeholder %>" 
         class="flex-1 rounded-l-md border-gray-300 focus:border-indigo-500 focus:ring-indigo-500">
  
  <%= render BetterUi::General::ButtonComponent.new(
    label: @button_text,
    variant: 'primary',
    icon_right: 'search',
    html: { class: 'rounded-l-none' }
  ) %>
</div>
```

### Implementing Behaviors

You can implement custom behaviors using Stimulus controllers:

```ruby
# app/components/my_app/collapsible_panel_component.rb
module MyApp
  class CollapsiblePanelComponent < BetterUi::General::PanelComponent
    def html_attributes
      super.merge({
        data: {
          controller: 'collapsible',
          **(super.dig(:data) || {})
        }
      })
    end
  end
end
```

```js
// app/javascript/controllers/collapsible_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"]
  
  toggle() {
    this.contentTarget.classList.toggle("hidden")
  }
}
```

## Advanced Customization

### Creating Custom Variants

Add new variants to components:

```scss
// _button_overrides.scss
.bui-button {
  // Custom variant
  &--glass {
    @apply bg-white opacity-20 backdrop-blur-lg 
           border border-white border-opacity-20
           text-white shadow-lg;
  }
  
  // Custom state modifier
  &--loading {
    @apply opacity-80 cursor-wait;
  }
}
```

Then extend the component to support the new variant:

```ruby
module MyApp
  class EnhancedButtonComponent < BetterUi::General::ButtonComponent
    def initialize(variant: 'default', loading: false, **options)
      @loading = loading
      
      # Allow custom variant
      super(variant: variant, **options)
    end
    
    def classes
      result = super
      result += " bui-button--loading" if @loading
      result
    end
    
    def render?
      # Add validation for custom variants
      valid_variants = %w[default primary secondary success warning danger info glass]
      raise ArgumentError, "Invalid variant: #{@variant}" unless valid_variants.include?(@variant)
      
      true
    end
  end
end
```

### Adding New Components

Create entirely new components following the Better UI conventions:

```ruby
# app/components/my_app/tag_component.rb
module MyApp
  class TagComponent < ViewComponent::Base
    attr_reader :text, :variant, :size, :dismissible
    
    def initialize(text:, variant: 'default', size: 'medium', dismissible: false)
      @text = text
      @variant = variant
      @size = size
      @dismissible = dismissible
    end
    
    def classes
      [
        'bui-tag',
        "bui-tag--#{@variant}",
        "bui-tag--#{@size}",
        @dismissible ? 'bui-tag--dismissible' : nil
      ].compact.join(' ')
    end
  end
end
```

```erb
<%# app/components/my_app/tag_component.html.erb %>
<span class="<%= classes %>">
  <%= text %>
  
  <% if dismissible %>
    <button type="button" class="bui-tag__dismiss">
      <%= render BetterUi::General::IconComponent.new(name: 'x', size: 'small') %>
    </button>
  <% end %>
</span>
```

Then add corresponding styles:

```scss
// app/assets/stylesheets/components/_tag.scss
@layer components {
  .bui-tag {
    @apply inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-medium;
    
    &--default {
      @apply bg-gray-100 text-gray-800;
    }
    
    &--blue {
      @apply bg-blue-100 text-blue-800;
    }
    
    // More variants...
    
    &--small {
      @apply text-xs px-2 py-0.5;
    }
    
    &--medium {
      @apply text-sm px-3 py-1;
    }
    
    &__dismiss {
      @apply ml-1.5 -mr-1 h-4 w-4 rounded-full inline-flex items-center justify-center 
             text-gray-400 hover:bg-gray-200 hover:text-gray-500 focus:outline-none;
    }
  }
}
```

### Integrating with Other Libraries

Better UI can be integrated with other libraries:

```ruby
# app/components/my_app/select2_component.rb
module MyApp
  class Select2Component < ViewComponent::Base
    attr_reader :options, :selected, :name, :placeholder
    
    def initialize(options:, selected: nil, name:, placeholder: 'Select an option')
      @options = options
      @selected = selected
      @name = name
      @placeholder = placeholder
    end
    
    def html_attributes
      {
        class: 'bui-select',
        data: {
          controller: 'select2',
          placeholder: @placeholder
        }
      }
    end
  end
end
```

```erb
<%# app/components/my_app/select2_component.html.erb %>
<select name="<%= name %>" <%= tag.attributes(html_attributes) %>>
  <option></option>
  <% options.each do |option| %>
    <option value="<%= option[:value] %>" <%= 'selected' if option[:value] == selected %>>
      <%= option[:text] %>
    </option>
  <% end %>
</select>
```

```js
// app/javascript/controllers/select2_controller.js
import { Controller } from "@hotwired/stimulus"
import Select2 from "select2"

export default class extends Controller {
  connect() {
    $(this.element).select2({
      placeholder: this.element.dataset.placeholder,
      theme: "better-ui"
    })
  }
  
  disconnect() {
    $(this.element).select2('destroy')
  }
}
```

For more examples and detailed component documentation, see the [Components Guide](COMPONENTS.md). 