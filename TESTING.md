# Testing Guide

This guide provides information on how to test applications using Better UI and how to contribute to the library's test suite.

## Table of Contents

- [Library Tests](#library-tests)
- [Component Tests](#component-tests)
- [Testing in Applications](#testing-in-applications)
- [Mocking Strategies](#mocking-strategies)
- [System Tests](#system-tests)
- [Integration Tests](#integration-tests)
- [Troubleshooting](#troubleshooting)

## Library Tests

Better UI uses RSpec for testing. To run the complete test suite:

```bash
bin/rails test
```

To run tests for a specific component:

```bash
bin/rails test test/components/better_ui/general/button_component_test.rb
```

## Component Tests

Component tests use ViewComponent's testing features to verify that components render correctly and their behavior is as expected.

### Test Example

```ruby
# test/components/better_ui/general/button_component_test.rb
require "test_helper"

module BetterUi
  module General
    class ButtonComponentTest < ViewComponent::TestCase
      test "renders a button with label" do
        render_inline(ButtonComponent.new(label: "Click me"))
        
        assert_selector("button", text: "Click me")
        assert_selector(".bui-button")
      end
      
      test "applies the correct variant" do
        render_inline(ButtonComponent.new(label: "Click me", variant: "primary"))
        
        assert_selector(".bui-button--primary")
      end
      
      test "supports icons" do
        render_inline(ButtonComponent.new(
          label: "Click me", 
          icon_left: "check"
        ))
        
        assert_selector(".bui-button__icon--left")
        assert_selector("i", class: /fa-check/)
      end
      
      test "accepts HTML attributes" do
        render_inline(ButtonComponent.new(
          label: "Click me",
          html: { id: "my-button", class: "custom-class" }
        ))
        
        assert_selector("button#my-button.custom-class")
      end
    end
  end
end
```

## Testing in Applications

When using Better UI in your Rails application, you can test your custom components and their integration with Better UI components.

### Setup

In your applications, make sure to configure tests to work with ViewComponent:

```ruby
# test/test_helper.rb
require "view_component/test_case"

class ViewComponentTestCase < ViewComponent::TestCase
  # Common setup
end
```

### Integration Testing with Better UI

```ruby
# test/components/search_bar_component_test.rb
require "test_helper"

class SearchBarComponentTest < ViewComponentTestCase
  test "renders correctly with a Better UI button" do
    render_inline(SearchBarComponent.new(
      placeholder: "Search...",
      button_text: "Search"
    ))
    
    assert_selector("input[placeholder='Search...']")
    assert_selector(".bui-button", text: "Search")
  end
end
```

## Mocking Strategies

When testing components that use other components, it's often useful to mock those components:

```ruby
# test/components/user_card_component_test.rb
require "test_helper"

class UserCardComponentTest < ViewComponentTestCase
  test "renders correctly with an avatar" do
    # Avatar component stub
    avatar_component = stub(render: '<div class="bui-avatar">JS</div>'.html_safe)
    BetterUi::General::AvatarComponent.expects(:new)
      .with(initials: "JS", size: "medium")
      .returns(avatar_component)
      
    user = OpenStruct.new(name: "John Smith", email: "john@example.com")
    render_inline(UserCardComponent.new(user: user))
    
    assert_selector(".bui-avatar", text: "JS")
    assert_selector("h3", text: "John Smith")
  end
end
```

## System Tests

To test user interactions with components, use Rails system tests:

```ruby
# test/system/posts_test.rb
require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test "creating a new post" do
    visit new_post_path
    
    fill_in "Title", with: "New Post"
    fill_in "Content", with: "Post content"
    
    # Interaction with a Better UI select component
    find(".bui-select").click
    find(".bui-select__option", text: "Technology").click
    
    find(".bui-button--primary", text: "Create Post").click
    
    assert_selector "h1", text: "New Post"
    assert_selector ".bui-badge--green", text: "Technology"
  end
end
```

## Integration Tests

Test the integration of components with controllers and views:

```ruby
# test/integration/user_dashboard_test.rb
require "test_helper"

class UserDashboardTest < ActionDispatch::IntegrationTest
  test "shows user dashboard with the correct components" do
    login_user(users(:admin))
    get dashboard_path
    
    assert_response :success
    assert_select ".bui-header"
    assert_select ".bui-sidebar"
    assert_select ".bui-panel", count: 3
    assert_select ".bui-card", count: 5
  end
end
```

## Troubleshooting

### Common Issues

#### 1. Components not rendering in tests

If components aren't rendering correctly in tests, check:

- Correct imports in tests
- ViewComponent configuration
- Correct relative paths

#### 2. Tests failing with CSS errors

If tests fail with errors related to CSS classes:

- Verify that Tailwind CSS is properly configured for the test environment
- Use `assert_selector` to verify classes instead of exact HTML
- Consider mocking the rendering part if necessary

#### 3. Slow tests

If tests are slow:

- Selectively use `assert_selector` instead of comparing complete HTML
- Mock nested components
- Use fixtures instead of factories when appropriate

For more information on testing components, see the [official ViewComponent documentation](https://viewcomponent.org/guide/testing.html). 