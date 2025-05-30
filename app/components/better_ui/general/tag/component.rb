# frozen_string_literal: true

module BetterUi
  module General
    module Tag
      class Component < ViewComponent::Base
        def initialize(text:, theme: :white, size: :medium, style: :filled, **options)
          @text = text
          @theme = theme.to_sym
          @size = size.to_sym
          @style = style.to_sym
          @options = options
        end

        private

        attr_reader :text, :theme, :size, :style, :options

        def tag_classes
          base_classes = %w[
            inline-flex
            items-center
            justify-center
            font-medium
            transition-colors
            duration-200
            bui-tag
          ]

          base_classes.concat(size_classes)
          base_classes.concat(theme_classes)
          base_classes.concat(style_classes)
          base_classes.join(" ")
        end

        def size_classes
          case size
          when :small
            %w[text-xs px-2 py-1 rounded]
          when :large
            %w[text-base px-4 py-2 rounded-lg]
          else # :medium
            %w[text-sm px-3 py-1.5 rounded-md]
          end
        end

        def theme_classes
          case theme
          when :default
            %w[bg-gray-100 text-gray-800]
          when :red
            %w[bg-red-100 text-red-800]
          when :rose
            %w[bg-rose-100 text-rose-800]
          when :orange
            %w[bg-orange-100 text-orange-800]
          when :green
            %w[bg-green-100 text-green-800]
          when :blue
            %w[bg-blue-100 text-blue-800]
          when :yellow
            %w[bg-yellow-100 text-yellow-800]
          when :violet
            %w[bg-violet-100 text-violet-800]
          else # :white
            %w[bg-white text-gray-700 border border-gray-200]
          end
        end

        def style_classes
          case style
          when :outline
            outline_theme_classes
          else # :filled
            []
          end
        end

        def outline_theme_classes
          case theme
          when :default
            %w[bg-transparent border-gray-300 text-gray-700 hover:bg-gray-50]
          when :red
            %w[bg-transparent border-red-300 text-red-700 hover:bg-red-50]
          when :rose
            %w[bg-transparent border-rose-300 text-rose-700 hover:bg-rose-50]
          when :orange
            %w[bg-transparent border-orange-300 text-orange-700 hover:bg-orange-50]
          when :green
            %w[bg-transparent border-green-300 text-green-700 hover:bg-green-50]
          when :blue
            %w[bg-transparent border-blue-300 text-blue-700 hover:bg-blue-50]
          when :yellow
            %w[bg-transparent border-yellow-300 text-yellow-700 hover:bg-yellow-50]
          when :violet
            %w[bg-transparent border-violet-300 text-violet-700 hover:bg-violet-50]
          else # :white
            %w[bg-transparent border-gray-300 text-gray-700 hover:bg-gray-50]
          end
        end
      end
    end
  end
end
