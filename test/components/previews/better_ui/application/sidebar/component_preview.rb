module BetterUi
  module Application
    module Sidebar
      class ComponentPreview < Lookbook::Preview
        # @!group Default

        # @label Con Helper
        # @param width select { choices: [sm, md, lg, xl] } "Larghezza della sidebar"
        # @param position select { choices: [left, right] } "Posizione della sidebar"
        # @param theme select { choices: [default, dark, light] } "Tema colori"
        # @param shadow select { choices: [none, sm, md, lg, xl] } "Tipo di ombra"
        # @param border toggle "Mostra bordo"
        # @param collapsible toggle "Abilita sezioni collassabili"
        def default(
          width: :md,
          position: :left,
          theme: :default,
          shadow: :lg,
          border: true,
          collapsible: true
        )
          render_with_template(locals: {
            width: width.to_sym,
            position: position.to_sym,
            theme: theme.to_sym,
            shadow: shadow.to_sym,
            border: border,
            collapsible: collapsible
          })
        end

        # @label Istanziazione Diretta
        # @param width select { choices: [sm, md, lg, xl] } "Larghezza della sidebar"
        # @param position select { choices: [left, right] } "Posizione della sidebar"
        # @param theme select { choices: [default, dark, light] } "Tema colori"
        # @param shadow select { choices: [none, sm, md, lg, xl] } "Tipo di ombra"
        # @param border toggle "Mostra bordo"
        # @param collapsible toggle "Abilita sezioni collassabili"
        def raw(
          width: :md,
          position: :left,
          theme: :default,
          shadow: :lg,
          border: true,
          collapsible: true
        )
          render_with_template(locals: {
            width: width.to_sym,
            position: position.to_sym,
            theme: theme.to_sym,
            shadow: shadow.to_sym,
            border: border,
            collapsible: collapsible
          })
        end

        # @!endgroup
      end
    end
  end
end
