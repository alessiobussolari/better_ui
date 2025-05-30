# frozen_string_literal: true

module BetterUi
  module General
    module Input
      class Component < ViewComponent::Base
        attr_reader :name, :type, :value, :placeholder, :required, :disabled, :classes, :options

        BASE_CLASSES = "block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm disabled:bg-gray-100 disabled:cursor-not-allowed"

        def initialize(name:, type: :text, value: nil, placeholder: nil, required: false, disabled: false, classes: '', **options)
          @name = name
          @type = type
          @value = value
          @placeholder = placeholder
          @required = required
          @disabled = disabled
          @options = options
          @classes = classes
          super()
        end

        def input_attributes
          {
            type: @type,
            name: @name,
            id: @name,
            value: @value,
            placeholder: @placeholder,
            required: @required,
            disabled: @disabled,
            class: BASE_CLASSES + (@classes.present? ? " #{@classes}" : "")
          }.merge(@options)
        end
      end
    end
  end
end 