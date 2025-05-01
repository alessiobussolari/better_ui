module BetterUi
  class DocsController < ApplicationController
    def index
      # Pagina principale della documentazione
    end
    
    def show
      # Verifica se esiste una vista con il nome richiesto
      page = params[:page]
      valid_pages = %w[introduction installation customization components/buttons]
      
      if valid_pages.include?(page)
        if page.start_with?('components/')
          # Per i componenti, rendiamo esplicitamente il template nella directory corretta
          component_name = page.split('/').last
          render template: "better_ui/docs/components/#{component_name}"
        else
          render page
        end
      else
        # Pagina non trovata
        render plain: "Pagina non trovata", status: :not_found
      end
    end
    
    def component
      # Gestisce le rotte tipo /better_ui/docs/components/button
      component_name = params[:component]
      render template: "better_ui/docs/components/#{component_name}"
    rescue ActionView::MissingTemplate
      render plain: "Componente non trovato", status: :not_found
    end
  end
end 