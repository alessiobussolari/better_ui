module BetterUi
  module General
    class ProgressComponentPreview < Lookbook::Preview
      # @!group Default
      
      # @label Con Helper
      # @param value range { min: 0, max: 100, step: 1 } "Percentuale di completamento"
      # @param type select { choices: [linear, circular] } "Tipo di progress"
      # @param orientation select { choices: [horizontal, vertical] } "Orientamento (solo per linear)"
      # @param mode select { choices: [determinate, indeterminate] } "Modalità"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema"
      # @param style select { choices: [filled, outline, flat] } "Stile"
      # @param size select { choices: [small, medium, large] } "Dimensione"
      # @param label toggle "Mostra etichetta percentuale"
      def default(
        value: 50,
        type: :linear,
        orientation: :horizontal,
        mode: :determinate,
        theme: :default,
        style: :filled,
        size: :medium,
        label: true
      )
        render_with_template(locals: {
          value: value,
          type: type,
          orientation: orientation,
          mode: mode,
          theme: theme,
          style: style,
          size: size,
          label: label
        })
      end
      
      # @label Istanziazione Diretta
      # @param value range { min: 0, max: 100, step: 1 } "Percentuale di completamento"
      # @param type select { choices: [linear, circular] } "Tipo di progress"
      # @param orientation select { choices: [horizontal, vertical] } "Orientamento (solo per linear)"
      # @param mode select { choices: [determinate, indeterminate] } "Modalità"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema"
      # @param style select { choices: [filled, outline, flat] } "Stile"
      # @param size select { choices: [small, medium, large] } "Dimensione"
      # @param label toggle "Mostra etichetta percentuale"
      def raw(
        value: 50,
        type: :linear,
        orientation: :horizontal,
        mode: :determinate,
        theme: :default,
        style: :filled,
        size: :medium,
        label: true
      )
        render BetterUi::General::ProgressComponent.new(
          value: value,
          type: type,
          orientation: orientation,
          mode: mode,
          theme: theme,
          style: style,
          size: size,
          label: label
        )
      end
      
      # @!endgroup
    end
  end
end
