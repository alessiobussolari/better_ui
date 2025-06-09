module BetterUi
  module General
    module Tag
      class ComponentPreview < Lookbook::Preview
        # @!group Esempi Base

        # @label Con Helper
        # @param text text "Testo del tag"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema di colore"
        # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione"
        # @param style select { choices: [filled, outline] } "Stile"
        def default(
          text: "Tag di esempio",
          theme: :white,
          size: :md,
          style: :filled
        )
          normalized = normalize_params!(
            text: text,
            theme: theme,
            size: size,
            style: style
          )

          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param text text "Testo del tag"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema di colore"
        # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione"
        # @param style select { choices: [filled, outline] } "Stile"
        def raw(
          text: "Tag di esempio",
          theme: :white,
          size: :md,
          style: :filled
        )
          normalized = normalize_params!(
            text: text,
            theme: theme,
            size: size,
            style: style
          )

          render BetterUi::General::Tag::Component.new(**normalized)
        end

        # @!endgroup

        private

        def normalize_params!(options)
          # Normalizzazione parametri
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:size] = options[:size].to_sym if options[:size].is_a?(String)
          options[:style] = options[:style].to_sym if options[:style].is_a?(String)

          options
        end
      end
    end
  end
end
