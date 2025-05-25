module BetterUi
  module Application
    module Navbar
      class ComponentPreview < Lookbook::Preview
        # @!group Default

        # @label Con Helper
        # @param theme select { choices: [default, dark, light] } "Tema colori"
        # @param position select { choices: [top, fixed_top, sticky_top] } "Posizione della navbar"
        # @param height select { choices: [sm, md, lg] } "Altezza della navbar"
        # @param shadow select { choices: [none, sm, md, lg, xl] } "Tipo di ombra"
        # @param border toggle "Mostra bordo inferiore"
        def default(
          theme: :default,
          position: :top,
          height: :md,
          shadow: :sm,
          border: true
        )
          normalized = normalize_params!(
            theme: theme,
            position: position,
            height: height,
            shadow: shadow,
            border: border
          )

          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param theme select { choices: [default, dark, light] } "Tema colori"
        # @param position select { choices: [top, fixed_top, sticky_top] } "Posizione della navbar"
        # @param height select { choices: [sm, md, lg] } "Altezza della navbar"
        # @param shadow select { choices: [none, sm, md, lg, xl] } "Tipo di ombra"
        # @param border toggle "Mostra bordo inferiore"
        def raw(
          theme: :default,
          position: :top,
          height: :md,
          shadow: :sm,
          border: true
        )
          normalized = normalize_params!(
            theme: theme,
            position: position,
            height: height,
            shadow: shadow,
            border: border
          )

          render BetterUi::Application::Navbar::Component.new(
            theme: normalized[:theme],
            position: normalized[:position],
            height: normalized[:height],
            shadow: normalized[:shadow],
            border: normalized[:border],
            brand: default_brand,
            breadcrumb: default_breadcrumb,
            navigation_items: default_navigation_items,
            actions: default_actions
          )
        end

        # @!endgroup

        private

        def normalize_params!(options)
          # Normalizzazione parametri
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:position] = options[:position].to_sym if options[:position].is_a?(String)
          options[:height] = options[:height].to_sym if options[:height].is_a?(String)
          options[:shadow] = options[:shadow].to_sym if options[:shadow].is_a?(String)

          options
        end

        def default_brand
          {
            logo: { name: "Better UI", size: :small, theme: :violet, shape: :rounded },
            title: "Better UI",
            href: "/"
          }
        end

        def default_breadcrumb
          {
            items: [
              { label: "Home", url: "/" },
              { label: "Dashboard", url: "/dashboard" },
              { label: "Projects", url: "/projects" },
              { label: "Current Project" }
            ],
            separator: :chevron,
            theme: :default
          }
        end

        def default_navigation_items
          [
            {
              label: "Dashboard",
              href: "/dashboard",
              icon: "home",
              active: true
            },
            {
              label: "Projects",
              href: "/projects",
              icon: "folder"
            },
            {
              label: "Team",
              href: "/team",
              icon: "users"
            },
            {
              label: "Analytics",
              href: "/analytics",
              icon: "chart-bar"
            }
          ]
        end

        def default_actions
          [
            {
              type: :icon,
              icon: "search",
              href: "/search",
              data: { tooltip: "Search" }
            },
            {
              type: :icon,
              icon: "bell",
              href: "/notifications",
              data: { tooltip: "Notifications" }
            },
            {
              type: :button,
              label: "New Project",
              theme: :primary,
              href: "/projects/new",
              icon: "plus"
            },
            {
              type: :avatar,
              avatar: { name: "Demo User", size: :small },
              href: "/profile"
            }
          ]
        end
      end
    end
  end
end
