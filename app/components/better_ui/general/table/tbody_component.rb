module BetterUi
  module General
    module Table
      class TbodyComponent < ViewComponent::Base
        attr_reader :theme, :striped, :hoverable

        def initialize(theme: :default, striped: false, hoverable: false, **html_options)
          @theme = theme.to_sym
          @striped = !!striped
          @hoverable = !!hoverable
          @html_options = html_options
        end

        def tbody_classes
          [
            @striped ? "[&_tr:nth-child(odd)]:bg-gray-50" : nil,
            @hoverable ? "[&_tr]:hover:bg-gray-50" : nil,
            @html_options[:class]
          ].compact.join(" ")
        end

        def tbody_attributes
          attrs = @html_options.except(:class)
          attrs[:class] = tbody_classes
          attrs
        end
      end
    end
  end
end
