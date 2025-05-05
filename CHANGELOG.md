# Changelog

All significant changes to BetterUI will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Coming Soon
- **FormComponent** for advanced form inputs
  - Text inputs with validation
  - Advanced selects
  - Checkboxes and radio buttons
  - Date picker
  - File uploader
- Enhanced **TableComponent** for tabular data visualization
  - Column sorting
  - Advanced filters
  - Pagination
  - Row selection
- Hotwire integration for real-time updates
- Dark/light theme with automatic switching

## [0.5.1] - 2024-05-20

### Added
- Added comprehensive documentation files:
  - New `FAQ.md` with frequently asked questions
  - New `ROADMAP.md` with development plans
  - Improved `USAGE.md` and `TESTING.md`

### Improved
- Translated gemspec description and comments to English
- Improved documentation organization and structure

## [0.5.0] - 2024-05-15

### Added
- **SpinnerComponent** for loading indicators
  - Multiple sizes (xxsmall to xxlarge)
  - Various themes (primary, secondary, and other colors)
  - Optional labels
  - Centered alignment options
- **BadgeComponent** for labels and badges
  - Support for icons
  - Multiple color variants
  - Outline and notification variants
- **AvatarComponent** for user avatars
  - Support for images and initials
  - Online status indicator
  - Multiple sizes
- Style override system for all components
  - Automatic generation of `*_overrides.scss` files
  - Empty CSS classes matching original components
  - Support for nested SCSS structure
  - Clean customization without modifying original files

### Improved
- **TableComponent** now supports custom partials
  - Custom header, body, and footer templates
  - Maintains semantic table structure
  - Simplifies complex table customization
- Updated documentation to English
- Enhanced README with component override system details
- Improved SCSS structure with nested selectors

## [0.4.0] - 2024-05-02

### Added
- **HeaderComponent** for creating page headers
  - Support for title with optional icon
  - Support for subtitle
  - Integration with breadcrumb and visibility control
  - Support for actions (buttons, menus, etc.)
  - Style variants: modern, light, dark, primary, transparent
  - Optional fixed positioning (top, bottom)
  - Mobile-friendly responsive structure
  - Integrated native SVG icons
  - Complete Lookbook previews with configurable parameters

### Improved
- Updated README with HeaderComponent documentation
- Improved preview organization in Lookbook
- Optimized component structure for better visual consistency

## [0.3.0] - 2024-04-15

### Added
- **ToastComponent** for temporary notifications
  - Configurable timer with progress bar
  - Entry and exit animations
  - Color variants
  - Configurable positioning
  - Automatic or manual closing options

### Improved
- Updated documentation for new components
- Improved mobile device compatibility
- Added "simple" variant to Alert notifications

## [0.2.0] - 2024-03-20

### Added
- **NavbarComponent** for responsive navigation bars
  - Support for dropdown menus
  - Color variants
  - Responsive layout for mobile and desktop
  - Stimulus controller for advanced interactions
  - Support for logo and branding
- **SidebarComponent** for side menus
  - Support for hierarchical navigation
  - Submenu dropdown management
  - Customizable header and footer
  - Integrated icons
  - Minimalist modern design

### Fixed
- Resolved display issues on small screens
- Fixed accessibility issues
- Improved contrast for better readability

## [0.1.0] - 2024-02-10

### Added
- Initial Rails engine configuration
- Lookbook integration for component previews
- **ButtonComponent** with style variants
- **AlertComponent** for notification messages
- **CardComponent** for flexible layouts
- **ModalComponent** for modal windows
- **TabsComponent** for tab navigation
- Basic documentation
- Testing setup and dummy app for development

[Unreleased]: https://github.com/alessiobussolari/better_ui/compare/v0.5.1...HEAD
[0.5.1]: https://github.com/alessiobussolari/better_ui/compare/v0.5.0...v0.5.1
[0.5.0]: https://github.com/alessiobussolari/better_ui/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/alessiobussolari/better_ui/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/alessiobussolari/better_ui/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/alessiobussolari/better_ui/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/alessiobussolari/better_ui/releases/tag/v0.1.0 