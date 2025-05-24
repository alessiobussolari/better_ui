# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Tag
        # Require dell'helper tag
        require_relative 'tag/tag_helper'

        # Include dell'helper nel modulo Tag
        include TagHelper
      end
    end
  end
end
