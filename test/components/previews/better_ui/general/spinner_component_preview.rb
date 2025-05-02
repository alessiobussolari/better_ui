module BetterUi
  module General
    class SpinnerComponentPreview < ViewComponent::Preview
      # Spinner configurabile
      #
      # @param variant select { choices: [primary, secondary, success, warning, danger, info, light, dark, white] } "Variante di colore"
      # @param size select { choices: [xs, sm, md, lg, xl, 2xl, 3xl] } "Dimensione"
      # @param type select { choices: [border, svg] } "Tipo di spinner"
      # @param label text "Testo (opzionale)"
      def default(
        variant: :primary,
        size: :md,
        type: :border,
        label: nil
      )
        # Conversione dei tipi
        variant = variant.to_sym if variant.is_a?(String)
        size = size.to_sym if size.is_a?(String)
        type = type.to_sym if type.is_a?(String)
        
        # Validazione
        valid_variants = [:primary, :secondary, :success, :warning, :danger, :info, :light, :dark, :white]
        valid_sizes = [:xs, :sm, :md, :lg, :xl, :'2xl', :'3xl']
        valid_types = [:border, :svg]
        
        variant = :primary unless valid_variants.include?(variant)
        size = :md unless valid_sizes.include?(size)
        type = :border unless valid_types.include?(type)
        
        # Pulisci valori vuoti
        label = nil if label.is_a?(String) && label.strip.empty?
        
        render BetterUi::General::SpinnerComponent.new(
            variant: variant,
            size: size,
            type: type,
            label: label
          )
      end

      # @!group Esempi specifici
      
      # @label Varianti
      def variants(preview_params = {})
        render_with_template(locals: {})
      end
      
      # @label Dimensioni
      def sizes(preview_params = {})
        render_with_template(locals: {})
      end
      
      # @label Tipi
      def types(preview_params = {})
        render_with_template(locals: {})
      end
      
      # @label Con etichetta
      def with_label(preview_params = {})
        render BetterUi::General::SpinnerComponent.new(
          variant: :primary,
          size: :md,
          label: "Caricamento..."
        )
      end
      
      # @label Casi d'uso
      def use_cases(preview_params = {})
        render_with_template(locals: {})
      end
      # @!endgroup
    end
  end
end 