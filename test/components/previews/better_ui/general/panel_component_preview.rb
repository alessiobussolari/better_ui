module BetterUi
  module General
    class PanelComponentPreview < ViewComponent::Preview
      # @!group Default
      
      # @label Con Helper
      # @param title text "Titolo del pannello (opzionale)"
      # @param body text "Contenuto del pannello (opzionale)"
      # @param header text "Header personalizzato (opzionale)"
      # @param footer text "Footer del pannello (opzionale)"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema di colore"
      # @param orientation select { choices: [horizontal, vertical] } "Orientamento"
      # @param style select { choices: [default, flat, raised, bordered] } "Stile del pannello"
      # @param padding select { choices: [none, small, medium, large] } "Dimensione del padding interno"
      # @param radius select { choices: [none, small, medium, large, full] } "Raggio dei bordi"
      def default(
        title: "Titolo Pannello",
        body: "Questo è il contenuto del pannello.",
        header: nil,
        footer: nil,
        theme: :default,
        orientation: :horizontal,
        style: :default,
        padding: :medium,
        radius: :small
      )
        render_with_template(locals: {
          title: title,
          body: body,
          header: header,
          footer: footer,
          theme: theme,
          orientation: orientation,
          style: style,
          padding: padding,
          radius: radius
        })
      end
      
      # @label Istanziazione Diretta
      # @param title text "Titolo del pannello (opzionale)"
      # @param body text "Contenuto del pannello (opzionale)"
      # @param header text "Header personalizzato (opzionale)"
      # @param footer text "Footer del pannello (opzionale)"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema di colore"
      # @param orientation select { choices: [horizontal, vertical] } "Orientamento"
      # @param style select { choices: [default, flat, raised, bordered] } "Stile del pannello"
      # @param padding select { choices: [none, small, medium, large] } "Dimensione del padding interno"
      # @param radius select { choices: [none, small, medium, large, full] } "Raggio dei bordi"
      def raw(
        title: "Titolo Pannello",
        body: "Questo è il contenuto del pannello.",
        header: nil,
        footer: nil,
        theme: :default,
        orientation: :horizontal,
        style: :default,
        padding: :medium,
        radius: :small
      )
        render BetterUi::General::PanelComponent.new(
          title: title,
          body: body,
          header: header,
          footer: footer,
          theme: theme,
          orientation: orientation,
          style: style,
          padding: padding,
          radius: radius
        )
      end
      
      # @!endgroup
    end
  end
end 