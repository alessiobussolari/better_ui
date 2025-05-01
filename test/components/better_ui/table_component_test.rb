# frozen_string_literal: true

require "test_helper"

class BetterUi::TableComponentTest < ViewComponent::TestCase
  def test_renders_with_data_and_headers
    # Arrange
    data = [
      { name: "Mario", age: 25, city: "Roma" },
      { name: "Luigi", age: 30, city: "Milano" }
    ]
    headers = ["name", "age", "city"]
    
    # Act
    render_inline(BetterUi::TableComponent.new(data: data, headers: headers))
    
    # Assert
    assert_selector "table"
    assert_selector "thead tr th", count: 3
    assert_selector "tbody tr", count: 2
    assert_text "Mario"
    assert_text "Luigi"
  end
  
  def test_derives_headers_from_data
    # Arrange
    data = [
      { name: "Mario", age: 25, city: "Roma" },
      { name: "Luigi", age: 30, city: "Milano" }
    ]
    
    # Act
    render_inline(BetterUi::TableComponent.new(data: data))
    
    # Assert
    assert_selector "thead tr th", count: 3
    assert_text "Name"
    assert_text "Age"
    assert_text "City"
  end
  
  def test_renders_with_caption
    # Arrange
    data = [{ name: "Mario" }]
    caption = "Elenco utenti"
    
    # Act
    render_inline(BetterUi::TableComponent.new(data: data, caption: caption))
    
    # Assert
    assert_selector "caption", text: "Elenco utenti"
  end
  
  def test_applies_striped_style
    # Arrange
    data = [
      { name: "Mario" },
      { name: "Luigi" },
      { name: "Peach" }
    ]
    
    # Act
    render_inline(BetterUi::TableComponent.new(data: data, striped: true))
    
    # Assert
    assert_selector "tbody tr:nth-child(odd).bg-gray-50"
  end
  
  def test_applies_bordered_style
    # Arrange
    data = [{ name: "Mario" }]
    
    # Act
    render_inline(BetterUi::TableComponent.new(data: data, bordered: true))
    
    # Assert
    assert_selector "table.border.border-gray-200"
    assert_selector "th.border.border-gray-200"
    assert_selector "td.border.border-gray-200"
  end
  
  def test_applies_compact_style
    # Arrange
    data = [{ name: "Mario" }]
    
    # Act
    render_inline(BetterUi::TableComponent.new(data: data, compact: true))
    
    # Assert
    assert_selector "td.px-2.py-1"
  end
  
  def test_applies_hoverable_style
    # Arrange
    data = [{ name: "Mario" }]
    
    # Act
    render_inline(BetterUi::TableComponent.new(data: data, hoverable: true))
    
    # Assert
    assert_selector "tr.hover\\:bg-gray-50"
  end
  
  def test_handles_empty_data
    # Arrange
    data = []
    
    # Act
    result = render_inline(BetterUi::TableComponent.new(data: data))
    
    # Assert
    assert_empty result.css("table")
  end
  
  def test_handles_nil_values_in_data
    # Arrange
    data = [{ name: "Mario", age: nil }]
    
    # Act
    render_inline(BetterUi::TableComponent.new(data: data))
    
    # Assert
    assert_selector "td", text: "—", count: 0  # Il valore nil non viene sostituito con un trattino
    assert_selector "td", text: ""
  end
  
  def test_applies_custom_classes
    # Arrange
    data = [{ name: "Mario" }]
    classes = "my-custom-class another-class"
    
    # Act
    render_inline(BetterUi::TableComponent.new(data: data, classes: classes))
    
    # Assert
    assert_selector "table.my-custom-class.another-class"
  end
end 