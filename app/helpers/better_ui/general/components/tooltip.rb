module BetterUi
  module General
    module Components
      module Tooltip
        # Require dell'helper tooltip
        require_relative 'tooltip/tooltip_helper'

        # Include dell'helper nel modulo Tooltip
        include TooltipHelper
      end
    end
  end
end
