module BetterUi
  module General
    class TableComponent < ViewComponent::Base
      attr_reader :data, :headers, :caption, :striped, :hoverable, :bordered, :compact, :classes, :variant
      
      def initialize(data:, headers: nil, caption: nil, striped: false, hoverable: false, bordered: true, compact: false, classes: nil, variant: :default)
        @data = data || []
        @headers = headers
        @caption = caption
        @striped = striped
        @hoverable = hoverable
        @bordered = bordered
        @compact = compact
        @classes = classes
        @variant = variant.to_sym
      end

      def table_classes
        ThemeHelper.generate_component_classes(:table, @variant, { bordered: @bordered, classes: @classes })
      end

      def table_container_classes
        [
          ThemeHelper::LAYOUT_STYLES[:table][:container],
          get_border_color
        ].compact.join(' ')
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
        when :primary
          'border-orange-200'
        when :success
          'border-green-200'
        when :warning
          'border-amber-200'
        when :danger
          'border-red-200'
        when :info
          'border-blue-200'
        else
          'border-gray-200'
        end
      end
      
      def caption_color_classes
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
      
      def th_color_classes
        case @variant
        when :primary
          'text-orange-700'
        when :success
          'text-green-700'
        when :warning
          'text-amber-700'
        when :danger
          'text-red-700'
        when :info
          'text-blue-700'
        else
          'text-gray-700'
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