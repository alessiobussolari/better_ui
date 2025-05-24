module BetterUi
  module General
    module Components
      module Link
        # Require dell'helper link
        require_relative 'link/link_helper'

        # Include dell'helper nel modulo Link
        include LinkHelper
      end
    end
  end
end
