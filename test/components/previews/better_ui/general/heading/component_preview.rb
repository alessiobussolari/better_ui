module BetterUi
  module General
    module Heading
      class ComponentPreview < Lookbook::Preview
        # @!group Esempi Base

        # @label Con Helper
        # @param text text "Testo del titolo"
        # @param level select { choices: [1, 2, 3, 4, 5, 6] } "Livello del heading (h1-h6)"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del colore"
        # @param align select { choices: [left, center, right] } "Allineamento del testo"
        # @param size select { choices: [small, medium, large] } "Dimensione del testo"
        # @param style select { choices: [normal, bold, italic, underline] } "Stile del testo"
        # @param icon text "Nome dell'icona (opzionale)"
        # @param subtitle text "Sottotitolo (opzionale)"
        # @param with_divider toggle "Mostra linea divisoria"
        def default(
          text: "Titolo di esempio",
          level: 2,
          theme: :white,
          align: :left,
          size: :medium,
          style: :normal,
          icon: "",
          subtitle: "",
          with_divider: false
        )
          normalized = normalize_params!(
            text: text,
            level: level,
            theme: theme,
            align: align,
            size: size,
            style: style,
            icon: icon,
            subtitle: subtitle,
            with_divider: with_divider
          )

          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param text text "Testo del titolo"
        # @param level select { choices: [1, 2, 3, 4, 5, 6] } "Livello del heading (h1-h6)"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del colore"
        # @param align select { choices: [left, center, right] } "Allineamento del testo"
        # @param size select { choices: [small, medium, large] } "Dimensione del testo"
        # @param style select { choices: [normal, bold, italic, underline] } "Stile del testo"
        # @param icon text "Nome dell'icona (opzionale)"
        # @param subtitle text "Sottotitolo (opzionale)"
        # @param with_divider toggle "Mostra linea divisoria"
        def raw(
          text: "Titolo di esempio",
          level: 2,
          theme: :white,
          align: :left,
          size: :medium,
          style: :normal,
          icon: "",
          subtitle: "",
          with_divider: false
        )
          normalized = normalize_params!(
            text: text,
            level: level,
            theme: theme,
            align: align,
            size: size,
            style: style,
            icon: icon,
            subtitle: subtitle,
            with_divider: with_divider
          )

          render BetterUi::General::Heading::Component.new(
            level: normalized[:level],
            theme: normalized[:theme],
            align: normalized[:align],
            size: normalized[:size],
            style: normalized[:style],
            icon: normalized[:icon],
            subtitle: normalized[:subtitle],
            with_divider: normalized[:with_divider]
          ).with_content(normalized[:text])
        end

        # @!endgroup

        private

        def normalize_params!(options)
          # Normalizzazione parametri
          options[:level] = options[:level].to_i if options[:level].is_a?(String)
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:align] = options[:align].to_sym if options[:align].is_a?(String)
          options[:size] = options[:size].to_sym if options[:size].is_a?(String)
          options[:style] = options[:style].to_sym if options[:style].is_a?(String)

          # Pulizia valori vuoti
          options[:icon] = nil if options[:icon].is_a?(String) && options[:icon].strip.empty?
          options[:subtitle] = nil if options[:subtitle].is_a?(String) && options[:subtitle].strip.empty?

          options
        end
      end
    end
  end
end
