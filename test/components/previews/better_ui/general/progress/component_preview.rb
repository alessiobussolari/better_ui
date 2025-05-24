module BetterUi
  module General
    module Progress
      class ComponentPreview < Lookbook::Preview
        # @!group Esempi Base

        # @label Con Helper
        # @param value range { min: 0, max: 100, step: 1 } "Percentuale di completamento"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema di colore"
        # @param size select { choices: [small, medium, large] } "Dimensione"
        # @param label toggle "Mostra etichetta percentuale"
        def default(
          value: 65,
          theme: :white,
          size: :medium,
          label: true
        )
          normalized = normalize_params!(
            value: value,
            theme: theme,
            size: size,
            label: label
          )

          render_with_template(locals: {
            value: value,
            theme: theme,
            size: size,
            label: label
          })
        end

        # @label Istanziazione Diretta
        # @param value range { min: 0, max: 100, step: 1 } "Percentuale di completamento"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema di colore"
        # @param size select { choices: [small, medium, large] } "Dimensione"
        # @param label toggle "Mostra etichetta percentuale"
        def raw(
          value: 65,
          theme: :white,
          size: :medium,
          label: true
        )
          normalized = normalize_params!(
            value: value,
            theme: theme,
            size: size,
            label: label
          )

          render BetterUi::General::Progress::Component.new(**normalized)
        end

        # @!endgroup

        private

        def normalize_params!(options)
          # Normalizzazione parametri
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:size] = options[:size].to_sym if options[:size].is_a?(String)
          options[:value] = options[:value].to_i if options[:value].is_a?(String)

          options
        end
      end
    end
  end
end
