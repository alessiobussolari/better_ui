# frozen_string_literal: true

module BetterUi
  module Application
    module Components
      module Card
        module CardHelper
          # Helper per creare una card per metriche e statistiche nelle dashboard applicative
          #
          # @param title [String] Il titolo/etichetta della metrica
          # @param value [String] Il valore principale da visualizzare
          # @param trend [Symbol, nil] La direzione del trend (:up, :down, nil), default nil
          # @param change [String, nil] Il valore del cambiamento (es. "+12%"), default nil
          # @param color [Symbol] Il colore del trend (:green, :red, :blue, :yellow, :purple, :indigo, :gray), default :green
          # @param theme [Symbol] Il tema della card (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet, :purple), default :default
          # @param size [Symbol] La dimensione della card (:small, :medium, :large), default :medium
          # @param rounded [Symbol] Il livello di arrotondamento (:none, :small, :medium, :large, :full), default :medium
          # @param shadow [Symbol] Il tipo di ombra (:none, :small, :medium, :large), default :small
          # @param classes [String, nil] Classi CSS aggiuntive per il contenitore principale
          # @param form [Nil] Parametro form per compatibilità con form builder (non utilizzato)
          # @param options [Hash] Attributi HTML aggiuntivi da passare al div principale
          #
          # @return [String] HTML della card per metriche
          #
          # @example Card base con solo titolo e valore
          #   <%= bui_card(title: "Utenti Attivi", value: "1.234") %>
          #
          # @example Card con trend positivo
          #   <%= bui_card(
          #     title: "Vendite Totali",
          #     value: "€ 45.231",
          #     trend: :up,
          #     change: "+12%",
          #     color: :green
          #   ) %>
          #
          # @example Card con trend negativo
          #   <%= bui_card(
          #     title: "Conversioni",
          #     value: "2.8%",
          #     trend: :down,
          #     change: "-5%",
          #     color: :red
          #   ) %>
          #
          # @example Card con tema e dimensioni personalizzate
          #   <%= bui_card(
          #     title: "Revenue",
          #     value: "$89,432",
          #     theme: :primary,
          #     size: :large,
          #     rounded: :large,
          #     shadow: :medium
          #   ) %>
          #
          # @example Card con attributi HTML aggiuntivi
          #   <%= bui_card(
          #     title: "Performance",
          #     value: "98.5%",
          #     classes: "transition-all hover:shadow-lg",
          #     data: { controller: "stats" },
          #     id: "performance-card"
          #   ) %>
          def bui_card(
            title:,
            value:,
            trend: nil,
            change: nil,
            color: :green,
            theme: :default,
            size: :medium,
            rounded: :medium,
            shadow: :small,
            classes: nil,
            form: nil,
            **options
          )
            render BetterUi::Application::Card::Component.new(
              title: title,
              value: value,
              trend: trend,
              change: change,
              color: color,
              theme: theme,
              size: size,
              rounded: rounded,
              shadow: shadow,
              classes: classes,
              **options
            )
          end
        end
      end
    end
  end
end
