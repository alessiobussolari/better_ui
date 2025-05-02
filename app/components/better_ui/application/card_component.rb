# frozen_string_literal: true

module BetterUi
  module Application
    class CardComponent < ViewComponent::Base
      attr_reader :title, :value, :value_from, :trend_value, :trend_type, :rounded

      # @param title [String] Titolo della card
      # @param value [String] Valore principale da visualizzare
      # @param value_from [String] Valore precedente di riferimento
      # @param trend_value [String] Percentuale di variazione
      # @param trend_type [Symbol] Tipo di variazione (:up o :down)
      # @param rounded [Symbol] Tipo di border-radius (:none, :xs, :sm, :md, :lg, :xl), default :sm
      def initialize(title:, value:, value_from:, trend_value:, trend_type: :up, rounded: :sm)
        @title = title
        @value = value
        @value_from = value_from
        @trend_value = trend_value
        @trend_type = trend_type.to_sym
        @rounded = rounded.to_sym
      end

      def trend_classes
        if trend_type == :up
          'bg-green-500 text-white'
        else
          'bg-black text-white'
        end
      end

      def trend_icon_classes
        if trend_type == :up
          'text-white'
        else
          'text-white'
        end
      end

      def get_border_radius_class
        ThemeHelper::BORDER_RADIUS[@rounded] || ThemeHelper::BORDER_RADIUS[:sm]
      end
    end
  end
end 