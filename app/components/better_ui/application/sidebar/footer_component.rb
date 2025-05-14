# frozen_string_literal: true

module BetterUi
  module Application
    module Sidebar
      class FooterComponent < ViewComponent::Base
        attr_reader :compact
        
        # @param compact [Boolean] Se visualizzare in modalità compatta
        def initialize(compact: false)
          @compact = compact
        end
      end
    end
  end
end 