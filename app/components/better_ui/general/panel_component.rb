module BetterUi
  module General
    class PanelComponent < ViewComponent::Base
      attr_reader :header, :footer, :body, :title, :padding, :theme, :orientation, :style, :radius, :html_options
      
      # Temi di colore disponibili
      PANEL_THEME = {
        default: 'bui-panel--default',
        white: 'bui-panel--white',
        red: 'bui-panel--red',
        rose: 'bui-panel--rose',
        orange: 'bui-panel--orange',
        green: 'bui-panel--green',
        blue: 'bui-panel--blue',
        yellow: 'bui-panel--yellow',
        violet: 'bui-panel--violet',
        gray: 'bui-panel--gray'
      }.freeze
      
      # Opzioni di padding disponibili
      PANEL_PADDING = {
        none: 'bui-panel--padding-none',
        small: 'bui-panel--padding-small',
        medium: 'bui-panel--padding-medium',
        large: 'bui-panel--padding-large'
      }.freeze
      
      # Orientamenti disponibili
      PANEL_ORIENTATION = {
        horizontal: 'bui-panel--horizontal',
        vertical: 'bui-panel--vertical'
      }.freeze
      
      # Stili disponibili
      PANEL_STYLE = {
        default: 'bui-panel--style-default',
        flat: 'bui-panel--style-flat',
        raised: 'bui-panel--style-raised',
        bordered: 'bui-panel--style-bordered'
      }.freeze
      
      # Opzioni di bordi arrotondati standardizzati
      PANEL_RADIUS = {
        none: 'bui-panel--radius-none',
        small: 'bui-panel--radius-small',
        medium: 'bui-panel--radius-medium',
        large: 'bui-panel--radius-large',
        full: 'bui-panel--radius-full'
      }.freeze
      
      # Parametri del componente
      # @param title [String] titolo del pannello (opzionale)
      # @param body [String] contenuto HTML del pannello (opzionale)
      # @param header [String] header personalizzato (opzionale)
      # @param footer [String] footer del pannello (opzionale)
      # @param theme [Symbol] default, white, red, rose, orange, green, blue, yellow, violet, gray
      # @param orientation [Symbol] horizontal, vertical
      # @param style [Symbol] default, flat, raised, bordered
      # @param padding [Symbol] none, small, medium, large
      # @param radius [Symbol] none, small, medium, large, full
      # @param html_options [Hash] opzioni HTML aggiuntive
      def initialize(
        title: nil, 
        body: nil, 
        header: nil, 
        footer: nil, 
        theme: :default, 
        orientation: :horizontal, 
        style: :default, 
        padding: :medium, 
        radius: :small,
        **html_options
      )
        @title = title
        @body = body
        @header = header
        @footer = footer
        @theme = theme.to_sym
        @orientation = orientation.to_sym
        @style = style.to_sym
        @padding = padding.to_sym
        @radius = radius.to_sym
        @html_options = html_options
        
        validate_params
      end

      # Combina tutte le classi CSS
      def combined_classes
        [
          'bui-panel', # Classe base
          get_theme_class,
          get_orientation_class,
          get_style_class,
          get_radius_class,
          @html_options[:class]
        ].compact.join(' ')
      end
      
      # Restituisce gli attributi HTML per il panel
      def panel_attributes
        attrs = @html_options.except(:class)
        attrs[:class] = combined_classes
        attrs
      end

      def header_classes
        [
          'bui-panel__header',
          get_padding_class
        ].compact.join(' ')
      end

      def body_classes
        [
          'bui-panel__body',
          get_padding_class
        ].compact.join(' ')
      end

      def footer_classes
        [
          'bui-panel__footer',
          get_padding_class
        ].compact.join(' ')
      end

      def title_classes
        'bui-panel__title'
      end
      
      def render?
        @body.present? || @header.present? || @footer.present? || content.present?
      end
      
      private
      
      def get_theme_class
        PANEL_THEME[@theme] || PANEL_THEME[:default]
      end
      
      def get_orientation_class
        PANEL_ORIENTATION[@orientation] || PANEL_ORIENTATION[:horizontal]
      end
      
      def get_style_class
        PANEL_STYLE[@style] || PANEL_STYLE[:default]
      end
      
      def get_radius_class
        PANEL_RADIUS[@radius] || PANEL_RADIUS[:small]
      end
      
      def get_padding_class
        PANEL_PADDING[@padding] || PANEL_PADDING[:medium]
      end
      
      def validate_params
        validate_theme
        validate_orientation
        validate_style
        validate_padding
        validate_radius
      end
      
      def validate_theme
        unless PANEL_THEME.keys.include?(@theme)
          raise ArgumentError, "Il tema deve essere uno tra: #{PANEL_THEME.keys.join(', ')}"
        end
      end
      
      def validate_orientation
        unless PANEL_ORIENTATION.keys.include?(@orientation)
          raise ArgumentError, "L'orientamento deve essere uno tra: #{PANEL_ORIENTATION.keys.join(', ')}"
        end
      end
      
      def validate_style
        unless PANEL_STYLE.keys.include?(@style)
          raise ArgumentError, "Lo stile deve essere uno tra: #{PANEL_STYLE.keys.join(', ')}"
        end
      end
      
      def validate_padding
        unless PANEL_PADDING.keys.include?(@padding)
          raise ArgumentError, "Il padding deve essere uno tra: #{PANEL_PADDING.keys.join(', ')}"
        end
      end
      
      def validate_radius
        unless PANEL_RADIUS.keys.include?(@radius)
          raise ArgumentError, "Il raggio deve essere uno tra: #{PANEL_RADIUS.keys.join(', ')}"
        end
      end
    end
  end
end 