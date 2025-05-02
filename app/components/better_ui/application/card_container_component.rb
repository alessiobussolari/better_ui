# frozen_string_literal: true

module BetterUi
  module Application
    class CardContainerComponent < ViewComponent::Base
      renders_many :cards, CardComponent

      # @param title [String] Titolo del container delle card
      def initialize(title:)
        @title = title
      end
    end
  end
end 