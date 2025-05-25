# frozen_string_literal: true

module BetterUi
  module Application
    module Sidebar
      class Component < ViewComponent::Base
        # Include degli helper per utilizzare bui_icon e bui_avatar
        include BetterUi::General::Components::Icon::IconHelper
        include BetterUi::General::Components::Avatar::AvatarHelper
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
        # @param footer [Hash] Configurazione footer (content, user_info)
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

        def container_classes
          base_classes = %w[fixed inset-y-0 z-50 flex flex-col overflow-y-auto]
          
          # Posizione
          base_classes << (position == :right ? "right-0" : "left-0")
          
          # Larghezza
          base_classes << width_class
          
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
          footer.present? && (footer[:content].present? || footer[:user_info].present?)
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
