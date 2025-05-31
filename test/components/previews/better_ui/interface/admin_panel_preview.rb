# frozen_string_literal: true

module BetterUi
  module Interface
    # @label Admin Panel
    class AdminPanelPreview < ViewComponent::Preview
      # @!group Layout Completi

      # @notes
      #
      # ## Admin Panel
      # 
      # Un pannello di amministrazione semplice che combina navbar e main content area senza sidebar.
      # Questo layout è adatto per interfacce più semplici o pagine di dettaglio.
      #
      # ## Componenti Utilizzati
      # - **Navbar**: Barra di navigazione superiore con titolo pagina e azioni utente
      # - **Main**: Area contenuto principale con padding e styling
      #
      # ## Utilizzo
      # 
      # Questo layout è ideale per pagine di dettaglio o schermate dove non è necessaria 
      # una navigazione complessa con sidebar.
      
      # @label Default
      # @param navbar_theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema navbar"
      # @param main_rounded select { choices: [none, small, medium, large] } "Arrotondamento main"
      # @param with_sidebar toggle "Con sidebar affiancata"
      # @param sidebar_width select { choices: [sm, md, lg, xl] } "Larghezza sidebar"
      def default(
        navbar_theme: :default,
        main_rounded: :small,
        with_sidebar: false,
        sidebar_width: :md
      )
        render_with_template(
          locals: {
            navbar_theme: navbar_theme.to_sym,
            main_rounded: main_rounded.to_sym,
            with_sidebar: with_sidebar,
            sidebar_width: sidebar_width.to_sym
          }
        )
      end
      
      # @!endgroup
    end
  end
end