module BetterUi
  module General
    class TagComponentPreview < Lookbook::Preview
      # @!group Default
      
      # @label Con Helper
      # @param text text "Testo del tag"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema del tag"
      # @param orientation select { choices: [horizontal, vertical] } "Orientamento"
      # @param style select { choices: [filled, outline, light, ghost, flat, bordered] } "Stile del tag"
      # @param size select { choices: [small, medium, large] } "Dimensione del tag"
      # @param shape select { choices: [rounded, square, pill] } "Forma del tag"
      # @param clickable toggle "Cliccabile"
      # @param selected toggle "Selezionato"
      # @param removable toggle "Rimovibile"
      # @param icon text "Nome icona (opzionale)"
      def default(
        text: "Tag di esempio",
        theme: :default,
        orientation: :horizontal,
        style: :filled,
        size: :medium,
        shape: :rounded,
        clickable: false,
        selected: false,
        removable: false,
        icon: nil
      )
        render_with_template(locals: {
          text: text,
          theme: theme,
          orientation: orientation,
          style: style,
          size: size,
          shape: shape,
          clickable: clickable,
          selected: selected,
          removable: removable,
          icon: icon
        })
      end
      
      # @label Istanziazione Diretta
      # @param text text "Testo del tag"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema del tag"
      # @param orientation select { choices: [horizontal, vertical] } "Orientamento"
      # @param style select { choices: [filled, outline, light, ghost, flat, bordered] } "Stile del tag"
      # @param size select { choices: [small, medium, large] } "Dimensione del tag"
      # @param shape select { choices: [rounded, square, pill] } "Forma del tag"
      # @param clickable toggle "Cliccabile"
      # @param selected toggle "Selezionato"
      # @param removable toggle "Rimovibile"
      # @param icon text "Nome icona (opzionale)"
      def raw(
        text: "Tag di esempio",
        theme: :default,
        orientation: :horizontal,
        style: :filled,
        size: :medium,
        shape: :rounded,
        clickable: false,
        selected: false,
        removable: false,
        icon: nil
      )
        render BetterUi::General::TagComponent.new(
          text: text,
          theme: theme,
          orientation: orientation,
          style: style,
          size: size,
          shape: shape,
          clickable: clickable,
          selected: selected,
          removable: removable,
          icon: icon
        )
      end
      
      # @!endgroup
    end
  end
end
