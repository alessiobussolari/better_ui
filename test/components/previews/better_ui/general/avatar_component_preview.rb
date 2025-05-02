module BetterUi
  module General
    class AvatarComponentPreview < ViewComponent::Preview
      # Avatar configurabile
      #
      # @param name text "Nome utente (per iniziali)"
      # @param size select { choices: [xs, sm, md, lg, xl, 2xl, 3xl] } "Dimensione dell'avatar"
      # @param shape select { choices: [circle, square, rounded] } "Forma dell'avatar"
      # @param status select { choices: [online, offline, busy, away, ] } "Stato online (opzionale)"
      # @param status_position select { choices: [bottom_right, bottom_left, top_right, top_left] } "Posizione dello stato"
      def default(
        name: "Mario Rossi",
        size: :md,
        shape: :circle,
        status: nil,
        status_position: :bottom_right
      )
        # Conversione dei tipi
        size = size.to_sym if size.is_a?(String)
        shape = shape.to_sym if shape.is_a?(String)
        status = status.present? ? status.to_sym : nil
        status_position = status_position.to_sym if status_position.is_a?(String)
        
        # Validazione
        valid_sizes = [:xs, :sm, :md, :lg, :xl, :'2xl', :'3xl']
        valid_shapes = [:circle, :square, :rounded]
        valid_statuses = [nil, :online, :offline, :busy, :away]
        valid_positions = [:bottom_right, :bottom_left, :top_right, :top_left]
        
        size = :md unless valid_sizes.include?(size)
        shape = :circle unless valid_shapes.include?(shape)
        status = nil unless valid_statuses.include?(status)
        status_position = :bottom_right unless valid_positions.include?(status_position)
        
        render BetterUi::General::AvatarComponent.new(
          name: name,
          size: size,
          shape: shape,
          status: status,
          status_position: status_position
        )
      end

      # @!group Esempi specifici
      
      # @label Dimensioni
      def sizes(preview_params = {})
        render_with_template(locals: {})
      end
      
      # @label Forme
      def shapes(preview_params = {})
        render_with_template(locals: {})
      end
      
      # @label Con immagine
      def with_image(preview_params = {})
        render BetterUi::General::AvatarComponent.new(
          name: "John Doe",
          src: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
          size: :lg
        )
      end
      
      # @label Stati online
      def online_states(preview_params = {})
        render_with_template(locals: {})
      end
      
      # @label Gruppo di avatar
      def avatar_group(preview_params = {})
        render_with_template(locals: {})
      end
      # @!endgroup
    end
  end
end 