# BetterUI 🎨

[![Gem Version](https://badge.fury.io/rb/better_ui.svg)](https://badge.fury.io/rb/better_ui)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

> Elegant, consistent, and easily integrable UI components for your Rails applications

BetterUI is a Rails gem that provides reusable UI components with built-in documentation. Designed to be lightweight, customizable, and easy to use, it helps you build beautiful and consistent interfaces without JavaScript.

## ✨ Key Features

- **Pure Design** - Elegant, fully CSS UI components, no JavaScript
- **Easy Integration** - Mountable Rails engine that integrates seamlessly with your app
- **Built-in Documentation** - View examples and documentation directly in your browser
- **Highly Customizable** - Easily adapt the style to your brand
- **Modular Components** - Use only what you need
- **Component Previews** - View and interact with components using Lookbook

## 📦 Available Components

| Component | Description |
|------------|-------------|
| **Button** | Styled buttons with primary, secondary, success, danger variants |
| **Alert** | Informational, success, warning, and error messages |
| **Card** | Flexible containers with header, body, and footer |
| **Modal** | Modal dialog windows |
| **Tabs** | Tab navigation |
| **Navbar** | Responsive navigation bar with dropdown menu support |
| **Sidebar** | Side menu with hierarchical navigation support |
| **Toast** | Temporary notifications with timer and animations |
| **Header** | Page headers with title, subtitle, breadcrumb, and actions |
| **Badge** | Labels with support for icons, colors, and outline variants |
| **Spinner** | Loading indicators with various themes and sizes |
| **Avatar** | User avatars with support for images, initials, and online status |
| **Form Elements** | Styled input fields (coming soon) |

## 🚀 Installation

Add this line to your application's Gemfile:

```ruby
gem 'better_ui', '~> 0.1.0'
```

And then execute:

```bash
$ bundle install
```

## ⚙️ Configuration

### Mount the Engine

Add this to your `config/routes.rb` file:

```ruby
Rails.application.routes.draw do
  mount BetterUi::Engine => '/better_ui'
  
  # ... your other routes
end
```

### Include the Assets

In `app/assets/stylesheets/application.css`:

```css
/*
 *= require better_ui/application
 */
```

## 🎮 Usage

Once installed, you can start using the components:

```erb
<%# Button %>
<%= better_ui_button("Save", type: "primary") %>

<%# Alert %>
<%= better_ui_alert("Operation completed", type: "success") %>

<%# Card %>
<%= better_ui_card do %>
  <%= better_ui_card_header("Card Title") %>
  <%= better_ui_card_body do %>
    <p>Card content...</p>
  <% end %>
<% end %>

<%# Header with breadcrumb %>
<%= render BetterUi::Application::HeaderComponent.new(
  title: "Dashboard",
  subtitle: "Manage everything from here",
  breadcrumbs: [
    { text: "Home", url: "/" },
    { text: "Dashboard" }
  ],
  actions: [
    { content: button_html("New", "primary") }
  ]
) %>
```

Visit `/better_ui` in your application to see the complete documentation and examples.

### The Header Component

The Header component is designed to create complete page headers with numerous features:

```erb
<%= render BetterUi::Application::HeaderComponent.new(
  title: {
    text: "Settings",
    icon: "settings"
  },
  subtitle: "Configure system preferences",
  breadcrumbs: [
    { text: "Home", url: "/" },
    { text: "Admin", url: "/admin" },
    { text: "Settings" }
  ],
  variant: :modern,
  fixed: :top,
  show_breadcrumbs: true,
  actions: [
    { content: button_html("Save", "primary") },
    { content: button_html("Cancel", "secondary") }
  ]
) %>
```

The component supports:
- Title with optional integrated icon
- Descriptive subtitle
- Complete breadcrumbs with navigation links
- Contextual actions (buttons, menus, etc.)
- Style variants: modern, light, dark, primary, transparent
- Fixed positioning (top or bottom)
- Breadcrumb visibility control

### Component Previews with Lookbook

BetterUI integrates [Lookbook](https://github.com/allmarkedup/lookbook) to preview UI components:

1. Access `/better_ui/lookbook` in your application to view the component catalog
2. Explore available variants and configurations for each component
3. View source code and generated markup
4. Interact with components in real-time

Lookbook is only available in development and test environments.

## 🎨 Customization

### Generate a Custom Stylesheet

BetterUI includes a generator to create a base stylesheet for customizing components:

```bash
# Generate a stylesheet with the default "custom" prefix
rails generate better_ui:stylesheet

# Generate a stylesheet with a custom prefix
rails generate better_ui:stylesheet --prefix=my_theme
```

This will create:
1. A main SCSS file with imports for all components
2. Individual SCSS files for each component in the `app/assets/stylesheets/components/` directory
3. Special `*_overrides.scss` files for each component that allow you to override styles without modifying the original files

### Component Overrides System ✨

One of BetterUI's most powerful features is the automatic generation of override files:

```bash
# Generate override files for all components
rails generate better_ui:stylesheet
```

This creates special `*_overrides.scss` files that:
- Contain empty classes matching the original component files
- Allow for clean customization without modifying the original styles
- Support both standard and nested SCSS class structures
- Include helpful comments for easier modification

Example override file structure:
```scss
/* ==============================
 * Button Component Overrides
 * ==============================
 * This file contains empty classes to override default styles.
 * Add your customizations here.
 */

.bui-button-primary {
  // Override styles for .bui-button-primary here
}

.bui-button-secondary {
  // Override styles for .bui-button-secondary here
}

// Nested class overrides
.bui-button-with-icon {
  .bui-icon {
    // Override nested styles here
  }
}
```

### Use the Initializer

Create a `config/initializers/better_ui.rb` file:

```ruby
BetterUi.configure do |config|
  config.button_defaults = {
    class: 'rounded-lg text-sm'
  }
  
  config.alert_defaults = {
    dismissible: true
  }
end
```

### Customize Styles

Override CSS styles in your stylesheet:

```css
.better-ui-button-primary {
  background-color: #8b5cf6; /* Custom purple */
  border-color: #8b5cf6;
}
```

## 🛠 Development

BetterUI uses an integrated dummy app for development and testing. Here's how to get started:

### Initial Setup

```bash
# Clone the repository
git clone https://github.com/alessiobussolari/better_ui.git
cd better_ui

# Install dependencies
bin/setup
```

### Start the Test Application

To see components in action and work on documentation:

```bash
# Start the test server
cd test/dummy
bin/rails server

# Or from the main directory
bin/rails server -b 0.0.0.0
```

Visit `http://localhost:3000/better_ui` in your browser to see the documentation and test the components.

### Development Flow

1. **Create a branch**: `git checkout -b feature/new-component`
2. **Implement the component**: Add helpers in `app/helpers/better_ui/application_helper.rb`
3. **Add CSS**: Insert styles in `app/assets/stylesheets/better_ui/application.css`
4. **Document**: Create Markdown files in `docs/components/`
5. **Test**: Verify in the dummy app that everything works correctly
6. **Run tests**: `rake test`

### Build and Release

To build the gem locally:

```bash
bundle exec rake build
```

To install the development version:

```bash
bundle exec rake install
```

## 🤝 Contributing

Contributions are welcome and appreciated! Here's how you can help:

1. **Fork** the repository on GitHub
2. **Clone** your fork: `git clone https://github.com/YOUR-USERNAME/better_ui.git`
3. **Create** a branch for your feature: `git checkout -b feature/amazing-improvement`
4. **Commit** your changes: `git commit -am 'Add an amazing feature'`
5. **Push** to the branch: `git push origin feature/amazing-improvement`
6. Submit a **Pull Request**

### Guidelines

- Follow the existing code style
- Write tests for new features
- Update documentation
- Create components that work without JavaScript

## 📄 License

BetterUI is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

---

Made with ❤️ by [Alessio Bussolari](https://github.com/alessiobussolari)
