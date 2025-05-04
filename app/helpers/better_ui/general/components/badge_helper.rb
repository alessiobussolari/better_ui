module BetterUi
  module General
    module Components
      module BadgeHelper
        def bui_badge(label = nil, **options)
          render BetterUi::General::BadgeComponent.new(
            label: label,
            **options
          )
        end
        
        # Supporto per la sintassi originale per compatibilità
        alias_method :better_ui_general_badge, :bui_badge
      end
    end
  end
end 