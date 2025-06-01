# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Tabs
        module TabsHelper
          # Crea un container di navigazione tabs per organizzare contenuti correlati
          #
          # @param variant [Symbol] lo stile delle tabs (:pills, :underline, :bordered, :minimal)
          # @param theme [Symbol] il tema di colore delle tabs (:default, :blue, :red, :green, :yellow, :violet, :orange, :rose, :white)
          # @param size [Symbol] la dimensione delle tabs (:small, :medium, :large)
          # @param orientation [Symbol] l'orientamento delle tabs (:horizontal, :vertical)
          # @param classes [String] classi CSS aggiuntive da applicare al container
          # @param options [Hash] attributi HTML aggiuntivi da applicare all'elemento
          # @param block [Proc] il contenuto delle tabs (le singole tab)
          # @return [String] l'HTML del container tabs
          #
          # @example Uso base
          #   <%= bui_tabs do %>
          #     <%= bui_tab(text: "Generale", target: "generale", active: true) %>
          #     <%= bui_tab(text: "Sicurezza", target: "sicurezza") %>
          #   <% end %>
          #
          # @example Con temi e dimensioni
          #   <%= bui_tabs(variant: :underline, theme: :blue, size: :large) do %>
          #     <%= bui_tab(text: "Dashboard", target: "dashboard", active: true, icon: "chart-bar") %>
          #     <%= bui_tab(text: "Impostazioni", target: "settings", icon: "cog-6-tooth") %>
          #   <% end %>
          #
          # @example Tabs verticali
          #   <%= bui_tabs(orientation: :vertical, variant: :pills) do %>
          #     <%= bui_tab(text: "Profilo", target: "profile") %>
          #     <%= bui_tab(text: "Account", target: "account") %>
          #   <% end %>
          #
          # @example Con attributi personalizzati
          #   <%= bui_tabs(classes: "my-4", data: { testid: "main-tabs" }) do %>
          #     <%= bui_tab(text: "Home", target: "home", active: true) %>
          #   <% end %>
          #
          # @example Con Rails form builder
          #   <%= bui_tabs(form: form, variant: :bordered) do %>
          #     <%= bui_tab(text: "Dati personali", target: "personal") %>
          #     <%= bui_tab(text: "Contatti", target: "contacts") %>
          #   <% end %>
          def bui_tabs(variant: :pills, theme: :default, size: :medium, orientation: :horizontal, 
                      classes: '', form: nil, **options, &block)
            render BetterUi::General::Tabs::Component.new(
              variant: variant,
              theme: theme,
              size: size,
              orientation: orientation,
              classes: classes,
              **options
            ), &block
          end
        end
      end
    end
  end
end
