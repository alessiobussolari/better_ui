# BetterUI

Elegant and reusable UI components for Rails with integrated documentation. BetterUI is a Rails gem that works as a mountable engine containing reusable UI components, built with ViewComponent and Tailwind CSS, following the BEM methodology.

A comprehensive UI component library for Rails applications built with ViewComponent and Tailwind CSS. Features 24+ components with a unified design system and interactive documentation.

- 🎨 **Beautiful Components**: Pre-built UI components with Tailwind CSS styling
- 📖 **Interactive Documentation**: Integrated Lookbook previews for all components
- 🔧 **Highly Customizable**: Flexible configuration options for each component
- 🚀 **Production Ready**: Battle-tested components following best practices
- 📱 **Responsive**: All components are mobile-first and responsive
- ♿ **Accessible**: Built with accessibility in mind

## Components Available

### General Components

## Overview

Better UI is a Rails gem that provides a collection of reusable UI components built with ViewComponent and Tailwind CSS. It features a unified design system with consistent theming and comprehensive form handling capabilities.

Key features:

- **TailwindCSS Only**: Pure Tailwind approach with no custom CSS/SCSS files
- **24+ Components**: Comprehensive component library organized by purpose
- **Unified Input System**: Single text component handles 14+ input types (text, email, password, number, date, time, etc.)
- **Interactive Documentation**: Built-in Lookbook integration with live previews
- **Helper System**: Rails-friendly helpers with form builder integration
- **Consistent Theming**: 9 standard themes (default, white, red, rose, orange, green, blue, yellow, violet)
- **Flexible Sizing**: 3 standard sizes (small, medium, large) with 5 border radius options
- **Accessibility**: Components designed with accessibility best practices

For more detailed information, see the [components documentation](COMPONENTS.md).

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

Better UI components can be used in two ways: direct instantiation or helper methods.

### Helper Methods (Recommended)

```erb
<%# Text input with validation %>
<%= bui_input_text(
  name: 'email',
  value: @user.email,
  type: :email,
  theme: :blue,
  size: :large,
  required: true
) %>

<%# Button with theme and size %>
<%= bui_button(
  'Submit Form',
  theme: :green,
  size: :large,
  type: :submit
) %>

<%# Card with content block %>
<%= bui_card(title: 'User Profile', theme: :white) do %>
  <p>User information content here</p>
<% end %>

<%# Form integration %>
<%= form_with model: @user do |form| %>
  <%= bui_input_text(name: 'name', form: form, required: true) %>
  <%= bui_input_text(name: 'email', type: :email, form: form) %>
  <%= bui_button('Save', type: :submit, theme: :blue) %>
<% end %>
```

### Direct Instantiation

```erb
<%# Direct component rendering %>
<%= render BetterUi::General::Input::Text::Component.new(
  name: 'username',
  type: :text,
  theme: :default,
  size: :medium
) %>

<%# Button component %>
<%= render BetterUi::General::Button::Component.new(
  'Click me',
  theme: :blue,
  size: :large
) %>
```

### Component Parameters

Each component supports various parameters for customization. Common parameters include:

Better UI is designed to be highly customizable while maintaining consistency:

1. **Theme Customization**: Modify component constants to change default styling
2. **Component Configuration**: Configure default options in `config/initializers/better_ui.rb`
3. **TailwindCSS Integration**: All styling uses TailwindCSS classes for maximum flexibility
4. **Component Extensions**: Extend existing components or create your own following the established patterns

### Styling Approach

Better UI uses a pure TailwindCSS approach with constants for maintainable styling:

```ruby
# Component constants define styling options
BUTTON_THEME_CLASSES = {
  default: 'bg-gray-100 text-gray-900 hover:bg-gray-200',
  blue: 'bg-blue-600 text-white hover:bg-blue-700',
  green: 'bg-green-600 text-white hover:bg-green-700'
}.freeze

BUTTON_SIZE_CLASSES = {
  small: 'px-3 py-1.5 text-sm',
  medium: 'px-4 py-2 text-base',
  large: 'px-6 py-3 text-lg'
}.freeze
```

### Theming System

All components support consistent theming:

- **9 Standard Themes**: default, white, red, rose, orange, green, blue, yellow, violet
- **3 Standard Sizes**: small, medium, large
- **5 Border Radius Options**: none, small, medium, large, full

For more detailed customization instructions, see [CUSTOMIZATION.md](CUSTOMIZATION.md).

You can create wrapper components or extend existing ones:

Better UI includes 24+ components organized into three categories:

### Application Components (3)

Layout and navigation components for application interfaces:

- **Main**: Application main content area with responsive layout
- **Navbar**: Top navigation bar with flexible content support
- **Sidebar**: Collapsible sidebar navigation

### General Components (21)

Core UI elements for building interfaces:

**Display & Feedback**

- **Alert**: Notification messages with multiple themes and dismissible options
- **Avatar**: User profile images with fallback support
- **Badge**: Status indicators and labels
- **Progress**: Progress bars and loading indicators
- **Spinner**: Loading animations
- **Tooltip**: Contextual help and information overlays

**Navigation & Structure**

- **Breadcrumb**: Navigation path indicators
- **Card**: Content containers with headers and actions
- **Container**: Layout containers with responsive widths
- **Divider**: Visual content separators
- **Heading**: Styled headings with consistent typography
- **Link**: Enhanced anchor elements with theme support
- **Panel**: Organized content sections
- **Table**: Data tables with sorting and responsive features
- **Tag**: Categorization and labeling elements

**Form & Input**

- **Button**: Action buttons with multiple variants and states
- **Field**: Form field wrapper with label and validation support
- **Form**: Form container with styling and validation
- **Input**: Unified input system supporting 14+ types:
  - **Text**: text, email, password, search, url, tel
  - **Number**: number, range
  - **Date/Time**: date, datetime-local, time, month, week
  - **File**: file upload
  - **Color**: color picker
  - **Checkbox**: Multi-select options
  - **Radio**: Single-select options
  - **Select**: Dropdown selections
  - **Textarea**: Multi-line text input
- **Icon**: SVG icon system with extensive library

### Form Components (0)

Reserved for future specialized form components and complex form widgets.

For detailed component documentation and interactive examples, see [COMPONENTS.md](COMPONENTS.md).

## Testing

Better UI components are thoroughly tested. You can run the test suite with:

```bash
bin/rails test
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
