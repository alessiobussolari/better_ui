# Troubleshooting Guide

This guide addresses common issues that you might encounter when working with Better UI and their solutions.

## Table of Contents

- [Installation Issues](#installation-issues)
- [Styling Problems](#styling-problems)
- [Component Rendering Issues](#component-rendering-issues)
- [Asset Pipeline Problems](#asset-pipeline-problems)
- [Tailwind Integration Issues](#tailwind-integration-issues)
- [JavaScript Functionality](#javascript-functionality)
- [Upgrading Issues](#upgrading-issues)
- [Common Errors](#common-errors)

## Installation Issues

### Gem Installation Fails

**Problem**: Bundle install fails when adding Better UI.

**Solution**:
1. Verify your Ruby version is >= 3.0: `ruby -v`
2. Check Rails version is >= 7.0: `rails -v`
3. Clear your bundler cache: `bundle clean --force`
4. Update bundler: `gem update bundler`
5. Try installing with specific version: `gem 'better_ui', '~> x.y.z'`

### Generator Errors

**Problem**: The generator fails with errors.

**Solution**:
1. Run with verbose flag for more information: `bin/rails generate better_ui:install --trace`
2. Ensure you have write permissions to the application directories
3. If specific errors are related to assets, check file permissions in app/assets

### Engine Mount Issues

**Problem**: Accessing `/better_ui` returns a routing error.

**Solution**:
1. Verify the engine is properly mounted in routes:
   ```ruby
   # config/routes.rb
   mount BetterUi::Engine => '/better_ui'
   ```
2. Run `bin/rails routes | grep better_ui` to confirm routes are registered
3. Restart your server
4. If still not working, try mounting at a different path

## Styling Problems

### Components Don't Look Right

**Problem**: Components appear unstyled or incorrectly styled.

**Solution**:
1. Ensure Tailwind CSS is properly installed and configured
2. Check that Better UI styles are included in your application.css/scss
3. Verify the loading order - Tailwind should be loaded before Better UI
4. Inspect the CSS classes in the browser to ensure they're being applied
5. Clear your asset cache: `bin/rails tmp:clear`

### Custom Styles Not Applied

**Problem**: Your component overrides are not being applied.

**Solution**:
1. Check that your override files are named correctly with _overrides.scss suffix
2. Verify the file paths in app/assets/stylesheets/components/
3. Make sure the stylesheet manifest is importing your overrides
4. Check specificity issues - BEM custom styles should have proper hierarchy

## Component Rendering Issues

### Components Not Rendering

**Problem**: Components fail to render or throw errors.

**Solution**:
1. Check for proper component namespacing: `BetterUi::General::ButtonComponent`
2. Verify required parameters are being passed to components
3. Check Ruby console errors for specific missing methods or arguments
4. Ensure ViewComponent is properly installed and running

### Yield Block Issues

**Problem**: Content passed to component blocks doesn't display.

**Solution**:
1. Verify you're passing content to components correctly:
   ```erb
   <%= render BetterUi::General::PanelComponent.new(title: 'Title') do %>
     Content here
   <% end %>
   ```
2. For components with slots, ensure you're using the slot API correctly:
   ```erb
   <% component.with_body do %>
     Body content
   <% end %>
   ```

## Asset Pipeline Problems

### Missing Assets

**Problem**: CSS or JavaScript assets are not found.

**Solution**:
1. Check asset paths in your configuration
2. Verify the gem is properly installed: `bundle show better_ui`
3. Ensure the engine is mounted and precompiling assets
4. Run `bin/rails assets:precompile` in development to test compilation
5. Check for asset pipeline configuration issues in `config/initializers/assets.rb`

### Asset Compilation Errors

**Problem**: Asset compilation fails during deployment.

**Solution**:
1. Check for syntax errors in your SCSS files
2. Verify compatibility between Tailwind and your other asset plugins
3. Try compiling assets locally first: `RAILS_ENV=production bin/rails assets:precompile`
4. Look for specific error messages in the compilation output

## Tailwind Integration Issues

### Missing Tailwind Classes

**Problem**: Tailwind classes don't work or purge CSS removes required classes.

**Solution**:
1. Update your Tailwind configuration to include Better UI paths:
   ```javascript
   module.exports = {
     content: [
       // Your existing paths
       './app/components/better_ui/**/*.{rb,html,html.erb,erb}'
     ],
     // rest of config
   }
   ```
2. If using PurgeCSS separately, ensure it's configured to keep Better UI classes
3. Add Better UI classes to your PurgeCSS safelist if needed

### Tailwind Version Conflicts

**Problem**: Version conflicts between Better UI and your Tailwind installation.

**Solution**:
1. Check Tailwind compatibility in the gemspec
2. Update your Tailwind version to match requirements
3. If using JIT mode, ensure it's properly configured
4. Consider using the Tailwind Rails gem for simpler integration

## JavaScript Functionality

### Interactive Components Not Working

**Problem**: Components with JavaScript functionality don't work.

**Solution**:
1. Check browser console for JavaScript errors
2. Verify Stimulus controllers are properly loaded (if using Stimulus)
3. Ensure required data attributes are included in component markup
4. Check for conflicting JavaScript libraries or frameworks

### Modal/Dropdown Issues

**Problem**: Interactive components like modals or dropdowns don't function.

**Solution**:
1. Verify your JavaScript runtime is properly set up (Importmaps, esbuild, etc.)
2. Check for missing event listeners or DOM elements
3. Ensure z-index values aren't being overridden by other styles
4. Test in a minimal example to isolate the issue

## Upgrading Issues

### Breaking Changes After Update

**Problem**: Upgrading Better UI breaks existing functionality.

**Solution**:
1. Review the CHANGELOG for breaking changes
2. Update component invocations to match new API if needed
3. Check for deprecated methods or parameters
4. Update your custom styles to match any BEM naming changes
5. Run a full test suite after upgrading

### Migration Path Issues

**Problem**: Difficulty migrating from an older version.

**Solution**:
1. Consider incremental updates rather than skipping multiple versions
2. Use deprecation warnings to identify code that needs updating
3. Take advantage of provided migration scripts if available
4. Create a test branch to experiment with upgrades safely

## Common Errors

### Invalid CSS in Stylesheet

**Problem**: Error about invalid CSS in your stylesheets.

**Solution**:
1. Check for syntax errors in your override files
2. Verify proper nesting of Sass rules
3. Ensure `@layer` directives are used correctly
4. Check for missing semicolons or brackets

### Missing Dependencies

**Problem**: Errors about missing gems or dependencies.

**Solution**:
1. Check gemspec for required dependencies
2. Ensure all dependencies are installed: `bundle install`
3. If using Node.js dependencies, check package.json
4. Verify compatible versions of all dependencies

### Initialization Errors

**Problem**: Engine initialization errors.

**Solution**:
1. Check your initializer file for syntax errors
2. Verify the configuration options are valid
3. Check load order in `config/application.rb`
4. Try with minimal configuration to isolate the issue

---

If you encounter issues not covered in this guide, please check the [GitHub Issues](https://github.com/alessiobussolari/better_ui/issues) or submit a new issue with detailed reproduction steps. 