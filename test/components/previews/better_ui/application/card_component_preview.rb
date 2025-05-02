# frozen_string_literal: true

module BetterUi
  module Application
    class CardComponentPreview < ViewComponent::Preview
      # @param title text "Titolo della card"
      # @param value text "Valore principale"
      # @param value_from text "Valore precedente"
      # @param trend_value text "Valore di variazione percentuale"
      # @param trend_type select { choices: [up, down] } "Tipo di variazione"
      def default(
        title: "Total Subscribers",
        value: "71,897",
        value_from: "70,946",
        trend_value: "12%",
        trend_type: :up
      )
        render(BetterUi::Application::CardComponent.new(
          title: title,
          value: value,
          value_from: value_from,
          trend_value: trend_value,
          trend_type: trend_type.to_sym
        ))
      end

      # @!group Esempi Specifici

      # @label Incremento
      def increasing
        render(BetterUi::Application::CardComponent.new(
          title: "Avg. Open Rate",
          value: "58.16%",
          value_from: "56.14%",
          trend_value: "2.02%",
          trend_type: :up
        ))
      end

      # @label Decremento
      def decreasing
        render(BetterUi::Application::CardComponent.new(
          title: "Avg. Click Rate",
          value: "24.57%",
          value_from: "28.62%",
          trend_value: "4.05%",
          trend_type: :down
        ))
      end

      # @!endgroup
    end
  end
end 