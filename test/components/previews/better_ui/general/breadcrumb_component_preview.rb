module BetterUi
  module General
    class BreadcrumbComponentPreview < ViewComponent::Preview
      # Breadcrumb configurabile
      #
      # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema di colore"
      # @param separator select { choices: [chevron, slash, arrow, dot, pipe] } "Tipo di separatore"
      # @param size select { choices: [small, medium, large] } "Dimensione del testo"
      # @param with_icons toggle "Mostra icone"
      def default(
        theme: :default,
        separator: :chevron,
        size: :medium,
        with_icons: false
      )
        # Valori validi per i parametri:
        # theme: :default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet
        # separator: :chevron, :slash, :arrow, :dot, :pipe
        # size: :small, :medium, :large
        # with_icons: true, false
        
        items = [
          { label: "Home", url: "#" },
          { label: "Prodotti", url: "#" },
          "Dettaglio prodotto"
        ]
        
        # Assicuriamoci che i parametri siano convertiti nel tipo corretto
        theme = theme.to_sym if theme.is_a?(String)
        separator = separator.to_sym if separator.is_a?(String)
        size = size.to_sym if size.is_a?(String)
        with_icons = with_icons == true || with_icons == "true"
        
        # Validiamo i valori per garantire opzioni corrette
        valid_themes = [:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet]
        valid_separators = [:chevron, :slash, :arrow, :dot, :pipe]
        valid_sizes = [:small, :medium, :large]
        
        theme = :default unless valid_themes.include?(theme)
        separator = :chevron unless valid_separators.include?(separator)
        size = :medium unless valid_sizes.include?(size)
        
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
        
        render_with_template(locals: {
          items: items,
          theme: theme,
          separator: separator,
          size: size
        })
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
      
      # @label Colori diversi
      def color_themes
        render_with_template(locals: {
          themes: [
            { label: "Default", theme: :default },
            { label: "White", theme: :white },
            { label: "Red", theme: :red },
            { label: "Rose", theme: :rose },
            { label: "Orange", theme: :orange },
            { label: "Green", theme: :green },
            { label: "Blue", theme: :blue },
            { label: "Yellow", theme: :yellow },
            { label: "Violet", theme: :violet },
          ]
        })
      end
      
      # @!endgroup
    end
  end
end 