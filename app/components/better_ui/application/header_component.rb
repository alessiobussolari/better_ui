module BetterUi
  module Application
    class HeaderComponent < ViewComponent::Base
      attr_reader :title, :breadcrumbs, :meta_items, :actions, :mobile_menu

      # Inizializzazione del componente
      def initialize(
        title:,
        breadcrumbs: [],
        meta_items: [],
        actions: [],
        mobile_menu: true
      )
        @title = title
        @breadcrumbs = breadcrumbs
        @meta_items = meta_items
        @actions = actions
        @mobile_menu = mobile_menu
      end

      # Struttura un elemento breadcrumb
      def format_breadcrumb(breadcrumb, last = false)
        {
          text: breadcrumb[:text],
          href: breadcrumb[:href],
          last: last
        }
      end

      # Struttura un elemento meta con icona
      def format_meta_item(item)
        {
          text: item[:text],
          icon: item[:icon]
        }
      end

      # Struttura un'azione (bottone)
      def format_action(action)
        {
          text: action[:text],
          icon: action[:icon],
          type: action[:type] || :secondary,
          href: action[:href],
          method: action[:method],
          data: action[:data] || {},
          classes: action[:classes],
          mobile_only: action[:mobile_only] || false,
          desktop_only: action[:desktop_only] || false
        }
      end

      # Verifica se ci sono azioni esclusivamente per mobile
      def has_mobile_only_actions?
        @actions.any? { |action| action[:mobile_only] }
      end

      # Ottieni solo le azioni per il menu mobile
      def mobile_menu_actions
        @actions.select { |action| !action[:desktop_only] }
      end
    end
  end
end 