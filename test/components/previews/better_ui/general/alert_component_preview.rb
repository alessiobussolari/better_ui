module BetterUi
  module General
    class AlertComponentPreview < Lookbook::Preview
      # @!group Esempi Base
      
      # @label Con Helper
      # @param title text "Titolo dell'alert (opzionale)"
      # @param message text "Messaggio dell'alert"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema dell'alert"
      # @param icon text "Nome dell'icona (opzionale, usa predefinita se vuoto)"
      # @param dismissible toggle "Permette di chiudere l'alert"
      def default(
        title: "Titolo alert",
        message: "Questo è un messaggio di alert di esempio.",
        theme: :default,
        icon: "",
        dismissible: false
      )
        normalize_params!(
          title: title,
          message: message,
          theme: theme,
          icon: icon,
          dismissible: dismissible
        )
        
        render_with_template(locals: {
          title: title,
          message: message,
          theme: theme,
          icon: icon,
          dismissible: dismissible
        })
      end
      
      # @label Istanziazione Diretta
      # @param title text "Titolo dell'alert (opzionale)"
      # @param message text "Messaggio dell'alert"
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema dell'alert"
      # @param icon text "Nome dell'icona (opzionale, usa predefinita se vuoto)"
      # @param dismissible toggle "Permette di chiudere l'alert"
      def raw(
        title: "Titolo alert",
        message: "Questo è un messaggio di alert di esempio.",
        theme: :default,
        icon: "",
        dismissible: false
      )
        normalize_params!(
          title: title,
          message: message,
          theme: theme,
          icon: icon,
          dismissible: dismissible
        )
        
        render_with_template(locals: {
          title: title,
          message: message,
          theme: theme,
          icon: icon,
          dismissible: dismissible
        })
      end
      
      # @!endgroup
      
      private
      
      def normalize_params!(options)
        # Normalizzazione parametri
        options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
        
        # Pulizia valori vuoti
        options[:title] = nil if options[:title].is_a?(String) && options[:title].strip.empty?
        options[:icon] = nil if options[:icon].is_a?(String) && options[:icon].strip.empty?
        
        options
      end
    end
  end
end
