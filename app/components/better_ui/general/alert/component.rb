module BetterUi
  module General
    module Alert
      class Component < ViewComponent::Base
        # Classi base sempre presenti
        ALERT_BASE_CLASSES = "flex p-4 mb-4 border"

        # Classi per elementi interni
        ALERT_ICON_CLASSES = "flex-shrink-0 mr-3 w-5 h-5"
        ALERT_ICON_RIGHT_CLASSES = "flex-shrink-0 ml-3 mr-0"
        ALERT_CONTENT_CLASSES = "flex-1"
        ALERT_TITLE_CLASSES = "font-medium mb-1"
        ALERT_MESSAGE_CLASSES = "text-sm"
        ALERT_CLOSE_CLASSES = "ml-auto -my-1.5 -mr-1.5 p-1.5 rounded-md focus:ring-2 focus:ring-offset-2 hover:bg-gray-100"

        # Temi di alert con classi Tailwind dirette
        ALERT_THEME_CLASSES = {
          default: "bg-black text-white border-gray-900",
          white: "bg-white text-black border-gray-200",
          red: "bg-red-500 text-white border-red-600",
          rose: "bg-rose-500 text-white border-rose-600",
          orange: "bg-orange-500 text-white border-orange-600",
          green: "bg-green-500 text-white border-green-600",
          blue: "bg-blue-500 text-white border-blue-600",
          yellow: "bg-yellow-500 text-black border-yellow-600",
          violet: "bg-violet-500 text-white border-violet-600"
        }

        # Colori icone per ogni tema
        ALERT_ICON_THEME_CLASSES = {
          default: "text-white",
          white: "text-black",
          red: "text-white",
          rose: "text-white",
          orange: "text-white",
          green: "text-white",
          blue: "text-white",
          yellow: "text-black",
          violet: "text-white"
        }

        # Colori close button per ogni tema
        ALERT_CLOSE_THEME_CLASSES = {
          default: "text-white focus:ring-gray-600",
          white: "text-black focus:ring-gray-400",
          red: "text-white focus:ring-red-400",
          rose: "text-white focus:ring-rose-400",
          orange: "text-white focus:ring-orange-400",
          green: "text-white focus:ring-green-400",
          blue: "text-white focus:ring-blue-400",
          yellow: "text-black focus:ring-yellow-400",
          violet: "text-white focus:ring-violet-400"
        }

        # Border radius con classi Tailwind dirette
        ALERT_RADIUS_CLASSES = {
          none: "rounded-none",
          small: "rounded-sm",
          medium: "rounded-md",
          large: "rounded-lg",
          full: "rounded-full"
        }

        # Classi per layout quando icon è a destra
        ALERT_ICON_RIGHT_LAYOUT_CLASSES = "flex-row-reverse"
        ALERT_CONTENT_RIGHT_CLASSES = "text-right"

        # Classi per alert dismissible
        ALERT_DISMISSIBLE_CLASSES = "pr-12 relative"
        ALERT_CLOSE_POSITION_CLASSES = "absolute right-4 top-4"

        # Livelli di importanza con attributi ARIA
        IMPORTANCE_LEVELS = {
          high: { role: "alert", "aria-live": "assertive" },
          medium: { role: "status", "aria-live": "polite" },
          low: { role: "status", "aria-live": "polite" }
        }

        # @param title [String] titolo dell'alert (opzionale)
        # @param message [String] contenuto dell'alert
        # @param theme [Symbol] :default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet
        # @param icon [String] nome dell'icona (opzionale)
        # @param icon_position [Symbol] :left, :right posizione dell'icona
        # @param dismissible [Boolean] se l'alert può essere chiuso
        # @param rounded [Symbol] :none, :sm, :md, :lg, :full arrotondamento degli angoli
        # @param importance [Symbol] :high, :md, :low livello di importanza per accessibilità
        # @param html_content [Boolean] se il messaggio contiene HTML
        # @param classes [String] classi CSS aggiuntive
        # @param html_options [Hash] opzioni HTML per il container
        def initialize(
          title: nil,
          message: nil,
          theme: :white,
          icon: nil,
          icon_position: :left,
          dismissible: false,
          rounded: :md,
          importance: :md,
          html_content: false,
          classes: nil,
          **html_options
        )
          @title = title
          @message = message
          @theme = theme.to_sym
          @icon = icon
          @icon_position = icon_position.to_sym
          @dismissible = dismissible
          @rounded = rounded.to_sym
          @importance = importance.to_sym
          @html_content = html_content
          @classes = classes
          @html_options = html_options

          validate_params
        end

        def default_icon
          case @theme
          when :default then "bell"
          when :white then "information-circle"
          when :red, :rose then "exclamation-circle"
          when :orange then "bell"
          when :green then "check-circle"
          when :blue then "information-circle"
          when :yellow then "exclamation-triangle"
          when :violet then "shield-exclamation"
          else "information-circle"
          end
        end

        # Combina tutte le classi
        def combined_classes
          [
            ALERT_BASE_CLASSES,
            get_theme_class,
            get_border_radius_class,
            get_icon_position_class,
            @dismissible ? ALERT_DISMISSIBLE_CLASSES : nil,
            @classes,
            @html_options[:class]
          ].compact.join(" ")
        end

        # Restituisce gli attributi per l'alert
        def alert_attributes
          attrs = {
            class: combined_classes
          }

          # Aggiungi attributi ARIA in base al livello di importanza
          importance_attrs = IMPORTANCE_LEVELS[@importance] || IMPORTANCE_LEVELS[:md]
          importance_attrs.each do |key, value|
            attrs[key] = value
          end

          # Aggiungi altri attributi HTML se presenti
          @html_options.except(:class).each do |key, value|
            attrs[key] = value
          end

          attrs
        end

        # Genera le classi del tema
        def get_theme_class
          ALERT_THEME_CLASSES[@theme] || ALERT_THEME_CLASSES[:white]
        end

        # Genera le classi per il border radius
        def get_border_radius_class
          ALERT_RADIUS_CLASSES[@rounded] || ALERT_RADIUS_CLASSES[:md]
        end

        # Genera la classe per la posizione dell'icona (layout)
        def get_icon_position_class
          @icon_position == :right ? ALERT_ICON_RIGHT_LAYOUT_CLASSES : nil
        end

        # Genera le classi per l'icona
        def get_icon_classes
          if @icon_position == :right
            ALERT_ICON_RIGHT_CLASSES
          else
            ALERT_ICON_CLASSES
          end
        end

        # Genera le classi per il contenuto
        def get_content_classes
          if @icon_position == :right
            [ ALERT_CONTENT_CLASSES, ALERT_CONTENT_RIGHT_CLASSES ].join(" ")
          else
            ALERT_CONTENT_CLASSES
          end
        end

        # Genera le classi per l'icona del tema
        def get_icon_theme_class
          ALERT_ICON_THEME_CLASSES[@theme] || ALERT_ICON_THEME_CLASSES[:white]
        end

        # Genera le classi per il close button
        def get_close_classes
          base_classes = ALERT_CLOSE_CLASSES
          theme_classes = ALERT_CLOSE_THEME_CLASSES[@theme] || ALERT_CLOSE_THEME_CLASSES[:white]
          position_classes = @dismissible ? ALERT_CLOSE_POSITION_CLASSES : nil

          [ base_classes, theme_classes, position_classes ].compact.join(" ")
        end

        private

        def validate_params
          # Validazione tema
          valid_themes = ALERT_THEME_CLASSES.keys
          unless valid_themes.include?(@theme)
            raise ArgumentError, "Il tema deve essere uno tra: #{valid_themes.join(', ')}"
          end

          # Validazione border radius
          valid_radius = ALERT_RADIUS_CLASSES.keys
          unless valid_radius.include?(@rounded)
            raise ArgumentError, "Il border radius deve essere uno tra: #{valid_radius.join(', ')}"
          end

          # Validazione posizione icona
          valid_positions = [ :left, :right ]
          unless valid_positions.include?(@icon_position)
            raise ArgumentError, "La posizione dell'icona deve essere una tra: #{valid_positions.join(', ')}"
          end

          # Validazione livello di importanza
          valid_importance = IMPORTANCE_LEVELS.keys
          unless valid_importance.include?(@importance)
            raise ArgumentError, "Il livello di importanza deve essere uno tra: #{valid_importance.join(', ')}"
          end
        end
      end
    end
  end
end
