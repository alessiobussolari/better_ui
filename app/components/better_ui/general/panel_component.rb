module BetterUi
  module General
    class PanelComponent < ViewComponent::Base
      attr_reader :header, :footer, :body, :title, :padding, :variant
      
      PADDING_OPTIONS = {
        none: '',
        small: 'p-2',
        medium: 'p-4',
        large: 'p-6'
      }.freeze
      
      def initialize(title: nil, body: nil, header: nil, footer: nil, padding: :medium, variant: :default)
        @title = title
        @body = body
        @header = header
        @footer = footer
        @padding = padding.to_sym
        @variant = variant.to_sym
      end

      def panel_classes
        ThemeHelper.generate_component_classes(:panel, @variant)
      end

      def header_classes
        [
          'panel-header',
          ThemeHelper::LAYOUT_STYLES[:panel][:header],
          header_color_classes,
          PADDING_OPTIONS.fetch(@padding, PADDING_OPTIONS[:medium])
        ].compact.join(' ')
      end

      def body_classes
        [
          'panel-body',
          ThemeHelper::LAYOUT_STYLES[:panel][:body],
          'overflow-x-auto break-words',
          PADDING_OPTIONS.fetch(@padding, PADDING_OPTIONS[:medium])
        ].compact.join(' ')
      end

      def footer_classes
        [
          'panel-footer',
          ThemeHelper::LAYOUT_STYLES[:panel][:footer],
          footer_color_classes,
          'overflow-x-auto break-words',
          PADDING_OPTIONS.fetch(@padding, PADDING_OPTIONS[:medium])
        ].compact.join(' ')
      end

      def title_classes
        'text-lg font-medium'
      end
      
      def header_color_classes
        case @variant
        when :primary
          'bg-orange-50 text-orange-700'
        when :success
          'bg-green-50 text-green-700'
        when :warning
          'bg-amber-50 text-amber-700'
        when :danger
          'bg-red-50 text-red-700'
        when :info
          'bg-blue-50 text-blue-700'
        else
          'bg-gray-50 text-gray-700'
        end
      end
      
      def footer_color_classes
        case @variant
        when :primary
          'bg-orange-50 text-orange-600'
        when :success
          'bg-green-50 text-green-600'
        when :warning
          'bg-amber-50 text-amber-600'
        when :danger
          'bg-red-50 text-red-600'
        when :info
          'bg-blue-50 text-blue-600'
        else
          'bg-gray-50 text-gray-600'
        end
      end

      def render?
        @body.present? || @header.present? || @footer.present? || content.present?
      end
    end
  end
end 