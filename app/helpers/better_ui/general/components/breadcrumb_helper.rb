module BetterUi
  module General
    module Components
      module BreadcrumbHelper
        def bui_breadcrumb(items = nil, **options)
          render BetterUi::General::BreadcrumbComponent.new(
            items: items,
            **options
          )
        end
        
        # Supporto per la sintassi originale per compatibilità
        alias_method :better_ui_general_breadcrumb, :bui_breadcrumb
      end
    end
  end
end 