module BetterUi
  module General
    module Table
      class TdComponent < ViewComponent::Base
        attr_reader :theme, :align, :compact

        def initialize(theme: :default, align: :left, compact: false, **html_options)
          @theme = theme.to_sym
          @align = align.to_sym
          @compact = !!compact
          @html_options = html_options
        end

        def td_classes
          [
            "px-4 py-3 text-sm text-gray-900",
            alignment_class,
            @compact ? "py-1" : nil,
            @html_options[:class]
          ].compact.join(" ")
        end

        def td_attributes
          attrs = @html_options.except(:class)
          attrs[:class] = td_classes
          attrs
        end

        private

        def alignment_class
          case @align
          when :center
            "text-center"
          when :right
            "text-right"
          else
            "text-left"
          end
        end
      end
    end
  end
end
