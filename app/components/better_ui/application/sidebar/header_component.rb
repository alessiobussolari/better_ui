# frozen_string_literal: true

module BetterUi
  module Application
    module Sidebar
      class HeaderComponent < BetterUi::Component
        attr_reader :logo, :title, :subtitle

        def initialize(
          logo: nil, 
          title: nil, 
          subtitle: nil, 
          **html_options
        )
          @logo = logo
          @title = title
          @subtitle = subtitle
          @html_options = html_options
        end

        def header_classes
          [
            "flex items-center px-4 py-6 border-b border-gray-200",
            @html_options[:class]
          ].compact.join(" ")
        end

        def logo_classes
          "flex-shrink-0 h-8 w-8"
        end

        def title_classes
          "ml-3 text-lg font-medium text-gray-900"
        end

        def subtitle_classes
          "ml-3 text-sm text-gray-500"
        end

        def has_logo?
          @logo.present?
        end

        def has_title?
          @title.present?
        end

        def has_subtitle?
          @subtitle.present?
        end
      end
    end
  end
end