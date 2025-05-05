module BetterUi
  module General
    class SpinnerComponentPreview < ViewComponent::Preview
      # @!group Default
      
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
        render BetterUi::General::SpinnerComponent.new(
          theme: theme,
          size: size,
          orientation: orientation,
          style: style,
          label: label,
          fullscreen: fullscreen
        )
      end
      
      # @!endgroup
    end
  end
end 