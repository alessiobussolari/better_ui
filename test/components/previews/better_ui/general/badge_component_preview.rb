module BetterUi
  module General
    class BadgeComponentPreview < ViewComponent::Preview
      # Badge configurabile
      #
      # @param text text "Testo del badge"
      # @param variant select { choices: [default, primary, success, warning, danger, info, dark, light] } "Variante di colore"
      # @param size select { choices: [xs, sm, md, lg] } "Dimensione"
      # @param rounded select { choices: [none, sm, md, lg, full] } "Arrotondamento angoli"
      # @param icon text "Nome icona (opzionale)"
      def default(
        text: "Badge",
        variant: :default,
        size: :md,
        rounded: :md,
        icon: nil
      )
        # Conversione dei tipi
        variant = variant.to_sym if variant.is_a?(String)
        size = size.to_sym if size.is_a?(String)
        rounded = rounded.to_sym if rounded.is_a?(String)
        
        # Validazione
        valid_variants = [:default, :primary, :success, :warning, :danger, :info, :dark, :light]
        valid_sizes = [:xs, :sm, :md, :lg]
        valid_rounded = [:none, :sm, :md, :lg, :full]
        
        variant = :default unless valid_variants.include?(variant)
        size = :md unless valid_sizes.include?(size)
        rounded = :md unless valid_rounded.include?(rounded)
        
        # Pulisci valori vuoti
        icon = nil if icon.is_a?(String) && icon.strip.empty?
        text = nil if text.is_a?(String) && text.strip.empty?
        
        render BetterUi::General::BadgeComponent.new(
          text: text,
          variant: variant,
          size: size,
          rounded: rounded,
          icon: icon
        )
      end

      # @!group Esempi specifici
      
      # @label Tutte le varianti
      def variants(preview_params = {})
        render_with_template(locals: {})
      end
      
      # @label Con icona
      def with_icon(preview_params = {})
        render BetterUi::General::BadgeComponent.new(
          text: "Nuovo",
          variant: :success,
          icon: "check-circle"
        )
      end
      
      # @label Solo icona
      def icon_only(preview_params = {})
        render BetterUi::General::BadgeComponent.new(
          variant: :primary,
          rounded: :full,
          icon: "star"
        )
      end
      
      # @label Contatore numerico
      def counter(preview_params = {})
        render_with_template(locals: {})
      end
      
      # @label Status
      def status(preview_params = {})
        render_with_template(locals: {})
      end
      # @!endgroup
    end
  end
end 