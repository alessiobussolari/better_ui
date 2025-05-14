# frozen_string_literal: true

module BetterUi
  module Application
    module Sidebar
      class LinkComponent < ViewComponent::Base
        attr_reader :text, :url, :icon, :active, :compact, :badge, :external
        
        # @param text [String] Testo del link
        # @param url [String] URL di destinazione
        # @param icon [String] Icona del link
        # @param active [Boolean] Se il link è attivo
        # @param compact [Boolean] Se visualizzare in modalità compatta
        # @param badge [String, Integer] Testo o numero da mostrare come badge
        # @param external [Boolean] Se il link è esterno
        def initialize(text:, url:, icon: nil, active: false, compact: false, badge: nil, external: false)
          @text = text
          @url = url
          @icon = icon
          @active = active
          @compact = compact
          @badge = badge
          @external = external
        end
        
        def link_classes
          [
            'bui-sidebar-link',
            active ? 'bui-sidebar-link--active' : nil,
            compact ? 'bui-sidebar-link--compact' : nil
          ].compact.join(' ')
        end
      end
    end
  end
end 