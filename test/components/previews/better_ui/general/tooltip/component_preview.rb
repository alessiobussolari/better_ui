module BetterUi
  module General
    module Tooltip
      class ComponentPreview < Lookbook::Preview
        # @!group Esempi Base

        # @label Con Helper
        # @param text text "Testo del tooltip"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema di colore"
        # @param position select { choices: [top, right, bottom, left] } "Posizione"
        # @param size select { choices: [small, medium, large] } "Dimensione"
        # @param style select { choices: [filled, outline] } "Stile"
        def default(
          text: "Questo è un tooltip di esempio",
          theme: :white,
          position: :top,
          size: :medium,
          style: :filled
        )
          normalized = normalize_params!(
            text: text,
            theme: theme,
            position: position,
            size: size,
            style: style
          )

          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param text text "Testo del tooltip"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema di colore"
        # @param position select { choices: [top, right, bottom, left] } "Posizione"
        # @param size select { choices: [small, medium, large] } "Dimensione"
        # @param style select { choices: [filled, outline] } "Stile"
        def raw(
          text: "Questo è un tooltip di esempio",
          theme: :white,
          position: :top,
          size: :medium,
          style: :filled
        )
          normalized = normalize_params!(
            text: text,
            theme: theme,
            position: position,
            size: size,
            style: style
          )

          render BetterUi::General::Tooltip::Component.new(**normalized) do
            tag.button("Hover me", class: "px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700")
          end
        end

        # @!endgroup

        private

        def normalize_params!(options)
          # Normalizzazione parametri
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:position] = options[:position].to_sym if options[:position].is_a?(String)
          options[:size] = options[:size].to_sym if options[:size].is_a?(String)
          options[:style] = options[:style].to_sym if options[:style].is_a?(String)

          options
        end
      end
    end
  end
end
