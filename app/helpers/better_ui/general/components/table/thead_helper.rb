module BetterUi
  module General
    module Components
      module Table
        module TheadHelper
          def bui_thead(**options, &block)
            render BetterUi::General::Table::TheadComponent.new(**options), &block
          end
        end
      end
    end
  end
end
