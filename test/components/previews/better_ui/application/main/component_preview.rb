module BetterUi
  module Application
    module Main
      # @label Main
      class ComponentPreview < ViewComponent::Preview
        # @!group Esempi Base
        
        # @notes
        #
        # ## Utilizzo Base
        # Il componente Main rappresenta l'area principale del contenuto di un'applicazione.
        # È progettato per adattarsi automaticamente alla presenza di una sidebar.
        #
        # ## Casi d'Uso Comuni
        # - Area principale per dashboard amministrative
        # - Contenitore di contenuto primario in layout applicativi
        # - Area di lavoro principale in interfacce multi-pannello
        #
        # ## Variabili Principali
        # - **rounded**: tipi di arrotondamento (none, small, medium, large, full)
        # - **shadow**: tipi di ombra (none, sm, md, lg)
        # - **padding/inner_padding**: gestione spaziatura interna ed esterna
        # - **with_sidebar**: adattamento automatico per sidebar
        # - **sidebar_width**: larghezza della sidebar (sm, md, lg, xl)
        #
        # ## Esempi Codice
        # ```erb
        # <%= bui_main %>
        # <%= bui_main(with_sidebar: true, sidebar_width: :lg) %>
        # <%= bui_main(rounded: :medium, shadow: :lg) do %>
        #   <!-- contenuto -->
        # <% end %>
        # ```
        
        # @label Con Helper
        # @param padding toggle "Padding del contenitore principale"
        # @param inner_padding toggle "Padding del contenitore interno"
        # @param rounded select { choices: [none, small, medium, large, full] } "Arrotondamento degli angoli"
        # @param shadow select { choices: [none, small, medium, large] } "Tipo di ombra"
        # @param with_sidebar toggle "Spazio per la sidebar"
        # @param sidebar_width select { choices: [sm, md, lg, xl] } "Larghezza sidebar"
        # @param classes text "Classi CSS aggiuntive (opzionale)"
        def default(
          padding: true,
          inner_padding: true,
          rounded: :small,
          shadow: :medium,
          with_sidebar: true,
          sidebar_width: :md,
          classes: ""
        )
          normalized = normalize_params!(
            padding: padding,
            inner_padding: inner_padding,
            rounded: rounded,
            shadow: shadow,
            with_sidebar: with_sidebar,
            sidebar_width: sidebar_width,
            classes: classes
          )

          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param padding toggle "Padding del contenitore principale"
        # @param inner_padding toggle "Padding del contenitore interno"
        # @param rounded select { choices: [none, small, medium, large, full] } "Arrotondamento degli angoli"
        # @param shadow select { choices: [none, small, medium, large] } "Tipo di ombra"
        # @param with_sidebar toggle "Spazio per la sidebar"
        # @param sidebar_width select { choices: [sm, md, lg, xl] } "Larghezza sidebar"
        # @param classes text "Classi CSS aggiuntive (opzionale)"
        def raw(
          padding: true,
          inner_padding: true,
          rounded: :small,
          shadow: :medium,
          with_sidebar: true,
          sidebar_width: :md,
          classes: ""
        )
          normalized = normalize_params!(
            padding: padding,
            inner_padding: inner_padding,
            rounded: rounded,
            shadow: shadow,
            with_sidebar: with_sidebar,
            sidebar_width: sidebar_width,
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
          options[:sidebar_width] = options[:sidebar_width].to_sym if options[:sidebar_width].is_a?(String)

          # Pulizia valori vuoti
          options[:classes] = nil if options[:classes].is_a?(String) && options[:classes].strip.empty?

          options
        end
      end
    end
  end
end
