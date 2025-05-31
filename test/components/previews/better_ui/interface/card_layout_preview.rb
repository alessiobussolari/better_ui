# frozen_string_literal: true

module BetterUi
  module Interface
    # @label Card Layout
    class CardLayoutPreview < ViewComponent::Preview
      # @!group Layout Completi

      # @notes
      #
      # ## Card Layout
      # 
      # Un layout a schede che presenta contenuti in formato card, ottimo per dashboard informative.
      # Utilizza navbar e una griglia di schede senza sidebar.
      #
      # ## Componenti Utilizzati
      # - **Navbar**: Barra di navigazione superiore con titolo pagina e azioni utente
      # - **Main**: Area contenuto principale organizzata in una griglia di card
      #
      # ## Utilizzo
      # 
      # Questo layout è ideale per dashboard, pagine di reporting o visualizzazioni
      # in cui è necessario mostrare informazioni sintetiche in card.
      
      # @label Default
      # @param navbar_theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema navbar"
      # @param columns select { choices: [2, 3, 4] } "Colonne griglia"
      # @param with_sidebar toggle "Con sidebar affiancata"
      # @param sidebar_width select { choices: [sm, md, lg, xl] } "Larghezza sidebar"
      def default(
        navbar_theme: :default,
        columns: 3,
        with_sidebar: false,
        sidebar_width: :md
      )
        render_with_template(
          locals: {
            navbar_theme: navbar_theme.to_sym,
            columns: columns.to_i,
            with_sidebar: with_sidebar,
            sidebar_width: sidebar_width.to_sym
          }
        )
      end
      
      # @!endgroup
    end
  end
end