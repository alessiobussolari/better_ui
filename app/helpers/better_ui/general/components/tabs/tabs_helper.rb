# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Tabs
        module TabsHelper
          # Crea un sistema completo di tabs con navigazione e panel inclusi
          #
          # @param variant [Symbol] lo stile delle tabs (:pills, :underline, :bordered, :minimal)
          # @param theme [Symbol] il tema di colore delle tabs (:default, :blue, :red, :green, :yellow, :violet, :orange, :rose, :white)
          # @param size [Symbol] la dimensione delle tabs (:sm, :md, :lg)
          # @param orientation [Symbol] l'orientamento delle tabs (:horizontal, :vertical)
          # @param navigation_classes [String] classi CSS aggiuntive per la navigazione
          # @param panels_classes [String] classi CSS aggiuntive per i panel (default: 'mt-4')
          # @param options [Hash] attributi HTML aggiuntivi da applicare all'elemento wrapper
          # @param block [Proc] il contenuto che definisce navigation e panels tramite slots
          # @return [String] l'HTML completo del sistema tabs
          #
          # @example Uso base con slots
          #   <%= bui_tabs do |tabs| %>
          #     <% tabs.with_navigation do %>
          #       <%= bui_tab(text: "Tab 1", target: "tab1", active: true) %>
          #       <%= bui_tab(text: "Tab 2", target: "tab2") %>
          #     <% end %>
          #     <% tabs.with_panels do %>
          #       <%= bui_tab_panel(id: "tab1", active: true) do %>
          #         Contenuto del primo pannello
          #       <% end %>
          #       <%= bui_tab_panel(id: "tab2") do %>
          #         Contenuto del secondo pannello
          #       <% end %>
          #     <% end %>
          #   <% end %>
          #
          # @example Con temi e dimensioni
          #   <%= bui_tabs(variant: :underline, theme: :blue, size: :lg) do |tabs| %>
          #     <% tabs.with_navigation do %>
          #       <%= bui_tab(text: "Dashboard", target: "dashboard", active: true, icon: "chart-bar") %>
          #       <%= bui_tab(text: "Impostazioni", target: "settings", icon: "cog-6-tooth") %>
          #     <% end %>
          #     <% tabs.with_panels do %>
          #       <%= bui_tab_panel(id: "dashboard", active: true) do %>
          #         Dashboard content...
          #       <% end %>
          #       <%= bui_tab_panel(id: "settings") do %>
          #         Settings content...
          #       <% end %>
          #     <% end %>
          #   <% end %>
          #
          # @example Tabs verticali
          #   <%= bui_tabs(orientation: :vertical, variant: :pills) do |tabs| %>
          #     <% tabs.with_navigation do %>
          #       <%= bui_tab(text: "Profilo", target: "profile", active: true) %>
          #       <%= bui_tab(text: "Account", target: "account") %>
          #     <% end %>
          #     <% tabs.with_panels do %>
          #       <%= bui_tab_panel(id: "profile", active: true) do %>
          #         Informazioni profilo...
          #       <% end %>
          #       <%= bui_tab_panel(id: "account") do %>
          #         Impostazioni account...
          #       <% end %>
          #     <% end %>
          #   <% end %>
          #
          # @example Con classi personalizzate
          #   <%= bui_tabs(navigation_classes: "border-b-2", panels_classes: "p-6 bg-gray-50") do |tabs| %>
          #     <% tabs.with_navigation do %>
          #       <%= bui_tab(text: "Home", target: "home", active: true) %>
          #     <% end %>
          #     <% tabs.with_panels do %>
          #       <%= bui_tab_panel(id: "home", active: true) do %>
          #         Home content with custom styling...
          #       <% end %>
          #     <% end %>
          #   <% end %>
          def bui_tabs(variant: :pills, theme: :default, size: :md, orientation: :horizontal, 
                      navigation_classes: '', panels_classes: 'mt-4', **options, &block)
            render BetterUi::General::Tabs::Component.new(
              variant: variant,
              theme: theme,
              size: size,
              orientation: orientation,
              navigation_classes: navigation_classes,
              panels_classes: panels_classes,
              **options
            ), &block
          end
        end
      end
    end
  end
end
