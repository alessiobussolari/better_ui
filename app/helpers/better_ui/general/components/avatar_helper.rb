module BetterUi
  module General
    module Components
      module AvatarHelper
        # Render un avatar con le opzioni specificate
        #
        # @param options [Hash] opzioni per il componente
        #
        # @option options [String] :name (nil) nome dell'utente per le iniziali
        # @option options [String] :src (nil) URL dell'immagine dell'avatar
        # @option options [Symbol] :size (:medium) :xxsmall, :xsmall, :small, :medium, :large, :xlarge, :xxlarge
        # @option options [Symbol] :shape (:circle) :circle, :square, :rounded
        # @option options [Symbol] :theme (:default) :default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet, :gray
        # @option options [Symbol] :style (:filled) :filled, :outline, :light
        # @option options [Symbol] :status (nil) :online, :offline, :busy, :away
        # @option options [Symbol] :status_position (:bottom_right) :bottom_right, :bottom_left, :top_right, :top_left
        # @option options [String] :classes (nil) classi CSS aggiuntive
        # @option options [String] :id (nil) ID HTML dell'elemento
        #
        # @return [String] HTML del componente
        def bui_avatar(**options)
          render BetterUi::General::AvatarComponent.new(**options)
        end

        # Supporto per la sintassi originale per compatibilità
        alias_method :better_ui_general_avatar, :bui_avatar
      end
    end
  end
end 
