module BetterUi
  module General
    class LinkComponentPreview < ViewComponent::Preview
      # @!group Esempi Base
      
      # Link configurabile
      #
      # @param label text "Testo del link"
      # @param href text "URL di destinazione (lasciare vuoto per semplice testo)"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema di colore"
      # @param icon text "Nome icona (opzionale)"
      # @param active toggle "Link attivo/corrente"
      # @param target select { choices: [_blank, _self, _parent, _top] } "Target del link (opzionale)"
      def default(
        label: "Esempio link",
        href: "#",
        theme: :default,
        icon: nil,
        active: false,
        target: nil
      )
        normalize_params!(
          label: label,
          href: href,
          theme: theme,
          icon: icon,
          active: active,
          target: target
        )
        
        render_with_template(locals: {
          label: label,
          href: href,
          theme: theme,
          icon: icon,
          active: active,
          target: target,
          bg_classes: bg_classes
        })
      end
      
      # @label Componente diretto
      # @param label text "Testo del link"
      # @param href text "URL di destinazione (lasciare vuoto per semplice testo)"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema di colore"
      # @param icon text "Nome icona (opzionale)"
      # @param active toggle "Link attivo/corrente"
      # @param target select { choices: [_blank, _self, _parent, _top] } "Target del link (opzionale)"
      def raw(
        label: "Esempio link",
        href: "#",
        theme: :default,
        icon: nil,
        active: false,
        target: nil
      )
        normalize_params!(
          label: label,
          href: href,
          theme: theme,
          icon: icon,
          active: active,
          target: target
        )
        
        render BetterUi::General::LinkComponent.new(
          label: label,
          href: href,
          theme: theme,
          icon: icon,
          active: active,
          target: target
        )
      end
      
      # @!endgroup
      
      private
      
      def normalize_params!(options)
        # Conversione dei tipi
        options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
        options[:active] = options[:active] == true || options[:active] == "true"
        options[:href] = nil if options[:href].is_a?(String) && options[:href].strip.empty?
        options[:icon] = nil if options[:icon].is_a?(String) && options[:icon].strip.empty?
        
        options
      end
      
      def bg_classes
        {
          default: "bg-black",
          white: "bg-white",
          red: "bg-red-500",
          rose: "bg-rose-500",
          orange: "bg-orange-500",
          green: "bg-green-500",
          blue: "bg-blue-500",
          yellow: "bg-yellow-500",
          violet: "bg-violet-500"
        }
      end
    end
  end
end
