module BetterUi
  module General
    module Table
      class TrComponent < ViewComponent::Base
        attr_reader :theme, :highlighted, :striped_index

        def initialize(theme: :default, highlighted: false, striped_index: nil, **html_options)
          @theme = theme.to_sym
          @highlighted = !!highlighted
          @striped_index = striped_index
          @html_options = html_options
        end

        def tr_classes
          [
            "border-b border-gray-100",
            @highlighted ? "bg-blue-50" : nil,
            @html_options[:class]
          ].compact.join(" ")
        end

        def tr_attributes
          attrs = @html_options.except(:class)
          attrs[:class] = tr_classes
          attrs
        end
      end
    end
  end
end
