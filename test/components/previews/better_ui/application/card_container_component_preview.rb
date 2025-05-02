# frozen_string_literal: true

module BetterUi
  module Application
    class CardContainerComponentPreview < ViewComponent::Preview
      # @param title text "Titolo del container"
      def default(title: "Last 30 days")
        render(BetterUi::Application::CardContainerComponent.new(title: title)) do |container|
          container.with_card(
            title: "Total Subscribers",
            value: "71,897",
            value_from: "70,946",
            trend_value: "12%",
            trend_type: :up
          )
          
          container.with_card(
            title: "Avg. Open Rate",
            value: "58.16%",
            value_from: "56.14%",
            trend_value: "2.02%",
            trend_type: :up
          )
          
          container.with_card(
            title: "Avg. Click Rate",
            value: "24.57%",
            value_from: "28.62%",
            trend_value: "4.05%",
            trend_type: :down
          )
        end
      end
      
      # @!group Esempi Specifici
      
      # @label Con varianti miste
      def with_mixed_cards
        render(BetterUi::Application::CardContainerComponent.new(title: "Analisi delle performace")) do |container|
          container.with_card(
            title: "Ricavi totali",
            value: "€120.250",
            value_from: "€105.430",
            trend_value: "14%",
            trend_type: :up
          )
          
          container.with_card(
            title: "Clienti attivi",
            value: "1.234",
            value_from: "1.198",
            trend_value: "3%",
            trend_type: :up
          )
          
          container.with_card(
            title: "Tasso di abbandono",
            value: "5.7%",
            value_from: "4.2%",
            trend_value: "1.5%",
            trend_type: :down
          )
        end
      end
      
      # @!endgroup
    end
  end
end 