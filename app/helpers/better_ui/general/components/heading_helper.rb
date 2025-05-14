module BetterUi
  module General
    module Components
      module HeadingHelper
        # Render un heading con le opzioni specificate
        #
        # @param title [String] testo del heading (opzionale, può essere fornito anche tramite blocco)
        # @param options [Hash] opzioni per il componente
        #
        # @option options [Integer] :level (2) livello del heading (1-6)
        # @option options [Symbol] :theme (:default) tema del heading (:default, :white, :red, etc.)
        # @option options [Symbol] :align (:left) allineamento del testo (:left, :center, :right)
        # @option options [Symbol] :size (:medium) dimensione del testo (:small, :medium, :large)
        # @option options [Symbol] :style (:normal) stile del testo (:normal, :bold, :italic, :underline)
        # @option options [String] :icon (nil) icona opzionale
        # @option options [String] :subtitle (nil) sottotitolo opzionale
        # @option options [Boolean] :with_divider (false) mostra linea divisoria
        #
        # @return [String] HTML del componente
        def bui_heading(title = nil, **options, &block)
          if block_given?
            render BetterUi::General::HeadingComponent.new(**options), &block
          else
            render BetterUi::General::HeadingComponent.new(**options).with_content(title)
          end
        end

        # Supporto per la sintassi originale per compatibilità
        alias_method :better_ui_general_heading, :bui_heading
      end
    end
  end
end
