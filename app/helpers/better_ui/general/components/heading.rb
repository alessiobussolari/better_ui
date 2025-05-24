module BetterUi
  module General
    module Components
      module Heading
        # Require dell'helper heading
        require_relative 'heading/heading_helper'

        # Include dell'helper nel modulo Heading
        include HeadingHelper
      end
    end
  end
end
