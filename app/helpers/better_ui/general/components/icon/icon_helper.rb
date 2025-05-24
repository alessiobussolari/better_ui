module BetterUi
  module General
    module Components
      module Icon
        module IconHelper
          def bui_icon(name = nil, **options)
            render BetterUi::General::Icon::Component.new(
              name: name,
              **options
            )
          end
        end
      end
    end
  end
end
