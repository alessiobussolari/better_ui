module BetterUi
  module General
    module Components
      module TooltipHelper
        # Render un tooltip con le opzioni specificate
        #
        # @param content [String] contenuto del tooltip
        # @param options [Hash] opzioni per il componente
        #
        # @option options [Symbol] :position (:top) :top, :right, :bottom, :left
        # @option options [Symbol] :theme (:dark) :dark, :light
        # @yield Il contenuto su cui mostrare il tooltip
        #
        # @return [String] HTML del componente
        def bui_tooltip(content: nil, **options, &block)
          render BetterUi::General::TooltipComponent.new(
            content: content,
            **options
          ), &block
        end
      end
    end
  end
end
