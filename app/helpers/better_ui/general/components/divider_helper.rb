module BetterUi
  module General
    module Components
      module DividerHelper
        # Render un divider con le opzioni specificate
        #
        # @param label [String] testo opzionale da mostrare al centro del divider
        # @param options [Hash] opzioni per il componente
        #
        # @option options [Symbol] :theme (:default) tema del divider (:default, :white, :red, etc.)
        # @option options [Symbol] :orientation (:horizontal) :horizontal o :vertical
        # @option options [Symbol] :style (:solid) :solid, :dashed, :dotted o :double
        # @option options [String] :height (nil) altezza per divider verticale (es. "100px", "100%")
        #
        # @return [String] HTML del componente
        def bui_divider(label = nil, **options)
          render BetterUi::General::DividerComponent.new(
            label: label,
            **options
          )
        end
      end
    end
  end
end
