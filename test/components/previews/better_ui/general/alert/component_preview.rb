module BetterUi
  module General
    module Alert
      class ComponentPreview < Lookbook::Preview
        # @!group Esempi Base

        # @label Con Helper
        # @param title text "Titolo dell'alert (opzionale)"
        # @param message text "Messaggio dell'alert"
        # @param theme select { choices: ["default", "white", "red", "rose", "orange", "green", "blue", "yellow", "violet"] } "Tema dell'alert"
        # @param icon text "Nome dell'icona (opzionale, usa predefinita se vuoto)"
        # @param icon_position select { choices: ["left", "right"] } "Posizione dell'icona"
        # @param dismissible toggle "Permette di chiudere l'alert"
        # @param rounded select { choices: ["none", "small", "medium", "large", "full"] } "Arrotondamento degli angoli"
        # @param importance select { choices: ["high", "medium", "low"] } "Livello di importanza"
        def default(
          title: "Titolo alert",
          message: "Questo è un messaggio di alert di esempio.",
          theme: :white,
          icon: "",
          icon_position: :left,
          dismissible: false,
          rounded: :medium,
          importance: :medium
        )
          normalize_params!(
            title: title,
            message: message,
            theme: theme,
            icon: icon,
            icon_position: icon_position,
            dismissible: dismissible,
            rounded: rounded,
            importance: importance
          )

          render_with_template(locals: {
            title: title,
            message: message,
            theme: theme,
            icon: icon,
            icon_position: icon_position,
            dismissible: dismissible,
            rounded: rounded,
            importance: importance
          })
        end

        # @label Istanziazione Diretta
        # @param title text "Titolo dell'alert (opzionale)"
        # @param message text "Messaggio dell'alert"
        # @param theme select { choices: ["default", "white", "red", "rose", "orange", "green", "blue", "yellow", "violet"] } "Tema dell'alert"
        # @param icon text "Nome dell'icona (opzionale, usa predefinita se vuoto)"
        # @param icon_position select { choices: ["left", "right"] } "Posizione dell'icona"
        # @param dismissible toggle "Permette di chiudere l'alert"
        # @param rounded select { choices: ["none", "small", "medium", "large", "full"] } "Arrotondamento degli angoli"
        # @param importance select { choices: ["high", "medium", "low"] } "Livello di importanza"
        def raw(
          title: "Titolo alert",
          message: "Questo è un messaggio di alert di esempio.",
          theme: :white,
          icon: "",
          icon_position: :left,
          dismissible: false,
          rounded: :medium,
          importance: :medium
        )
          normalize_params!(
            title: title,
            message: message,
            theme: theme,
            icon: icon,
            icon_position: icon_position,
            dismissible: dismissible,
            rounded: rounded,
            importance: importance
          )

          render BetterUi::General::Alert::Component.new(
            title: title,
            message: message,
            theme: theme,
            icon: icon,
            icon_position: icon_position,
            dismissible: dismissible,
            rounded: rounded,
            importance: importance
          )
        end

        # @!endgroup


        private

        def normalize_params!(options)
          # Normalizzazione parametri
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:icon_position] = options[:icon_position].to_sym if options[:icon_position].is_a?(String)
          options[:rounded] = options[:rounded].to_sym if options[:rounded].is_a?(String)
          options[:importance] = options[:importance].to_sym if options[:importance].is_a?(String)

          # Pulizia valori vuoti
          options[:title] = nil if options[:title].is_a?(String) && options[:title].strip.empty?
          options[:icon] = nil if options[:icon].is_a?(String) && options[:icon].strip.empty?

          options
        end
      end
    end
  end
end
