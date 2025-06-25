module BetterUi
  module General
    module Table
      class TfootComponent < BetterUi::Component  # ← Cambiato da ViewComponent::Base
        attr_reader :theme, :bordered
        
        # Supporto per righe multiple nel tfoot
        renders_many :rows, "BetterUi::General::Table::TrComponent"

        def initialize(theme: :default, bordered: false, **html_options)
          @theme = theme.to_sym
          @bordered = !!bordered
          @html_options = html_options
        end

        def tfoot_classes
          [
            "bg-gray-50 border-t border-gray-200",
            @html_options[:class]
          ].compact.join(" ")
        end

        def tfoot_attributes
          attrs = @html_options.except(:class)
          attrs[:class] = tfoot_classes
          attrs
        end
      end
    end
  end
end
