module BetterUi
  module General
    module Components
      module Button
        # Require dell'helper button
        require_relative 'button/button_helper'

        # Include dell'helper nel modulo Button
        include ButtonHelper
      end
    end
  end
end
