module BetterUi
  module General
    module Components
      module TableHelper
        def bui_table(data = nil, **options, &block)
          render BetterUi::General::TableComponent.new(
            data: data,
            **options
          ), &block
        end
        
        # Supporto per la sintassi originale per compatibilità
        alias_method :better_ui_general_table, :bui_table
      end
    end
  end
end 