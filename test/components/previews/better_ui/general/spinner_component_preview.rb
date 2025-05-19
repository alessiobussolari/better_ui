module BetterUi
  module General
    class SpinnerComponentPreview < Lookbook::Preview
      # @!group Esempi Base

      # @label Con Helper
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema di colore"
      # @param size select { choices: [small, medium, large] } "Dimensione dello spinner"
      # @param orientation select { choices: [horizontal, vertical] } "Orientamento"
      # @param style select { choices: [default, outline, filled, dotted] } "Stile dello spinner"
      # @param label text "Testo da mostrare (opzionale)"
      # @param fullscreen toggle "Modalità fullscreen"
      def default(
        theme: :default,
        size: :medium,
        orientation: :horizontal,
        style: :default,
        label: nil,
        fullscreen: false
      )
        normalize_params!(
          theme: theme,
          size: size,
          orientation: orientation,
          style: style,
          label: label,
          fullscreen: fullscreen
        )

        render_with_template(locals: {
          theme: theme,
          size: size,
          orientation: orientation,
          style: style,
          label: label,
          fullscreen: fullscreen
        })
      end

      # @label Istanziazione Diretta
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema di colore"
      # @param size select { choices: [small, medium, large] } "Dimensione dello spinner"
      # @param orientation select { choices: [horizontal, vertical] } "Orientamento"
      # @param style select { choices: [default, outline, filled, dotted] } "Stile dello spinner"
      # @param label text "Testo da mostrare (opzionale)"
      # @param fullscreen toggle "Modalità fullscreen"
      def raw(
        theme: :default,
        size: :medium,
        orientation: :horizontal,
        style: :default,
        label: nil,
        fullscreen: false
      )
        normalize_params!(
          theme: theme,
          size: size,
          orientation: orientation,
          style: style,
          label: label,
          fullscreen: fullscreen
        )

        render_with_template(locals: {
          theme: theme,
          size: size,
          orientation: orientation,
          style: style,
          label: label,
          fullscreen: fullscreen
        })
      end

      # @!endgroup

      private

      def normalize_params!(options)
        # Normalizzazione parametri
        options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
        options[:size] = options[:size].to_sym if options[:size].is_a?(String)
        options[:orientation] = options[:orientation].to_sym if options[:orientation].is_a?(String)
        options[:style] = options[:style].to_sym if options[:style].is_a?(String)

        # Pulizia valori vuoti
        options[:label] = nil if options[:label].is_a?(String) && options[:label].strip.empty?

        options
      end
    end
  end
end 
