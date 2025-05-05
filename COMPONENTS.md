# Components Documentation

Better UI provides a comprehensive set of UI components organized into logical categories. This document provides an overview of all available components, their functionality, and basic usage patterns.

## Table of Contents

- [Component Categories](#component-categories)
- [General Components](#general-components)
  - [Button](#button)
  - [Badge](#badge)
  - [Avatar](#avatar)
  - [Heading](#heading)
  - [Icon](#icon)
  - [Link](#link)
  - [Spinner](#spinner)
  - [Table](#table)
  - [Panel](#panel)
  - [Breadcrumb](#breadcrumb)
- [Application Components](#application-components)
  - [Alert](#alert)
  - [Card](#card)
  - [Card Container](#card-container)
  - [Header](#header)
  - [Navbar](#navbar)
  - [Sidebar](#sidebar)
  - [Toast](#toast)
  - [Modal](#modal)
  - [Tabs](#tabs)
- [Website Components](#website-components)
- [Component Architecture](#component-architecture)
- [Extending Components](#extending-components)

## Component Categories

Better UI organizes components into three main categories:

1. **General Components**: Basic UI elements that can be used in any context. These components are the building blocks for more complex UI patterns.

2. **Application Components**: More complex UI elements typically used in application interfaces like dashboards, admin panels, and data-driven applications.

3. **Website Components**: Specialized components designed for marketing websites, landing pages, and content-focused interfaces.

## General Components

### Button

Buttons allow users to take actions and make choices with a single tap.

```erb
<%= render BetterUi::General::ButtonComponent.new(
  label: 'Click me',
  variant: 'primary',
  size: 'medium',
  icon_left: 'check',
  radius: 'medium',
  full_width: false,
  disabled: false
) %>
```

**Variants**: default, primary, secondary, danger, success, warning, info

**Sizes**: small, medium, large

**Radius Options**: none, small, medium, large, full

[Button Component Documentation](button.md)

### Badge

Badges are small elements that represent status, counts, or categories.

```erb
<%= render BetterUi::General::BadgeComponent.new(
  text: 'New',
  variant: 'red',
  size: 'medium',
  radius: 'full'
) %>
```

**Variants**: default, red, green, blue, yellow, orange, violet

**Sizes**: small, medium, large

[Badge Component Documentation](badge.md)

### Avatar

Avatars represent users, entities, or groups with images or initials.

```erb
<%= render BetterUi::General::AvatarComponent.new(
  src: 'https://example.com/avatar.jpg',
  alt: 'User Name',
  size: 'medium',
  variant: 'circle',
  status: 'online'
) %>
```

**Sizes**: xs, sm, md, lg, xl

**Variants**: circle, square

**Status**: online, offline, busy, away

[Avatar Component Documentation](avatar.md)

### Heading

Headings provide structure and hierarchy to your content.

```erb
<%= render BetterUi::General::HeadingComponent.new(
  text: 'Page Title',
  level: 1,
  size: 'large'
) %>
```

**Levels**: 1-6 (corresponds to h1-h6)

**Sizes**: small, medium, large, xl, 2xl, 3xl

[Heading Component Documentation](heading.md)

### Icon

Icons enhance visual communication and interface density.

```erb
<%= render BetterUi::General::IconComponent.new(
  name: 'check',
  size: 'medium',
  variant: 'default'
) %>
```

**Sizes**: small, medium, large

**Variants**: default, primary, secondary, success, danger, warning, info

[Icon Component Documentation](icon.md)

### Link

Links allow users to navigate between pages or sections.

```erb
<%= render BetterUi::General::LinkComponent.new(
  text: 'Read more',
  href: '/articles/1',
  variant: 'default',
  icon_right: 'arrow-right'
) %>
```

**Variants**: default, primary, secondary, danger, success, warning, info

[Link Component Documentation](link.md)

### Spinner

Spinners indicate loading states and processes.

```erb
<%= render BetterUi::General::SpinnerComponent.new(
  size: 'medium',
  variant: 'primary',
  label: 'Loading...',
  show_label: true
) %>
```

**Sizes**: small, medium, large

**Variants**: default, primary, secondary, success, danger, warning, info

[Spinner Component Documentation](spinner.md)

### Table

Tables organize and display structured data.

```erb
<%= render BetterUi::General::TableComponent.new(
  headers: ['Name', 'Email', 'Role'],
  rows: @users.map { |user| [user.name, user.email, user.role] },
  striped: true,
  bordered: true,
  hover: true
) %>
```

**Options**: striped, bordered, hover, responsive, compact

[Table Component Documentation](table.md)

### Panel

Panels group related content and controls.

```erb
<%= render BetterUi::General::PanelComponent.new(
  title: 'User Information',
  variant: 'default',
  footer: true
) do |panel| %>
  <% panel.with_body do %>
    <!-- Panel content here -->
  <% end %>
  
  <% panel.with_footer do %>
    <!-- Footer content here -->
  <% end %>
<% end %>
```

**Variants**: default, primary, secondary, info, success, warning, danger

[Panel Component Documentation](panel.md)

### Breadcrumb

Breadcrumbs provide hierarchical navigation context.

```erb
<%= render BetterUi::General::BreadcrumbComponent.new(
  items: [
    { text: 'Home', href: '/' },
    { text: 'Products', href: '/products' },
    { text: 'Product Name', href: nil }
  ],
  separator: '/'
) %>
```

[Breadcrumb Component Documentation](breadcrumb.md)

## Application Components

### Alert

Alerts provide feedback, warnings, or important information to users.

```erb
<%= render BetterUi::Application::AlertComponent.new(
  title: 'Success!',
  message: 'Your changes have been saved.',
  variant: 'success',
  dismissible: true,
  icon: 'check-circle'
) %>
```

**Variants**: info, success, warning, error

[Alert Component Documentation](alert.md)

### Card

Cards contain content and actions related to a single subject.

```erb
<%= render BetterUi::Application::CardComponent.new(
  title: 'Card Title',
  variant: 'default',
  footer: true
) do |card| %>
  <% card.with_body do %>
    <!-- Card content here -->
  <% end %>
  
  <% card.with_footer do %>
    <!-- Footer content here -->
  <% end %>
<% end %>
```

**Variants**: default, primary, secondary, outlined, elevated

[Card Component Documentation](card.md)

### Card Container

Card containers organize multiple cards in a grid layout.

```erb
<%= render BetterUi::Application::CardContainerComponent.new(
  columns: { default: 1, sm: 2, md: 3, lg: 4 },
  gap: 'medium'
) do %>
  <!-- Cards go here -->
<% end %>
```

**Column Options**: default (1-12), sm (1-12), md (1-12), lg (1-12), xl (1-12)

**Gap Options**: small, medium, large

[Card Container Documentation](card-container.md)

### Header

Headers provide consistent navigation and branding for your application.

```erb
<%= render BetterUi::Application::HeaderComponent.new(
  title: 'Application Name',
  logo_path: '/images/logo.svg',
  user: current_user,
  navigation: [
    { text: 'Dashboard', href: '/dashboard', active: true },
    { text: 'Users', href: '/users' },
    { text: 'Settings', href: '/settings' }
  ]
) %>
```

[Header Component Documentation](header.md)

### Navbar

Navbars provide application-wide navigation and actions.

```erb
<%= render BetterUi::Application::NavbarComponent.new(
  title: 'Application Name',
  logo_path: '/images/logo.svg',
  items: [
    { text: 'Dashboard', href: '/dashboard', active: true },
    { text: 'Users', href: '/users' },
    { text: 'Settings', href: '/settings' }
  ],
  right_items: [
    { icon: 'bell', href: '/notifications' },
    { icon: 'user', href: '/profile' }
  ]
) %>
```

[Navbar Component Documentation](navbar.md)

### Sidebar

Sidebars provide persistent vertical navigation.

```erb
<%= render BetterUi::Application::SidebarComponent.new(
  title: 'Application Name',
  logo_path: '/images/logo.svg',
  items: [
    { 
      text: 'Dashboard', 
      href: '/dashboard', 
      icon: 'home', 
      active: true 
    },
    {
      text: 'Users',
      href: '/users',
      icon: 'users',
      sub_items: [
        { text: 'All Users', href: '/users' },
        { text: 'Add User', href: '/users/new' }
      ]
    }
  ]
) %>
```

[Sidebar Component Documentation](sidebar.md)

### Toast

Toasts provide brief, temporary notifications.

```erb
<%= render BetterUi::Application::ToastComponent.new(
  title: 'Success!',
  message: 'Your changes have been saved.',
  variant: 'success',
  autoclose: true,
  timeout: 5000
) %>
```

**Variants**: info, success, warning, error

[Toast Component Documentation](toast.md)

### Modal

Modals present focused content or workflows that require user attention.

```erb
<%= render BetterUi::Application::ModalComponent.new(
  id: 'confirm-modal',
  title: 'Confirm Action',
  size: 'medium'
) do |modal| %>
  <% modal.with_body do %>
    <p>Are you sure you want to continue?</p>
  <% end %>
  
  <% modal.with_footer do %>
    <%= render BetterUi::General::ButtonComponent.new(
      label: 'Cancel',
      variant: 'secondary',
      data: { action: 'modal#close' }
    ) %>
    
    <%= render BetterUi::General::ButtonComponent.new(
      label: 'Confirm',
      variant: 'primary'
    ) %>
  <% end %>
<% end %>
```

**Sizes**: small, medium, large, xl, full

[Modal Component Documentation](modal.md)

### Tabs

Tabs organize content into separate, selectable views.

```erb
<%= render BetterUi::Application::TabsComponent.new(
  id: 'user-tabs',
  tabs: [
    { id: 'profile', title: 'Profile', active: true },
    { id: 'settings', title: 'Settings' },
    { id: 'billing', title: 'Billing' }
  ],
  variant: 'default'
) do |tabs| %>
  <% tabs.with_panel(id: 'profile') do %>
    <!-- Profile content -->
  <% end %>
  
  <% tabs.with_panel(id: 'settings') do %>
    <!-- Settings content -->
  <% end %>
  
  <% tabs.with_panel(id: 'billing') do %>
    <!-- Billing content -->
  <% end %>
<% end %>
```

**Variants**: default, underline, pills, boxed

[Tabs Component Documentation](tabs.md)

## Website Components

The Website component category is currently under development. Check back for updates on available components.

## Component Architecture

Better UI components follow a consistent architecture:

1. **ViewComponent**: Each component is a Ruby class inheriting from ViewComponent::Base
2. **BEM Styling**: Components use BEM methodology for CSS class naming
3. **Slot API**: Complex components use slots for structured content
4. **Tailwind Integration**: Components leverage Tailwind CSS for styling
5. **Accessibility**: ARIA attributes and keyboard navigation are built-in

## Extending Components

You can extend Better UI components in your application:

```ruby
module MyApp
  class EnhancedButtonComponent < BetterUi::General::ButtonComponent
    def initialize(analytics_id: nil, **options)
      @analytics_id = analytics_id
      super(**options)
    end

    def call
      content_tag :button, **html_attributes do
        render_content
      end
    end

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

For detailed information on extending components, see [CUSTOMIZATION.md](CUSTOMIZATION.md). 