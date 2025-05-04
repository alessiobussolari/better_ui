module BetterUi
  module General
    module Components
      module LinkHelper
        def bui_link(label = nil, **options)
          render BetterUi::General::LinkComponent.new(
            label: label,
            **options
          )
        end
        
        # Supporto per la sintassi originale per compatibilità
        alias_method :better_ui_general_link, :bui_link
      end
    end
  end
end 