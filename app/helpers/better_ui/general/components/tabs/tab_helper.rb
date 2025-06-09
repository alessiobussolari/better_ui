# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Tabs
        module TabHelper
          # Crea una singola tab all'interno di un container tabs
          #
          # @param text [String] il testo da visualizzare nella tab
          # @param target [String] l'ID del pannello associato a questa tab
          # @param active [Boolean] se questa tab è attualmente attiva
          # @param icon [String] il nome dell'icona opzionale da visualizzare
          # @param disabled [Boolean] se questa tab è disabilitata
          # @param badge [String] il testo/numero del badge opzionale
          # @param theme [Symbol] il tema di colore della tab (:default, :blue, :red, :green, :yellow, :violet, :orange, :rose, :white)
          # @param size [Symbol] la dimensione della tab (:xxs, :xs, :sm, :md, :lg, :xl, :xxl)
          # @param classes [String] classi CSS aggiuntive da applicare alla tab
          # @param options [Hash] attributi HTML aggiuntivi da applicare all'elemento
          # @return [String] l'HTML della tab
          #
          # @example Uso base
          #   <%= bui_tab(text: "Generale", target: "generale", active: true) %>
          #
          # @example Con icona e badge
          #   <%= bui_tab(text: "Messaggi", target: "messages", icon: "envelope", badge: "3") %>
          #
          # @example Tab disabilitata
          #   <%= bui_tab(text: "Premium", target: "premium", disabled: true, icon: "star") %>
          #
          # @example Con temi personalizzati
          #   <%= bui_tab(text: "Errori", target: "errors", theme: :red, badge: "12") %>
          #
          # @example Con attributi personalizzati
          #   <%= bui_tab(text: "Settings", target: "settings", classes: "font-bold", data: { testid: "settings-tab" }) %>
          def bui_tab(text:, target:, active: false, icon: nil, disabled: false, badge: nil, 
                     theme: :default, size: :md, classes: '', **options)
            render BetterUi::General::Tabs::TabComponent.new(
              text: text,
              target: target,
              active: active,
              icon: icon,
              disabled: disabled,
              badge: badge,
              theme: theme,
              size: size,
              classes: classes,
              **options
            )
          end
        end
      end
    end
  end
end
