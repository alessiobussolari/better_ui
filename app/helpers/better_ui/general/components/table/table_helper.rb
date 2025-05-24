module BetterUi
  module General
    module Components
      module Table
        module TableHelper
          def bui_table(**options, &block)
            render BetterUi::General::Table::Component.new(**options), &block
          end
        end
      end
    end
  end
end
