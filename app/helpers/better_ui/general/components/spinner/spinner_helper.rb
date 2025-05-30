module BetterUi
  module General
    module Components
      module Spinner
        module SpinnerHelper
          def bui_spinner(label = nil, **options)
            render BetterUi::General::Spinner::Component.new(
              label: label,
              **options
            )
          end

          # Supporto per la sintassi originale per compatibilità
          alias_method :better_ui_general_spinner, :bui_spinner
        end
      end
    end
  end
end
