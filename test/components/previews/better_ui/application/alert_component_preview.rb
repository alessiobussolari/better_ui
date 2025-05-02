module BetterUi
  module Application
    class AlertComponentPreview < ViewComponent::Preview
      # Alert configurabile
      #
      # @param title text "Titolo dell'alert"
      # @param message text "Messaggio dell'alert"
      # @param variant select { choices: [simple, primary, info, success, warning, danger, dark] } "Variante di colore"
      # @param icon text "Nome icona personalizzata (opzionale)"
      # @param dismissible toggle "Mostra pulsante di chiusura"
      # @param icon_position select { choices: [left, top] } "Posizione dell'icona"
      # @param outline toggle "Stile outline"
      def default(
        title: "Heads up!",
        message: "You can add components to your app using the cli.",
        variant: :simple,
        icon: nil,
        dismissible: false,
        icon_position: :left,
        outline: false
      )
        # Conversione dei tipi
        variant = variant.to_sym if variant.is_a?(String)
        icon_position = icon_position.to_sym if icon_position.is_a?(String)
        dismissible = dismissible == true || dismissible == "true"
        outline = outline == true || outline == "true"
        
        # Validazione
        valid_variants = [:simple, :primary, :info, :success, :warning, :danger, :dark]
        valid_icon_positions = [:left, :top]
        
        variant = :simple unless valid_variants.include?(variant)
        icon_position = :left unless valid_icon_positions.include?(icon_position)
        
        # Pulisci valori vuoti
        icon = nil if icon.is_a?(String) && icon.strip.empty?
        title = nil if title.is_a?(String) && title.strip.empty?
        message = nil if message.is_a?(String) && message.strip.empty?
        
        render BetterUi::Application::AlertComponent.new(
          title: title,
          message: message,
          variant: variant,
          icon: icon,
          dismissible: dismissible,
          icon_position: icon_position,
          outline: outline
        )
      end
      
      # @!group Esempi specifici
      
      # @label Tutte le varianti
      def all_variants
        render_with_template
      end
      
      # @label Alert semplice (default)
      def simple_alert
        render BetterUi::Application::AlertComponent.new(
          title: "Heads up!",
          message: "You can add components to your app using the cli.",
          variant: :simple
        )
      end
      
      # @label Alert con icona in alto
      def with_top_icon
        render BetterUi::Application::AlertComponent.new(
          title: "Alert con icona in alto",
          message: "Questo alert mostra l'icona posizionata sopra il testo anziché a sinistra.",
          variant: :primary,
          icon_position: :top
        )
      end
      
      # @label Alert chiudibile
      def dismissible_alert
        render BetterUi::Application::AlertComponent.new(
          title: "Alert chiudibile",
          message: "Questo alert può essere chiuso dall'utente cliccando sul pulsante X.",
          variant: :warning,
          dismissible: true
        )
      end
      
      # @label Alert con stile outline
      def outline_style
        render BetterUi::Application::AlertComponent.new(
          title: "Alert con stile outline",
          message: "Questo alert utilizza uno stile outline con sfondo bianco e bordo colorato.",
          variant: :success,
          outline: true
        )
      end
      
      # @label Alert con contenuto HTML
      def with_html_content
        render BetterUi::Application::AlertComponent.new(
          title: "Alert con contenuto HTML",
          variant: :danger
        ) do
          "<p class='mb-2'>Questo alert contiene <strong>contenuto HTML</strong> personalizzato al suo interno.</p>
          <p>È possibile includere qualsiasi markup, anche <a href='#' class='underline'>link</a> o liste.</p>".html_safe
        end
      end
      
      # @!endgroup
    end
  end
end 