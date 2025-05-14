module BetterUi
  module General
    class BreadcrumbComponentPreview < Lookbook::Preview
      # @!group Esempi Base

      # @label Con Helper
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema del breadcrumb"
      # @param separator select { choices: [chevron, slash, arrow, dot, pipe] } "Tipo di separatore"
      # @param size select { choices: [small, medium, large] } "Dimensione del testo"
      # @param with_icons toggle "Mostra icone"
      def default(
        theme: :default,
        separator: :chevron,
        size: :medium,
        with_icons: false
      )
        items = generate_items(with_icons)

        normalize_params!(
          theme: theme,
          separator: separator,
          size: size,
          with_icons: with_icons
        )

        render_with_template(locals: {
          items: items,
          theme: theme,
          separator: separator,
          size: size
        })
      end

      # @label Istanziazione Diretta
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet, gray] } "Tema del breadcrumb"
      # @param separator select { choices: [chevron, slash, arrow, dot, pipe] } "Tipo di separatore"
      # @param size select { choices: [small, medium, large] } "Dimensione del testo"
      # @param with_icons toggle "Mostra icone"
      def raw(
        theme: :default,
        separator: :chevron,
        size: :medium,
        with_icons: false
      )
        items = generate_items(with_icons)

        normalize_params!(
          theme: theme,
          separator: separator,
          size: size,
          with_icons: with_icons
        )

        render BetterUi::General::BreadcrumbComponent.new(
          items: items,
          theme: theme,
          separator: separator,
          size: size
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
        # Conversione dei tipi
        options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
        options[:separator] = options[:separator].to_sym if options[:separator].is_a?(String)
        options[:size] = options[:size].to_sym if options[:size].is_a?(String)
        options[:with_icons] = options[:with_icons] == true || options[:with_icons] == "true"

        options
      end
    end
  end
end
