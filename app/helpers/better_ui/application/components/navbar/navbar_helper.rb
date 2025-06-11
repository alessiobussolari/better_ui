# frozen_string_literal: true

module BetterUi
  module Application
    module Components
      module Navbar
        module NavbarHelper
          # Helper per creare la navbar dell'applicazione
          #
          # @param size [Symbol] Dimensione navbar (:sm, :md, :lg), default :md
          # @param theme [Symbol] Tema colori (default, white, red, rose, orange, green, blue, yellow, violet), default :default
          # @param variant [Symbol] Variante stilistica (:default, :solid, :transparent, :glass), default :default
          # @param shadow [Symbol] Tipo di ombra (none, sm, md, lg), default :sm
          # @param border [Boolean] Se mostrare il bordo inferiore, default false
          # @param actions [Array] Array di azioni/pulsanti a destra (legacy)
          # @param show_avatar [Boolean] Se mostrare l'avatar, default false
          # @param show_user_dropdown [Boolean] Se mostrare il dropdown utente, default false
          # @param show_icon_buttons [Boolean] Se mostrare i pulsanti icona, default false
          # @param with_sidebar [Boolean] Se la navbar è affiancata a una sidebar, default false
          # @param sidebar_width [Symbol] Larghezza della sidebar affiancata (:sm, :md, :lg, :xl), default :md
          # @param action_button_theme [Symbol] Tema per i button nelle azioni, default :default
          # @param action_icon_theme [Symbol] Tema per le icone nelle azioni, default :default
          # @param form [Nil] Parametro form per compatibilità con form builder (non utilizzato)
          # @param options [Hash] Opzioni HTML aggiuntive
          # @param block [Proc] Blocco contenente contenuto aggiuntivo della navbar
          #
          # @return [String] HTML del componente navbar
          #
          # @example Navbar base
          #   <%= bui_navbar %>
          # 
          # @example Navbar con tema e dimensione
          #   <%= bui_navbar(size: :lg, theme: :blue, variant: :glass) %>
          #
          # @example Navbar con nuovi componenti
          #   <%= bui_navbar(
          #     theme: :blue,
          #     show_avatar: true,
          #     show_user_dropdown: true,
          #     show_icon_buttons: true
          #   ) do |navbar|
          #     # Contenuto principale
          #     navbar.with_avatar(name: "John Doe", size: :md, theme: :blue)
          #     navbar.with_icon_button(icon: "bell", theme: :default, size: :sm)
          #     navbar.with_user_dropdown(trigger: "Menu") do
          #       bui_dropdown_item("Profile", icon: "user")
          #       bui_dropdown_item("Logout", icon: "logout")
          #     end
          #   end %>
          #
          # @example Navbar con azioni legacy (compatibilità)
          #   <%= bui_navbar(
          #     theme: :green,
          #     actions: [
          #       { type: :button, text: "Save", theme: :green },
          #       { type: :icon, icon: "share" }
          #     ]
          #   ) %>
          #
          # @example Navbar con attributi HTML
          #   <%= bui_navbar(
          #     data: { controller: "navbar" },
          #     class: "custom-navbar"
          #   ) %>
          def bui_navbar(
            size: :md,
            theme: :default,
            variant: :default,
            shadow: :sm,
            border: false,
            actions: [],
            show_avatar: false,
            show_user_dropdown: false,
            show_icon_buttons: false,
            with_sidebar: false,
            sidebar_width: :md,
            action_button_theme: :default,
            action_icon_theme: :default,
            form: nil, 
            **options,
            &block
          )
            render BetterUi::Application::Navbar::Component.new(
              size: size,
              theme: theme,
              variant: variant,
              shadow: shadow,
              border: border,
              actions: actions,
              show_avatar: show_avatar,
              show_user_dropdown: show_user_dropdown,
              show_icon_buttons: show_icon_buttons,
              with_sidebar: with_sidebar,
              sidebar_width: sidebar_width,
              action_button_theme: action_button_theme,
              action_icon_theme: action_icon_theme,
              **options
            ), &block
          end
        end
      end
    end
  end
end