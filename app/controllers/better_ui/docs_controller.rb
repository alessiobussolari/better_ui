module BetterUi
  class DocsController < ApplicationController
    def index
      @components = [
        { name: 'Button', path: better_ui.docs_component_path('button') },
        { name: 'Alert', path: better_ui.docs_component_path('alert') },
        { name: 'Card', path: better_ui.docs_component_path('card') },
        { name: 'Modal', path: better_ui.docs_component_path('modal') },
        { name: 'Tabs', path: better_ui.docs_component_path('tabs') },
        { name: 'Form Elements', path: better_ui.docs_component_path('form_elements') }
      ]
    end
    
    def show
      doc_file = Rails.root.join('docs', "#{params[:page]}.md")
      
      if File.exist?(doc_file)
        @content = File.read(doc_file)
      else
        @content = "# Documentazione non trovata\nLa pagina richiesta non è stata trovata."
      end
    end
    
    def component
      component_name = params[:component]
      
      # Percorso relativo ai file di documentazione dei componenti
      doc_file = BetterUi::Engine.root.join('docs', 'components', "#{component_name}.md")
      
      if File.exist?(doc_file)
        @content = File.read(doc_file)
      else
        @content = "# Componente non trovato\nLa documentazione per il componente '#{component_name}' non è stata trovata."
      end
      
      # Decidere quali esempi mostrare in base al componente
      @component_name = component_name
      render :component
    end
  end
end 