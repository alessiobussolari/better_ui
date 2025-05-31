# frozen_string_literal: true

module BetterUi
  module Interface
    # @label Dashboard
    class DashboardPreview < ViewComponent::Preview
      # @!group Layout Completi

      # @notes
      #
      # ## Dashboard
      # 
      # Una dashboard completa che combina navbar, sidebar e main content area.
      # Questo esempio mostra come combinare i componenti per creare un'interfaccia di amministrazione completa.
      #
      # ## Componenti Utilizzati
      # - **Navbar**: Barra di navigazione superiore con titolo pagina e azioni utente
      # - **Sidebar**: Menu laterale con navigazione e categorie
      # - **Main**: Area contenuto principale con padding e styling
      #
      # ## Utilizzo
      # 
      # Questi componenti sono pensati per essere usati insieme in un'applicazione amministrativa.
      # La navbar mostra informazioni sul contesto corrente e azioni rapide, la sidebar fornisce
      # navigazione principale e il main content è l'area di lavoro.
      
      # @label Default
      # @param navbar_theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema navbar"
      # @param sidebar_theme select { choices: [default, dark, light] } "Tema sidebar"
      # @param main_rounded select { choices: [none, small, medium, large] } "Arrotondamento main"
      def default(
        navbar_theme: :default,
        sidebar_theme: :default,
        main_rounded: :small
      )
        render_with_template(
          locals: {
            navbar_theme: navbar_theme.to_sym,
            sidebar_theme: sidebar_theme.to_sym,
            main_rounded: main_rounded.to_sym
          }
        )
      end
      
      # @!endgroup
    end
  end
end