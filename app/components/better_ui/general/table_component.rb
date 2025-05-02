module BetterUi
  module General
    class TableComponent < ViewComponent::Base
      attr_reader :data, :headers, :caption, :striped, :hoverable, :bordered, :compact, :classes, :variant, :rounded
      
      def initialize(data:, headers: nil, caption: nil, striped: false, hoverable: false, bordered: true, compact: false, classes: nil, variant: :default, rounded: :sm)
        @data = data || []
        @headers = headers
        @caption = caption
        @striped = striped
        @hoverable = hoverable
        @bordered = bordered
        @compact = compact
        @classes = classes
        @variant = variant.to_sym
        @rounded = rounded.to_sym
      end

      def table_classes
        ThemeHelper.generate_component_classes(:table, @variant, { bordered: @bordered, classes: @classes })
      end

      def table_container_classes
        [
          ThemeHelper::LAYOUT_STYLES[:table][:container],
          get_border_radius_class,
          get_border_color
        ].compact.join(' ')
      end

      def get_border_radius_class
        ThemeHelper::BORDER_RADIUS[@rounded] || ThemeHelper::BORDER_RADIUS[:sm]
      end

      def caption_classes
        [
          'px-4 py-2',
          'text-sm font-medium text-left',
          caption_color_classes,
          @bordered ? "border-b #{get_border_color}" : nil
        ].compact.join(' ')
      end

      def thead_classes
        ThemeHelper::LAYOUT_STYLES[:table][:header]
      end

      def tbody_classes
        @striped ? ThemeHelper::LAYOUT_STYLES[:table][:row][:striped] : nil
      end

      def tr_classes(index)
        [
          @hoverable ? ThemeHelper::LAYOUT_STYLES[:table][:row][:hover] : nil,
          @striped ? nil : (index.odd? ? 'bg-gray-50' : nil)
        ].compact.join(' ')
      end

      def th_classes
        [
          @compact ? 'px-2 py-1' : 'px-4 py-3',
          'text-left text-xs font-medium uppercase tracking-wider',
          th_color_classes,
          @bordered ? "border #{get_border_color}" : nil
        ].compact.join(' ')
      end

      def td_classes
        [
          @compact ? 'px-2 py-1' : 'px-4 py-3',
          @bordered ? "border #{get_border_color}" : nil,
          'text-sm'
        ].compact.join(' ')
      end
      
      def get_border_color
        case @variant
        when :default
          'border-gray-900'
        when :white
          'border-gray-200'
        when :red
          'border-red-600'
        when :rose
          'border-rose-600'
        when :orange
          'border-orange-600'
        when :green
          'border-green-600'
        when :blue
          'border-blue-600'
        when :yellow
          'border-yellow-600'
        when :violet
          'border-violet-600'
        else
          'border-gray-900'
        end
      end
      
      def caption_color_classes
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
      
      def th_color_classes
        case @variant
        when :default
          'text-white'
        when :white
          'text-black'
        when :red
          'text-white'
        when :rose
          'text-white'
        when :orange
          'text-white'
        when :green
          'text-white'
        when :blue
          'text-white'
        when :yellow
          'text-black'
        when :violet
          'text-white'
        else
          'text-white'
        end
      end

      def headers_for_display
        return @headers if @headers.present?
        return [] if @data.empty?
        
        # Se non sono stati forniti headers, li derivo dalle chiavi del primo elemento
        first_item = @data.first
        if first_item.is_a?(Hash)
          first_item.keys
        elsif first_item.respond_to?(:attributes)
          first_item.attributes.keys - ['id', 'created_at', 'updated_at']
        else
          []
        end
      end

      def render?
        @data.present?
      end
    end
  end
end 