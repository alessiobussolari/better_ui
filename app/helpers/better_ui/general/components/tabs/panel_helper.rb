# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Tabs
        module PanelHelper
          # Crea un pannello di contenuto associato a una tab
          #
          # @param id [String] l'identificatore univoco del pannello (deve corrispondere al target della tab)
          # @param active [Boolean] se questo pannello è attualmente visibile
          # @param classes [String] classi CSS aggiuntive da applicare al pannello
          # @param options [Hash] attributi HTML aggiuntivi da applicare all'elemento
          # @param block [Proc] il contenuto del pannello
          # @return [String] l'HTML del pannello
          #
          # @example Uso base
          #   <%= bui_tab_panel(id: "generale", active: true) do %>
          #     <h3>Impostazioni Generali</h3>
          #     <p>Contenuto del pannello generale...</p>
          #   <% end %>
          #
          # @example Pannello nascosto
          #   <%= bui_tab_panel(id: "sicurezza") do %>
          #     <h3>Sicurezza</h3>
          #     <p>Contenuto del pannello sicurezza...</p>
          #   <% end %>
          #
          # @example Con classi personalizzate
          #   <%= bui_tab_panel(id: "notifiche", classes: "p-6 bg-gray-50") do %>
          #     <h3>Notifiche</h3>
          #     <p>Contenuto del pannello notifiche...</p>
          #   <% end %>
          #
          # @example Con attributi personalizzati
          #   <%= bui_tab_panel(id: "dashboard", data: { testid: "dashboard-panel" }) do %>
          #     <div class="grid grid-cols-2 gap-4">
          #       <div>Statistiche</div>
          #       <div>Grafici</div>
          #     </div>
          #   <% end %>
          #
          # @example Con form Rails
          #   <%= bui_tab_panel(id: "profile") do %>
          #     <%= form_with model: @user do |form| %>
          #       <%= form.text_field :name, class: "form-input" %>
          #       <%= form.submit "Salva", class: "btn btn-primary" %>
          #     <% end %>
          #   <% end %>
          def bui_tab_panel(id:, active: false, classes: '', **options, &block)
            render BetterUi::General::Tabs::PanelComponent.new(
              id: id,
              active: active,
              classes: classes,
              **options
            ), &block
          end
        end
      end
    end
  end
end
