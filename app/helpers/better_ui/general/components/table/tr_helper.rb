module BetterUi
  module General
    module Components
      module Table
        module TrHelper
          def bui_tr(**options, &block)
            render BetterUi::General::Table::TrComponent.new(**options), &block
          end
        end
      end
    end
  end
end
