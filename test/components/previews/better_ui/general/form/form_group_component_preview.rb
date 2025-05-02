module BetterUi
  module General
    module Form
      class FormGroupComponentPreview < Lookbook::Preview
        # @!group Default
        
        # @label Default
        # @param border select [true, false]
        def default(border: true)
          # Usa il template esterno
          render template: "better_ui/general/form/form_group_component_preview/default", 
                 locals: { border: border }
        end
        
        # @!endgroup
        
        # @!group Esempi Specifici
        
        # @label Contenente Campi Diversi
        def with_multiple_input_types
          render template: "better_ui/general/form/form_group_component_preview/with_multiple_input_types"
        end
        
        # @label Senza Bordo
        def without_border
          render template: "better_ui/general/form/form_group_component_preview/without_border"
        end
        
        # @label Solo Titolo
        def title_only
          render template: "better_ui/general/form/form_group_component_preview/title_only"
        end
        
        # @label Solo Descrizione
        def description_only
          render template: "better_ui/general/form/form_group_component_preview/description_only"
        end
        
        # @label Annidato con Altri Componenti
        def nested_with_other_components
          render template: "better_ui/general/form/form_group_component_preview/nested"
        end
        
        # @!endgroup
      end
    end
  end
end 