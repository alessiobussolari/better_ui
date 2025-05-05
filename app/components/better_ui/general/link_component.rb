module BetterUi
  module General
    class LinkComponent < ViewComponent::Base
      # Temi di colore disponibili
      LINK_THEME = {
        default: "bui-link--default",
        white: "bui-link--white",
        red: "bui-link--red",
        rose: "bui-link--rose",
        orange: "bui-link--orange",
        green: "bui-link--green",
        blue: "bui-link--blue",
        yellow: "bui-link--yellow",
        violet: "bui-link--violet",
        gray: "bui-link--gray"
      }

      # Orientamenti disponibili
      LINK_ORIENTATION = {
        horizontal: "bui-link--horizontal",
        vertical: "bui-link--vertical"
      }

      # Stili disponibili
      LINK_STYLE = {
        default: "bui-link--style-default",
        underline: "bui-link--style-underline",
        bold: "bui-link--style-bold",
        text: "bui-link--style-text"
      }

      # Stati disponibili
      LINK_STATE = {
        default: "bui-link--state-default",
        active: "bui-link--state-active",
        disabled: "bui-link--state-disabled"
      }

      # Parametri del componente
      # @param label [String] testo del link
      # @param href [String] URL di destinazione (nil per semplice testo)
      # @param theme [Symbol] default, white, red, rose, orange, green, blue, yellow, violet, gray
      # @param orientation [Symbol] horizontal, vertical
      # @param style [Symbol] default, underline, bold, text
      # @param icon [String] icona opzionale
      # @param active [Boolean] stato attivo del link
      # @param disabled [Boolean] stato disabilitato del link
      # @param data [Hash] attributi data
      # @param method [Symbol] metodo HTTP (per Turbo)
      # @param target [String] target del link
      # @param html_options [Hash] opzioni HTML aggiuntive
      def initialize(
        label:, 
        href: nil,
        theme: :default,
        orientation: :horizontal,
        style: :default,
        icon: nil,
        active: false,
        disabled: false,
        data: {},
        method: nil,
        target: nil,
        **html_options
      )
        @label = label
        @href = href
        @theme = theme.to_sym
        @orientation = orientation.to_sym
        @style = style.to_sym
        @icon = icon
        @active = active
        @disabled = disabled
        @data = data || {}
        @method = method
        @target = target
        @html_options = html_options
        
        validate_params
      end

      # Determina se è un link attivo/corrente
      def active?
        @active
      end

      # Determina se è disabilitato
      def disabled?
        @disabled
      end

      # Determina se è un link o solo testo
      def link?
        @href.present? && !@disabled
      end

      # Combina tutte le classi CSS
      def combined_classes
        [
          "bui-link", # Classe base
          get_theme_class,
          get_orientation_class,
          get_style_class,
          active? ? LINK_STATE[:active] : LINK_STATE[:default],
          disabled? ? LINK_STATE[:disabled] : nil,
          @html_options[:class]
        ].compact.join(" ")
      end

      # Restituisce gli attributi per il link
      def link_attributes
        attrs = @html_options.except(:class)
        attrs[:class] = combined_classes
        
        if @method.present?
          attrs[:data] = @data.merge(turbo_method: @method) 
        elsif @data.present?
          attrs[:data] = @data
        end
        
        attrs[:target] = @target if @target.present?
        attrs[:aria] ||= {}
        attrs[:aria][:current] = 'page' if active?
        attrs[:disabled] = true if disabled?
        
        attrs
      end

      # Renderizza l'icona
      def render_icon
        return nil unless @icon.present?
        
        if @icon.is_a?(String)
          render BetterUi::General::IconComponent.new(name: @icon)
        else
          @icon # Assumiamo che sia già un componente renderizzato
        end
      end
      
      private
      
      def get_theme_class
        LINK_THEME[@theme] || LINK_THEME[:default]
      end
      
      def get_orientation_class
        LINK_ORIENTATION[@orientation] || LINK_ORIENTATION[:horizontal]
      end
      
      def get_style_class
        LINK_STYLE[@style] || LINK_STYLE[:default]
      end
      
      def validate_params
        validate_theme
        validate_orientation
        validate_style
      end
      
      def validate_theme
        unless LINK_THEME.keys.include?(@theme)
          raise ArgumentError, "Il tema deve essere uno tra: #{LINK_THEME.keys.join(', ')}"
        end
      end
      
      def validate_orientation
        unless LINK_ORIENTATION.keys.include?(@orientation)
          raise ArgumentError, "L'orientamento deve essere uno tra: #{LINK_ORIENTATION.keys.join(', ')}"
        end
      end
      
      def validate_style
        unless LINK_STYLE.keys.include?(@style)
          raise ArgumentError, "Lo stile deve essere uno tra: #{LINK_STYLE.keys.join(', ')}"
        end
      end
    end
  end
end 