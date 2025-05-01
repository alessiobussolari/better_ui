# frozen_string_literal: true

module BetterUi
  class TableComponent < ViewComponent::Base
    attr_reader :data, :headers, :caption, :striped, :hoverable, :bordered, :compact, :classes
    
    def initialize(data:, headers: nil, caption: nil, striped: false, hoverable: false, bordered: true, compact: false, classes: nil)
      @data = data || []
      @headers = headers
      @caption = caption
      @striped = striped
      @hoverable = hoverable
      @bordered = bordered
      @compact = compact
      @classes = classes
    end

    def table_classes
      [
        'min-w-full',
        'border-collapse',
        'bg-white',
        @bordered ? 'border border-gray-200' : nil,
        @classes
      ].compact.join(' ')
    end

    def table_container_classes
      [
        'overflow-x-auto',
        'rounded-lg',
        @bordered ? 'border border-gray-200' : nil,
        'shadow-sm'
      ].compact.join(' ')
    end

    def caption_classes
      [
        'px-4 py-2',
        'text-sm font-medium text-left text-gray-500',
        'bg-gray-50',
        @bordered ? 'border-b border-gray-200' : nil
      ].compact.join(' ')
    end

    def thead_classes
      'bg-gray-50'
    end

    def tbody_classes
      [
        @striped ? 'divide-y divide-gray-200' : nil
      ].compact.join(' ')
    end

    def tr_classes(index)
      [
        @hoverable ? 'hover:bg-gray-50' : nil,
        @striped && index.odd? ? 'bg-gray-50' : nil
      ].compact.join(' ')
    end

    def th_classes
      [
        'px-4 py-3',
        'text-left text-xs font-medium text-gray-500 uppercase tracking-wider',
        @bordered ? 'border border-gray-200' : nil
      ].compact.join(' ')
    end

    def td_classes
      [
        @compact ? 'px-2 py-1' : 'px-4 py-3',
        @bordered ? 'border border-gray-200' : nil,
        'text-sm text-gray-700'
      ].compact.join(' ')
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