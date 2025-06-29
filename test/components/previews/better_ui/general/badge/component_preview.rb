module BetterUi
  module General
    module Badge
      class ComponentPreview < Lookbook::Preview
        # @!group Esempi Base

        # @label Con Helper
        # @param label text "Testo del badge"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema del badge"
        # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del badge"
        # @param shape select { choices: [square, rounded] } "Forma del badge"
        # @param style select { choices: [filled, outline] } "Stile del badge"
        # @param variant select { choices: ["", notification, counter, dot] } "Variante del badge (opzionale)"
        # @param icon text "Nome icona (opzionale)"
        # @param icon_position select { choices: [left, right] } "Posizione icona"
        def default(
          label: "Badge",
          theme: :default,
          size: :md,
          shape: :rounded,
          style: :filled,
          variant: "",
          icon: "",
          icon_position: :left
        )
          normalized = normalize_params!(
            label: label,
            theme: theme,
            size: size,
            shape: shape,
            style: style,
            variant: variant,
            icon: icon,
            icon_position: icon_position
          )

          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param label text "Testo del badge"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema del badge"
        # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del badge"
        # @param shape select { choices: [square, rounded] } "Forma del badge"
        # @param style select { choices: [filled, outline] } "Stile del badge"
        # @param variant select { choices: ["", notification, counter, dot] } "Variante del badge (opzionale)"
        # @param icon text "Nome icona (opzionale)"
        # @param icon_position select { choices: [left, right] } "Posizione icona"
        def raw(
          label: "Badge",
          theme: :default,
          size: :md,
          shape: :rounded,
          style: :filled,
          variant: "",
          icon: "",
          icon_position: :left
        )
          normalized = normalize_params!(
            label: label,
            theme: theme,
            size: size,
            shape: shape,
            style: style,
            variant: variant,
            icon: icon,
            icon_position: icon_position
          )

          render BetterUi::General::Badge::Component.new(**normalized)
        end

        # @!endgroup

        private

        def normalize_params!(options)
          # Normalizzazione parametri
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:size] = options[:size].to_sym if options[:size].is_a?(String)
          options[:shape] = options[:shape].to_sym if options[:shape].is_a?(String)
          options[:style] = options[:style].to_sym if options[:style].is_a?(String)
          options[:icon_position] = options[:icon_position].to_sym if options[:icon_position].is_a?(String)
          
          # Gestione variant - converte stringa vuota in nil
          if options[:variant].is_a?(String)
            options[:variant] = options[:variant].strip.empty? ? nil : options[:variant].to_sym
          end

          # Pulizia valori vuoti
          options[:icon] = nil if options[:icon].is_a?(String) && options[:icon].strip.empty?

          options
        end
      end
    end
  end
end
