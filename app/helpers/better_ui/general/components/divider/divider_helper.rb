module BetterUi
  module General
    module Components
      module Divider
        module DividerHelper
          # Genera un divider usando BetterUi::General::Divider::Component
          #
          # @param theme [Symbol] tema del divider (:default, :white, etc.)
          # @param orientation [Symbol] orientamento del divider (:horizontal, :vertical)
          # @param style [Symbol] stile della linea (:solid, :dashed, :dotted, :double)
          # @param size [Symbol] dimensione della linea (:thin, :medium, :thick)
          # @param label [String] testo opzionale da mostrare al centro del divider
          # @param height [String] altezza per divider verticale (es. "100px", "100%")
          # @param classes [String] classi CSS aggiuntive
          # @param html_options [Hash] opzioni HTML per il container
          # @return [String] HTML del divider renderizzato
          #
          # @example Uso base
          #   bui_divider
          #   bui_divider(theme: :blue, size: :thick)
          #
          # @example Con label
          #   bui_divider(label: "Oppure", theme: :red)
          #
          # @example Divider verticale
          #   bui_divider(orientation: :vertical, height: "100px", theme: :green)
          #
          # @example Con opzioni avanzate
          #   bui_divider(
          #     theme: :violet,
          #     orientation: :horizontal,
          #     style: :dashed,
          #     size: :medium,
          #     label: "Sezione",
          #     classes: "my-8",
          #     id: "main-divider"
          #   )
          def bui_divider(
            theme: :white,
            orientation: :horizontal,
            style: :solid,
            size: :medium,
            label: nil,
            height: nil,
            classes: nil,
            **html_options
          )
            render BetterUi::General::Divider::Component.new(
              theme: theme,
              orientation: orientation,
              style: style,
              size: size,
              label: label,
              height: height,
              classes: classes,
              **html_options
            )
          end
        end
      end
    end
  end
end
