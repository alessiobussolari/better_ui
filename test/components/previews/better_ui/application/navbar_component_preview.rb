module BetterUi
  module Application
    class NavbarComponentPreview < ViewComponent::Preview
      # Navbar configurabile
      #
      # @param brand_name text "Nome del brand"
      # @param variant select { choices: [light, dark, primary, transparent] } "Variante di colore"
      # @param fixed select { choices: [none, top, bottom] } "Posizione fissa"
      def default(
        brand_name: "BetterUI",
        variant: :light,
        fixed: "none"
      )
        # Conversione dei tipi
        variant = variant.to_sym if variant.is_a?(String)
        
        # Gestione del fixed position
        fixed_position = fixed != "none" ? fixed.to_sym : nil
        
        # Costruisci gli elementi del menu
        nav_items = [
          { 
            label: "Home", 
            url: "#", 
            active: true
          },
          { 
            label: "Prodotti", 
            url: "#", 
            dropdown: [
              { label: "Categoria 1", url: "#", icon: "tag" },
              { label: "Categoria 2", url: "#", icon: "tag" },
              { label: "Offerte speciali", url: "#", icon: "star" }
            ]
          },
          { 
            label: "Servizi", 
            url: "#"
          },
          { 
            label: "Blog", 
            url: "#"
          },
          { 
            label: "Contatti", 
            url: "#",
            icon: "envelope"
          }
        ]
        
        # Costruisci le azioni
        actions = []
        
        # Aggiungi un pulsante di ricerca
        actions << {
          content: %{
            <button type="button" class="text-gray-700 hover:text-orange-500 focus:outline-none focus:ring-2 focus:ring-orange-300 rounded-lg text-sm p-2">
              <span class="sr-only">Cerca</span>
              <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
              </svg>
            </button>
          }
        }
        
        # Aggiungi un pulsante accedi/registrati
        actions << {
          content: %{
            <button type="button" class="text-white bg-orange-600 hover:bg-orange-700 focus:ring-4 focus:outline-none focus:ring-orange-300 font-medium rounded-lg text-sm px-4 py-2 text-center">
              Accedi
            </button>
          }
        }
        
        # Crea il componente
        render BetterUi::Application::NavbarComponent.new(
          brand: { name: brand_name, url: "#" },
          variant: variant,
          fixed: fixed_position,
          items: nav_items,
          actions: actions
        )
      end
      
      # @!group Esempi specifici
      
      # @label Navbar scura con logo
      def dark_with_logo
        logo_html = %{
          <svg class="h-8 w-8" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M12 16C14.2091 16 16 14.2091 16 12C16 9.79086 14.2091 8 12 8C9.79086 8 8 9.79086 8 12C8 14.2091 9.79086 16 12 16Z" fill="white"/>
            <path d="M22 12C22 17.5228 17.5228 22 12 22C6.47715 22 2 17.5228 2 12C2 6.47715 6.47715 2 12 2C17.5228 2 22 6.47715 22 12Z" stroke="white" stroke-width="2"/>
          </svg>
        }
        
        nav_items = [
          { label: "Home", url: "#", active: true },
          { label: "Prodotti", url: "#" },
          { label: "Servizi", url: "#" },
          { label: "Contatti", url: "#" }
        ]
        
        render BetterUi::Application::NavbarComponent.new(
          brand: { 
            name: "Dark UI", 
            logo: logo_html,
            url: "#" 
          },
          variant: :dark,
          items: nav_items
        )
      end
      
      # @label Navbar primaria con dropdown
      def primary_with_dropdown
        nav_items = [
          { label: "Dashboard", url: "#", icon: "chart-bar" },
          { 
            label: "Utenti", 
            url: "#", 
            icon: "users",
            dropdown: [
              { label: "Elenco utenti", url: "#", icon: "list" },
              { label: "Gruppi", url: "#", icon: "user-group" },
              { label: "Permessi", url: "#", icon: "shield-check" }
            ]
          },
          { label: "Impostazioni", url: "#", icon: "cog" }
        ]
        
        # Azioni
        actions = []
        actions << {
          content: %{
            <button type="button" class="text-white bg-orange-700 hover:bg-orange-800 focus:ring-4 focus:outline-none focus:ring-orange-300 font-medium rounded-lg text-sm px-4 py-2 text-center">
              <i class="fas fa-plus mr-1"></i> Nuovo
            </button>
          }
        }
        
        render BetterUi::Application::NavbarComponent.new(
          brand: "Admin Panel",
          variant: :primary,
          items: nav_items,
          actions: actions
        )
      end
      
      # @label Navbar trasparente
      def transparent_navbar
        nav_items = [
          { label: "Home", url: "#", active: true },
          { label: "Chi siamo", url: "#" },
          { label: "Servizi", url: "#" },
          { label: "Portfolio", url: "#" },
          { label: "Contatti", url: "#" }
        ]
        
        # Aggiungi un pulsante CTA
        actions = [{
          content: %{
            <button type="button" class="text-white bg-orange-600 hover:bg-orange-700 focus:ring-4 focus:outline-none focus:ring-orange-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
              Richiedi preventivo
            </button>
          }
        }]
        
        render_with_template(locals: {
          component: BetterUi::Application::NavbarComponent.new(
            brand: { 
              name: "Studio Creativo", 
              url: "#" 
            },
            variant: :transparent,
            fixed: :top,
            items: nav_items,
            actions: actions
          )
        })
      end
      
      # @!endgroup
    end
  end
end 