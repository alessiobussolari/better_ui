module BetterUi
  module General
    class HeadingComponentPreview < ViewComponent::Preview
      # Heading configurabile
      #
      # @param text text "Testo dell'heading"
      # @param level select { choices: [1, 2, 3, 4, 5, 6] } "Livello dell'heading"
      # @param variant select { choices: [default, primary, success, warning, danger, info, light] } "Variante di colore"
      # @param size select { choices: [xs, sm, md, lg, xl, xxl] } "Dimensione del testo"
      # @param align select { choices: [left, center, right] } "Allineamento del testo"
      # @param icon text "Nome icona (opzionale)"
      # @param subtitle text "Sottotitolo (opzionale)"
      # @param with_divider toggle "Mostra linea divisoria"
      def default(
        text: "Titolo di esempio",
        level: 2,
        variant: :default,
        size: :md,
        align: :left,
        icon: nil,
        subtitle: nil,
        with_divider: false
      )
        # Conversione dei tipi
        level = level.to_i if level.is_a?(String)
        variant = variant.to_sym if variant.is_a?(String)
        size = size.to_sym if size.is_a?(String)
        align = align.to_sym if align.is_a?(String)
        with_divider = with_divider == true || with_divider == "true"
        
        # Validazione
        valid_levels = [1, 2, 3, 4, 5, 6]
        valid_variants = [:default, :primary, :success, :warning, :danger, :info, :light]
        valid_sizes = [:xs, :sm, :md, :lg, :xl, :xxl]
        valid_aligns = [:left, :center, :right]
        
        level = 2 unless valid_levels.include?(level)
        variant = :default unless valid_variants.include?(variant)
        size = :md unless valid_sizes.include?(size)
        align = :left unless valid_aligns.include?(align)
        
        # Pulisci valori vuoti
        icon = nil if icon.is_a?(String) && icon.strip.empty?
        subtitle = nil if subtitle.is_a?(String) && subtitle.strip.empty?
        
        # Se lo sfondo è chiaro e la variante è light, mostriamo con sfondo scuro
        if variant == :light
          render_with_template(locals: {
            variant: variant,
            level: level,
            size: size,
            align: align,
            text: text,
            icon: icon,
            subtitle: subtitle,
            with_divider: with_divider
          })
        else
          render BetterUi::General::HeadingComponent.new(
            text: text,
            level: level,
            variant: variant,
            size: size,
            align: align,
            icon: icon,
            subtitle: subtitle,
            with_divider: with_divider
          )
        end
      end
      
      # @!group Esempi specifici
      
      # @label Gerarchia di titoli
      def heading_hierarchy
        render_with_template
      end
      
      # @label Con sottotitolo e divisore
      def with_subtitle_and_divider
        render BetterUi::General::HeadingComponent.new(
          text: "Titolo con sottotitolo",
          level: 2,
          variant: :primary,
          subtitle: "Questo è un sottotitolo che fornisce informazioni aggiuntive",
          with_divider: true
        )
      end
      
      # @label Con icona
      def with_icon
        render BetterUi::General::HeadingComponent.new(
          text: "Titolo con icona",
          level: 2,
          variant: :info,
          icon: "info-circle",
          subtitle: "Informazioni importanti"
        )
      end
      
      # @!endgroup
    end
  end
end 