module BetterUi
  module General
    class ButtonComponentPreview < Lookbook::Preview
      # @!group Default
      
      # @label Default
      # @param label text "Testo del bottone"
      # @param type select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tipo di bottone"
      # @param size select { choices: [small, medium, large] } "Dimensione del bottone"
      # @param rounded select { choices: [none, small, medium, large, full] } "Tipo di border-radius"
      # @param full_width toggle "Larghezza completa"
      # @param disabled toggle "Disabilitato"
      # @param icon text "Nome icona (opzionale)"
      # @param icon_position select { choices: [left, right] } "Posizione icona"
      # @param href text "URL per il link (opzionale)"
      # @param method select { choices: [get, post, put, patch, delete] } "Metodo HTTP (opzionale)"
      def default(
        label: "Bottone",
        type: :default,
        size: :medium,
        rounded: :small,
        full_width: false,
        disabled: false,
        icon: nil,
        icon_position: :left,
        href: nil,
        method: nil
      )
        # Normalizzazione parametri
        type = type.to_sym if type.is_a?(String)
        size = size.to_sym if size.is_a?(String)
        rounded = rounded.to_sym if rounded.is_a?(String)
        icon_position = icon_position.to_sym if icon_position.is_a?(String)
        method = method.to_sym if method.is_a?(String) && !method.empty?
        
        # Pulizia valori vuoti
        icon = nil if icon.is_a?(String) && icon.strip.empty?
        href = nil if href.is_a?(String) && href.strip.empty?
        
        render_with_template(locals: {
          label: label,
          type: type,
          size: size,
          rounded: rounded,
          full_width: full_width,
          disabled: disabled,
          icon: icon,
          icon_position: icon_position,
          href: href,
          method: method
        })
      end
      
      # @!endgroup
      
      # @!group Raw
      
      # @label Raw
      # @param label text "Testo del bottone"
      # @param type select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tipo di bottone"
      # @param size select { choices: [small, medium, large] } "Dimensione del bottone"
      # @param rounded select { choices: [none, small, medium, large, full] } "Tipo di border-radius"
      # @param full_width toggle "Larghezza completa"
      # @param disabled toggle "Disabilitato"
      # @param icon text "Nome icona (opzionale)"
      # @param icon_position select { choices: [left, right] } "Posizione icona"
      # @param href text "URL per il link (opzionale)"
      # @param method select { choices: [get, post, put, patch, delete] } "Metodo HTTP (opzionale)"
      def raw(
        label: "Bottone",
        type: :default,
        size: :medium,
        rounded: :small,
        full_width: false,
        disabled: false,
        icon: nil,
        icon_position: :left,
        href: nil,
        method: nil
      )
        # Normalizzazione parametri
        type = type.to_sym if type.is_a?(String)
        size = size.to_sym if size.is_a?(String)
        rounded = rounded.to_sym if rounded.is_a?(String)
        icon_position = icon_position.to_sym if icon_position.is_a?(String)
        method = method.to_sym if method.is_a?(String) && !method.empty?
        
        # Pulizia valori vuoti
        icon = nil if icon.is_a?(String) && icon.strip.empty?
        href = nil if href.is_a?(String) && href.strip.empty?
        
        render_with_template(locals: {
          label: label,
          type: type,
          size: size,
          rounded: rounded,
          full_width: full_width,
          disabled: disabled,
          icon: icon,
          icon_position: icon_position,
          href: href,
          method: method
        })
      end
      
      # @!endgroup
      
      # @!group Esempi
      
      # @label Tipo
      def tipo
        render_with_template(locals: {
          variants: [
            { label: "Default", type: :default },
            { label: "White", type: :white },
            { label: "Red", type: :red },
            { label: "Green", type: :green },
            { label: "Blue", type: :blue },
            { label: "Yellow", type: :yellow },
            { label: "Violet", type: :violet }
          ]
        })
      end
      
      # @label Dimensione
      def dimensione
        render_with_template(locals: {
          variants: [
            { label: "Small", size: :small },
            { label: "Medium", size: :medium },
            { label: "Large", size: :large }
          ]
        })
      end
      
      # @label Border Radius
      def border_radius
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
      
      # @label Larghezza Completa
      def larghezza_completa
        render_with_template(locals: {
          variants: [
            { label: "Normale", full_width: false },
            { label: "Full width", full_width: true }
          ]
        })
      end
      
      # @label Con Icona
      def con_icona
        render_with_template(locals: {
          variants: [
            { label: "Icona sx", icon: "home", icon_position: :left },
            { label: "Icona dx", icon: "home", icon_position: :right }
          ]
        })
      end
      
      # @label Disabilitato
      def disabilitato
        render_with_template(locals: {
          variants: [
            { label: "Abilitato", disabled: false },
            { label: "Disabilitato", disabled: true }
          ]
        })
      end
      
      # @!endgroup
    end
  end
end 