module BetterUi
  module General
    module Components
      module Card
        # Require dell'helper card
        require_relative 'card/card_helper'

        # Include dell'helper nel modulo Card
        include CardHelper
      end
    end
  end
end