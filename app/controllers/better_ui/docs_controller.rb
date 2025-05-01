module BetterUi
  class DocsController < ApplicationController
    def index
      # Pagina principale della documentazione
    end
    
    def show
      # Verifica se esiste una vista con il nome richiesto
      page = params[:page]
      valid_pages = %w[introduction installation customization]
      
      if valid_pages.include?(page)
        render page
      else
        # Pagina non trovata
        render plain: "Pagina non trovata", status: :not_found
      end
    end
  end
end 