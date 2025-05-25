module BetterUi
  module Application
    module Components
      module Navbar
        module NavbarHelper
          # Helper per creare la navbar dell'applicazione
          #
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
          # @param block [Proc] Blocco contenente contenuto aggiuntivo della navbar
          #
          # @return [String] HTML del componente navbar
          def bui_navbar(
            theme: :default,
            position: :top,
            height: :md,
            shadow: :sm,
            border: true,
            brand: {},
            breadcrumb: {},
            navigation_items: [],
            actions: [],
            classes: nil,
            &block
          )
            render BetterUi::Application::Navbar::Component.new(
              theme: theme,
              position: position,
              height: height,
              shadow: shadow,
              border: border,
              brand: brand,
              breadcrumb: breadcrumb,
              navigation_items: navigation_items,
              actions: actions,
              classes: classes
            ), &block
          end
        end
      end
    end
  end
end
