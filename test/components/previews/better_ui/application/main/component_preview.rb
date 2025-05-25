module BetterUi
  module Application
    module Main
      class ComponentPreview < Lookbook::Preview
        # @!group Esempi Base

        # @label Con Helper
        # @param padding toggle "Padding del contenitore principale"
        # @param inner_padding toggle "Padding del contenitore interno"
        # @param rounded select { choices: [none, small, medium, large, full] } "Arrotondamento degli angoli"
        # @param shadow select { choices: [none, sm, md, lg] } "Tipo di ombra"
        # @param with_sidebar toggle "Spazio per la sidebar"
        # @param with_navbar toggle "Spazio per la navbar"
        # @param classes text "Classi CSS aggiuntive (opzionale)"
        def default(
          padding: true,
          inner_padding: true,
          rounded: :small,
          shadow: :md,
          with_sidebar: true,
          with_navbar: true,
          classes: ""
        )
          normalized = normalize_params!(
            padding: padding,
            inner_padding: inner_padding,
            rounded: rounded,
            shadow: shadow,
            with_sidebar: with_sidebar,
            with_navbar: with_navbar,
            classes: classes
          )

          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param padding toggle "Padding del contenitore principale"
        # @param inner_padding toggle "Padding del contenitore interno"
        # @param rounded select { choices: [none, small, medium, large, full] } "Arrotondamento degli angoli"
        # @param shadow select { choices: [none, sm, md, lg] } "Tipo di ombra"
        # @param with_sidebar toggle "Spazio per la sidebar"
        # @param with_navbar toggle "Spazio per la navbar"
        # @param classes text "Classi CSS aggiuntive (opzionale)"
        def raw(
          padding: true,
          inner_padding: true,
          rounded: :small,
          shadow: :md,
          with_sidebar: true,
          with_navbar: true,
          classes: ""
        )
          normalized = normalize_params!(
            padding: padding,
            inner_padding: inner_padding,
            rounded: rounded,
            shadow: shadow,
            with_sidebar: with_sidebar,
            with_navbar: with_navbar,
            classes: classes
          )

          render BetterUi::Application::Main::Component.new(**normalized) do
            content_tag(:div, "Contenuto del main", class: "p-8 text-center text-gray-600")
          end
        end

        # @!endgroup

        private

        def normalize_params!(options)
          # Normalizzazione parametri
          options[:rounded] = options[:rounded].to_sym if options[:rounded].is_a?(String)
          options[:shadow] = options[:shadow].to_sym if options[:shadow].is_a?(String)

          # Pulizia valori vuoti
          options[:classes] = nil if options[:classes].is_a?(String) && options[:classes].strip.empty?

          options
        end
      end
    end
  end
end
