module BetterUi
  module General
    module Components
      module Tag
        module TagHelper
        # Render un tag con le opzioni specificate
        #
        # @param text [String] testo del tag (obbligatorio)
        # @param options [Hash] opzioni per il componente
        #
        # @option options [Symbol] :theme (:white) tema del colore (:default, :white, :red, etc.)
        # @option options [Symbol] :size (:md) dimensione (:sm, :md, :lg)
        # @option options [Symbol] :style (:filled) stile (:filled, :outline)
        #
        # @return [String] HTML del componente
        def bui_tag(text, **options)
          render BetterUi::General::Tag::Component.new(
            text: text,
            **options
          )
        end
        end
      end
    end
  end
end
