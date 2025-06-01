# frozen_string_literal: true

module BetterUi
  module General
    module Dropdown
      class DividerComponent < ViewComponent::Base
        attr_reader :classes, :html_options

        # Classi base per il divisore del dropdown
        DROPDOWN_DIVIDER_CLASSES = "border-t border-gray-100 my-1"

        def initialize(classes: nil, **html_options)
          @classes = classes
          @html_options = html_options
        end

        # Combina tutte le classi per il divisore
        def divider_classes
          [
            DROPDOWN_DIVIDER_CLASSES,
            @classes
          ].compact.join(" ")
        end

        # Restituisce gli attributi per il divisore
        def divider_attributes
          attrs = {
            class: divider_classes,
            role: "separator"
          }

          @html_options.except(:class).each do |key, value|
            attrs[key] = value
          end

          attrs
        end
      end
    end
  end
end
