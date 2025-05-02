module BetterUi
  module General
    class BreadcrumbComponentPreview < ViewComponent::Preview
      # Breadcrumb configurabile
      #
      # @param variant select { choices: [default, primary, light] } "Variante di colore"
      # @param separator select { choices: [chevron, slash, arrow, dot, pipe] } "Tipo di separatore"
      # @param size select { choices: [sm, md, lg] } "Dimensione del testo"
      # @param inverse toggle "Usa sfondo scuro"
      # @param with_icons toggle "Mostra icone"
      # @param items_count select { choices: [2, 3, 5] } "Numero di elementi"
      def default(
        variant: :default,
        separator: :chevron,
        size: :md,
        inverse: false,
        with_icons: false,
        items_count: 3
      )
        # Valori validi per i parametri:
        # variant: :default, :primary, :light
        # separator: :chevron, :slash, :arrow, :dot, :pipe
        # size: :sm, :md, :lg
        # inverse: true, false
        # with_icons: true, false
        # items_count: 2, 3, 5
        
        base_items = [
          { label: "Home", url: "#" },
          { label: "Prodotti", url: "#" },
          { label: "Elettronica", url: "#" },
          { label: "Computer", url: "#" },
          { label: "Laptop", url: "#" },
          "MacBook Pro 16"
        ]
        
        # Assicuriamoci che i parametri siano convertiti nel tipo corretto
        variant = variant.to_sym if variant.is_a?(String)
        separator = separator.to_sym if separator.is_a?(String)
        size = size.to_sym if size.is_a?(String)
        inverse = inverse == true || inverse == "true"
        with_icons = with_icons == true || with_icons == "true"
        items_count = items_count.to_i if items_count.is_a?(String)
        
        # Validiamo i valori per garantire opzioni corrette
        valid_variants = [:default, :primary, :light]
        valid_separators = [:chevron, :slash, :arrow, :dot, :pipe]
        valid_sizes = [:sm, :md, :lg]
        valid_items_counts = [2, 3, 5]
        
        variant = :default unless valid_variants.include?(variant)
        separator = :chevron unless valid_separators.include?(separator)
        size = :md unless valid_sizes.include?(size)
        items_count = 3 unless valid_items_counts.include?(items_count)
        
        items = base_items.take(items_count)
        
        # Se richieste le icone, aggiungile
        if with_icons
          icon_names = ["home", "box", "tag", "laptop", "microchip", "info-circle"]
          items = items.each_with_index.map do |item, index|
            if item.is_a?(Hash)
              item.merge(icon: icon_names[index])
            else
              { label: item, icon: icon_names[index] }
            end
          end
        end
        
        # Se richiesto lo sfondo inverso, aggiungi un wrapper
        if inverse && variant != :light
          render_with_template(locals: {
            variant: variant,
            separator: separator,
            size: size,
            inverse: inverse,
            items: items
          })
        else
          render BetterUi::General::BreadcrumbComponent.new(
            items: items,
            variant: variant,
            separator: separator,
            size: size,
            inverse: inverse
          )
        end
      end
      
      # @!group Esempi specifici
      
      # @label Con percorso lungo
      def long_path
        render BetterUi::General::BreadcrumbComponent.new(
          items: [
            { label: "Home", url: "#", icon: "home" },
            { label: "Prodotti", url: "#", icon: "box" },
            { label: "Elettronica", url: "#", icon: "tag" },
            { label: "Computer", url: "#", icon: "laptop" },
            { label: "Laptop", url: "#", icon: "microchip" },
            { label: "MacBook Pro 16", icon: "info-circle" }
          ]
        )
      end
      
      # @label Solo stringhe
      def strings_only
        render BetterUi::General::BreadcrumbComponent.new(
          items: [
            "Home",
            "Prodotti",
            "Dettaglio prodotto"
          ]
        )
      end
      
      # @!endgroup
    end
  end
end 