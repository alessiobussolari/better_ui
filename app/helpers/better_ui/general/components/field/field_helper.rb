module BetterUi
  module General
    module Components
      module Field
        module FieldHelper
          # @param text [String] Testo della label (argomento posizionale)
          # @param name [String] Nome del campo
          # @param required [Boolean] Se il campo è obbligatorio
          # @param error [String] Messaggio di errore
          # @param help_text [String] Testo di aiuto
          # @return [BetterUi::General::FieldComponent] Componente del campo
          def bui_field(text = nil, name:, required: false, error: nil, help_text: nil, id: nil, &block)
            render BetterUi::General::Field::Component.new(
              text: text,
              name: name,
              required: required,
              error: error,
              help_text: help_text,
              id: id || SecureRandom.uuid
            ), &block
          end
        end
      end
    end
  end
end
