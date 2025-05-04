module BetterUi
  module General
    class AvatarComponentPreview < ViewComponent::Preview
      # Avatar configurabile
      #
      # @param name text "Nome utente (per iniziali)"
      # @param size select { choices: [xxsmall, xsmall, small, medium, large, xlarge, xxlarge] } "Dimensione dell'avatar"
      # @param shape select { choices: [circle, square, rounded] } "Forma dell'avatar"
      # @param type select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Colore dell'avatar"
      # @param status select { choices: [online, offline, busy, away] } "Stato online (opzionale)"
      # @param status_position select { choices: [bottom_right, bottom_left, top_right, top_left] } "Posizione dello stato"
      def default(
        name: "Mario Rossi",
        size: :medium,
        shape: :circle,
        type: :default,
        status: nil,
        status_position: :bottom_right
      )
        # Conversione dei tipi
        size = size.to_sym if size.is_a?(String)
        shape = shape.to_sym if shape.is_a?(String)
        type = type.to_sym if type.is_a?(String)
        status = status.present? ? status.to_sym : nil
        status_position = status_position.to_sym if status_position.is_a?(String)
        
        # Validazione
        valid_sizes = [:xxsmall, :xsmall, :small, :medium, :large, :xlarge, :xxlarge]
        valid_shapes = [:circle, :square, :rounded]
        valid_types = [:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet, :gray]
        valid_statuses = [nil, :online, :offline, :busy, :away]
        valid_positions = [:bottom_right, :bottom_left, :top_right, :top_left]
        
        size = :medium unless valid_sizes.include?(size)
        shape = :circle unless valid_shapes.include?(shape)
        type = :default unless valid_types.include?(type)
        status = nil unless valid_statuses.include?(status)
        status_position = :bottom_right unless valid_positions.include?(status_position)
        
        render_with_template(locals: {
          name: name,
          size: size,
          shape: shape,
          type: type,
          status: status,
          status_position: status_position
        })
      end

      # @!group Esempi specifici
      
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