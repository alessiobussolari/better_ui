# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Text
        module TextHelper
          # Genera un testo usando BetterUi::General::Text::Component
          #
          # @param text [String] testo da mostrare (nil se si usa blocco)
          # @param theme [Symbol] tema del colore (:default, :white, :red, :blue, etc.)
          # @param size [Symbol] dimensione (:xs, :sm, :md, :lg, :xl, :"2xl")
          # @param align [Symbol] allineamento (:left, :center, :right, :justify)
          # @param weight [Symbol] peso font (:thin, :light, :normal, :md, :semibold, :bold, :extrabold)
          # @param style [Symbol] stile (:normal, :italic, :underline, :line_through)
          # @param classes [String] classi CSS aggiuntive
          # @param html_options [Hash] opzioni HTML aggiuntive
          # @return [String] HTML del testo renderizzato
          #
          # @example Uso base
          #   bui_text("Testo semplice")
          #   bui_text("Testo importante", theme: :blue, weight: :bold)
          #
          # @example Con dimensioni e stili
          #   bui_text("Titolo grande", size: :xl, weight: :bold)
          #   bui_text("Testo sottile", theme: :muted, size: :sm)
          #
          # @example Con allineamento
          #   bui_text("Testo centrato", align: :center)
          #   bui_text("Testo giustificato", align: :justify)
          #
          # @example Con stili tipografici
          #   bui_text("Testo corsivo", style: :italic)
          #   bui_text("Testo sottolineato", style: :underline)
          #
          # @example Con blocco Ruby
          #   bui_text(theme: :green, weight: :semibold) do
          #     "Contenuto complesso con <strong>HTML</strong>".html_safe
          #   end
          #
          # @example Con attributi HTML personalizzati
          #   bui_text("Testo con ID", 
          #            theme: :blue, 
          #            id: "my-text",
          #            data: { action: "click->handler#process" })
          #
          # @example Per sostituire paragrafi standard
          #   # Invece di: <p class="text-gray-600">Descrizione</p>
          #   bui_text("Descrizione", theme: :gray)
          #
          # @example Combinazioni complesse
          #   bui_text("Messaggio di errore", 
          #            theme: :red, 
          #            size: :sm, 
          #            weight: :md,
          #            classes: "mb-2")
          def bui_text(
            text = nil,
            theme: :default,
            size: :md,
            align: :left,
            weight: :normal,
            style: :normal,
            classes: '',
            **html_options,
            &block
          )
            render BetterUi::General::Text::Component.new(
              text: text,
              theme: theme,
              size: size,
              align: align,
              weight: weight,
              style: style,
              classes: classes,
              **html_options
            ), &block
          end
        end
      end
    end
  end
end
