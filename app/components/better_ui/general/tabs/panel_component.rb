# frozen_string_literal: true

module BetterUi
  module General
    module Tabs
      class PanelComponent < BetterUi::Component
        def initialize(id:, active: false, classes: '', **options)
          @id = id
          @active = active
          @classes = classes
          @options = options
        end

        private

        attr_reader :id, :active, :classes, :options

        def panel_attributes
          base_classes = [
            'focus:outline-none',
            'hidden', # Sempre nascosto inizialmente, JavaScript gestisce la visibilità
            classes
          ].compact.join(' ')

          {
            class: base_classes,
            role: 'tabpanel',
            id: id,
            'aria-labelledby': "tab-#{id}",
            'data-bui-tabs-target': 'panel',
            tabindex: '0'
          }.merge(options)
        end
      end
    end
  end
end
