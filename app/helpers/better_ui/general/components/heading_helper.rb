module BetterUi
  module General
    module Components
      module HeadingHelper
        def bui_heading(title = nil, **options)
          render BetterUi::General::HeadingComponent.new(
            title: title,
            **options
          )
        end
        
        # Supporto per la sintassi originale per compatibilità
        alias_method :better_ui_general_heading, :bui_heading
      end
    end
  end
end 