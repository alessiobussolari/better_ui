module BetterUi
  module General
    class ButtonComponentPreview < Lookbook::Preview
      # @!group Esempi Base
      
      # @label Con Helper
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
        normalize_params!(
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
        )
        
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
      
      # @label Istanziazione Diretta
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
        normalize_params!(
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
        )
        
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
      
      private
      
      def normalize_params!(options)
        # Normalizzazione parametri
        options[:type] = options[:type].to_sym if options[:type].is_a?(String)
        options[:size] = options[:size].to_sym if options[:size].is_a?(String)
        options[:rounded] = options[:rounded].to_sym if options[:rounded].is_a?(String)
        options[:icon_position] = options[:icon_position].to_sym if options[:icon_position].is_a?(String)
        options[:method] = options[:method].to_sym if options[:method].is_a?(String) && !options[:method].empty?
        
        # Pulizia valori vuoti
        options[:icon] = nil if options[:icon].is_a?(String) && options[:icon].strip.empty?
        options[:href] = nil if options[:href].is_a?(String) && options[:href].strip.empty?
        
        options
      end
    end
  end
end 