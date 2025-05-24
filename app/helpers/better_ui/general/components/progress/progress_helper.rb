module BetterUi
  module General
    module Components
      module Progress
        module ProgressHelper
          # Helper per renderizzare una progress bar
          #
          # @param value [Integer] percentuale di completamento (0-100)
          # @param theme [Symbol] tema del colore (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
          # @param size [Symbol] dimensione della progress bar (:small, :medium, :large)
          # @param label [Boolean] mostra etichetta con percentuale
          # @param classes [String] classi CSS aggiuntive
          # @param html_options [Hash] opzioni HTML aggiuntive
          #
          # @return [String] HTML della progress bar
          #
          # @example Uso base
          #   bui_progress(value: 75)
          #
          # @example Progress con etichetta
          #   bui_progress(value: 50, label: true, theme: :green)
          #
          # @example Progress personalizzata
          #   bui_progress(
          #     value: 90,
          #     theme: :blue,
          #     size: :large,
          #     label: true,
          #     classes: "my-custom-class",
          #     id: "main-progress"
          #   )
          def bui_progress(
            value: 0,
            theme: :white,
            size: :medium,
            label: false,
            classes: nil,
            **html_options
          )
            render BetterUi::General::Progress::Component.new(
              value: value,
              theme: theme,
              size: size,
              label: label,
              classes: classes,
              **html_options
            )
          end
        end
      end
    end
  end
end
