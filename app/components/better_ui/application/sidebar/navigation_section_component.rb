# frozen_string_literal: true

module BetterUi
  module Application
    module Sidebar
      class NavigationSectionComponent < BetterUi::Component
        attr_reader :title, :collapsible, :collapsed

        # Sistema renders_many per gli items di navigazione
        renders_many :navigation_items, "BetterUi::Application::Sidebar::NavigationItemComponent"

        def initialize(
          title: nil, 
          collapsible: true, 
          collapsed: false,
          **html_options
        )
          @title = title
          @collapsible = collapsible
          @collapsed = collapsed
          @html_options = html_options
        end

        def has_title?
          @title.present?
        end

        def has_navigation_items?
          navigation_items.any?
        end

        def section_classes
          [
            "space-y-1",
            (@collapsed ? "collapsed" : ""),
            @html_options[:class]
          ].compact.join(" ")
        end

        def title_classes
          "px-3 py-2 text-xs font-semibold text-gray-500 uppercase tracking-wider"
        end
      end
    end
  end
end