# BetterUI

Elegant and reusable UI components for Rails with integrated documentation. BetterUI is a Rails gem that works as a mountable engine containing reusable UI components, built with ViewComponent and Tailwind CSS, following the BEM methodology.

## Features

- 🎨 **Beautiful Components**: Pre-built UI components with Tailwind CSS styling
- 📖 **Interactive Documentation**: Integrated Lookbook previews for all components
- 🔧 **Highly Customizable**: Flexible configuration options for each component
- 🚀 **Production Ready**: Battle-tested components following best practices
- 📱 **Responsive**: All components are mobile-first and responsive
- ♿ **Accessible**: Built with accessibility in mind

## Components Available

### General Components

- **Alert**: Notification and alert messages
- **Avatar**: User profile pictures and placeholders
- **Badge**: Small status indicators and labels
- **Breadcrumb**: Navigation breadcrumbs
- **Button**: Interactive buttons with multiple variants
- **Card**: Content containers and panels
- **Divider**: Visual separators
- **Heading**: Consistent typography headings
- **Icon**: FontAwesome icon components
- **Link**: Styled navigation links
- **Panel**: Content panels and containers
- **Progress**: Progress bars and indicators
- **Table**: Data tables with sorting and styling
- **Tag**: Content tags and labels
- **Tooltip**: Contextual help tooltips

## Installation

Add this line to your application's Gemfile:

```ruby
gem "better_ui"
```

For development with Lookbook documentation:

```ruby
gem "better_ui"
gem "lookbook", group: :development
```

And then execute:

```bash
$ bundle install
```

## Setup

### 1. Mount the Engine (Optional)

If you want to access BetterUI's internal routes, mount the engine in your `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  mount BetterUi::Engine => "/better_ui"
  # your other routes...
end
```

### 2. Setup Lookbook (Recommended for Development)

To access the interactive component documentation during development, mount Lookbook in your `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  # Mount Lookbook only in development
  mount Lookbook::Engine => "/lookbook" if Rails.env.development?

  # your other routes...
end
```

**That's it!** BetterUI components and their previews are automatically available in Lookbook.

### 3. Include Tailwind CSS

Make sure your application includes Tailwind CSS, as BetterUI components rely on Tailwind classes. If you don't have Tailwind CSS installed, follow the [official Tailwind CSS installation guide](https://tailwindcss.com/docs/guides/ruby-on-rails).

## Usage

### Basic Component Usage

```erb
<!-- Using the Button component -->
<%= render BetterUi::General::Button::Component.new(
  label: "Click me",
  type: :blue,
  size: :large
) %>

<!-- Using the Alert component -->
<%= render BetterUi::General::Alert::Component.new(
  message: "Success! Your changes have been saved.",
  type: :success,
  dismissible: true
) %>

<!-- Using the Badge component -->
<%= render BetterUi::General::Badge::Component.new(
  label: "New",
  variant: :success,
  size: :small
) %>
```

### Using with Content Blocks

```erb
<!-- Button with custom content -->
<%= render BetterUi::General::Button::Component.new(type: :blue) do %>
  <i class="fas fa-download"></i>
  Download File
<% end %>

<!-- Card with content -->
<%= render BetterUi::General::Card::Component.new(
  title: "Card Title",
  shadow: :medium
) do %>
  <p>Your card content goes here...</p>
<% end %>
```

### Component Parameters

Each component supports various parameters for customization. Common parameters include:

- **type/variant**: Visual style (e.g., `:primary`, `:secondary`, `:success`, `:danger`)
- **size**: Component size (e.g., `:small`, `:medium`, `:large`)
- **classes**: Additional CSS classes
- **html_options**: Any additional HTML attributes

## Lookbook Documentation

Once you have Lookbook mounted, visit `http://localhost:3000/lookbook` in your development environment to:

- 📖 Browse all available components
- 🎛️ Interactive parameter testing
- 👀 Live preview of components
- 📋 Copy code examples
- 🎨 Experiment with different configurations

The Lookbook interface provides:

1. **Component Gallery**: Visual overview of all components
2. **Interactive Controls**: Real-time parameter adjustment
3. **Code Examples**: Copy-paste ready code snippets
4. **Documentation**: Detailed usage instructions

## Development

### Adding Custom Previews

While BetterUI components come with built-in Lookbook previews, you can add your own custom previews in your application:

```ruby
# spec/components/previews/my_custom_preview.rb
class MyCustomPreview < Lookbook::Preview
  def default
    render BetterUi::General::Button::Component.new(
      label: "My Custom Button",
      type: :purple
    )
  end
end
```

### Customizing Components

You can create wrapper components or extend existing ones:

```ruby
# app/components/my_button_component.rb
class MyButtonComponent < BetterUi::General::Button::Component
  def initialize(label:, **options)
    super(label: label, type: :blue, **options)
  end
end
```

## Styling and Customization

BetterUI components use Tailwind CSS classes. You can:

1. **Override classes**: Pass custom classes via the `classes` parameter
2. **Extend components**: Create your own components that inherit from BetterUI
3. **Theme customization**: Modify Tailwind configuration for consistent theming

```erb
<!-- Add custom classes -->
<%= render BetterUi::General::Button::Component.new(
  label: "Custom Button",
  classes: "my-custom-class hover:scale-105"
) %>
```

## Browser Support

BetterUI components support all modern browsers that support:

- CSS Grid and Flexbox
- ES6+ JavaScript features
- Tailwind CSS

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-component`)
3. Add your component with tests and Lookbook previews
4. Commit your changes (`git commit -am 'Add amazing component'`)
5. Push to the branch (`git push origin feature/amazing-component`)
6. Create a Pull Request

### Development Setup

```bash
git clone https://github.com/alessiobussolari/better_ui.git
cd better_ui
bundle install
cd test/dummy
bundle exec rails server
```

Visit `http://localhost:3000/lookbook` to see the component documentation.

## Roadmap

- 🎯 Form components (inputs, selects, checkboxes)
- 📊 Chart and data visualization components
- 🎭 Animation and transition components
- 🌙 Dark mode support
- 📱 Mobile-specific components

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Support

- 📖 [Documentation](https://github.com/alessiobussolari/better_ui)
- 🐛 [Issue Tracker](https://github.com/alessiobussolari/better_ui/issues)
- 💬 [Discussions](https://github.com/alessiobussolari/better_ui/discussions)

---

Built with ❤️ by [PanDev](https://github.com/alessiobussolari)
