module BetterUi
  module Application
    module Components
      module Sidebar
        module SidebarHelper
          # Helper per creare la sidebar dell'applicazione
          #
          # @param width [Symbol] Larghezza della sidebar (:sm, :md, :lg, :xl), default :md
          # @param position [Symbol] Posizione della sidebar (:left, :right), default :left
          # @param theme [Symbol] Tema colori (:default, :dark, :light), default :default
          # @param shadow [Symbol] Tipo di ombra (:none, :sm, :md, :lg), default :lg
          # @param border [Boolean] Se mostrare il bordo destro/sinistro, default true
          # @param header [Hash] Configurazione header (logo, title, subtitle)
          # @param footer [Hash] Configurazione footer (content, user_info)
          # @param navigation_sections [Array] Array di sezioni di navigazione
          # @param collapsible [Boolean] Se abilitare sezioni collassabili, default true
          # @param classes [String] Classi CSS aggiuntive
          # @param block [Proc] Blocco contenente contenuto aggiuntivo della sidebar
          #
          # @return [String] HTML del componente sidebar
          def bui_sidebar(
            width: :md,
            position: :left,
            theme: :default,
            shadow: :lg,
            border: true,
            header: {},
            footer: {},
            navigation_sections: [],
            collapsible: true,
            classes: nil,
            &block
          )
            render BetterUi::Application::Sidebar::Component.new(
              width: width,
              position: position,
              theme: theme,
              shadow: shadow,
              border: border,
              header: header,
              footer: footer,
              navigation_sections: navigation_sections,
              collapsible: collapsible,
              classes: classes
            ), &block
          end
        end
      end
    end
  end
end
