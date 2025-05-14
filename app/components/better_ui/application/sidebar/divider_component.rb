# frozen_string_literal: true

module BetterUi
  module Application
    module Sidebar
      class DividerComponent < ViewComponent::Base
        attr_reader :label
        
        # @param label [String] Testo opzionale da mostrare sul separatore
        def initialize(label: nil)
          @label = label
        end
      end
    end
  end
end 