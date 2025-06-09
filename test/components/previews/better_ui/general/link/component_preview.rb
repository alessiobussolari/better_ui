module BetterUi
  module General
    module Link
      class ComponentPreview < Lookbook::Preview
        # @!group Esempi Base

        # @label Con Helper
        # @param label text "Testo del link"
        # @param href text "URL di destinazione (lasciare vuoto per semplice testo)"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema di colore"
        # @param orientation select { choices: [horizontal, vertical] } "Orientamento"
        # @param style select { choices: [default, underline, bold, text] } "Stile del link"
        # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del link"
        # @param icon text "Nome icona (opzionale)"
        # @param active toggle "Link attivo/corrente"
        # @param disabled toggle "Link disabilitato"
        # @param target select { choices: [_blank, _self, _parent, _top] } "Target del link (opzionale)"
        def default(
          label: "Esempio link",
          href: "#",
          theme: :white,
          orientation: :horizontal,
          style: :default,
          size: :md,
          icon: "",
          active: false,
          disabled: false,
          target: ""
        )
          normalized = normalize_params!(
            label: label,
            href: href,
            theme: theme,
            orientation: orientation,
            style: style,
            size: size,
            icon: icon,
            active: active,
            disabled: disabled,
            target: target
          )

          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param label text "Testo del link"
        # @param href text "URL di destinazione (lasciare vuoto per semplice testo)"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema di colore"
        # @param orientation select { choices: [horizontal, vertical] } "Orientamento"
        # @param style select { choices: [default, underline, bold, text] } "Stile del link"
        # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del link"
        # @param icon text "Nome icona (opzionale)"
        # @param active toggle "Link attivo/corrente"
        # @param disabled toggle "Link disabilitato"
        # @param target select { choices: [_blank, _self, _parent, _top] } "Target del link (opzionale)"
        def raw(
          label: "Esempio link",
          href: "#",
          theme: :white,
          orientation: :horizontal,
          style: :default,
          size: :md,
          icon: "",
          active: false,
          disabled: false,
          target: ""
        )
          normalized = normalize_params!(
            label: label,
            href: href,
            theme: theme,
            orientation: orientation,
            style: style,
            size: size,
            icon: icon,
            active: active,
            disabled: disabled,
            target: target
          )

          render BetterUi::General::Link::Component.new(
            label: normalized[:label],
            href: normalized[:href],
            theme: normalized[:theme],
            orientation: normalized[:orientation],
            style: normalized[:style],
            size: normalized[:size],
            icon: normalized[:icon],
            active: normalized[:active],
            disabled: normalized[:disabled],
            target: normalized[:target]
          )
        end

        # @!endgroup

        private

        def normalize_params!(options)
          # Normalizzazione parametri
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:orientation] = options[:orientation].to_sym if options[:orientation].is_a?(String)
          options[:style] = options[:style].to_sym if options[:style].is_a?(String)
          options[:size] = options[:size].to_sym if options[:size].is_a?(String)

          # Pulizia valori vuoti
          options[:href] = nil if options[:href].is_a?(String) && options[:href].strip.empty?
          options[:icon] = nil if options[:icon].is_a?(String) && options[:icon].strip.empty?
          options[:target] = nil if options[:target].is_a?(String) && options[:target].strip.empty?

          options
        end
      end
    end
  end
end
