# frozen_string_literal: true

module BetterUi
  module General
    module Field
      class Component < ViewComponent::Base
        attr_reader :text, :name, :required, :error, :help_text, :id

        renders_one :input

        BASE_CLASSES = "flex flex-col space-y-2"
        LABEL_CLASSES = "text-sm font-medium text-gray-700"
        REQUIRED_CLASSES = "text-red-500 ml-1"
        ERROR_CLASSES = "text-sm text-red-600 mt-1"
        HELP_TEXT_CLASSES = "text-sm text-gray-500 mt-1"

        def initialize(text:, name:, required: false, error: nil, help_text: nil, id: nil)
          @text = text
          @name = name
          @required = required
          @error = error
          @help_text = help_text
          @id = id
          super()
        end

        private

        def field_classes
          classes = [BASE_CLASSES]
          classes << ERROR_CLASSES if @error.present?
          classes.join(" ")
        end
      end
    end
  end
end
