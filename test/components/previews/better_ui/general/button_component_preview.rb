module BetterUi
  module General
    class ButtonComponentPreview < ViewComponent::Preview
      # Bottone configurabile
      #
      # @param label text "Testo del bottone"
      # @param type select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tipo di bottone"
      # @param size select { choices: [small, medium, large] } "Dimensione del bottone"
      # @param rounded select { choices: [none, small, medium, large, full] } "Tipo di border-radius"
      # @param full_width toggle "Larghezza completa"
      # @param disabled toggle "Disabilitato"
      # @param icon text "Nome icona (opzionale)"
      # @param icon_position select { choices: [left, right] } "Posizione icona"
      # @param href text "URL per il link (opzionale)"
      def default(
        label: "Bottone",
        type: :default,
        size: :medium,
        rounded: :small,
        full_width: false,
        disabled: false,
        icon: nil,
        icon_position: :left,
        href: nil
      )
        # Conversione dei tipi
        type = type.to_sym if type.is_a?(String)
        size = size.to_sym if size.is_a?(String)
        rounded = rounded.to_sym if rounded.is_a?(String)
        icon_position = icon_position.to_sym if icon_position.is_a?(String)
        full_width = full_width == true || full_width == "true"
        disabled = disabled == true || disabled == "true"
        
        # Validazione
        valid_types = [:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet]
        valid_sizes = [:small, :medium, :large]
        valid_rounded = [:none, :small, :medium, :large, :full]
        valid_icon_positions = [:left, :right]
        
        type = :default unless valid_types.include?(type)
        size = :medium unless valid_sizes.include?(size)
        rounded = :small unless valid_rounded.include?(rounded)
        icon_position = :left unless valid_icon_positions.include?(icon_position)
        
        # Pulisci valori vuoti
        icon = nil if icon.is_a?(String) && icon.strip.empty?
        href = nil if href.is_a?(String) && href.strip.empty?
        
        render BetterUi::General::ButtonComponent.new(
          label: label, 
          type: type,
          size: size,
          rounded: rounded,
          full_width: full_width,
          disabled: disabled,
          icon: icon,
          icon_position: icon_position,
          href: href
        )
      end
      
      # @!group Esempi specifici
      
      # @label Con contenuto personalizzato
      def custom_content
        render(BetterUi::General::ButtonComponent.new(type: :green)) do
          "<span>Contenuto</span><span class='ml-2'>personalizzato</span>".html_safe
        end
      end
      
      # @label Link con metodo
      def link_with_method
        render BetterUi::General::ButtonComponent.new(
          label: "Logout", 
          type: :red, 
          href: "#", 
          method: :delete
        )
      end
      
      # @label Varianti di border-radius
      def border_radius_variants
        render_with_template(locals: {
          variants: [
            { label: "Nessun radius", rounded: :none },
            { label: "Small", rounded: :small },
            { label: "Medium", rounded: :medium },
            { label: "Large", rounded: :large },
            { label: "Full (circolare)", rounded: :full }
          ]
        })
      end
      
      # @!endgroup
    end
  end
end 