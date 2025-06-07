# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Dropdown
        module DropdownHelper
          ##
          # Crea un componente dropdown interattivo con menu contestuale.
          #
          # @param trigger [String] Il testo del pulsante trigger (obbligatorio)
          # @param position [Symbol] La posizione del menu dropdown (:bottom, :top, :left, :right)
          # @param theme [Symbol] Il tema colore del trigger (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
          # @param size [Symbol] La dimensione del trigger (:small, :medium, :large)
          # @param rounded [Symbol] Il border radius (:none, :small, :medium, :large, :full)
          # @param animation [Symbol] Il tipo di animazione (:fade, :slide, :none)
          # @param fullwidth [Boolean] Se il trigger deve occupare tutta la larghezza disponibile
          # @param show_chevron [Boolean] Se mostrare l'icona chevron automatica
          # @param selectable [Boolean] Se il dropdown deve aggiornare il trigger con la selezione
          # @param classes [String] Classi CSS aggiuntive
          # @param options [Hash] Attributi HTML aggiuntivi
          # @param block [Proc] Il contenuto del menu dropdown
          #
          # @return [String] Il markup HTML del componente dropdown
          #
          # @example Uso base
          #   <%= bui_dropdown(trigger: "Azioni") do %>
          #     <%= bui_dropdown_item(text: "Modifica") %>
          #   <% end %>
          #
          # @example Con posizione e tema
          #   <%= bui_dropdown(trigger: "Menu", position: :top, theme: :blue) do %>
          #     <%= bui_dropdown_item(text: "Profilo", icon: "user") %>
          #     <%= bui_dropdown_divider %>
          #     <%= bui_dropdown_item(text: "Logout", icon: "logout") %>
          #   <% end %>
          #
          # @example Con dimensioni e stile
          #   <%= bui_dropdown(trigger: "Opzioni", size: :large, rounded: :full, animation: :slide) do %>
          #     <%= bui_dropdown_item(text: "Impostazioni", icon: "cog") %>
          #   <% end %>
          #
          # @example Con link e azioni
          #   <%= bui_dropdown(trigger: "Utente", theme: :green) do %>
          #     <%= bui_dropdown_item(text: "Dashboard", href: "/dashboard") %>
          #     <%= bui_dropdown_item(text: "Profilo", href: "/profile") %>
          #     <%= bui_dropdown_divider %>
          #     <%= bui_dropdown_item(text: "Elimina", theme: :red, icon: "trash") %>
          #   <% end %>
          #
          # @example Con attributi HTML personalizzati
          #   <%= bui_dropdown(trigger: "Menu", id: "main-menu", data: { controller: "dropdown" }) do %>
          #     <%= bui_dropdown_item(text: "Item 1") %>
          #   <% end %>
          #
          def bui_dropdown(
            trigger:,
            position: :bottom,
            theme: :default,
            size: :medium,
            rounded: :medium,
            animation: :fade,
            fullwidth: false,
            show_chevron: true,
            selectable: false,
            classes: '',
            **options,
            &block
          )
            render BetterUi::General::Dropdown::Component.new(
              trigger: trigger,
              position: position,
              theme: theme,
              size: size,
              rounded: rounded,
              animation: animation,
              fullwidth: fullwidth,
              show_chevron: show_chevron,
              selectable: selectable,
              classes: classes,
              **options
            ), &block
          end
        end
      end
    end
  end
end
