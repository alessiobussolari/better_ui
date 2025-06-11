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
        # - **size**: dimensioni disponibili (sm, md, lg)
        # - **theme**: colori disponibili (default, white, red, rose, orange, green, blue, yellow, violet)
        # - **variant**: varianti stilistiche (default, solid, transparent, glass)
        # - **shadow**: tipo di ombra (none, sm, md, lg)
        # - **border**: se mostrare il bordo inferiore
        # - **actions**: array di azioni utente sulla destra
        # - **action_button_theme**: tema per i button nelle azioni
        # - **action_icon_theme**: tema per le icone nelle azioni
        #
        # ## Esempi Codice
        # ```erb
        # <%= bui_navbar %>
        # <%= bui_navbar(size: :lg, theme: :blue, variant: :glass, shadow: :md) %>
        # <%= bui_navbar(
        #   theme: :green,
        #   action_button_theme: :green,
        #   action_icon_theme: :green,
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
        # @param size select { choices: [sm, md, lg] } "Dimensione navbar"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema colori"
        # @param variant select { choices: [default, solid, transparent, glass] } "Variante stilistica"
        # @param shadow select { choices: [none, sm, md, lg] } "Tipo di ombra"
        # @param border toggle "Mostra bordo inferiore"
        # @param with_sidebar toggle "Con sidebar affiancata"
        # @param sidebar_width select { choices: [sm, md, lg, xl] } "Larghezza sidebar"
        # @param action_button_theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema button azioni"
        # @param action_icon_theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema icone azioni"
        def default(
          size: :md,
          theme: :default,
          variant: :default,
          shadow: :sm,
          border: false,
          with_sidebar: false,
          sidebar_width: :md,
          action_button_theme: :default,
          action_icon_theme: :default
        )
          normalized = normalize_params!(
            size: size,
            theme: theme,
            variant: variant,
            shadow: shadow,
            border: border,
            with_sidebar: with_sidebar,
            sidebar_width: sidebar_width,
            action_button_theme: action_button_theme,
            action_icon_theme: action_icon_theme
          )

          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param size select { choices: [sm, md, lg] } "Dimensione navbar"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema colori"
        # @param variant select { choices: [default, solid, transparent, glass] } "Variante stilistica"
        # @param shadow select { choices: [none, sm, md, lg] } "Tipo di ombra"
        # @param border toggle "Mostra bordo inferiore"
        # @param with_sidebar toggle "Con sidebar affiancata"
        # @param sidebar_width select { choices: [sm, md, lg, xl] } "Larghezza sidebar"
        # @param action_button_theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema button azioni"
        # @param action_icon_theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema icone azioni"
        def raw(
          size: :md,
          theme: :default,
          variant: :default,
          shadow: :sm,
          border: false,
          with_sidebar: false,
          sidebar_width: :md,
          action_button_theme: :default,
          action_icon_theme: :default
        )
          normalized = normalize_params!(
            size: size,
            theme: theme,
            variant: variant,
            shadow: shadow,
            border: border,
            with_sidebar: with_sidebar,
            sidebar_width: sidebar_width,
            action_button_theme: action_button_theme,
            action_icon_theme: action_icon_theme
          )

          render BetterUi::Application::Navbar::Component.new(
            size: normalized[:size],
            theme: normalized[:theme],
            variant: normalized[:variant],
            shadow: normalized[:shadow],
            border: normalized[:border],
            with_sidebar: normalized[:with_sidebar],
            sidebar_width: normalized[:sidebar_width],
            action_button_theme: normalized[:action_button_theme],
            action_icon_theme: normalized[:action_icon_theme],
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
          options[:size] = options[:size].to_sym if options[:size].is_a?(String)
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:variant] = options[:variant].to_sym if options[:variant].is_a?(String)
          options[:shadow] = options[:shadow].to_sym if options[:shadow].is_a?(String)
          options[:sidebar_width] = options[:sidebar_width].to_sym if options[:sidebar_width].is_a?(String)
          options[:action_button_theme] = options[:action_button_theme].to_sym if options[:action_button_theme].is_a?(String)
          options[:action_icon_theme] = options[:action_icon_theme].to_sym if options[:action_icon_theme].is_a?(String)

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
