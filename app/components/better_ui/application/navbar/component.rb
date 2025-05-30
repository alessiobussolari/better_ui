# frozen_string_literal: true

module BetterUi
  module Application
    module Navbar
      class Component < ViewComponent::Base
        # Include degli helper per utilizzare bui_icon, bui_avatar e bui_breadcrumb
        include BetterUi::General::Components::Icon::IconHelper
        include BetterUi::General::Components::Avatar::AvatarHelper
        include BetterUi::General::Components::Breadcrumb::BreadcrumbHelper
        attr_reader :theme, :position, :height, :shadow, :border, :brand, :breadcrumb, :navigation_items, :actions, :classes

        # Temi navbar con classi Tailwind dirette
        NAVBAR_THEMES = {
          default: "bg-white text-gray-900 border-gray-200",
          dark: "bg-gray-900 text-white border-gray-700",
          light: "bg-gray-50 text-gray-900 border-gray-100"
        }

        # Altezze navbar con classi Tailwind dirette
        NAVBAR_HEIGHTS = {
          sm: "h-12",
          md: "h-16",
          lg: "h-20"
        }

        # Posizioni navbar con classi Tailwind dirette
        NAVBAR_POSITIONS = {
          top: "",
          fixed_top: "fixed top-0 left-0 right-0 z-50",
          sticky_top: "sticky top-0 z-40"
        }

        # Ombre navbar con classi Tailwind dirette
        NAVBAR_SHADOWS = {
          none: "",
          sm: "shadow-sm",
          md: "shadow-md",
          lg: "shadow-lg",
          xl: "shadow-xl"
        }

        # @param theme [Symbol] Tema colori (:default, :dark, :light), default :default
        # @param position [Symbol] Posizione della navbar (:top, :fixed_top, :sticky_top), default :top
        # @param height [Symbol] Altezza della navbar (:sm, :md, :lg), default :md
        # @param shadow [Symbol] Tipo di ombra (:none, :sm, :md, :lg, :xl), default :sm
        # @param border [Boolean] Se mostrare il bordo inferiore, default true
        # @param brand [Hash] Configurazione brand (logo, title, href)
        # @param breadcrumb [Hash] Configurazione breadcrumb (items, separator, theme)
        # @param navigation_items [Array] Array di elementi di navigazione centrali
        # @param actions [Array] Array di azioni/pulsanti a destra
        # @param classes [String] Classi CSS aggiuntive
        def initialize(
          theme: :default,
          position: :top,
          height: :md,
          shadow: :sm,
          border: true,
          brand: {},
          breadcrumb: {},
          navigation_items: [],
          actions: [],
          classes: nil
        )
          @theme = theme.to_sym
          @position = position.to_sym
          @height = height.to_sym
          @shadow = shadow.to_sym
          @border = border
          @brand = brand || {}
          @breadcrumb = breadcrumb || {}
          @navigation_items = navigation_items || []
          @actions = actions || []
          @classes = classes
        end

        def container_classes
          base_classes = %w[w-full flex items-center justify-between px-4 sm:px-6 lg:px-8]

          # Posizione
          base_classes.concat(position_classes.split) if position != :top

          # Altezza
          base_classes << height_class

          # Tema
          base_classes.concat(theme_classes.split)

          # Shadow
          base_classes << shadow_class if shadow != :none

          # Border
          base_classes << "border-b" if border

          # Classi aggiuntive
          base_classes << classes if classes.present?

          base_classes.compact.join(" ")
        end

        def has_brand?
          brand.present? && (brand[:title].present? || brand[:logo].present?)
        end

        def has_breadcrumb?
          breadcrumb.present? && breadcrumb[:items].present? && breadcrumb[:items].any?
        end

        def has_navigation?
          navigation_items.present? && navigation_items.any?
        end

        def has_actions?
          actions.present? && actions.any?
        end

        def render_breadcrumb
          return unless has_breadcrumb?

          bui_breadcrumb(
            items: breadcrumb[:items],
            separator: breadcrumb[:separator] || :chevron,
            theme: breadcrumb[:theme] || theme,
            size: :small
          )
        end

        private

        def position_classes
          NAVBAR_POSITIONS[@position] || NAVBAR_POSITIONS[:top]
        end

        def height_class
          NAVBAR_HEIGHTS[@height] || NAVBAR_HEIGHTS[:md]
        end

        def theme_classes
          NAVBAR_THEMES[@theme] || NAVBAR_THEMES[:default]
        end

        def shadow_class
          NAVBAR_SHADOWS[@shadow] || NAVBAR_SHADOWS[:sm]
        end
      end
    end
  end
end
