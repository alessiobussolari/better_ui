module BetterUi
  module General
    module Components
      module Alert
        # Require dell'helper alert
        require_relative 'alert/alert_helper'

        # Include dell'helper nel modulo Alert
        include AlertHelper
      end
    end
  end
end
