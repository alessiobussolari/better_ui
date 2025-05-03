module BetterUi
  module General
    class PanelComponent < ViewComponent::Base
      attr_reader :header, :footer, :body, :title, :padding, :variant, :rounded
      
      # Opzioni di padding disponibili
      PANEL_PADDING = {
        none: 'bui-panel-padding-none',
        small: 'bui-panel-padding-small',
        medium: 'bui-panel-padding-medium',
        large: 'bui-panel-padding-large'
      }.freeze
      
      # Temi di colore per l'header
      PANEL_HEADER_THEME = {
        default: 'bui-panel-default-header',
        white: 'bui-panel-white-header',
        red: 'bui-panel-red-header',
        rose: 'bui-panel-rose-header',
        orange: 'bui-panel-orange-header',
        green: 'bui-panel-green-header',
        blue: 'bui-panel-blue-header',
        yellow: 'bui-panel-yellow-header',
        violet: 'bui-panel-violet-header'
      }.freeze
      
      # Temi di colore per il footer
      PANEL_FOOTER_THEME = {
        default: 'bui-panel-default-footer',
        white: 'bui-panel-white-footer',
        red: 'bui-panel-red-footer',
        rose: 'bui-panel-rose-footer',
        orange: 'bui-panel-orange-footer',
        green: 'bui-panel-green-footer',
        blue: 'bui-panel-blue-footer',
        yellow: 'bui-panel-yellow-footer',
        violet: 'bui-panel-violet-footer'
      }.freeze
      
      # Opzioni di bordi arrotondati standardizzati
      PANEL_RADIUS = {
        none: 'bui-panel-radius-none',
        small: 'bui-panel-radius-small',
        medium: 'bui-panel-radius-medium',
        large: 'bui-panel-radius-large',
        full: 'bui-panel-radius-full'
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
          'bui-panel-base',
          get_border_radius_class
        ].compact.join(' ')
      end

      def get_border_radius_class
        PANEL_RADIUS[@rounded] || PANEL_RADIUS[:small]
      end

      def header_classes
        [
          'bui-panel-header',
          PANEL_HEADER_THEME[@variant] || PANEL_HEADER_THEME[:default],
          PANEL_PADDING.fetch(@padding, PANEL_PADDING[:medium])
        ].compact.join(' ')
      end

      def body_classes
        [
          'bui-panel-body',
          'bui-panel-body-content',
          PANEL_PADDING.fetch(@padding, PANEL_PADDING[:medium])
        ].compact.join(' ')
      end

      def footer_classes
        [
          'bui-panel-footer',
          PANEL_FOOTER_THEME[@variant] || PANEL_FOOTER_THEME[:default],
          PANEL_PADDING.fetch(@padding, PANEL_PADDING[:medium])
        ].compact.join(' ')
      end

      def title_classes
        'bui-panel-title'
      end

      def render?
        @body.present? || @header.present? || @footer.present? || content.present?
      end
    end
  end
end 