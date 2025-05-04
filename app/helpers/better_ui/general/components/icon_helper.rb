module BetterUi
  module General
    module Components
      module IconHelper
        def bui_icon(name = nil, **options)
          render BetterUi::General::IconComponent.new(
            name: name,
            **options
          )
        end
        
        # Supporto per la sintassi originale per compatibilità
        alias_method :better_ui_general_icon, :bui_icon
      end
    end
  end
end 