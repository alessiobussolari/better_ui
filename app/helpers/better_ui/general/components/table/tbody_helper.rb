module BetterUi
  module General
    module Components
      module Table
        module TbodyHelper
          def bui_tbody(**options, &block)
            render BetterUi::General::Table::TbodyComponent.new(**options), &block
          end
        end
      end
    end
  end
end
