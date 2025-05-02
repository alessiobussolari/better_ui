# frozen_string_literal: true

module BetterUi
  module Application
    class CardComponent < ViewComponent::Base
      attr_reader :title, :value, :value_from, :trend_value, :trend_type

      # @param title [String] Titolo della card
      # @param value [String] Valore principale da visualizzare
      # @param value_from [String] Valore precedente di riferimento
      # @param trend_value [String] Percentuale di variazione
      # @param trend_type [Symbol] Tipo di variazione (:up o :down)
      def initialize(title:, value:, value_from:, trend_value:, trend_type: :up)
        @title = title
        @value = value
        @value_from = value_from
        @trend_value = trend_value
        @trend_type = trend_type.to_sym
      end

      def trend_classes
        if trend_type == :up
          'bg-green-100 text-green-800'
        else
          'bg-red-100 text-red-800'
        end
      end

      def trend_icon_classes
        if trend_type == :up
          'text-green-500'
        else
          'text-red-500'
        end
      end
    end
  end
end 