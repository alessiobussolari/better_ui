module BetterUi
  module General
    class PanelComponent < ViewComponent::Base
      attr_reader :header, :footer, :body, :title, :padding, :variant, :rounded
      
      # Opzioni di padding disponibili
      PANEL_PADDING = {
        none: 'bui-panel--padding-none',
        small: 'bui-panel--padding-small',
        medium: 'bui-panel--padding-medium',
        large: 'bui-panel--padding-large'
      }.freeze
      
      # Temi di colore per il panel
      PANEL_THEME = {
        default: 'bui-panel--default',
        white: 'bui-panel--white',
        red: 'bui-panel--red',
        rose: 'bui-panel--rose',
        orange: 'bui-panel--orange',
        green: 'bui-panel--green',
        blue: 'bui-panel--blue',
        yellow: 'bui-panel--yellow',
        violet: 'bui-panel--violet'
      }.freeze
      
      # Opzioni di bordi arrotondati standardizzati
      PANEL_RADIUS = {
        none: 'bui-panel--radius-none',
        small: 'bui-panel--radius-small',
        medium: 'bui-panel--radius-medium',
        large: 'bui-panel--radius-large',
        full: 'bui-panel--radius-full'
      }.freeze
      
      def initialize(title: nil, body: nil, header: nil, footer: nil, padding: :medium, variant: :default, rounded: :small)
        @title = title
        @body = body
        @header = header
        @footer = footer
        @padding = padding.to_sym
        @variant = variant.to_sym
        @rounded = rounded.to_sym
      end

      def panel_classes
        [
          'bui-panel',
          get_theme_class,
          get_border_radius_class
        ].compact.join(' ')
      end

      def get_border_radius_class
        PANEL_RADIUS[@rounded] || PANEL_RADIUS[:small]
      end
      
      def get_theme_class
        PANEL_THEME[@variant] || PANEL_THEME[:default]
      end

      def header_classes
        [
          'bui-panel__header',
          PANEL_PADDING.fetch(@padding, PANEL_PADDING[:medium])
        ].compact.join(' ')
      end

      def body_classes
        [
          'bui-panel__body',
          PANEL_PADDING.fetch(@padding, PANEL_PADDING[:medium])
        ].compact.join(' ')
      end

      def footer_classes
        [
          'bui-panel__footer',
          PANEL_PADDING.fetch(@padding, PANEL_PADDING[:medium])
        ].compact.join(' ')
      end

      def title_classes
        'bui-panel__title'
      end

      def render?
        @body.present? || @header.present? || @footer.present? || content.present?
      end
    end
  end
end 