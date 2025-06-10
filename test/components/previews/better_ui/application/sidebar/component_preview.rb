# frozen_string_literal: true

module BetterUi
  module Application
    module Sidebar
      class ComponentPreview < Lookbook::Preview
        # @!group Default

        # @label Con Helper (renders_one/renders_many)
        # @param width select { choices: [sm, md, lg, xl] } "Larghezza della sidebar"
        # @param position select { choices: [left, right] } "Posizione della sidebar"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema colori"
        # @param shadow select { choices: [none, sm, md, lg] } "Tipo di ombra"
        def default(
          width: :md,
          position: :left,
          theme: :default,
          shadow: :lg
        )
          render_with_template(locals: {
            width: width.to_sym,
            position: position.to_sym,
            theme: theme.to_sym,
            shadow: shadow.to_sym
          })
        end

        # @!group Raw
        # @label Istanziazione Diretta (Component.new)
        # @param width select { choices: [sm, md, lg, xl] } "Larghezza della sidebar"
        # @param position select { choices: [left, right] } "Posizione della sidebar"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema colori"
        # @param shadow select { choices: [none, sm, md, lg] } "Tipo di ombra"
        def raw(
          width: :md,
          position: :left,
          theme: :default,
          shadow: :lg
        )
          render_with_template(locals: {
            width: width.to_sym,
            position: position.to_sym,
            theme: theme.to_sym,
            shadow: shadow.to_sym
          })
        end

        # @!endgroup
      end
    end
  end
end
