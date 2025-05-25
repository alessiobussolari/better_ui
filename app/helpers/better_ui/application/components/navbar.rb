module BetterUi
  module Application
    module Components
      module Navbar
        # Require dell'helper navbar
        require_relative 'navbar/navbar_helper'

        # Include dell'helper nel modulo Navbar
        include NavbarHelper
      end
    end
  end
end
