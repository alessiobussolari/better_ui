module BetterUi
  module General
    class BadgeComponentPreview < ViewComponent::Preview
      # @!group Default
      
      # @label Default
      # @param label text "Testo del badge"
      # @param type select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tipo di badge"
      # @param size select { choices: [small, medium, large] } "Dimensione del badge"
      # @param rounded select { choices: [none, small, medium, large, full] } "Tipo di border-radius"
      # @param outline toggle "Stile outline"
      # @param notification toggle "Stile notifica"
      # @param icon text "Nome icona (opzionale)"
      # @param icon_position select { choices: [left, right] } "Posizione icona"
      def default(
        label: "Badge",
        type: :default,
        size: :medium,
        rounded: :medium,
        outline: false,
        notification: false,
        icon: nil,
        icon_position: :left
      )
        # Normalizzazione parametri
        type = type.to_sym if type.is_a?(String)
        size = size.to_sym if size.is_a?(String)
        rounded = rounded.to_sym if rounded.is_a?(String)
        icon_position = icon_position.to_sym if icon_position.is_a?(String)
        outline = outline == true || outline == "true"
        notification = notification == true || notification == "true"
        
        # Pulizia valori vuoti
        icon = nil if icon.is_a?(String) && icon.strip.empty?
        
        render_with_template(locals: {
          label: label,
          type: type,
          size: size,
          rounded: rounded,
          outline: outline,
          notification: notification,
          icon: icon,
          icon_position: icon_position
        })
      end
      
      # @!endgroup
      
      # @!group Esempi
      
      # @label Tipi e colori
      def tipi_colori
        render_with_template(locals: {
          variants: [
            { label: "Default", type: :default },
            { label: "White", type: :white },
            { label: "Red", type: :red },
            { label: "Green", type: :green },
            { label: "Blue", type: :blue },
            { label: "Yellow", type: :yellow },
            { label: "Violet", type: :violet },
            { label: "Gray", type: :gray }
          ]
        })
      end
      
      # @label Dimensioni
      def dimensioni
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
            { label: "Full (pill)", rounded: :full }
          ]
        })
      end
      
      # @label Con Icona
      def con_icona
        render_with_template(locals: {
          variants: [
            { label: "Icona sx", icon: "check", icon_position: :left },
            { label: "Icona dx", icon: "check", icon_position: :right },
            { label: "Icona only", icon: "check", label: nil }
          ]
        })
      end
      
      # @label Stile Outline
      def outline
        render_with_template(locals: {
          variants: [
            { label: "Default", type: :default, outline: true },
            { label: "Red", type: :red, outline: true },
            { label: "Green", type: :green, outline: true },
            { label: "Blue", type: :blue, outline: true }
          ]
        })
      end
      
      # @label Notifica
      def notifica
        render_with_template(locals: {
          variants: [
            { label: "1", type: :red, notification: true, rounded: :full },
            { label: "2", type: :blue, notification: true, rounded: :full },
            { label: "3", type: :green, notification: true, rounded: :full },
            { label: "99+", type: :orange, notification: true, rounded: :full, size: :small }
          ]
        })
      end
      
      # @label Casi d'uso
      def casi_uso
        render_with_template(locals: {})
      end
      
      # @!endgroup
    end
  end
end 