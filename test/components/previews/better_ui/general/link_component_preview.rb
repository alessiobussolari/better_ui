module BetterUi
  module General
    class LinkComponentPreview < ViewComponent::Preview
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
        # Conversione dei tipi
        theme = theme.to_sym if theme.is_a?(String)
        active = active == true || active == "true"
        href = nil if href.is_a?(String) && href.strip.empty?
        icon = nil if icon.is_a?(String) && icon.strip.empty?
        
        render_with_template(locals: {
          label: label,
          href: href,
          theme: theme,
          icon: icon,
          active: active,
          target: target
        })
      end
      
      # @!group Esempi specifici
      
      # @label Solo testo
      def text_only
        render BetterUi::General::LinkComponent.new(
          label: "Testo semplice (non cliccabile)"
        )
      end
      
      # @label Link con icona
      def link_with_icon
        render BetterUi::General::LinkComponent.new(
          label: "Link con icona",
          href: "#",
          icon: "link"
        )
      end
      
      # @label Link attivo
      def active_link
        render BetterUi::General::LinkComponent.new(
          label: "Link attivo/corrente",
          href: "#",
          active: true
        )
      end
      
      # @label Temi di colore
      def color_themes
        render_with_template(locals: {
          themes: [
            { label: "Default", theme: :default },
            { label: "White", theme: :white },
            { label: "Red", theme: :red },
            { label: "Rose", theme: :rose },
            { label: "Orange", theme: :orange },
            { label: "Green", theme: :green },
            { label: "Blue", theme: :blue },
            { label: "Yellow", theme: :yellow },
            { label: "Violet", theme: :violet },
          ]
        })
      end
      
      # @!endgroup
    end
  end
end 