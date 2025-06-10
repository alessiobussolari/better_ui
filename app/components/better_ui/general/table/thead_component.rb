module BetterUi
  module General
    module Table
      class TheadComponent < BetterUi::Component
        renders_many :rows, "BetterUi::General::Table::TrComponent"
        
        attr_reader :theme, :bordered

        def initialize(theme: :default, bordered: false, **html_options)
          super()
          @theme = theme.to_sym
          @bordered = !!bordered
          @html_options = html_options
        end

        def thead_classes
          [
            "bg-gray-100 border-b border-gray-200",
            @html_options[:class]
          ].compact.join(" ")
        end

        def thead_attributes
          attrs = @html_options.except(:class)
          attrs[:class] = thead_classes
          attrs
        end
      end
    end
  end
end
