module BetterUi
  module Application
    module Components
      module Sidebar
        # Require dell'helper sidebar
        require_relative 'sidebar/sidebar_helper'

        # Include dell'helper nel modulo Sidebar
        include SidebarHelper
      end
    end
  end
end
