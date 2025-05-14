module BetterUi
  module General
    class AlertComponent < ViewComponent::Base
      # Temi di alert disponibili con classi CSS personalizzate
      ALERT_THEME = {
        default: "bui-alert--default",
        white: "bui-alert--white",
        red: "bui-alert--red",
        rose: "bui-alert--rose",
        orange: "bui-alert--orange",
        green: "bui-alert--green",
        blue: "bui-alert--blue",
        yellow: "bui-alert--yellow",
        violet: "bui-alert--violet"
      }

      # Border radius disponibili con classi CSS personalizzate
      ALERT_RADIUS = {
        none: "bui-alert--radius-none",
        small: "bui-alert--radius-small",
        medium: "bui-alert--radius-medium",
        large: "bui-alert--radius-large",
        full: "bui-alert--radius-full"
      }

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
      # @param rounded [Symbol] :none, :small, :medium, :large, :full arrotondamento degli angoli
      # @param importance [Symbol] :high, :medium, :low livello di importanza per accessibilità
      # @param html_content [Boolean] se il messaggio contiene HTML
      # @param classes [String] classi CSS aggiuntive
      # @param html_options [Hash] opzioni HTML per il container
      def initialize(
        title: nil,
        message: nil,
        theme: :default,
        icon: nil,
        icon_position: :left,
        dismissible: false,
        rounded: :medium,
        importance: :medium,
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
          "bui-alert", # Classe base
          theme_classes,
          border_radius_classes,
          icon_position_class,
          @dismissible ? "bui-alert--dismissible" : nil,
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
        importance_attrs = IMPORTANCE_LEVELS[@importance] || IMPORTANCE_LEVELS[:medium]
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
      def theme_classes
        ALERT_THEME[@theme] || ALERT_THEME[:default]
      end

      # Genera le classi per il border radius
      def border_radius_classes
        ALERT_RADIUS[@rounded] || ALERT_RADIUS[:medium]
      end

      # Genera la classe per la posizione dell'icona
      def icon_position_class
        @icon_position == :right ? "bui-alert--icon-right" : nil
      end

      private

      def validate_params
        # Validazione tema
        valid_themes = ALERT_THEME.keys
        unless valid_themes.include?(@theme)
          raise ArgumentError, "Il tema deve essere uno tra: #{valid_themes.join(', ')}"
        end

        # Validazione border radius
        valid_radius = ALERT_RADIUS.keys
        unless valid_radius.include?(@rounded)
          raise ArgumentError, "Il border radius deve essere uno tra: #{valid_radius.join(', ')}"
        end

        # Validazione posizione icona
        valid_positions = [:left, :right]
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
