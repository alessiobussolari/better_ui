# frozen_string_literal: true

module BetterUi
  module Application
    class CardComponent < ViewComponent::Base
      attr_reader :title, :value, :value_from, :trend_value, :trend_type, :rounded

      # Opzioni di bordi arrotondati standardizzati
      CARD_RADIUS = {
        none: 'bui-card-radius-none',
        small: 'bui-card-radius-small',
        medium: 'bui-card-radius-medium',
        large: 'bui-card-radius-large',
        full: 'bui-card-radius-full'
      }.freeze

      # @param title [String] Titolo della card
      # @param value [String] Valore principale da visualizzare
      # @param value_from [String] Valore precedente di riferimento
      # @param trend_value [String] Percentuale di variazione
      # @param trend_type [Symbol] Tipo di variazione (:up o :down)
      # @param rounded [Symbol] Tipo di border-radius (:none, :small, :medium, :large, :full), default :small
      def initialize(title:, value:, value_from:, trend_value:, trend_type: :up, rounded: :small)
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
        CARD_RADIUS[@rounded] || CARD_RADIUS[:small]
      end
    end
  end
end 