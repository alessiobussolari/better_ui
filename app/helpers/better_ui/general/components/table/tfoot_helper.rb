module BetterUi
  module General
    module Components
      module Table
        module TfootHelper
          def bui_tfoot(**options, &block)
            render BetterUi::General::Table::TfootComponent.new(**options), &block
          end
        end
      end
    end
  end
end
