# frozen_string_literal: true

module BetterUi
  module Application
    module Sidebar
      class Component < ViewComponent::Base
        # Include degli helper per utilizzare bui_icon, bui_avatar, bui_button e bui_dropdown
        include BetterUi::General::Components::Icon::IconHelper
        include BetterUi::General::Components::Avatar::AvatarHelper
        include BetterUi::General::Components::Button::ButtonHelper
        include BetterUi::General::Components::Dropdown::DropdownHelper
        include BetterUi::General::Components::Dropdown::ItemHelper
        attr_reader :width, :position, :theme, :shadow, :border, :header, :footer, :navigation_sections, :collapsible, :classes

        # Larghezze sidebar con classi Tailwind dirette
        SIDEBAR_WIDTHS = {
          sm: "w-48",
          md: "w-64",
          lg: "w-72",
          xl: "w-80"
        }

        # Temi sidebar con classi Tailwind dirette
        SIDEBAR_THEMES = {
          default: "bg-white text-gray-900",
          dark: "bg-gray-900 text-white",
          light: "bg-white text-gray-900"
        }

        # Ombre sidebar con classi Tailwind dirette
        SIDEBAR_SHADOWS = {
          none: "",
          sm: "shadow-sm",
          md: "shadow-md",
          lg: "shadow-lg",
          xl: "shadow-xl"
        }

        # Bordi sidebar con classi Tailwind dirette
        SIDEBAR_BORDERS = {
          left: "border-r border-gray-200",
          right: "border-l border-gray-200"
        }

        # @param width [Symbol] Larghezza della sidebar (:sm, :md, :lg, :xl), default :md (w-64)
        # @param position [Symbol] Posizione della sidebar (:left, :right), default :left
        # @param theme [Symbol] Tema colori (:default, :dark, :light), default :default
        # @param shadow [Symbol] Tipo di ombra (:none, :sm, :md, :lg), default :lg
        # @param border [Boolean] Se mostrare il bordo destro/sinistro, default true
        # @param header [Hash] Configurazione header (logo, title, subtitle)
        # @param footer [Hash] Configurazione footer (content, user_info, user_dropdown)
        # @param navigation_sections [Array] Array di sezioni di navigazione
        # @param collapsible [Boolean] Se abilitare sezioni collassabili, default true
        # @param classes [String] Classi CSS aggiuntive
        def initialize(
          width: :md,
          position: :left,
          theme: :default,
          shadow: :lg,
          border: true,
          header: {},
          footer: {},
          navigation_sections: [],
          collapsible: true,
          classes: nil
        )
          @width = width.to_sym
          @position = position.to_sym
          @theme = theme.to_sym
          @shadow = shadow.to_sym
          @border = border
          @header = header || {}
          @footer = footer || {}
          @navigation_sections = navigation_sections || []
          @collapsible = collapsible
          @classes = classes
        end

        def wrapper_classes
          base_classes = %w[fixed top-0 inset-y-0 h-screen z-[9999]]

          # Posizione
          base_classes << (position == :right ? "right-0" : "left-0")

          # Larghezza
          base_classes << width_class

          base_classes.compact.join(" ")
        end

        def container_classes
          base_classes = %w[flex flex-col h-full]

          # Tema
          base_classes.concat(theme_classes)

          # Shadow
          base_classes << shadow_class if shadow != :none

          # Border
          base_classes << border_class if border

          # Classi aggiuntive
          base_classes << classes if classes.present?

          base_classes.compact.join(" ")
        end


        def has_header?
          header.present? && (header[:title].present? || header[:logo].present?)
        end

        def has_footer?
          footer.present? && (footer[:content].present? || footer[:user_info].present? || footer[:user_dropdown].present?)
        end

        def has_user_dropdown?
          footer.present? && footer[:user_dropdown].present?
        end

        def user_dropdown_trigger
          return '' unless has_user_dropdown?
          
          user_dropdown = footer[:user_dropdown]
          avatar_html = if user_dropdown[:avatar].present?
            if user_dropdown[:avatar].is_a?(Hash)
              bui_avatar(**user_dropdown[:avatar])
            else
              user_dropdown[:avatar].html_safe
            end
          else
            ''
          end

          content_tag(:div, class: "flex items-center w-full text-left") do
            avatar_section = if user_dropdown[:avatar].present?
              content_tag(:div, avatar_html, class: "flex-shrink-0")
            else
              ''
            end

            text_section = content_tag(:div, class: user_dropdown[:avatar].present? ? 'ml-3 min-w-0 flex-1' : 'min-w-0 flex-1') do
              name_part = if user_dropdown[:name].present?
                content_tag(:p, user_dropdown[:name], class: "text-sm font-medium text-gray-700 truncate")
              else
                ''
              end

              subtitle_part = if user_dropdown[:subtitle].present?
                content_tag(:p, user_dropdown[:subtitle], class: "text-xs text-gray-500 truncate")
              else
                ''
              end

              (name_part + subtitle_part).html_safe
            end

            chevron_section = content_tag(:div, class: "ml-auto flex-shrink-0") do
              bui_icon("chevron-down", size: :small, classes: "text-gray-400")
            end

            (avatar_section + text_section + chevron_section).html_safe
          end
        end

        private

        def width_class
          SIDEBAR_WIDTHS[@width] || SIDEBAR_WIDTHS[:md]
        end

        def theme_classes
          (SIDEBAR_THEMES[@theme] || SIDEBAR_THEMES[:default]).split
        end

        def shadow_class
          SIDEBAR_SHADOWS[@shadow] || SIDEBAR_SHADOWS[:none]
        end

        def border_class
          SIDEBAR_BORDERS[@position] || SIDEBAR_BORDERS[:left]
        end
      end
    end
  end
end
