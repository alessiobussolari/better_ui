module BetterUi
  module General
    class TooltipComponentPreview < Lookbook::Preview
      # @!group Default
      
      # @label Con Helper
      # @param tooltip_text text "Contenuto del tooltip"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema del tooltip"
      # @param position select { choices: [top, right, bottom, left] } "Posizione del tooltip"
      # @param orientation select { choices: [horizontal, vertical] } "Orientamento"
      # @param style select { choices: [filled, outline, light, flat, ghost] } "Stile del tooltip"
      # @param size select { choices: [small, medium, large] } "Dimensione del tooltip"
      def default(
        tooltip_text: "Questo è un suggerimento.",
        theme: :default,
        position: :top,
        orientation: :horizontal,
        style: :filled,
        size: :medium
      )
        render_with_template(locals: {
          tooltip_text: tooltip_text,
          theme: theme,
          position: position,
          orientation: orientation,
          style: style,
          size: size
        })
      end
      
      # @label Istanziazione Diretta
      # @param tooltip_text text "Contenuto del tooltip"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema del tooltip"
      # @param position select { choices: [top, right, bottom, left] } "Posizione del tooltip"
      # @param orientation select { choices: [horizontal, vertical] } "Orientamento"
      # @param style select { choices: [filled, outline, light, flat, ghost] } "Stile del tooltip"
      # @param size select { choices: [small, medium, large] } "Dimensione del tooltip"
      def raw(
        tooltip_text: "Questo è un suggerimento.",
        theme: :default,
        position: :top,
        orientation: :horizontal,
        style: :filled,
        size: :medium
      )
        render BetterUi::General::TooltipComponent.new(
          tooltip_text: tooltip_text,
          theme: theme,
          position: position,
          orientation: orientation,
          style: style,
          size: size
        ) do
          content_tag :button, "Passa sopra per il tooltip", class: "bui-button bui-button--default bui-button--medium"
        end
      end
      
      # @!endgroup
    end
  end
end
