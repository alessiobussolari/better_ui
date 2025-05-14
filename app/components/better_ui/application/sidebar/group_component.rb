# frozen_string_literal: true

module BetterUi
  module Application
    module Sidebar
      class GroupComponent < ViewComponent::Base
        attr_reader :title, :collapsible, :collapsed, :compact, :icon
        
        # @param title [String] Titolo del gruppo
        # @param collapsible [Boolean] Se il gruppo è collassabile
        # @param collapsed [Boolean] Se il gruppo è collassato di default
        # @param compact [Boolean] Se visualizzare in modalità compatta
        # @param icon [String] Icona opzionale del gruppo
        def initialize(title: nil, collapsible: false, collapsed: false, compact: false, icon: nil)
          @title = title
          @collapsible = collapsible
          @collapsed = collapsible && collapsed
          @compact = compact
          @icon = icon
        end
        
        def group_classes
          [
            'bui-sidebar-group',
            collapsible ? 'bui-sidebar-group--collapsible' : nil,
            collapsed ? 'bui-sidebar-group--collapsed' : nil,
            compact ? 'bui-sidebar-group--compact' : nil
          ].compact.join(' ')
        end
      end
    end
  end
end 