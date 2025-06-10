# frozen_string_literal: true

module BetterUi
  module Application
    module Navbar
      # @label Navbar
      class ComponentPreview < ViewComponent::Preview
        # @!group Esempi Base

        # @notes
        #
        # ## Utilizzo Base
        # La navbar dell'applicazione è un'intestazione che mostra il contenuto personalizzabile e le azioni dell'utente.
        #
        # ## Casi d'Uso Comuni
        # - Intestazione di pannelli di amministrazione
        # - Dashboard applicative
        # - Intestazione di pagine interne
        #
        # ## Variabili Principali
        # - **theme**: colori disponibili (default, white, red, rose, orange, green, blue, yellow, violet)
        # - **shadow**: tipo di ombra (none, small, medium, large)
        # - **border**: se mostrare il bordo inferiore
        # - **actions**: array di azioni utente sulla destra
        #
        # ## Esempi Codice
        # ```erb
        # <%= bui_navbar %>
        # <%= bui_navbar(theme: :blue, shadow: :medium) %>
        # <%= bui_navbar(
        #   theme: :green,
        #   actions: [
        #     { type: :avatar, avatar: { initials: 'AB', theme: :green }, href: '/profile' },
        #     { type: :icon, icon: 'chat', data: { action: 'click->chat#toggle' } }
        #   ]
        # ) do %>
        #   <div class="flex items-center">
        #     <div class="mr-4">
        #       <%= image_tag("logo.svg", class: "h-8 w-8") %>
        #     </div>
        #     <h2 class="text-lg font-semibold">Dashboard</h2>
        #   </div>
        # <% end %>
        # ```

        # @label Con Helper
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema colori"
        # @param shadow select { choices: [none, small, medium, large] } "Tipo di ombra"
        # @param border toggle "Mostra bordo inferiore"
        # @param with_sidebar toggle "Con sidebar affiancata"
        # @param sidebar_width select { choices: [sm, md, lg, xl] } "Larghezza sidebar"
        def default(
          theme: :default,
          shadow: :small,
          border: true,
          with_sidebar: false,
          sidebar_width: :md
        )
          normalized = normalize_params!(
            theme: theme,
            shadow: shadow,
            border: border,
            with_sidebar: with_sidebar,
            sidebar_width: sidebar_width
          )

          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema colori"
        # @param shadow select { choices: [none, small, medium, large] } "Tipo di ombra"
        # @param border toggle "Mostra bordo inferiore"
        # @param with_sidebar toggle "Con sidebar affiancata"
        # @param sidebar_width select { choices: [sm, md, lg, xl] } "Larghezza sidebar"
        def raw(
          theme: :default,
          shadow: :small,
          border: true,
          with_sidebar: false,
          sidebar_width: :md
        )
          normalized = normalize_params!(
            theme: theme,
            shadow: shadow,
            border: border,
            with_sidebar: with_sidebar,
            sidebar_width: sidebar_width
          )

          render BetterUi::Application::Navbar::Component.new(
            theme: normalized[:theme],
            shadow: normalized[:shadow],
            border: normalized[:border],
            with_sidebar: normalized[:with_sidebar],
            sidebar_width: normalized[:sidebar_width],
            actions: default_actions
          ) do
            content_tag(:div, class: "flex items-center") do
              content_tag(:h2, "Dashboard", class: "text-lg font-semibold")
            end
          end
        end

        # @!endgroup

        private

        def normalize_params!(options)
          # Normalizzazione parametri
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:shadow] = options[:shadow].to_sym if options[:shadow].is_a?(String)
          options[:sidebar_width] = options[:sidebar_width].to_sym if options[:sidebar_width].is_a?(String)

          options
        end


        def default_actions
          [
            {
              type: :icon,
              icon: "chat-bubble-oval",
              data: { tooltip: "Messages" }
            },
            {
              type: :avatar,
              avatar: { initials: "DU", size: :sm, theme: :green },
              href: "/profile"
            }
          ]
        end
      end
    end
  end
end
