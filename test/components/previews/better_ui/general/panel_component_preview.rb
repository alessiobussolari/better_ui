module BetterUi
  module General
    class PanelComponentPreview < ViewComponent::Preview
      # Pannello configurabile
      #
      # @param title text "Titolo del pannello (opzionale)"
      # @param body text "Contenuto del pannello (opzionale)"
      # @param header text "Header personalizzato (opzionale)"
      # @param footer text "Footer del pannello (opzionale)"
      # @param variant select { choices: [default, primary, success, warning, danger, info] } "Variante di colore"
      # @param padding select { choices: [none, small, medium, large] } "Dimensione del padding interno"
      def default(
        title: "Titolo Pannello",
        body: "Questo è il contenuto del pannello.",
        header: nil,
        footer: nil,
        variant: :default,
        padding: :medium
      )
        # Conversione dei tipi
        variant = variant.to_sym if variant.is_a?(String)
        padding = padding.to_sym if padding.is_a?(String)
        
        # Validazione
        valid_variants = [:default, :primary, :success, :warning, :danger, :info]
        valid_paddings = [:none, :small, :medium, :large]
        
        variant = :default unless valid_variants.include?(variant)
        padding = :medium unless valid_paddings.include?(padding)
        
        # Pulisci valori vuoti
        title = nil if title.is_a?(String) && title.strip.empty?
        body = nil if body.is_a?(String) && body.strip.empty?
        header = nil if header.is_a?(String) && header.strip.empty?
        footer = nil if footer.is_a?(String) && footer.strip.empty?
        
        render BetterUi::General::PanelComponent.new(
          title: title,
          body: body,
          header: header,
          footer: footer,
          variant: variant,
          padding: padding
        )
      end
      
      # @!group Esempi specifici
      
      # @label Pannello completo
      def complete_panel
        render BetterUi::General::PanelComponent.new(
          title: "Pannello Completo",
          body: "Questo pannello include tutte le sezioni disponibili con un footer informativo.",
          footer: "Ultimo aggiornamento: maggio 2023",
          variant: :primary
        )
      end
      
      # @label Con header personalizzato
      def custom_header_panel
        render BetterUi::General::PanelComponent.new(
          header: "Header completamente personalizzato",
          body: "Corpo del pannello con header personalizzato anziché titolo standard.",
          variant: :info
        )
      end
      
      # @!endgroup
    end
  end
end 