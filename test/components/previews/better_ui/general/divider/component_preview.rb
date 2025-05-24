module BetterUi
  module General
    module Divider
      class ComponentPreview < Lookbook::Preview
        # @!group Esempi Base
        
        # @label Con Helper
        # @param orientation select { choices: [horizontal, vertical] } "Orientamento del divisore"
        # @param style select { choices: [solid, dashed, dotted, double] } "Stile del divisore"
        # @param size select { choices: [thin, medium, thick] } "Dimensione del divisore"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del divisore"
        # @param label text "Testo del divisore (opzionale)"
        # @param height text "Altezza (solo per orientamento verticale, es. 100px)"
        def default(
          orientation: :horizontal,
          style: :solid,
          size: :medium,
          theme: :white,
          label: "",
          height: "50px"
        )
          normalized = normalize_params!(
            orientation: orientation,
            style: style,
            size: size,
            theme: theme,
            label: label,
            height: height
          )
          
          render_with_template(locals: normalized)
        end
        
        # @label Istanziazione Diretta
        # @param orientation select { choices: [horizontal, vertical] } "Orientamento del divisore"
        # @param style select { choices: [solid, dashed, dotted, double] } "Stile del divisore"
        # @param size select { choices: [thin, medium, thick] } "Dimensione del divisore"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del divisore"
        # @param label text "Testo del divisore (opzionale)"
        # @param height text "Altezza (solo per orientamento verticale, es. 100px)"
        def raw(
          orientation: :horizontal,
          style: :solid,
          size: :medium,
          theme: :white,
          label: "",
          height: "50px"
        )
          normalized = normalize_params!(
            orientation: orientation,
            style: style,
            size: size,
            theme: theme,
            label: label,
            height: height
          )
          
          render BetterUi::General::Divider::Component.new(**normalized)
        end
        
        # @!endgroup
        
        private
        
        def normalize_params!(options)
          # Normalizzazione parametri
          options[:orientation] = options[:orientation].to_sym if options[:orientation].is_a?(String)
          options[:style] = options[:style].to_sym if options[:style].is_a?(String)
          options[:size] = options[:size].to_sym if options[:size].is_a?(String)
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          
          # Pulizia valori vuoti
          options[:label] = nil if options[:label].is_a?(String) && options[:label].strip.empty?
          options[:height] = nil if options[:height].is_a?(String) && options[:height].strip.empty?
          
          options
        end
      end
    end
  end
end
