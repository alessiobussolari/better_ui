module BetterUi
  module General
    module Components
      module Badge
        module BadgeHelper
          # Helper per renderizzare un badge
          #
          # @param label [String] Testo del badge
          # @param theme [Symbol] Tema del badge (:default, :white, :red, etc.)
          # @param size [Symbol] Dimensione del badge (:sm, :md, :lg)
          # @param shape [Symbol] Forma del badge (:square, :rounded)
          # @param style [Symbol] Stile del badge (:filled, :outline)
          # @param variant [Symbol] Variante del badge (:notification, :counter, :dot)
          # @param icon [String] Nome dell'icona (opzionale)
          # @param icon_position [Symbol] Posizione dell'icona (:left, :right)
          # @param classes [String] Classi CSS aggiuntive
          # @param id [String] ID HTML
          # @param html_options [Hash] Opzioni HTML aggiuntive
          #
          # @return [String] HTML del badge
          def bui_badge(
            label: nil,
            theme: :white,
            size: :md,
            shape: :rounded,
            style: :filled,
            variant: nil,
            icon: nil,
            icon_position: :left,
            classes: nil,
            id: nil,
            **html_options,
            &block
          )
            render BetterUi::General::Badge::Component.new(
              label: label,
              theme: theme,
              size: size,
              shape: shape,
              style: style,
              variant: variant,
              icon: icon,
              icon_position: icon_position,
              classes: classes,
              id: id,
              **html_options
            ), &block
          end
        end
      end
    end
  end
end
