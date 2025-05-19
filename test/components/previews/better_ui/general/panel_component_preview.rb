module BetterUi
  module General
    class PanelComponentPreview < Lookbook::Preview
      # @!group Esempi Base

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
        normalize_params!(
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
        normalize_params!(
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

      # @!endgroup

      private

      def normalize_params!(options)
        # Normalizzazione parametri
        options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
        options[:orientation] = options[:orientation].to_sym if options[:orientation].is_a?(String)
        options[:style] = options[:style].to_sym if options[:style].is_a?(String)
        options[:padding] = options[:padding].to_sym if options[:padding].is_a?(String)
        options[:radius] = options[:radius].to_sym if options[:radius].is_a?(String)

        # Pulizia valori vuoti
        options[:title] = nil if options[:title].is_a?(String) && options[:title].strip.empty?
        options[:body] = nil if options[:body].is_a?(String) && options[:body].strip.empty?
        options[:header] = nil if options[:header].is_a?(String) && options[:header].strip.empty?
        options[:footer] = nil if options[:footer].is_a?(String) && options[:footer].strip.empty?

        options
      end
    end
  end
end 
