module BetterUi
  module General
    module Components
      module Heading
        module HeadingHelper
          # Genera un heading usando BetterUi::General::Heading::Component
          #
          # @param text [String] testo del heading
          # @param level [Integer] livello del heading (1-6)
          # @param theme [Symbol] tema del colore (:default, :white, etc.)
          # @param align [Symbol] allineamento (:left, :center, :right)
          # @param size [Symbol] dimensione (:sm, :md, :lg)
          # @param style [Symbol] stile (:normal, :bold, :italic, :underline)
          # @param icon [String] icona opzionale
          # @param subtitle [String] sottotitolo opzionale
          # @param with_divider [Boolean] mostra linea divisoria
          # @param html_options [Hash] opzioni HTML per il container
          # @return [String] HTML del heading renderizzato
          #
          # @example Uso base
          #   bui_heading("Titolo principale")
          #   bui_heading("Sottotitolo", level: 3, theme: :blue)
          #
          # @example Con icona e sottotitolo
          #   bui_heading("Dashboard", icon: "home", subtitle: "Panoramica generale")
          #
          # @example Con divider
          #   bui_heading("Sezione", level: 2, with_divider: true, theme: :green)
          #
          # @example Con opzioni avanzate
          #   bui_heading(
          #     "Titolo personalizzato",
          #     level: 1,
          #     theme: :violet,
          #     align: :center,
          #     size: :lg,
          #     style: :bold,
          #     icon: "star",
          #     subtitle: "Con tutte le opzioni",
          #     with_divider: true,
          #     id: "main-title",
          #     class: "custom-heading"
          #   )
          def bui_heading(
            text,
            level: 2,
            theme: :white,
            align: :left,
            size: :md,
            style: :normal,
            icon: nil,
            subtitle: nil,
            with_divider: false,
            **html_options
          )
            render BetterUi::General::Heading::Component.new(
              level: level,
              theme: theme,
              align: align,
              size: size,
              style: style,
              icon: icon,
              subtitle: subtitle,
              with_divider: with_divider,
              **html_options
            ).with_content(text)
          end
        end
      end
    end
  end
end
