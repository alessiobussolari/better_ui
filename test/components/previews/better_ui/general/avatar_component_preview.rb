module BetterUi
  module General
    class AvatarComponentPreview < Lookbook::Preview
      # @!group Esempi Base
      
      # @label Con Helper
      # @param name text "Nome utente (per iniziali)"
      # @param src text "URL immagine (opzionale)"
      # @param size select { choices: [xxsmall, xsmall, small, medium, large, xlarge, xxlarge] } "Dimensione dell'avatar"
      # @param shape select { choices: [circle, square, rounded] } "Forma dell'avatar"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema dell'avatar"
      # @param style select { choices: [filled, outline, light] } "Stile dell'avatar"
      # @param status select { choices: [online, offline, busy, away] } "Stato online (opzionale)"
      # @param status_position select { choices: [bottom_right, bottom_left, top_right, top_left] } "Posizione dello stato"
      def default(
        name: "Mario Rossi",
        src: nil,
        size: :medium,
        shape: :circle,
        theme: :default,
        style: :filled,
        status: nil,
        status_position: :bottom_right
      )
        normalize_params!(
          name: name,
          src: src,
          size: size,
          shape: shape,
          theme: theme,
          style: style,
          status: status,
          status_position: status_position
        )
        
        render_with_template(locals: {
          name: name,
          src: src,
          size: size,
          shape: shape,
          theme: theme,
          style: style,
          status: status,
          status_position: status_position
        })
      end
      
      # @label Istanziazione Diretta
      # @param name text "Nome utente (per iniziali)"
      # @param src text "URL immagine (opzionale)"
      # @param size select { choices: [xxsmall, xsmall, small, medium, large, xlarge, xxlarge] } "Dimensione dell'avatar"
      # @param shape select { choices: [circle, square, rounded] } "Forma dell'avatar"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema dell'avatar"
      # @param style select { choices: [filled, outline, light] } "Stile dell'avatar"
      # @param status select { choices: [online, offline, busy, away] } "Stato online (opzionale)"
      # @param status_position select { choices: [bottom_right, bottom_left, top_right, top_left] } "Posizione dello stato"
      def raw(
        name: "Mario Rossi",
        src: nil,
        size: :medium,
        shape: :circle,
        theme: :default,
        style: :filled,
        status: nil,
        status_position: :bottom_right
      )
        normalize_params!(
          name: name,
          src: src,
          size: size,
          shape: shape,
          theme: theme,
          style: style,
          status: status,
          status_position: status_position
        )
        
        render BetterUi::General::AvatarComponent.new(
          name: name,
          src: src,
          size: size,
          shape: shape,
          theme: theme,
          style: style,
          status: status,
          status_position: status_position
        )
      end
      
      # @!endgroup
      
      private
      
      def normalize_params!(options)
        # Conversione dei tipi
        options[:size] = options[:size].to_sym if options[:size].is_a?(String)
        options[:shape] = options[:shape].to_sym if options[:shape].is_a?(String)
        options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
        options[:style] = options[:style].to_sym if options[:style].is_a?(String)
        options[:status] = options[:status].present? ? options[:status].to_sym : nil
        options[:status_position] = options[:status_position].to_sym if options[:status_position].is_a?(String)
        
        options
      end
      
      # @!group esempi_specifici
      
      # @label Dimensioni
      def sizes
        render_with_template(locals: {
          variants: [
            { label: "XXSmall", size: :xxsmall },
            { label: "XSmall", size: :xsmall },
            { label: "Small", size: :small },
            { label: "Medium", size: :medium },
            { label: "Large", size: :large },
            { label: "XLarge", size: :xlarge },
            { label: "XXLarge", size: :xxlarge }
          ]
        })
      end
      
      # @label Forme
      def shapes
        render_with_template(locals: {
          variants: [
            { label: "Cerchio", shape: :circle },
            { label: "Quadrato", shape: :square },
            { label: "Arrotondato", shape: :rounded }
          ]
        })
      end

      # @label Colori
      def colors
        render_with_template(locals: {
          variants: [
            { label: "Default", type: :default },
            { label: "White", type: :white },
            { label: "Red", type: :red },
            { label: "Rose", type: :rose },
            { label: "Orange", type: :orange },
            { label: "Green", type: :green },
            { label: "Blue", type: :blue },
            { label: "Yellow", type: :yellow },
            { label: "Violet", type: :violet },
            { label: "Gray", type: :gray }
          ]
        })
      end
      
      # @label Con immagine
      def with_image
        render BetterUi::General::AvatarComponent.new(
          name: "John Doe",
          src: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
          size: :large
        )
      end
      
      # @label Stati online
      def online_states
        render_with_template(locals: {})
      end
      
      # @label Gruppo di avatar
      def avatar_group
        render_with_template(locals: {})
      end
      # @!endgroup
    end
  end
end
