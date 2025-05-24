module BetterUi
  module General
    module Components
      module Breadcrumb
        # Require dell'helper breadcrumb
        require_relative 'breadcrumb/breadcrumb_helper'

        # Include dell'helper nel modulo Breadcrumb
        include BreadcrumbHelper
      end
    end
  end
end
