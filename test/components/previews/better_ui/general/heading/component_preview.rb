module BetterUi
  module General
    module Heading
      class ComponentPreview < BetterUi::BaseComponentPreview
        # @!group Esempi Base

        # @label Con Helper
        # @param text text "Testo del titolo"
        # @param level select { choices: [1, 2, 3, 4, 5, 6] } "Livello del heading (h1-h6)"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del colore"
        # @param align select { choices: [left, center, right] } "Allineamento del testo"
        # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del testo"
        # @param style select { choices: [normal, bold, italic, underline] } "Stile del testo"
        # @param icon text "Nome dell'icona (opzionale)"
        # @param subtitle text "Sottotitolo (opzionale)"
        # @param with_divider toggle "Mostra linea divisoria"
        def default(
          text: "Titolo di esempio",
          level: 2,
          theme: :white,
          align: :left,
          size: :md,
          style: :normal,
          icon: "",
          subtitle: "",
          with_divider: false
        )
          normalized = normalize_params!(
            text: text,
            level: level,
            theme: theme,
            align: align,
            size: size,
            style: style,
            icon: icon,
            subtitle: subtitle,
            with_divider: with_divider
          )

          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param text text "Testo del titolo"
        # @param level select { choices: [1, 2, 3, 4, 5, 6] } "Livello del heading (h1-h6)"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del colore"
        # @param align select { choices: [left, center, right] } "Allineamento del testo"
        # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del testo"
        # @param style select { choices: [normal, bold, italic, underline] } "Stile del testo"
        # @param icon text "Nome dell'icona (opzionale)"
        # @param subtitle text "Sottotitolo (opzionale)"
        # @param with_divider toggle "Mostra linea divisoria"
        def raw(
          text: "Titolo di esempio",
          level: 2,
          theme: :white,
          align: :left,
          size: :md,
          style: :normal,
          icon: "",
          subtitle: "",
          with_divider: false
        )
          normalized = normalize_params!(
            text: text,
            level: level,
            theme: theme,
            align: align,
            size: size,
            style: style,
            icon: icon,
            subtitle: subtitle,
            with_divider: with_divider
          )

          render BetterUi::General::Heading::Component.new(
            level: normalized[:level],
            theme: normalized[:theme],
            align: normalized[:align],
            size: normalized[:size],
            style: normalized[:style],
            icon: normalized[:icon],
            subtitle: normalized[:subtitle],
            with_divider: normalized[:with_divider]
          ).with_content(normalized[:text])
        end

        # @!endgroup

        private

        def enum_params
          [:theme, :align, :size, :style]
        end

        def nullable_string_params
          [:icon, :subtitle]
        end

        def numeric_params
          [:level]
        end

        def default_params
          {
            theme: :default,
            align: :left,
            size: :md,
            style: :normal
          }
        end
      end
    end
  end
end
