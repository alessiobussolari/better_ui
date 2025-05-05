module BetterUi
  module General
    class HeadingComponentPreview < ViewComponent::Preview
      # @!group Default
      
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
        render BetterUi::General::HeadingComponent.new(
          level: level,
          theme: theme,
          align: align,
          size: size,
          style: style,
          icon: icon,
          subtitle: subtitle,
          with_divider: with_divider
        ).with_content(text)
      end
      
      # @!endgroup
    end
  end
end
