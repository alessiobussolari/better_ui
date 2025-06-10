# frozen_string_literal: true

module BetterUi
  module Application
    module Sidebar
      class FooterComponent < BetterUi::Component
        attr_reader :footer_content, :user_info, :user_dropdown

        def initialize(
          footer_content: nil, 
          user_info: nil, 
          user_dropdown: nil, 
          **html_options
        )
          @footer_content = footer_content
          @user_info = user_info
          @user_dropdown = user_dropdown
          @html_options = html_options
        end

        def footer_classes
          [
            "flex-shrink-0 px-4 py-4 border-t border-gray-200",
            @html_options[:class]
          ].compact.join(" ")
        end

        def has_content?
          @footer_content.present?
        end

        def has_user_info?
          @user_info.present?
        end

        def has_user_dropdown?
          @user_dropdown.present?
        end

        def user_dropdown_trigger
          return '' unless has_user_dropdown?
          
          dropdown_data = user_dropdown
          avatar_html = if dropdown_data[:avatar].present?
            if dropdown_data[:avatar].is_a?(Hash)
              bui_avatar(**dropdown_data[:avatar])
            else
              dropdown_data[:avatar].html_safe
            end
          else
            ''
          end

          content_tag(:div, class: "flex items-center w-full text-left") do
            avatar_section = if dropdown_data[:avatar].present?
              content_tag(:div, avatar_html, class: "flex-shrink-0")
            else
              ''
            end

            text_section = content_tag(:div, class: dropdown_data[:avatar].present? ? 'ml-3 min-w-0 flex-1' : 'min-w-0 flex-1') do
              name_part = if dropdown_data[:name].present?
                content_tag(:p, dropdown_data[:name], class: "text-sm font-medium text-gray-700 truncate")
              else
                ''
              end

              subtitle_part = if dropdown_data[:subtitle].present?
                content_tag(:p, dropdown_data[:subtitle], class: "text-xs text-gray-500 truncate")
              else
                ''
              end

              (name_part + subtitle_part).html_safe
            end

            chevron_section = content_tag(:div, class: "ml-auto flex-shrink-0") do
              bui_icon("chevron-up", size: :sm, classes: "text-gray-400")
            end

            (avatar_section + text_section + chevron_section).html_safe
          end
        end
      end
    end
  end
end