module BetterUi
  module General
    module Components
      module Table
        module TdHelper
          def bui_td(content = nil, **options, &block)
            if block_given?
              render BetterUi::General::Table::TdComponent.new(**options), &block
            else
              render BetterUi::General::Table::TdComponent.new(**options) do
                content
              end
            end
          end
        end
      end
    end
  end
end
