module BetterUi
  module General
    module Components
      module ButtonHelper
        def bui_button(label = nil, **options)
          render BetterUi::General::ButtonComponent.new(
            label: label,
            **options
          )
        end
        
        # Supporto per la sintassi originale per compatibilità
        alias_method :better_ui_general_button, :bui_button
      end
    end
  end
end 