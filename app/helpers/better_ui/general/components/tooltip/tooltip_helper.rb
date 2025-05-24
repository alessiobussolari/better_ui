module BetterUi
  module General
    module Components
      module Tooltip
        module TooltipHelper
          # Genera un tooltip usando BetterUi::General::Tooltip::Component
          #
          # @param text [String] testo del tooltip
          # @param theme [Symbol] tema del colore (:default, :white, :red, etc.)
          # @param position [Symbol] posizione del tooltip (:top, :right, :bottom, :left)
          # @param size [Symbol] dimensione del tooltip (:small, :medium, :large)
          # @param style [Symbol] stile del tooltip (:filled, :outline)
          # @param html_options [Hash] opzioni HTML aggiuntive
          # @param block [Block] contenuto dell'elemento trigger
          # @return [String] HTML del tooltip renderizzato
          #
          # @example Uso base
          #   bui_tooltip("Questo è un tooltip") do
          #     bui_button(label: "Hover me")
          #   end
          #
          # @example Tooltip con posizione specifica
          #   bui_tooltip("Messaggio importante", position: :right, theme: :red) do
          #     link_to "Info", "#", class: "text-blue-500"
          #   end
          #
          # @example Tooltip con stili avanzati
          #   bui_tooltip(
          #     "Tooltip grande con outline",
          #     theme: :blue,
          #     position: :bottom,
          #     size: :large,
          #     style: :outline,
          #     id: "custom-tooltip"
          #   ) do
          #     content_tag(:span, "Trigger personalizzato", class: "custom-trigger")
          #   end
          def bui_tooltip(
            text,
            theme: :white,
            position: :top,
            size: :medium,
            style: :filled,
            **html_options,
            &block
          )
            render BetterUi::General::Tooltip::Component.new(
              text: text,
              theme: theme,
              position: position,
              size: size,
              style: style,
              **html_options
            ), &block
          end
        end
      end
    end
  end
end
