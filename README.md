# Better UI

[![Gem Version](https://badge.fury.io/rb/better_ui.svg)](https://badge.fury.io/rb/better_ui)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A comprehensive UI component library for Rails applications built with ViewComponent and Tailwind CSS, following BEM methodology.

![Better UI Components](https://via.placeholder.com/800x400?text=Better+UI+Components)

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
  - [Basic Installation](#basic-installation)
  - [Advanced Installation Options](#advanced-installation-options)
  - [Tailwind CSS Configuration](#tailwind-css-configuration)
- [Documentation](#documentation)
- [Usage](#usage)
- [Customization](#customization)
- [Components](#components)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)
- [Resources](#resources)

## Overview

Better UI is a Rails gem that provides a collection of reusable UI components built with ViewComponent and Tailwind CSS. It follows the BEM (Block Element Modifier) methodology to ensure consistent naming and styling conventions.

Key features:
- **Modern Sass Architecture**: Uses `@use` and `@forward` instead of deprecated `@import`
- **Modular Components**: Each component is isolated and can be used independently
- **Customizable**: Override components styles with your own customizations
- **Interactive Documentation**: Built-in documentation viewer with Lookbook
- **Responsive Design**: All components are responsive by default
- **Accessibility**: Components are designed with accessibility in mind

For more detailed information, see the [components documentation](COMPONENTS.md).

## Installation

### Basic Installation

1. Add the gem to your Gemfile:

```ruby
gem 'better_ui'
```

2. Run bundle install:

```bash
bundle install
```

3. Run the installer:

```bash
bin/rails generate better_ui:install
```

The installer will:
- Mount the Better UI engine at `/better_ui`
- Add the necessary assets to your application
- Create a configuration file at `config/initializers/better_ui.rb`
- Generate customizable stylesheets in `app/assets/stylesheets/components/`

### Advanced Installation Options

You can customize the installation process with the following options:

```bash
# Skip mounting the engine in routes
bin/rails generate better_ui:install --skip-routes

# Skip generating stylesheets
bin/rails generate better_ui:install --skip-stylesheets

# Skip creating the configuration file
bin/rails generate better_ui:install --skip-config

# All options together
bin/rails generate better_ui:install --skip-routes --skip-stylesheets --skip-config
```

### Tailwind CSS Configuration

Better UI requires Tailwind CSS to be properly configured in your application. If you haven't already set up Tailwind CSS, follow these steps:

1. Install Tailwind CSS in your Rails application:

```bash
bin/rails tailwindcss:install
```

2. Configure Tailwind to include Better UI's components:

In your `tailwind.config.js` file, add:

```javascript
module.exports = {
  content: [
    './app/views/**/*.{html,html.erb,erb}',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/components/**/*.{rb,html,html.erb,erb}',
    // Add this line for Better UI components
    './app/components/better_ui/**/*.{rb,html,html.erb,erb}'
  ],
  // other configurations...
}
```

For more detailed installation instructions, see [INSTALLATION.md](INSTALLATION.md).

## Documentation

After installation, you can access the interactive documentation at:

```
http://localhost:3000/better_ui
```

This provides:
- Interactive component previews
- Component API documentation
- Usage examples and code snippets
- Styling reference

## Usage

Using Better UI components in your views is straightforward:

```erb
<%# Basic button %>
<%= render BetterUi::General::ButtonComponent.new(label: 'Click me') %>

<%# Button with more options %>
<%= render BetterUi::General::ButtonComponent.new(
  label: 'Submit',
  variant: 'primary',
  size: 'large',
  icon_left: 'check',
  data: { turbo: false }
) %>

<%# Panel component %>
<%= render BetterUi::General::PanelComponent.new(title: 'User Details') do %>
  <p>This is the panel content</p>
<% end %>
```

For more detailed usage instructions, see [USAGE.md](USAGE.md).

## Customization

Better UI is designed to be highly customizable:

1. **Style Customization**: Edit the generated override files in `app/assets/stylesheets/components/`
2. **Component Configuration**: Configure default options in `config/initializers/better_ui.rb`
3. **Component Extensions**: Extend existing components or create your own

Example of customizing a component style:

```scss
// app/assets/stylesheets/components/_button_overrides.scss
@layer components {
  .bui-button {
    &--primary {
      @apply bg-indigo-600 hover:bg-indigo-700;
    }
  }
}
```

For more detailed customization instructions, see [CUSTOMIZATION.md](CUSTOMIZATION.md).

## Components

Better UI includes a wide range of components categorized into:

- **General Components**: Basic UI elements like buttons, badges, icons
- **Application Components**: Complex UI elements like cards, alerts, sidebars
- **Website Components**: Components specifically designed for websites

For a full list of available components and their documentation, see [COMPONENTS.md](COMPONENTS.md).

## Testing

Better UI components are thoroughly tested. You can run the test suite with:

```bash
bin/rails test
```

For more detailed testing instructions, see [TESTING.md](TESTING.md).

## Contributing

Contributions are welcome! Please check out our [contribution guidelines](CONTRIBUTING.md).

## License

Better UI is available as open source under the terms of the [MIT License](LICENSE).

## Resources

- [Troubleshooting Guide](TROUBLESHOOTING.md)
- [FAQs](FAQ.md)
- [Changelog](CHANGELOG.md)
- [Roadmap](ROADMAP.md)
