module BetterUi
  module General
    class SpinnerComponentPreview < ViewComponent::Preview
      # Spinner configurabile
      #
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema di colore"
      # @param size select { choices: [small, medium, large] } "Dimensione dello spinner"
      # @param label text "Testo da mostrare (opzionale)"
      # @param fullscreen toggle "Modalità fullscreen"
      def default(
        theme: :default,
        size: :medium,
        label: nil,
        fullscreen: false
      )
        # Valori validi per i parametri:
        # theme: :default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet
        # size: :small, :medium, :large
        # fullscreen: true, false
        
        # Assicuriamoci che i parametri siano convertiti nel tipo corretto
        theme = theme.to_sym if theme.is_a?(String)
        size = size.to_sym if size.is_a?(String)
        fullscreen = fullscreen == true || fullscreen == "true"
        
        # Pulizia valori vuoti
        label = nil if label.is_a?(String) && label.strip.empty?
        
        # Validiamo i valori per garantire opzioni corrette
        valid_themes = [:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet]
        valid_sizes = [:small, :medium, :large]
        
        theme = :default unless valid_themes.include?(theme)
        size = :medium unless valid_sizes.include?(size)
        
        render_with_template(locals: {
          theme: theme,
          size: size,
          label: label,
          fullscreen: fullscreen
        })
      end
      
      # @!group Esempi specifici
      
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
      
      # @label Temi di colore
      def temi_colore
        render_with_template(locals: {
          variants: [
            { label: "Default", theme: :default },
            { label: "White", theme: :white },
            { label: "Red", theme: :red },
            { label: "Rose", theme: :rose },
            { label: "Orange", theme: :orange },
            { label: "Green", theme: :green },
            { label: "Blue", theme: :blue },
            { label: "Yellow", theme: :yellow },
            { label: "Violet", theme: :violet }
          ]
        })
      end
      
      # @label Con etichetta
      def con_etichetta
        render BetterUi::General::SpinnerComponent.new(
          label: "Caricamento in corso...",
          size: :medium,
          theme: :blue
        )
      end
      
      # @label Con contenuto personalizzato
      def con_contenuto
        render_with_template(locals: {
          content: true
        })
      end
      
      # @label Modalità fullscreen
      def fullscreen
        render BetterUi::General::SpinnerComponent.new(
          label: "Caricamento della pagina...",
          fullscreen: true,
          theme: :blue,
          size: :large
        )
      end
      
      # @!endgroup
    end
  end
end 