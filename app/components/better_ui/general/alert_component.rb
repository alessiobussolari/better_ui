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

      # @param title [String] titolo dell'alert (opzionale)
      # @param message [String] contenuto dell'alert
      # @param theme [Symbol] :default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet
      # @param icon [String] nome dell'icona (opzionale)
      # @param dismissible [Boolean] se l'alert può essere chiuso
      # @param html_options [Hash] opzioni HTML per il container
      def initialize(
        title: nil,
        message: nil,
        theme: :default,
        icon: nil,
        dismissible: false,
        classes: nil,
        **html_options
      )
        @title = title
        @message = message
        @theme = theme.to_sym
        @icon = icon
        @dismissible = dismissible
        @classes = classes
        @html_options = html_options
        
        validate_theme
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
      
      private
      
      def validate_theme
        valid_themes = ALERT_THEME.keys
        unless valid_themes.include?(@theme)
          raise ArgumentError, "Il tema deve essere uno tra: #{valid_themes.join(', ')}"
        end
      end
    end
  end
end
