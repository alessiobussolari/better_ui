# frozen_string_literal: true

module BetterUi
  module General
    module Form
      class Component < ViewComponent::Base
        renders_many :fields, "BetterUi::General::Field::Component"

        BASE_CLASSES = "space-y-6 w-full"

        def initialize(url:, method: :post, **options)
          puts "Options: #{options}"
          puts "Url: #{url}"
          @url = url
          @method = method
          @options = options
          super()
        end

        private

        def form_tag_attributes
          attrs = {
            action: @url,
            method: action_attribute_mapping[@method],
            class: BASE_CLASSES,
          }.merge(@options)

          puts "Attrs: #{attrs}"
          attrs
        end

        def method_override_field
          return if %i[get post].include?(@method)

          tag.input(type: "hidden", name: "_method", value: @method)
        end

        def action_attribute_mapping
          {
            get: :get,
            post: :post,
            put: :post,
            patch: :post,
            delete: :post
          }
        end
      end
    end
  end
end 