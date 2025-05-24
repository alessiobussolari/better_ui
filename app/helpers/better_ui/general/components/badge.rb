module BetterUi
  module General
    module Components
      module Badge
        # Require dell'helper badge
        require_relative 'badge/badge_helper'

        # Include dell'helper nel modulo Badge
        include BadgeHelper
      end
    end
  end
end
