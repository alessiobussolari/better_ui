# frozen_string_literal: true

require "test_helper"

class BetterUi::PanelComponentTest < ViewComponent::TestCase
  def test_component_renders_something_useful
    # Arrange
    component = BetterUi::PanelComponent.new(
      title: "Titolo del panel",
      content: "Contenuto del panel", 
      padding: :medium,
      variant: :default
    )
    
    # Act
    render_inline(component)
    
    # Assert
    assert_text "Titolo del panel"
    assert_text "Contenuto del panel"
    assert_selector "div", class: "bg-white"
  end
  
  def test_renders_with_different_variant
    # Arrange
    component = BetterUi::PanelComponent.new(
      title: "Panel primario",
      content: "Contenuto primario", 
      variant: :primary
    )
    
    # Act
    render_inline(component)
    
    # Assert
    assert_selector "div", class: "bg-blue-50"
  end
  
  def test_renders_with_different_padding
    # Arrange
    component = BetterUi::PanelComponent.new(
      content: "Contenuto con padding grande", 
      padding: :large
    )
    
    # Act
    render_inline(component)
    
    # Assert
    assert_selector "div", class: "p-6"
  end
  
  def test_renders_without_title
    # Arrange
    component = BetterUi::PanelComponent.new(
      content: "Solo contenuto"
    )
    
    # Act
    render_inline(component)
    
    # Assert
    assert_no_selector "div.text-lg.font-medium"
    assert_text "Solo contenuto"
  end
end 