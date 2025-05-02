module BetterUi
  module Application
    class HeaderComponentPreview < ViewComponent::Preview
      # @!group Esempi base
      
      # @label Base con titolo e azioni
      def base
        render BetterUi::Application::HeaderComponent.new(
          title: "Dashboard Utente",
          actions: [
            { text: "Modifica", icon: "pencil", type: :secondary },
            { text: "Salva", icon: "check", type: :primary }
          ]
        )
      end
      
      # @label Con breadcrumb
      def with_breadcrumbs
        render BetterUi::Application::HeaderComponent.new(
          title: "Profilo Utente",
          breadcrumbs: [
            { text: "Dashboard", href: "#dashboard" },
            { text: "Utenti", href: "#users" },
            { text: "Profilo", href: "#" }
          ],
          actions: [
            { text: "Modifica", icon: "pencil", type: :secondary }
          ]
        )
      end
      
      # @!endgroup
      
      # @!group Con metadati
      
      # @label Con metadati semplici
      def with_meta_items
        render BetterUi::Application::HeaderComponent.new(
          title: "Posizione: Back End Developer",
          meta_items: [
            { text: "Full-time", icon: "briefcase" },
            { text: "Remote", icon: "map-pin" },
            { text: "$120k – $140k", icon: "currency-dollar" },
            { text: "Scade il 9 Gennaio 2024", icon: "calendar" }
          ],
          actions: [
            { text: "Candidati ora", icon: "paper-airplane", type: :primary }
          ]
        )
      end
      
      # @!endgroup
      
      # @!group Configurazione azioni
      
      # @label Con molte azioni
      def with_multiple_actions
        render BetterUi::Application::HeaderComponent.new(
          title: "Report annuale 2023",
          breadcrumbs: [
            { text: "Dashboard", href: "#dashboard" },
            { text: "Report", href: "#reports" }
          ],
          actions: [
            { text: "Modifica", icon: "pencil", type: :secondary },
            { text: "Condividi", icon: "share", type: :secondary },
            { text: "Esporta PDF", icon: "document-arrow-down", type: :secondary },
            { text: "Pubblica", icon: "check", type: :primary }
          ]
        )
      end
      
      # @label Con azioni per mobile
      def with_mobile_actions
        render BetterUi::Application::HeaderComponent.new(
          title: "Ordine #12345",
          breadcrumbs: [
            { text: "Ordini", href: "#orders" }
          ],
          meta_items: [
            { text: "In lavorazione", icon: "clock" },
            { text: "€149,99", icon: "currency-euro" }
          ],
          actions: [
            { text: "Annulla", icon: "x-mark", type: :secondary, mobile_only: true },
            { text: "Modifica", icon: "pencil", type: :secondary },
            { text: "Conferma", icon: "check", type: :primary }
          ]
        )
      end
      
      # @!endgroup
      
      # @!group Esempi completi
      
      # @label Completo con tutte le opzioni
      def complete
        render BetterUi::Application::HeaderComponent.new(
          title: "Progetto: Sistema di gestione magazzino",
          breadcrumbs: [
            { text: "Progetti", href: "#projects" },
            { text: "Interni", href: "#internal" },
            { text: "Magazzino", href: "#" }
          ],
          meta_items: [
            { text: "In sviluppo", icon: "code" },
            { text: "Priorità alta", icon: "exclamation" },
            { text: "Team: 5 persone", icon: "user-group" },
            { text: "Scadenza: 15/03/2024", icon: "calendar" }
          ],
          actions: [
            { text: "Archivio", icon: "archive-box", type: :secondary, mobile_only: true },
            { text: "Condividi", icon: "share", type: :secondary, mobile_only: true },
            { text: "Assegna", icon: "user-plus", type: :secondary },
            { text: "Documenti", icon: "document", type: :secondary },
            { text: "Aggiorna", icon: "arrow-path", type: :primary }
          ]
        )
      end
      
      # @!endgroup
    end
  end
end 