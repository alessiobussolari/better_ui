module BetterUi
  module Application
    module Components
      module Main
        # Require dell'helper main
        require_relative 'main/main_helper'

        # Include dell'helper nel modulo Main
        include MainHelper
      end
    end
  end
end
