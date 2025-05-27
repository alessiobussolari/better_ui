module BetterUi
  module General
    module Components
      module Container
        # Require dell'helper container
        require_relative 'container/container_helper'

        # Include dell'helper nel modulo Container
        include ContainerHelper
      end
    end
  end
end