module BetterUi
  module General
    class PanelComponent < ViewComponent::Base
      attr_reader :header, :footer, :body, :title, :padding, :variant, :rounded
      
      PADDING_OPTIONS = {
        none: '',
        small: 'p-2',
        medium: 'p-4',
        large: 'p-6'
      }.freeze
      
      def initialize(title: nil, body: nil, header: nil, footer: nil, padding: :medium, variant: :default, rounded: :sm)
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
          ThemeHelper.generate_component_classes(:panel, @variant, { rounded: @rounded }),
          get_border_radius_class
        ].compact.join(' ')
      end

      def get_border_radius_class
        ThemeHelper::BORDER_RADIUS[@rounded] || ThemeHelper::BORDER_RADIUS[:sm]
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
        when :default
          'bg-black text-white'
        when :white
          'bg-white text-black'
        when :red
          'bg-red-500 text-white'
        when :rose
          'bg-rose-500 text-white'
        when :orange
          'bg-orange-500 text-white'
        when :green
          'bg-green-500 text-white'
        when :blue
          'bg-blue-500 text-white'
        when :yellow
          'bg-yellow-500 text-black'
        when :violet
          'bg-violet-500 text-white'
        else
          'bg-black text-white'
        end
      end
      
      def footer_color_classes
        case @variant
        when :default
          'bg-black text-white'
        when :white
          'bg-white text-black'
        when :red
          'bg-red-500 text-white'
        when :rose
          'bg-rose-500 text-white'
        when :orange
          'bg-orange-500 text-white'
        when :green
          'bg-green-500 text-white'
        when :blue
          'bg-blue-500 text-white'
        when :yellow
          'bg-yellow-500 text-black'
        when :violet
          'bg-violet-500 text-white'
        else
          'bg-black text-white'
        end
      end

      def render?
        @body.present? || @header.present? || @footer.present? || content.present?
      end
    end
  end
end 