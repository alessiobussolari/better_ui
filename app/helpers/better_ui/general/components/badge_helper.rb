module BetterUi
  module General
    module Components
      module BadgeHelper
        # Render un badge con le opzioni specificate
        #
        # @param options [Hash] opzioni per il componente
        #
        # @option options [String] :label (nil) testo del badge
        # @option options [Symbol] :theme (:default) :default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet, :gray
        # @option options [Symbol] :size (:medium) :small, :medium, :large
        # @option options [Symbol] :shape (:rounded) :square, :rounded
        # @option options [Symbol] :style (:filled) :filled, :outline
        # @option options [Symbol] :variant (nil) :notification, :counter, :dot
        # @option options [String] :icon (nil) nome dell'icona (opzionale)
        # @option options [Symbol] :icon_position (:left) :left, :right
        # @option options [String] :classes (nil) classi CSS aggiuntive
        # @option options [String] :id (nil) ID HTML dell'elemento
        #
        # @return [String] HTML del componente
        def bui_badge(**options)
          render BetterUi::General::BadgeComponent.new(**options)
        end

        # Supporto per la sintassi originale per compatibilità
        alias_method :better_ui_general_badge, :bui_badge
      end
    end
  end
end 
