module BetterUi
  module General
    class BadgeComponentPreview < Lookbook::Preview
      # @!group Esempi Base

      # @label Con Helper
      # @param label text "Testo del badge"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema del badge"
      # @param size select { choices: [small, medium, large] } "Dimensione del badge"
      # @param shape select { choices: [square, rounded] } "Forma del badge"
      # @param style select { choices: [filled, outline] } "Stile del badge"
      # @param variant select { choices: [notification, counter, dot] } "Variante del badge (opzionale)"
      # @param icon text "Nome icona (opzionale)"
      # @param icon_position select { choices: [left, right] } "Posizione icona"
      def default(
        label: "Badge",
        theme: :default,
        size: :medium,
        shape: :rounded,
        style: :filled,
        variant: nil,
        icon: nil,
        icon_position: :left
      )
        normalize_params!(
          label: label,
          theme: theme,
          size: size,
          shape: shape,
          style: style,
          variant: variant,
          icon: icon,
          icon_position: icon_position
        )

        render_with_template(locals: {
          label: label,
          theme: theme,
          size: size,
          shape: shape,
          style: style,
          variant: variant,
          icon: icon,
          icon_position: icon_position
        })
      end

      # @label Istanziazione Diretta
      # @param label text "Testo del badge"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema del badge"
      # @param size select { choices: [small, medium, large] } "Dimensione del badge"
      # @param shape select { choices: [square, rounded] } "Forma del badge"
      # @param style select { choices: [filled, outline] } "Stile del badge"
      # @param variant select { choices: [notification, counter, dot] } "Variante del badge (opzionale)"
      # @param icon text "Nome icona (opzionale)"
      # @param icon_position select { choices: [left, right] } "Posizione icona"
      def raw(
        label: "Badge",
        theme: :default,
        size: :medium,
        shape: :rounded,
        style: :filled,
        variant: nil,
        icon: nil,
        icon_position: :left
      )
        normalize_params!(
          label: label,
          theme: theme,
          size: size,
          shape: shape,
          style: style,
          variant: variant,
          icon: icon,
          icon_position: icon_position
        )

        render_with_template(locals: {
          label: label,
          theme: theme,
          size: size,
          shape: shape,
          style: style,
          variant: variant,
          icon: icon,
          icon_position: icon_position
        })
      end

      # @!endgroup

      private

      def normalize_params!(options)
        # Normalizzazione parametri
        options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
        options[:size] = options[:size].to_sym if options[:size].is_a?(String)
        options[:shape] = options[:shape].to_sym if options[:shape].is_a?(String)
        options[:style] = options[:style].to_sym if options[:style].is_a?(String)
        options[:variant] = options[:variant].present? ? options[:variant].to_sym : nil
        options[:icon_position] = options[:icon_position].to_sym if options[:icon_position].is_a?(String)

        # Pulizia valori vuoti
        options[:icon] = nil if options[:icon].is_a?(String) && options[:icon].strip.empty?

        options
      end
    end
  end
end
