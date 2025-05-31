# frozen_string_literal: true

module BetterUi
  module Application
    module Components
      module Navbar
        module NavbarHelper
          # Helper per creare la navbar dell'applicazione
          #
          # @param theme [Symbol] Tema colori (default, white, red, rose, orange, green, blue, yellow, violet), default :default
          # @param shadow [Symbol] Tipo di ombra (none, small, medium, large), default :small
          # @param border [Boolean] Se mostrare il bordo inferiore, default true
          # @param actions [Array] Array di azioni/pulsanti a destra
          # @param classes [String] Classi CSS aggiuntive
          # @param with_sidebar [Boolean] Se la navbar è affiancata a una sidebar, default false
          # @param sidebar_width [Symbol] Larghezza della sidebar affiancata (:sm, :md, :lg, :xl), default :md
          # @param form [Nil] Parametro form per compatibilità con form builder (non utilizzato)
          # @param options [Hash] Opzioni HTML aggiuntive
          # @param block [Proc] Blocco contenente contenuto aggiuntivo della navbar
          #
          # @return [String] HTML del componente navbar
          #
          # @example Navbar base
          #   <%= bui_navbar %>
          # 
          # @example Navbar con tema
          #   <%= bui_navbar(theme: :blue) %>
          #
          #
          # @example Navbar con azioni
          #   <%= bui_navbar(
          #     actions: [
          #       { 
          #         type: :avatar,
          #         avatar: { initials: 'AB', theme: :green },
          #         href: '/profile'
          #       },
          #       {
          #         type: :icon,
          #         icon: 'chat',
          #         data: { action: 'click->chat#toggle' }
          #       }
          #     ]
          #   ) %>
          #
          # @example Navbar con classi aggiuntive
          #   <%= bui_navbar(
          #     classes: "my-8",
          #     data: { controller: "navbar" }
          #   ) %>
          def bui_navbar(
            theme: :default,
            shadow: :small,
            border: true,
            actions: [],
            classes: nil,
            with_sidebar: false,
            sidebar_width: :md,
            form: nil, 
            **options,
            &block
          )
            render BetterUi::Application::Navbar::Component.new(
              theme: theme,
              shadow: shadow,
              border: border,
              actions: actions,
              classes: classes,
              with_sidebar: with_sidebar,
              sidebar_width: sidebar_width
            ), &block
          end
        end
      end
    end
  end
end