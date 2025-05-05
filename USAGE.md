# Usage Guide

This guide provides detailed instructions on how to use Better UI components in your Rails applications.

## Table of Contents

- [Basic Concepts](#basic-concepts)
- [Incorporating Components](#incorporating-components)
- [Components with Blocks](#components-with-blocks)
- [Components with Slots](#components-with-slots)
- [Inline Customization](#inline-customization)
- [Event Handling](#event-handling)
- [Best Practices](#best-practices)

## Basic Concepts

Better UI uses [ViewComponent](https://viewcomponent.org/) to create reusable components. Each component is a Ruby class that inherits from `ViewComponent::Base` and has a corresponding template.

Components are organized into three categories:

- **General**: Basic components like buttons, badges, icons
- **Application**: Complex components like cards, alerts, sidebars
- **Website**: Components specifically designed for websites (in development)

## Incorporating Components

To incorporate a component in your views, use the `render` method with a new instance of the component:

```erb
<%= render BetterUi::General::ButtonComponent.new(label: 'Click me') %>
```

Each component accepts specific parameters to configure its behavior:

```erb
<%= render BetterUi::General::ButtonComponent.new(
  label: 'Save',
  variant: 'primary',
  size: 'large',
  icon_left: 'save',
  disabled: false,
  full_width: true
) %>
```

## Components with Blocks

Some components accept content blocks:

```erb
<%= render BetterUi::General::PanelComponent.new(title: 'User Details') do %>
  <p>This is the panel content.</p>
<% end %>
```

## Components with Slots

More complex components use "slots" to organize content into specific sections:

```erb
<%= render BetterUi::Application::CardComponent.new(title: 'Profile') do |card| %>
  <% card.with_body do %>
    <p>User profile information.</p>
  <% end %>
  
  <% card.with_footer do %>
    <%= render BetterUi::General::ButtonComponent.new(
      label: 'Edit',
      variant: 'primary'
    ) %>
  <% end %>
<% end %>
```

## Inline Customization

You can customize the appearance of components directly in the view using the `html` option:

```erb
<%= render BetterUi::General::ButtonComponent.new(
  label: 'Special Action',
  html: {
    class: 'mx-auto my-8 shadow-xl',
    data: { controller: 'analytics', action: 'click->analytics#track' }
  }
) %>
```

## Event Handling

For interactive components, you can use data attributes to integrate them with Stimulus or other JavaScript libraries:

```erb
<%= render BetterUi::General::ButtonComponent.new(
  label: 'Toggle Menu',
  data: {
    controller: 'menu',
    action: 'click->menu#toggle',
    menu_target: 'button'
  }
) %>
```

## Best Practices

1. **Consistency**: Maintain consistency in component usage throughout the application.

2. **Props vs HTML**: Prefer using specific component props over generic HTML attributes when possible.

3. **Composition**: Compose more complex components using simpler components.

4. **Separation**: Separate business logic from presentation. Use components for presentation, not for business logic.

5. **Reuse**: Create helpers or partials for recurring component usage patterns.

Example of a helper for common action components:

```ruby
# app/helpers/action_helper.rb
module ActionHelper
  def edit_button(url, options = {})
    render BetterUi::General::ButtonComponent.new(
      label: options[:label] || 'Edit',
      variant: options[:variant] || 'primary',
      size: options[:size] || 'medium',
      icon_left: 'pencil',
      href: url
    )
  end
  
  def delete_button(url, options = {})
    render BetterUi::General::ButtonComponent.new(
      label: options[:label] || 'Delete',
      variant: options[:variant] || 'danger',
      size: options[:size] || 'medium',
      icon_left: 'trash',
      data: {
        turbo_method: :delete,
        turbo_confirm: options[:confirm] || 'Are you sure?'
      }
    )
  end
end
```

Using the helper:

```erb
<%= edit_button(edit_user_path(@user)) %>
<%= delete_button(user_path(@user), confirm: 'Do you really want to delete this user?') %>
```

For more details on individual components, see the [components documentation](COMPONENTS.md). 