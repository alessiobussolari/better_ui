module BetterUi
  module General
    module Avatar
      class ComponentPreview < Lookbook::Preview
        # @!group Esempi Base

        # @label Con Helper
        # @param name text "Nome per le iniziali"
        # @param src url "URL dell'immagine"
        # @param size select { choices: [xxsmall, xsmall, small, medium, large, xlarge, xxlarge] } "Dimensione dell'avatar"
        # @param shape select { choices: [circle, square, rounded] } "Forma dell'avatar"
        # @param status select { choices: [online, offline, busy, away] } "Stato online"
        # @param status_position select { choices: [bottom_right, bottom_left, top_right, top_left] } "Posizione indicatore stato"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema dell'avatar"
        # @param style select { choices: [filled, outline, light] } "Stile dell'avatar"
        def default(
          name: "Mario Rossi",
          src: "",
          size: :medium,
          shape: :circle,
          status: "",
          status_position: :bottom_right,
          theme: :white,
          style: :filled
        )
          normalized = normalize_params!(
            name: name,
            src: src,
            size: size,
            shape: shape,
            status: status,
            status_position: status_position,
            theme: theme,
            style: style
          )

          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param name text "Nome per le iniziali"
        # @param src url "URL dell'immagine"
        # @param size select { choices: [xxsmall, xsmall, small, medium, large, xlarge, xxlarge] } "Dimensione dell'avatar"
        # @param shape select { choices: [circle, square, rounded] } "Forma dell'avatar"
        # @param status select { choices: [online, offline, busy, away] } "Stato online"
        # @param status_position select { choices: [bottom_right, bottom_left, top_right, top_left] } "Posizione indicatore stato"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema dell'avatar"
        # @param style select { choices: [filled, outline, light] } "Stile dell'avatar"
        def raw(
          name: "Mario Rossi",
          src: "",
          size: :medium,
          shape: :circle,
          status: "",
          status_position: :bottom_right,
          theme: :white,
          style: :filled
        )
          normalized = normalize_params!(
            name: name,
            src: src,
            size: size,
            shape: shape,
            status: status,
            status_position: status_position,
            theme: theme,
            style: style
          )

          render BetterUi::General::Avatar::Component.new(**normalized)
        end

        # @!endgroup

        private

        def normalize_params!(options)
          # Normalizzazione parametri simbolici
          options[:size] = options[:size].to_sym if options[:size].is_a?(String)
          options[:shape] = options[:shape].to_sym if options[:shape].is_a?(String)
          options[:status_position] = options[:status_position].to_sym if options[:status_position].is_a?(String)
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:style] = options[:style].to_sym if options[:style].is_a?(String)

          # Gestione stato (può essere vuoto)
          if options[:status].is_a?(String)
            options[:status] = options[:status].strip.empty? ? nil : options[:status].to_sym
          end

          # Pulizia valori vuoti
          options[:name] = nil if options[:name].is_a?(String) && options[:name].strip.empty?
          options[:src] = nil if options[:src].is_a?(String) && options[:src].strip.empty?

          options
        end
      end
    end
  end
end
