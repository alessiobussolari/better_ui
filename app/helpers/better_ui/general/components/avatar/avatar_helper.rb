module BetterUi
  module General
    module Components
      module Avatar
        module AvatarHelper
          # Helper per renderizzare un avatar
          #
          # @param name [String] Nome per le iniziali
          # @param src [String] URL dell'immagine (opzionale)
          # @param shape [Symbol] Forma dell'avatar (:circle, :square, :rounded)
          # @param size [Symbol] Dimensione (:xxs, :xs, :sm, :md, :lg, :xl, :xxl)
          # @param status [Symbol] Stato online (:online, :offline, :busy, :away)
          # @param status_position [Symbol] Posizione indicatore stato (:bottom_right, :bottom_left, :top_right, :top_left)
          # @param style [Symbol] Stile dell'avatar (:filled, :outline, :light)
          # @param theme [Symbol] Tema (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
          # @param classes [String] Classi CSS aggiuntive
          # @param id [String] ID elemento
          # @param html_options [Hash] Opzioni HTML aggiuntive
          #
          # @return [String] HTML dell'avatar
          def bui_avatar(
            name = nil,
            src: nil,
            shape: :circle,
            size: :md,
            status: nil,
            status_position: :bottom_right,
            style: :filled,
            theme: :white,
            classes: nil,
            id: nil,
            **html_options
          )
            render BetterUi::General::Avatar::Component.new(
              name: name,
              src: src,
              shape: shape,
              size: size,
              status: status,
              status_position: status_position,
              style: style,
              theme: theme,
              classes: classes,
              id: id,
              **html_options
            )
          end
        end
      end
    end
  end
end
