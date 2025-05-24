module BetterUi
  module General
    module Components
      module Panel
        # Require dell'helper panel
        require_relative 'panel/panel_helper'

        # Include dell'helper nel modulo Panel
        include PanelHelper
      end
    end
  end
end
