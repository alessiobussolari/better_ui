require_dependency 'better_ui/general/components/icon' # Tentativo di forzare il caricamento

module BetterUi
  module General
    module Icon
      class ComponentPreview < Lookbook::Preview
        # @!group default

        # @label Con Helper
        # @param name text "Nome dell'icona"
        # @param style select { choices: [solid, regular, brands] } "Stile dell'icona"
        # @param size select { choices: [small, medium, large] } "Dimensione dell'icona"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema dell'icona"
        # @param spin toggle "Rotazione continua"
        # @param pulse toggle "Pulsazione"
        # @param border toggle "Con bordo"
        # @param fixed_width toggle "Larghezza fissa"
        # @param rotation select { choices: [0, 90, 180, 270] } "Rotazione (gradi)"
        # @param flip select { choices: [none, horizontal, vertical, both] } "Flip"
        def default(
          name: "star",
          style: :solid,
          size: :medium,
          theme: :default,
          spin: false,
          pulse: false,
          border: false,
          fixed_width: false,
          rotation: nil,
          flip: nil
        )
          normalize_params!(
            name: name,
            style: style,
            size: size,
            theme: theme,
            spin: spin,
            pulse: pulse,
            border: border,
            fixed_width: fixed_width,
            rotation: rotation,
            flip: flip
          )

          bui_icon(
            name,
            style: style,
            size: size,
            theme: theme,
            spin: spin,
            pulse: pulse,
            border: border,
            fixed_width: fixed_width,
            rotation: rotation,
            flip: flip
          )
        end

        # @label Istanziazione Diretta
        # @param name text "Nome dell'icona"
        # @param style select { choices: [solid, regular, brands] } "Stile dell'icona"
        # @param size select { choices: [small, medium, large] } "Dimensione dell'icona"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema dell'icona"
        # @param spin toggle "Rotazione continua"
        # @param pulse toggle "Pulsazione"
        # @param border toggle "Con bordo"
        # @param fixed_width toggle "Larghezza fissa"
        # @param rotation select { choices: [0, 90, 180, 270] } "Rotazione (gradi)"
        # @param flip select { choices: [none, horizontal, vertical, both] } "Flip"
        def raw(
          name: "star",
          style: :solid,
          size: :medium,
          theme: :default,
          spin: false,
          pulse: false,
          border: false,
          fixed_width: false,
          rotation: nil,
          flip: nil
        )
          normalize_params!(
            name: name,
            style: style,
            size: size,
            theme: theme,
            spin: spin,
            pulse: pulse,
            border: border,
            fixed_width: fixed_width,
            rotation: rotation,
            flip: flip
          )

          render BetterUi::General::Icon::Component.new(
            name: name,
            style: style,
            size: size,
            theme: theme,
            spin: spin,
            pulse: pulse,
            border: border,
            fixed_width: fixed_width,
            rotation: rotation,
            flip: flip
          )
        end

        # @!endgroup

        private

        def normalize_params!(options)
          # Conversione dei tipi
          options[:style] = options[:style].to_sym if options[:style].is_a?(String)
          options[:size] = options[:size].to_sym if options[:size].is_a?(String)
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:spin] = options[:spin] == true || options[:spin] == "true"
          options[:pulse] = options[:pulse] == true || options[:pulse] == "true"
          options[:border] = options[:border] == true || options[:border] == "true"
          options[:fixed_width] = options[:fixed_width] == true || options[:fixed_width] == "true"

          if options[:rotation].present?
            options[:rotation] = options[:rotation].to_i if options[:rotation].is_a?(String)
          end

          if options[:flip].present? && options[:flip] != "none"
            options[:flip] = options[:flip].to_sym if options[:flip].is_a?(String)
          else
            options[:flip] = nil
          end

          # Validazione
          valid_styles = [:solid, :regular, :brands]
          valid_sizes = [:small, :medium, :large]
          valid_themes = [:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet]
          valid_rotations = [nil, 0, 90, 180, 270]
          valid_flips = [nil, :horizontal, :vertical, :both]

          options[:style] = :solid unless valid_styles.include?(options[:style])
          options[:size] = :medium unless valid_sizes.include?(options[:size])
          options[:theme] = :default unless valid_themes.include?(options[:theme])
          options[:rotation] = nil unless valid_rotations.include?(options[:rotation])
          options[:flip] = nil unless valid_flips.include?(options[:flip])

          options
        end
      end
    end
  end
end
