module BetterUi
  module General
    class HeadingComponentPreview < Lookbook::Preview
      # @!group Esempi Base

      # @label Con Helper
      # @param text text "Testo dell'heading"
      # @param level select { choices: [1, 2, 3, 4, 5, 6] } "Livello dell'heading"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema di colore"
      # @param size select { choices: [small, medium, large] } "Dimensione del testo"
      # @param align select { choices: [left, center, right] } "Allineamento del testo"
      # @param style select { choices: [normal, bold, italic, underline] } "Stile del testo"
      # @param icon text "Nome icona (opzionale)"
      # @param subtitle text "Sottotitolo (opzionale)"
      # @param with_divider toggle "Mostra linea divisoria"
      def default(
        text: "Titolo di esempio",
        level: 2,
        theme: :default,
        size: :medium,
        align: :left,
        style: :normal,
        icon: nil,
        subtitle: nil,
        with_divider: false
      )
        normalize_params!(
          text: text,
          level: level,
          theme: theme,
          size: size,
          align: align,
          style: style,
          icon: icon,
          subtitle: subtitle,
          with_divider: with_divider
        )

        render_with_template(locals: {
          text: text,
          level: level,
          theme: theme,
          size: size,
          align: align,
          style: style,
          icon: icon,
          subtitle: subtitle,
          with_divider: with_divider
        })
      end

      # @label Istanziazione Diretta
      # @param text text "Testo dell'heading"
      # @param level select { choices: [1, 2, 3, 4, 5, 6] } "Livello dell'heading"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema di colore"
      # @param size select { choices: [small, medium, large] } "Dimensione del testo"
      # @param align select { choices: [left, center, right] } "Allineamento del testo"
      # @param style select { choices: [normal, bold, italic, underline] } "Stile del testo"
      # @param icon text "Nome icona (opzionale)"
      # @param subtitle text "Sottotitolo (opzionale)"
      # @param with_divider toggle "Mostra linea divisoria"
      def raw(
        text: "Titolo di esempio",
        level: 2,
        theme: :default,
        size: :medium,
        align: :left,
        style: :normal,
        icon: nil,
        subtitle: nil,
        with_divider: false
      )
        normalize_params!(
          text: text,
          level: level,
          theme: theme,
          size: size,
          align: align,
          style: style,
          icon: icon,
          subtitle: subtitle,
          with_divider: with_divider
        )

        render_with_template(locals: {
          text: text,
          level: level,
          theme: theme,
          size: size,
          align: align,
          style: style,
          icon: icon,
          subtitle: subtitle,
          with_divider: with_divider
        })
      end

      # @!endgroup

      private

      def normalize_params!(options)
        # Normalizzazione parametri
        options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
        options[:size] = options[:size].to_sym if options[:size].is_a?(String)
        options[:align] = options[:align].to_sym if options[:align].is_a?(String)
        options[:style] = options[:style].to_sym if options[:style].is_a?(String)

        # Pulizia valori vuoti
        options[:icon] = nil if options[:icon].is_a?(String) && options[:icon].strip.empty?
        options[:subtitle] = nil if options[:subtitle].is_a?(String) && options[:subtitle].strip.empty?

        options
      end
    end
  end
end
