module BetterUi
  module General
    module Breadcrumb
      class ComponentPreview < Lookbook::Preview
        # @!group Esempi Base

        # @label Con Helper
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema del breadcrumb"
        # @param separator select { choices: [chevron, slash, arrow, dot, pipe] } "Tipo di separatore"
        # @param size select { choices: [small, medium, large] } "Dimensione del testo"
        # @param with_icons toggle "Mostra icone"
        # @notes
        # **Struttura dell'array `items`:**
        #
        # L'array `items` supporta diversi formati per massima flessibilità:
        #
        # - **Stringa semplice**: Per l'ultimo elemento (non cliccabile)
        #   ```ruby
        #   "Pagina corrente"
        #   ```
        #
        # - **Hash base**: Per elementi cliccabili con label e URL
        #   ```ruby
        #   { label: "Home", url: "/home" }
        #   ```
        #
        # - **Hash con icona**: Per elementi cliccabili con icone
        #   ```ruby
        #   { label: "Prodotti", url: "/products", icon: "box" }
        #   ```
        #
        # **Esempio completo di utilizzo:**
        # ```ruby
        # items = [
        #   { label: "Home", url: "/", icon: "home" },
        #   { label: "Prodotti", url: "/products", icon: "box" },
        #   { label: "Categoria", url: "/category" },
        #   "Dettaglio prodotto"  # Ultimo elemento (non cliccabile)
        # ]
        #
        # # Con helper
        # bui_breadcrumb(items: items, theme: :white, size: :medium)
        #
        # # Istanziazione diretta
        # render BetterUi::General::Breadcrumb::Component.new(
        #   items: items,
        #   theme: :white,
        #   size: :medium
        # )
        # ```
        #
        # **Note:**
        # - L'ultimo elemento viene automaticamente reso non cliccabile (active)
        # - Le icone sono opzionali e utilizzano il componente IconComponent
        # - I separatori sono configurabili tramite il parametro `separator`
        def default(
          theme: :white,
          separator: :chevron,
          size: :medium,
          with_icons: false
        )
          items = generate_items(with_icons)

          normalized = normalize_params!(
            theme: theme,
            separator: separator,
            size: size,
            with_icons: with_icons
          )

          render_with_template(locals: {
            items: items,
            theme: normalized[:theme],
            separator: normalized[:separator],
            size: normalized[:size]
          })
        end

        # @label Istanziazione Diretta
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema del breadcrumb"
        # @param separator select { choices: [chevron, slash, arrow, dot, pipe] } "Tipo di separatore"
        # @param size select { choices: [small, medium, large] } "Dimensione del testo"
        # @param with_icons toggle "Mostra icone"
        def raw(
          theme: :white,
          separator: :chevron,
          size: :medium,
          with_icons: false
        )
          items = generate_items(with_icons)

          normalized = normalize_params!(
            theme: theme,
            separator: separator,
            size: size,
            with_icons: with_icons
          )

          render BetterUi::General::Breadcrumb::Component.new(
            items: items,
            theme: normalized[:theme],
            separator: normalized[:separator],
            size: normalized[:size]
          )
        end

        # @!endgroup

        private

        def generate_items(with_icons)
          items = [
            { label: "Home", url: "#" },
            { label: "Prodotti", url: "#" },
            "Dettaglio prodotto"
          ]

          # Se richieste le icone, aggiungile
          if with_icons
            icon_names = ["home", "box", "info-circle"]
            items = items.each_with_index.map do |item, index|
              if item.is_a?(Hash)
                item.merge(icon: icon_names[index])
              else
                { label: item, icon: icon_names[index] }
              end
            end
          end

          items
        end

        def normalize_params!(options)
          # Normalizzazione parametri
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:separator] = options[:separator].to_sym if options[:separator].is_a?(String)
          options[:size] = options[:size].to_sym if options[:size].is_a?(String)
          options[:with_icons] = options[:with_icons] == true || options[:with_icons] == "true"

          options
        end
      end
    end
  end
end
