# frozen_string_literal: true

module BetterUi
  class PanelComponent < ViewComponent::Base
    VARIANTS = {
      default: 'bg-white border border-gray-200 rounded-lg shadow-sm',
      primary: 'bg-blue-50 border border-blue-200 rounded-lg shadow-sm',
      success: 'bg-green-50 border border-green-200 rounded-lg shadow-sm',
      warning: 'bg-yellow-50 border border-yellow-200 rounded-lg shadow-sm',
      danger: 'bg-red-50 border border-red-200 rounded-lg shadow-sm',
      info: 'bg-sky-50 border border-sky-200 rounded-lg shadow-sm'
    }.freeze

    PADDING_OPTIONS = {
      none: '',
      small: 'p-2',
      medium: 'p-4',
      large: 'p-6'
    }.freeze

    attr_reader :header, :footer, :body, :title, :padding, :variant

    def initialize(title: nil, body: nil, header: nil, footer: nil, padding: :medium, variant: :default)
      @title = title
      @body = body
      @header = header
      @footer = footer
      @padding = padding.to_sym
      @variant = variant.to_sym
    end

    def panel_classes
      [
        VARIANTS.fetch(@variant, VARIANTS[:default]),
        'w-full overflow-hidden'
      ].compact.join(' ')
    end

    def header_classes
      [
        'panel-header',
        'border-b border-gray-200',
        'overflow-x-auto break-words',
        PADDING_OPTIONS.fetch(@padding, PADDING_OPTIONS[:medium])
      ].compact.join(' ')
    end

    def body_classes
      [
        'panel-body',
        'overflow-x-auto break-words',
        PADDING_OPTIONS.fetch(@padding, PADDING_OPTIONS[:medium])
      ].compact.join(' ')
    end

    def footer_classes
      [
        'panel-footer',
        'border-t border-gray-200',
        'overflow-x-auto break-words',
        PADDING_OPTIONS.fetch(@padding, PADDING_OPTIONS[:medium])
      ].compact.join(' ')
    end

    def title_classes
      'text-lg font-medium'
    end

    def render?
      @body.present? || @header.present? || @footer.present? || content.present?
    end
  end
end 