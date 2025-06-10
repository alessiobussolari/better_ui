# frozen_string_literal: true

module BetterUi
  module Application
    module Sidebar
      class FooterComponent < BetterUi::Component
        attr_reader :footer_content, :user_info, :user_dropdown, :variant

delegate :bui_avatar, to: :helpers

        # Costanti per le varianti del footer
        FOOTER_VARIANT_CLASSES = {
          simple: "flex-shrink-0 p-2 border-t border-gray-200",
          dropdown: "flex-shrink-0 p-2 border-t border-gray-200 relative"
        }.freeze

        # Configurazione con validazione automatica
        configure_attributes({
          variant: {
            var: :@variant,
            default: :simple,
            constants: [:FOOTER_VARIANT_CLASSES],
            methods: [:get_variant_class]
          }
        })

        def initialize(
          footer_content: nil, 
          user_info: nil, 
          user_dropdown: nil,
          variant: :simple,
          dropdown_items: [],
          **html_options
        )
          @footer_content = footer_content
          @user_info = user_info
          @user_dropdown = user_dropdown
          @variant = variant.to_sym
          @dropdown_items = dropdown_items
          @html_options = html_options
          validate_params
        end

        def footer_classes
          [
            get_variant_class,
            @html_options[:class]
          ].compact.join(" ")
        end



        def has_dropdown_items?
          @dropdown_items.present? && @dropdown_items.any?
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
          return '' unless has_user_info?
          
          avatar_html = if @user_info[:avatar].present?
            bui_avatar(
              src: @user_info[:avatar],
              size: :sm,
              classes: "flex-shrink-0"
            )
          else
            ''
          end

          content_tag(:div, class: "flex items-center space-x-3") do
            avatar_section = if @user_info[:avatar].present?
              avatar_html
            else
              ''
            end

            text_section = content_tag(:div, class: "flex-1 min-w-0") do
              name_part = if @user_info[:name].present?
                content_tag(:p, @user_info[:name], class: "text-sm font-medium text-gray-900 truncate")
              else
                ''
              end

              email_part = if @user_info[:email].present?
                content_tag(:p, @user_info[:email], class: "text-sm text-gray-500 truncate")
              else
                ''
              end

              (name_part + email_part).html_safe
            end

            (avatar_section + text_section).html_safe
          end
        end
      end
    end
  end
end