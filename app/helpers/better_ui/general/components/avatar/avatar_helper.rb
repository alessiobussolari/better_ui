module BetterUi
  module General
    module Components
      module Avatar
        module AvatarHelper
          # Render un avatar con le opzioni specificate
          #
          # @param options [Hash] opzioni per il componente
          #
          # @option options [String] :name (nil) nome per le iniziali
          # @option options [String] :src (nil) URL dell'immagine
          # @option options [Symbol] :size (:md) :xxsmall, :xsmall, :sm, :md, :lg, :xlarge, :xxlarge
          # @option options [Symbol] :shape (:circle) :circle, :square, :rounded
          # @option options [Symbol] :status (nil) :online, :offline, :busy, :away
          # @option options [Symbol] :status_position (:bottom_right) :bottom_right, :bottom_left, :top_right, :top_left
          # @option options [Symbol] :theme (:white) :default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet
          # @option options [Symbol] :style (:filled) :filled, :outline, :light
          # @option options [String] :classes (nil) classi CSS aggiuntive
          # @option options [String] :id (nil) ID HTML
          #
          # @return [String] HTML del componente
          def bui_avatar(**options)
            render BetterUi::General::Avatar::Component.new(**options)
          end
        end
      end
    end
  end
end
