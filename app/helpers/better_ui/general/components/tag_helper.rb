module BetterUi
  module General
    module Components
      module TagHelper
        # Render un tag/chip con le opzioni specificate
        #
        # @param text [String] testo del tag
        # @param options [Hash] opzioni per il componente
        #
        # @option options [Symbol] :variant (:gray) :gray, :red, :blue, :green, :yellow
        # @option options [Symbol] :shape (:rounded) :rounded, :square
        # @option options [Boolean] :outline (false) versione outline anziché piena
        # @option options [Boolean] :clickable (false) se il tag può essere cliccato
        # @option options [Boolean] :selected (false) stato selezionato
        # @option options [Boolean] :removable (false) se può essere rimosso
        # @option options [String] :icon (nil) icona opzionale
        #
        # @return [String] HTML del componente
        def bui_tag(text = nil, **options)
          options[:text] = text if text.present?
          render BetterUi::General::TagComponent.new(**options)
        end
      end
    end
  end
end
