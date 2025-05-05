module BetterUi
  module General
    module Components
      module ProgressHelper
        # Render una barra di avanzamento con le opzioni specificate
        #
        # @param options [Hash] opzioni per il componente
        #
        # @option options [Integer] :value (0) valore da 0 a 100
        # @option options [Symbol] :type (:linear) :linear o :circular
        # @option options [Symbol] :variant (:determinate) :determinate o :indeterminate
        # @option options [Symbol] :color (:default) :default, :red, :blue, :green, :yellow
        # @option options [Symbol] :size (:md) :sm, :md, :lg
        # @option options [Boolean] :label (false) mostra etichetta percentuale
        #
        # @return [String] HTML del componente
        def bui_progress(**options)
          render BetterUi::General::ProgressComponent.new(**options)
        end
      end
    end
  end
end
