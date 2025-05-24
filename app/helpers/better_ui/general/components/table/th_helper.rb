module BetterUi
  module General
    module Components
      module Table
        module ThHelper
          def bui_th(content = nil, **options, &block)
            if block_given?
              render BetterUi::General::Table::ThComponent.new(**options), &block
            else
              render BetterUi::General::Table::ThComponent.new(**options) do
                content
              end
            end
          end
        end
      end
    end
  end
end
