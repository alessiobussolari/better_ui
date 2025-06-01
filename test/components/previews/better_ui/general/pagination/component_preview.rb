# frozen_string_literal: true

module BetterUi
  module General
    module Pagination
      class ComponentPreview < ViewComponent::Preview
        # @notes
        #
        # ## Utilizzo Base
        # Il componente Pagination fornisce navigazione paginata per liste e tabelle con controlli Previous/Next,
        # numeri di pagina cliccabili e gestione intelligente degli ellipsis per molte pagine.
        #
        # ## Casi d'Uso Comuni
        # - **Tabelle con molti record**: Navigazione attraverso dataset di grandi dimensioni
        # - **Liste prodotti**: Esplorazione cataloghi e inventari estesi
        # - **Risultati ricerca**: Navigazione tra pagine di risultati filtrati
        # - **Feed contenuti**: Paginazione di articoli, post, notizie
        # - **Dashboard admin**: Gestione elenchi utenti, ordini, transazioni
        #
        # ## Variabili Principali
        # - **current_page**: pagina corrente (1-indexed)
        # - **total_pages**: numero totale di pagine disponibili
        # - **path**: URL base per costruire i link di navigazione
        # - **theme**: colori disponibili (default, blue, red, green, yellow, violet, orange, rose, white)
        # - **size**: dimensioni disponibili (small, medium, large)
        # - **window**: numero di pagine da mostrare intorno alla corrente (default: 2)
        # - **show_info**: mostrare informazioni sui risultati (richiede per_page)
        # - **per_page**: elementi per pagina (per calcolo informazioni)
        #
        # ## Esempi Codice
        # ```erb
        # <%= bui_pagination(current_page: 3, total_pages: 10, path: '/products') %>
        # <%= bui_pagination(current_page: 5, total_pages: 20, path: '/articles', theme: :blue, size: :large) %>
        # <%= bui_pagination(current_page: 2, total_pages: 8, path: '/users', show_info: true, per_page: 25) %>
        # <%= bui_pagination(current_page: 10, total_pages: 50, path: '/orders', window: 3, classes: 'my-4') %>
        # <%= bui_pagination(current_page: 1, total_pages: 5, path: '/dashboard', data: { turbo_frame: 'content' }) %>
        # ```

        # @!group Esempi Base

        # @label Con Helper
        # @param current_page number { value: 3 }
        # @param total_pages number { value: 10 }
        # @param path text { value: '/products' }
        # @param theme select { choices: [default, blue, red, green, yellow, violet, orange, rose, white] }
        # @param size select { choices: [small, medium, large] }
        # @param window number { value: 2 }
        # @param show_info toggle
        # @param per_page number { value: 25 }
        # @param classes text
        def default(current_page: 3, total_pages: 10, path: '/products', theme: :default, size: :medium,
                    window: 2, show_info: false, per_page: 25, classes: '', **params)
          normalized = normalize_params!(
            current_page: current_page,
            total_pages: total_pages,
            path: path,
            theme: theme,
            size: size,
            window: window,
            show_info: show_info,
            per_page: per_page,
            classes: classes,
            **params
          )
          
          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param current_page number { value: 3 }
        # @param total_pages number { value: 10 }
        # @param path text { value: '/products' }
        # @param theme select { choices: [default, blue, red, green, yellow, violet, orange, rose, white] }
        # @param size select { choices: [small, medium, large] }
        # @param window number { value: 2 }
        # @param show_info toggle
        # @param per_page number { value: 25 }
        # @param classes text
        def raw(current_page: 3, total_pages: 10, path: '/products', theme: :default, size: :medium,
                window: 2, show_info: false, per_page: 25, classes: '', **params)
          normalized = normalize_params!(
            current_page: current_page,
            total_pages: total_pages,
            path: path,
            theme: theme,
            size: size,
            window: window,
            show_info: show_info,
            per_page: per_page,
            classes: classes,
            **params
          )
          
          render_with_template(locals: normalized)
        end

        # @!endgroup

        private

        def normalize_params!(options)
          options[:current_page] = options[:current_page].to_i
          options[:total_pages] = options[:total_pages].to_i
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:size] = options[:size].to_sym if options[:size].is_a?(String)
          options[:window] = options[:window].to_i
          options[:per_page] = options[:per_page].to_i if options[:per_page]
          options[:classes] = options[:classes] || ''
          options[:path] = options[:path] || '/products'
          
          # Validazioni base per la preview
          options[:current_page] = [[options[:current_page], 1].max, options[:total_pages]].min
          options[:total_pages] = [options[:total_pages], 1].max
          
          options
        end
      end
    end
  end
end
