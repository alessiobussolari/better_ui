module BetterUi
  module Application
    class SidebarComponentPreview < ViewComponent::Preview
      # Sidebar configurabile
      #
      # @param title text "Titolo della sidebar"
      # @param variant select { choices: [light, dark, primary, blue] } "Variante di colore"
      # @param position select { choices: [left, right] } "Posizione della sidebar"
      # @param width select { choices: [narrow, medium, wide] } "Larghezza della sidebar"
      # @param collapsible toggle "Permette di collassare la sidebar"
      # @param collapsed_default toggle "Sidebar collassata all'avvio"
      def default(
        title: "Sidebar",
        variant: :light,
        position: :left,
        width: :medium,
        collapsible: true,
        collapsed_default: false
      )
        # Conversione dei tipi
        variant = variant.to_sym if variant.is_a?(String)
        position = position.to_sym if position.is_a?(String)
        width = width.to_sym if width.is_a?(String)
        collapsible = collapsible == true || collapsible == "true"
        collapsed_default = collapsed_default == true || collapsed_default == "true"
        
        # Costruisci gli elementi del menu
        items = create_menu_items
        
        # Aggiungi un footer
        footer_content = <<-HTML
          <div class="flex items-center">
            <div class="flex-shrink-0">
              <img class="h-10 w-10 rounded-full" src="https://ui-avatars.com/api/?name=Mario+Rossi&background=random" alt="Mario Rossi">
            </div>
            <div class="ml-3">
              <p class="text-sm font-medium">Mario Rossi</p>
              <p class="text-xs opacity-70">mario.rossi@example.com</p>
            </div>
            <button type="button" class="ml-auto p-1 rounded-full hover:bg-gray-200">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
              </svg>
            </button>
          </div>
        HTML
        
        # Crea la preview
        render_with_template(locals: {
          component: BetterUi::Application::SidebarComponent.new(
            title: title,
            variant: variant,
            position: position,
            width: width,
            collapsible: collapsible,
            collapsed_default: collapsed_default,
            items: items,
            footer: footer_content
          )
        })
      end
      
      # @!group Esempi specifici
      
      # @label Sidebar scura con badge
      def dark_with_badges
        items = create_menu_items
        
        # Aggiungi badge ad alcuni elementi
        items[1][:badge] = { text: "5", type: :primary }
        items[3][:badge] = { text: "Nuovo", type: :success }
        
        if items[2][:children]
          items[2][:children][0][:badge] = { text: "7", type: :danger }
        end
        
        render BetterUi::Application::SidebarComponent.new(
          title: "Dashboard",
          variant: :dark,
          items: items
        )
      end
      
      # @label Sidebar primaria con icone
      def primary_sidebar
        render BetterUi::Application::SidebarComponent.new(
          title: "Admin Panel",
          variant: :primary,
          items: create_menu_items,
          width: :narrow
        )
      end
      
      # @label Sidebar a destra con stile blu
      def right_sidebar
        items = create_menu_items
        
        render BetterUi::Application::SidebarComponent.new(
          title: "Settings",
          variant: :blue,
          position: :right,
          items: items
        )
      end
      
      # @label Con pulsante toggle in layout con contenuto
      def with_layout
        sidebar = BetterUi::Application::SidebarComponent.new(
          title: "Dashboard",
          variant: :light,
          items: create_menu_items,
          collapsible: true,
          collapsed_default: false
        )
        
        render_with_template(locals: { sidebar: sidebar })
      end
      
      # @!endgroup
      
      private
      
      # Metodo helper per creare le voci di menu standard
      def create_menu_items
        [
          {
            label: "Dashboard",
            url: "#",
            icon: "chart-simple",
            active: true
          },
          {
            label: "Utenti",
            url: "#",
            icon: "users"
          },
          {
            label: "Documenti",
            icon: "folder",
            children: [
              {
                label: "Fatture",
                url: "#",
                icon: "file-invoice"
              },
              {
                label: "Contratti",
                url: "#",
                icon: "file-signature"
              },
              {
                label: "Report",
                url: "#",
                icon: "file-chart-column"
              }
            ]
          },
          {
            label: "Impostazioni",
            url: "#",
            icon: "gear"
          },
          {
            divider: true
          },
          {
            heading: "Amministrazione"
          },
          {
            label: "Gestione Ruoli",
            url: "#",
            icon: "user-shield"
          },
          {
            label: "Log Attività",
            url: "#",
            icon: "clock-rotate-left"
          }
        ]
      end
    end
  end
end 