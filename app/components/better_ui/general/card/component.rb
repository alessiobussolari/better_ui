# frozen_string_literal: true

module BetterUi
  module General
    module Card
      class Component < ViewComponent::Base
        renders_one :header
        renders_one :body
        renders_one :footer

        def initialize(theme: :white, style: :default, padding: :medium, radius: :medium, **options)
          @theme = theme
          @style = style
          @padding = padding
          @radius = radius
          @options = options
        end

        private

        def html_attributes
          {
            class: class_names(
              "bui-card",
              "bui-card--theme-#{@theme}",
              "bui-card--style-#{@style}",
              "bui-card--padding-#{@padding}",
              "bui-card--radius-#{@radius}",
              @options[:class]
            ),
            **@options.except(:class)
          }
        end
      end
    end
  end
end 