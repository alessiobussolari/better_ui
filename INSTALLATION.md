# Installation Guide

This guide provides detailed instructions for installing and configuring Better UI in your Rails application.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Basic Installation](#basic-installation)
- [Manual Installation](#manual-installation)
- [Configuration](#configuration)
- [Integrating with Existing Projects](#integrating-with-existing-projects)
- [Troubleshooting Installation Issues](#troubleshooting-installation-issues)

## Prerequisites

Before installing Better UI, ensure your system meets the following requirements:

- Ruby >= 3.0
- Rails >= 7.0
- Node.js >= 14.0 (for Tailwind CSS)
- Tailwind CSS 3.x

## Basic Installation

The easiest way to install Better UI is using the provided generator:

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

This installation process will:

- Mount the Better UI engine at `/better_ui`
- Add the necessary assets to your application
- Create a configuration file at `config/initializers/better_ui.rb`
- Generate customizable stylesheets in `app/assets/stylesheets/components/`

## Manual Installation

If you prefer a more hands-on approach, you can install Better UI manually:

1. Add the gem to your Gemfile and run `bundle install`

2. Mount the engine in your routes:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  mount BetterUi::Engine => '/better_ui'
  # your other routes...
end
```

3. Add the CSS to your application:

```ruby
# For .css files with Sprockets:
# app/assets/stylesheets/application.css
/*
 *= require better_ui/application
 */

# For .scss files with modern Sass:
# app/assets/stylesheets/application.scss
@use 'better_ui/application';
```

4. Create the initializer:

```ruby
# config/initializers/better_ui.rb
BetterUi.configure do |config|
  # Default button configurations
  config.button_defaults = {
    variant: 'default',
    size: 'medium',
    radius: 'medium'
  }
  
  # Default alert configurations
  config.alert_defaults = {
    variant: 'info',
    dismissible: true
  }
  
  # Default card configurations
  config.card_defaults = {
    variant: 'default',
    padding: 'medium'
  }
  
  # Default tabs configurations
  config.tabs_defaults = {
    variant: 'default',
    size: 'medium'
  }
end
```

5. Generate stylesheets manually:

```bash
bin/rails generate better_ui:stylesheet
```

## Configuration

### Global Component Defaults

You can configure default options for components in `config/initializers/better_ui.rb`:

```ruby
BetterUi.configure do |config|
  # Button configuration
  config.button_defaults = {
    variant: 'primary',     # Changes the default variant for all buttons
    size: 'medium',         # Sets the default size
    radius: 'medium',       # Sets the default corner radius
    icon_position: 'left'   # Sets the default icon position
  }
  
  # More component configurations...
end
```

### Tailwind CSS Configuration

Better UI requires Tailwind CSS to work properly. Here's how to configure it:

1. Make sure Tailwind CSS is installed:

```bash
bin/rails tailwindcss:install
```

2. Configure Tailwind to include Better UI components:

```javascript
// tailwind.config.js
module.exports = {
  content: [
    './app/views/**/*.{html,html.erb,erb}',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/components/**/*.{rb,html,html.erb,erb}',
    // Add this line for Better UI components
    './app/components/better_ui/**/*.{rb,html,html.erb,erb}'
  ],
  theme: {
    extend: {
      // Your theme customizations
    },
  },
  plugins: [
    // Your Tailwind plugins
  ],
}
```

## Integrating with Existing Projects

### With Existing ViewComponent Setup

If your project already uses ViewComponent, integrating Better UI is straightforward:

1. Follow the standard installation steps
2. Ensure no naming conflicts with existing components
3. Check for CSS class naming conflicts with existing styles

### With Existing Tailwind Setup

If your project already uses Tailwind CSS:

1. Make sure your Tailwind configuration includes Better UI components paths
2. Verify there are no conflicts in your theme customizations
3. Check that the Tailwind plugin requirements don't conflict

### With Import Maps (Rails 7+)

For Rails 7+ projects using import maps:

```ruby
# config/importmap.rb
pin "better_ui", to: "better_ui/application.js"
```

## Troubleshooting Installation Issues

### Missing Assets

If you get errors about missing assets:

1. Ensure the gem is properly installed: `bundle show better_ui`
2. Check asset paths in your configuration
3. Try clearing cache: `bin/rails tmp:clear`
4. Restart your server

### Styling Issues

If components don't look right:

1. Verify Tailwind CSS is properly installed and configured
2. Check that Better UI styles are loaded after Tailwind
3. Inspect the CSS to ensure there are no conflicts

### Engine Mount Problems

If accessing `/better_ui` gives a routing error:

1. Check your routes file to ensure the engine is mounted
2. Run `bin/rails routes | grep better_ui` to verify the routes exist
3. Restart your server

For more troubleshooting help, see the [Troubleshooting Guide](TROUBLESHOOTING.md). 