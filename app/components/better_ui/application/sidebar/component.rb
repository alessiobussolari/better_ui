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
          [
            "flex flex-col h-full",
            get_theme_class,   # Metodo generato automaticamente
            get_shadow_class,  # Metodo generato automaticamente
            "border-r border-gray-200" # Border fisso per ora
          ].compact.join(" ")
        end

        # Metodi helper per il template
        def has_header?
          header.present?
        end

        def has_footer?
          footer.present?
        end

        def has_navigation_sections?
          navigation_sections.any?
        end
      end
    end
  end
end
