module BetterUi
  module Application
    class SidebarComponentPreview < ViewComponent::Preview
      # Sidebar configurabile
      #
      # @param title text "Titolo della sidebar"
      # @param variant select { choices: [modern, light, dark, primary, blue] } "Variante di colore"
      # @param position select { choices: [left, right] } "Posizione della sidebar"
      # @param width select { choices: [narrow, medium, wide] } "Larghezza della sidebar"
      # @param collapsible toggle "Permette di collassare la sidebar"
      # @param collapsed_default toggle "Sidebar collassata all'avvio"
      def default(
        title: "Acme Inc",
        variant: :modern,
        position: :left,
        width: :narrow,
        collapsible: false,
        collapsed_default: false
      )
        # Conversione dei tipi
        variant = variant.to_sym if variant.is_a?(String)
        position = position.to_sym if position.is_a?(String)
        width = width.to_sym if width.is_a?(String)
        collapsible = collapsible == true || collapsible == "true"
        collapsed_default = collapsed_default == true || collapsed_default == "true"
        
        # Costruisci gli elementi del menu
        items = create_modern_menu_items
        
        # Aggiungi un footer
        footer_content = <<-HTML
          <div class="flex items-center justify-between rounded-md p-2 hover:bg-gray-100 cursor-pointer">
            <div class="flex items-center">
              <img class="h-8 w-8 rounded-md" src="https://ui-avatars.com/api/?name=shadcn&background=6366f1&color=fff&bold=true" alt="shadcn">
              <div class="ml-3">
                <p class="text-sm font-medium text-gray-900">shadcn</p>
                <p class="text-xs text-gray-500">m@example.com</p>
              </div>
            </div>
            <button type="button" class="p-1 rounded-full text-gray-400 hover:text-gray-500">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
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
      
      # @label Sidebar moderna (come nell'immagine)
      def modern_sidebar
        items = create_modern_menu_items
        
        footer_content = <<-HTML
          <div class="flex items-center justify-between rounded-md p-2 hover:bg-gray-100 cursor-pointer">
            <div class="flex items-center">
              <img class="h-8 w-8 rounded-md" src="https://ui-avatars.com/api/?name=shadcn&background=6366f1&color=fff&bold=true" alt="shadcn">
              <div class="ml-3">
                <p class="text-sm font-medium text-gray-900">shadcn</p>
                <p class="text-xs text-gray-500">m@example.com</p>
              </div>
            </div>
            <button type="button" class="p-1 rounded-full text-gray-400 hover:text-gray-500">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path>
              </svg>
            </button>
          </div>
        HTML
        
        render BetterUi::Application::SidebarComponent.new(
          title: "Acme Inc",
          variant: :modern,
          items: items,
          footer: footer_content,
          width: :narrow
        )
      end
      
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
      
      # Metodo helper per creare le voci di menu moderno
      def create_modern_menu_items
        [
          {
            label: "Playground",
            icon: "table-cells",
            active: true,
            children: [
              {
                label: "History",
                url: "#",
              },
              {
                label: "Starred",
                url: "#",
              },
              {
                label: "Settings",
                url: "#",
              }
            ]
          },
          {
            label: "Models",
            url: "#",
            icon: "cube",
          },
          {
            label: "Documentation",
            url: "#",
            icon: "book",
          },
          {
            label: "Settings",
            url: "#",
            icon: "gear",
          }
        ]
      end
      
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