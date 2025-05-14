# frozen_string_literal: true

module BetterUi
  module Application
    module Sidebar
      class Component < ViewComponent::Base
        attr_reader :width, :position, :theme, :expanded, :compact_width, :collapsed, :compact, :id, :classes

        # Posizioni possibili per la sidebar
        SIDEBAR_POSITION = {
          left: 'bui-sidebar--position-left',
          right: 'bui-sidebar--position-right'
        }.freeze

        # Temi disponibili per la sidebar
        SIDEBAR_THEME = {
          default: 'bui-sidebar--theme-default',
          white: 'bui-sidebar--theme-white',
          light: 'bui-sidebar--theme-light',
          dark: 'bui-sidebar--theme-dark',
          gray: 'bui-sidebar--theme-gray'
        }.freeze

        # Stati della sidebar
        SIDEBAR_STATE = {
          expanded: 'bui-sidebar--expanded',
          collapsed: 'bui-sidebar--collapsed',
          collapsible: 'bui-sidebar--collapsible',
          compact: 'bui-sidebar--compact'
        }.freeze

        # @param width [String] Larghezza della sidebar (es. "16rem" o "256px")
        # @param compact_width [String] Larghezza della sidebar in modalità compatta (es. "4rem" o "64px")
        # @param position [Symbol] Posizione della sidebar (:left o :right)
        # @param theme [Symbol] Tema della sidebar (:default, :white, :light, :dark, :gray)
        # @param expanded [Boolean] Se la sidebar è espansa per default
        # @param collapsed [Boolean] Se la sidebar è collassabile
        # @param compact [Boolean] Se mostrare la sidebar in modalità compatta
        # @param id [String] ID HTML opzionale
        # @param classes [String] Classi CSS aggiuntive
        def initialize(
          width: '16rem',
          compact_width: '4rem',
          position: :left,
          theme: :default,
          expanded: true,
          collapsed: false,
          compact: false,
          id: nil,
          classes: nil
        )
          @width = width
          @compact_width = compact_width
          @position = position.to_sym
          @theme = theme.to_sym
          @expanded = expanded
          @collapsed = collapsed
          @compact = compact
          @id = id
          @classes = classes
        end

        # Combina tutte le classi in una stringa
        def combined_classes
          [
            'bui-sidebar',
            get_position_class,
            get_theme_class,
            expanded ? SIDEBAR_STATE[:expanded] : SIDEBAR_STATE[:collapsed],
            collapsed ? SIDEBAR_STATE[:collapsible] : nil,
            compact ? SIDEBAR_STATE[:compact] : nil,
            classes
          ].compact.join(' ')
        end

        # Genera gli stili inline per la sidebar
        def inline_styles
          sidebar_width = compact ? compact_width : width
          "width: #{sidebar_width};"
        end

        # Restituisce tutti gli attributi HTML
        def html_options
          {
            class: combined_classes,
            style: inline_styles,
            id: @id
          }.compact
        end

        private

        def get_position_class
          SIDEBAR_POSITION[position] || SIDEBAR_POSITION[:left]
        end

        def get_theme_class
          SIDEBAR_THEME[theme] || SIDEBAR_THEME[:default]
        end
      end
    end
  end
end
