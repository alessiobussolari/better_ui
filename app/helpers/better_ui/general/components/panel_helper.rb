module BetterUi
  module General
    module Components
      module PanelHelper
        def bui_panel(**options, &block)
          render BetterUi::General::PanelComponent.new(
            **options
          ), &block
        end
        
        # Supporto per la sintassi originale per compatibilità
        alias_method :better_ui_general_panel, :bui_panel
      end
    end
  end
end 