module BetterUi
  module Application
    module Sidebar
      class ComponentPreview < Lookbook::Preview
        # @!group Default

        # @label Con Helper
        # @param width select { choices: [sm, md, lg, xl] } "Larghezza della sidebar"
        # @param position select { choices: [left, right] } "Posizione della sidebar"
        # @param theme select { choices: [default, dark, light] } "Tema colori"
        # @param shadow select { choices: [none, sm, md, lg] } "Tipo di ombra"
        # @param border toggle "Mostra bordo"
        # @param collapsible toggle "Abilita sezioni collassabili"
        # @notes
        # **Struttura dell'array `navigation_sections`:**
        #
        # Ogni sezione può contenere diversi tipi di elementi di navigazione:
        #
        # - **Link semplice**: Per elementi cliccabili standard
        #   ```ruby
        #   { label: "Dashboard", href: "/dashboard", icon: "home", active: true }
        #   ```
        #
        # - **Sezione collassabile**: Per menu organizzati gerarchicamente
        #   ```ruby
        #   {
        #     type: :collapsible,
        #     id: "progetti",
        #     label: "Progetti",
        #     icon: "folder",
        #     expanded: false,
        #     children: [
        #       { label: "Progetto A", href: "/progetti/a" },
        #       { label: "Progetto B", href: "/progetti/b", active: true }
        #     ]
        #   }
        #   ```
        #
        # **Esempio completo di utilizzo:**
        # ```ruby
        # navigation_sections = [
        #   {
        #     title: "Platform",
        #     items: [
        #       { label: "Dashboard", href: "/", icon: "home", active: true },
        #       { type: :collapsible, id: "menu1", label: "Progetti",
        #         children: [{ label: "Nuovo", href: "/nuovo" }] }
        #     ]
        #   }
        # ]
        #
        # # Con helper
        # bui_sidebar(navigation_sections: navigation_sections, theme: :default)
        #
        # # Istanziazione diretta
        # render BetterUi::Application::Sidebar::Component.new(
        #   navigation_sections: navigation_sections,
        #   theme: :default
        # )
        # ```
        def default(
          width: :md,
          position: :left,
          theme: :default,
          shadow: :lg,
          border: true,
          collapsible: true
        )
          normalized = normalize_params!(
            width: width,
            position: position,
            theme: theme,
            shadow: shadow,
            border: border,
            collapsible: collapsible
          )

          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param width select { choices: [sm, md, lg, xl] } "Larghezza della sidebar"
        # @param position select { choices: [left, right] } "Posizione della sidebar"
        # @param theme select { choices: [default, dark, light] } "Tema colori"
        # @param shadow select { choices: [none, sm, md, lg] } "Tipo di ombra"
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
          normalized = normalize_params!(
            width: width,
            position: position,
            theme: theme,
            shadow: shadow,
            border: border,
            collapsible: collapsible
          )

          render BetterUi::Application::Sidebar::Component.new(
            width: normalized[:width],
            position: normalized[:position],
            theme: normalized[:theme],
            shadow: normalized[:shadow],
            border: normalized[:border],
            collapsible: normalized[:collapsible],
            header: default_header,
            footer: default_footer,
            navigation_sections: default_navigation_sections
          )
        end

        # @!endgroup

        private

        def normalize_params!(options)
          # Normalizzazione parametri
          options[:width] = options[:width].to_sym if options[:width].is_a?(String)
          options[:position] = options[:position].to_sym if options[:position].is_a?(String)
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:shadow] = options[:shadow].to_sym if options[:shadow].is_a?(String)

          options
        end

        def default_header
          {
            logo: { name: "Better UI", size: :small, theme: :violet, shape: :rounded },
            title: "Better UI",
            subtitle: "Component Library"
          }
        end

        def default_footer
          {
            user_info: {
              avatar: { name: "Demo User", size: :small },
              name: "Demo User",
              email: "demo@example.com"
            }
          }
        end

        def default_navigation_sections
          [
            {
              title: "Platform",
              items: [
                {
                  type: :collapsible,
                  id: "playground",
                  label: "Playground",
                  icon: "play",
                  expanded: true,
                  children: [
                    { label: "Workspace", href: "#", active: true },
                    { label: "Projects", href: "#" },
                    { label: "Experiments", href: "#" }
                  ]
                },
                {
                  label: "History",
                  href: "#",
                  icon: "clock"
                },
                {
                  label: "Settings",
                  href: "#",
                  icon: "cog"
                }
              ]
            },
            {
              title: "Development",
              items: [
                {
                  type: :collapsible,
                  id: "models",
                  label: "Models",
                  icon: "cube",
                  expanded: false,
                  children: [
                    { label: "GPT-4", href: "#" },
                    { label: "Claude", href: "#" },
                    { label: "Gemini", href: "#" }
                  ]
                },
                {
                  label: "Documentation",
                  href: "#",
                  icon: "file-text",
                  badge: "New"
                }
              ]
            }
          ]
        end
      end
    end
  end
end
