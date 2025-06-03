# frozen_string_literal: true

module BetterUi
  module General
    module Tabs
      class ComponentPreview < ViewComponent::Preview
        # @notes
        #
        # ## Utilizzo Base
        # Il componente Tabs fornisce un sistema di navigazione a schede per organizzare contenuti correlati in sezioni separate.
        # Combina tabs (bottoni di navigazione), pannelli (contenuto) e un controller Stimulus per gestire l'interazione.
        #
        # ## Casi d'Uso Comuni
        # - **Impostazioni utente**: Separare informazioni personali, sicurezza, notifiche
        # - **Dashboard**: Organizzare grafici, tabelle, report in sezioni tematiche
        # - **Form complessi**: Suddividere lunghi form in steps logici
        # - **Navigazione prodotti**: Visualizzare descrizione, specifiche, recensioni
        # - **Admin panel**: Gestire utenti, contenuti, configurazioni
        #
        # ## Variabili Principali
        # - **variant**: stile delle tabs (:pills, :underline, :bordered, :minimal)
        # - **theme**: colori del sistema (:default, :blue, :red, :green, :yellow, :violet, :orange, :rose, :white)
        # - **size**: dimensioni delle tabs (:small, :medium, :large)
        # - **orientation**: layout delle tabs (:horizontal, :vertical)
        #
        # ## Esempi Codice
        # ```erb
        # <%= bui_tabs do |tabs| %>
        #   <% tabs.with_navigation do %>
        #     <%= bui_tab(text: "Generale", target: "generale", active: true) %>
        #     <%= bui_tab(text: "Sicurezza", target: "sicurezza") %>
        #   <% end %>
        #   <% tabs.with_panels do %>
        #     <%= bui_tab_panel(id: "generale", active: true) do %>
        #       <p>Contenuto pannello generale</p>
        #     <% end %>
        #     <%= bui_tab_panel(id: "sicurezza") do %>
        #       <p>Contenuto pannello sicurezza</p>
        #     <% end %>
        #   <% end %>
        # <% end %>
        # ```

        # @!group Esempi Base

        # @label Con Helper
        # @param variant select { choices: [pills, underline, bordered, minimal] }
        # @param theme select { choices: [default, blue, red, green, yellow, violet, orange, rose, white] }
        # @param size select { choices: [small, medium, large] }
        # @param orientation select { choices: [horizontal, vertical] }
        # @param navigation_classes text
        # @param panels_classes text
        def default(variant: :pills, theme: :default, size: :medium, orientation: :horizontal, 
                   navigation_classes: '', panels_classes: 'mt-4')
          normalized = normalize_params!(
            variant: variant,
            theme: theme,
            size: size,
            orientation: orientation,
            navigation_classes: navigation_classes,
            panels_classes: panels_classes
          )
          
          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param variant select { choices: [pills, underline, bordered, minimal] }
        # @param theme select { choices: [default, blue, red, green, yellow, violet, orange, rose, white] }
        # @param size select { choices: [small, medium, large] }
        # @param orientation select { choices: [horizontal, vertical] }
        # @param navigation_classes text
        # @param panels_classes text
        def raw(variant: :pills, theme: :default, size: :medium, orientation: :horizontal,
               navigation_classes: '', panels_classes: 'mt-4')
          normalized = normalize_params!(
            variant: variant,
            theme: theme,
            size: size,
            orientation: orientation,
            navigation_classes: navigation_classes,
            panels_classes: panels_classes
          )
          
          render_with_template(locals: normalized)
        end

        # @!endgroup

        private

        def normalize_params!(options)
          options[:variant] = options[:variant].to_sym if options[:variant].is_a?(String)
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:size] = options[:size].to_sym if options[:size].is_a?(String)
          options[:orientation] = options[:orientation].to_sym if options[:orientation].is_a?(String)
          options[:navigation_classes] = options[:navigation_classes] || ''
          options[:panels_classes] = options[:panels_classes] || 'mt-4'
          
          options
        end
      end
    end
  end
end
