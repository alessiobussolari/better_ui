module BetterUi
  module General
    module Table
      class CaptionComponent < BetterUi::Component
        attr_reader :text

        def initialize(text: nil, **html_options)
          super()
          @text = text
          @html_options = html_options
        end

        def caption_classes
          [
            "mb-2 text-sm text-gray-600 text-left",
            @html_options[:class]
          ].compact.join(" ")
        end

        def caption_attributes
          attrs = @html_options.except(:class)
          attrs[:class] = caption_classes
          attrs
        end

        def render?
          @text.present? || content.present?
        end
      end
    end
  end
end