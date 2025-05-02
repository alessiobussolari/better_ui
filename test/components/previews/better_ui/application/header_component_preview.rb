module BetterUi
  module Application
    class HeaderComponentPreview < Lookbook::Preview
      # @!group Default
      
      # @label Default
      # @param variant select [modern, light, dark, primary, transparent]
      # @param fixed select [none, top, bottom]
      def default(variant: "modern", fixed: "none")
        render(
          BetterUi::Application::HeaderComponent.new(
            title: "Dashboard",
            subtitle: "Gestisci tutto da qui",
            variant: variant,
            fixed: fixed == "none" ? nil : fixed,
            actions: [
              {
                content: button_html("Nuovo", "primary")
              },
              {
                content: button_html("Esporta", "secondary")
              }
            ]
          )
        )
      end
      
      # @!endgroup
      
      # @!group Esempi Specifici
      
      # @label Con Icona
      # @param variant select [modern, light, dark, primary, transparent]
      def with_icon(variant: "modern")
        render(
          BetterUi::Application::HeaderComponent.new(
            title: {
              text: "Impostazioni",
              icon: "settings"
            },
            subtitle: "Configura le tue preferenze",
            variant: variant,
            actions: [
              {
                content: button_html("Salva", "primary")
              },
              {
                content: button_html("Annulla", "secondary")
              }
            ]
          )
        )
      end
      
      # @label Con Breadcrumbs
      # @param variant select [modern, light, dark, primary, transparent]
      # @param show_breadcrumbs select [true, false]
      def with_breadcrumbs(variant: "modern", show_breadcrumbs: true)
        render(
          BetterUi::Application::HeaderComponent.new(
            title: "Dettaglio Utente",
            subtitle: "Visualizza e modifica le informazioni dell'utente",
            variant: variant,
            breadcrumbs: [
              { text: "Home", url: "/" },
              { text: "Utenti", url: "/users" },
              { text: "Mario Rossi" }
            ],
            show_breadcrumbs: show_breadcrumbs,
            actions: [
              {
                content: button_html("Modifica", "primary")
              },
              {
                content: button_html("Elimina", "secondary")
              }
            ]
          )
        )
      end

      # @label Con Molti Breadcrumbs
      # @param variant select [modern, light, dark, primary, transparent]
      def with_many_breadcrumbs(variant: "modern")
        render(
          BetterUi::Application::HeaderComponent.new(
            title: "File.pdf",
            subtitle: "Documento condiviso",
            variant: variant,
            breadcrumbs: [
              { text: "Home", url: "/" },
              { text: "Progetti", url: "/projects" },
              { text: "Progetto Alpha", url: "/projects/alpha" },
              { text: "Documenti", url: "/projects/alpha/documents" },
              { text: "File.pdf" }
            ],
            actions: [
              {
                content: button_html("Scarica", "primary")
              }
            ]
          )
        )
      end
      
      # @label Esempio Completo
      # @param variant select [modern, light, dark, primary, transparent]
      def complete_example(variant: "modern")
        render(
          BetterUi::Application::HeaderComponent.new(
            title: {
              text: "Prodotti",
              icon: "shopping-cart"
            },
            subtitle: "Gestisci il catalogo prodotti",
            variant: variant,
            breadcrumbs: [
              { text: "Dashboard", url: "/" },
              { text: "E-commerce", url: "/ecommerce" },
              { text: "Prodotti" }
            ],
            actions: [
              {
                content: button_html("Nuovo Prodotto", "primary")
              },
              {
                content: button_html("Importa", "secondary")
              },
              {
                content: button_html("Esporta", "secondary")
              }
            ]
          )
        )
      end

      # @label Senza Azioni
      # @param variant select [modern, light, dark, primary, transparent]
      def without_actions(variant: "modern")
        render(
          BetterUi::Application::HeaderComponent.new(
            title: "Documenti",
            subtitle: "La tua libreria di documenti",
            variant: variant
          )
        )
      end

      # @label Senza Sottotitolo
      # @param variant select [modern, light, dark, primary, transparent]
      def without_subtitle(variant: "modern")
        render(
          BetterUi::Application::HeaderComponent.new(
            title: "Utenti",
            variant: variant,
            actions: [
              {
                content: button_html("Aggiungi", "primary")
              }
            ]
          )
        )
      end

      # @label Con Container Personalizzato
      # @param variant select [modern, light, dark, primary, transparent]
      def with_custom_container(variant: "modern")
        render(
          BetterUi::Application::HeaderComponent.new(
            title: "Amministrazione",
            subtitle: "Pannello di controllo",
            variant: variant,
            container_class: "px-6 py-2 max-w-7xl mx-auto",
            actions: [
              {
                content: button_html("Salva", "primary")
              }
            ]
          )
        )
      end

      # @label Con Molte Azioni
      # @param variant select [modern, light, dark, primary, transparent]
      def with_many_actions(variant: "modern")
        render(
          BetterUi::Application::HeaderComponent.new(
            title: "Report",
            subtitle: "Analisi e statistiche",
            variant: variant,
            actions: [
              {
                content: button_html("Esporta PDF", "primary")
              },
              {
                content: button_html("Esporta CSV", "secondary")
              },
              {
                content: button_html("Stampa", "secondary")
              },
              {
                content: button_html("Condividi", "secondary")
              }
            ]
          )
        )
      end
      
      # @!endgroup

      private

      def button_html(label, style = "secondary")
        case style
        when "primary"
          %(<button type="button" class="rounded-md bg-orange-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-orange-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-orange-600">#{label}</button>)
        else
          %(<button type="button" class="rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50">#{label}</button>)
        end
      end
    end
  end
end 