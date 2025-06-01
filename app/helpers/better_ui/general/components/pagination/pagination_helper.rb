# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Pagination
        module PaginationHelper
          # Genera un componente di navigazione paginata per liste e tabelle
          #
          # @param current_page [Integer] La pagina corrente (1-indexed)
          # @param total_pages [Integer] Il numero totale di pagine
          # @param path [String] L'URL base per costruire i link di paginazione
          # @param theme [Symbol] Il tema del componente (:default, :blue, :red, :green, :yellow, :violet, :orange, :rose, :white)
          # @param size [Symbol] La dimensione del componente (:small, :medium, :large)
          # @param window [Integer] Il numero di pagine da mostrare intorno alla pagina corrente (default: 2)
          # @param show_info [Boolean] Se mostrare le informazioni sui risultati (default: false)
          # @param per_page [Integer] Il numero di elementi per pagina (richiesto se show_info è true)
          # @param classes [String] Classi CSS aggiuntive
          # @param form [FormBuilder, nil] Form builder per l'integrazione con Rails form (opzionale)
          # @param options [Hash] Attributi HTML aggiuntivi
          # @return [String] Il markup HTML del componente pagination
          #
          # @example Uso base standalone
          #   <%= bui_pagination(current_page: 3, total_pages: 10, path: '/products') %>
          #
          # @example Con tema e dimensione personalizzati
          #   <%= bui_pagination(
          #     current_page: 5, 
          #     total_pages: 20, 
          #     path: '/articles',
          #     theme: :blue,
          #     size: :large
          #   ) %>
          #
          # @example Con informazioni sui risultati
          #   <%= bui_pagination(
          #     current_page: 2,
          #     total_pages: 8,
          #     path: '/users',
          #     show_info: true,
          #     per_page: 25,
          #     theme: :green
          #   ) %>
          #
          # @example Con finestra di pagine personalizzata
          #   <%= bui_pagination(
          #     current_page: 10,
          #     total_pages: 50,
          #     path: '/orders',
          #     window: 3,
          #     size: :small
          #   ) %>
          #
          # @example Con attributi HTML aggiuntivi
          #   <%= bui_pagination(
          #     current_page: 1,
          #     total_pages: 5,
          #     path: '/dashboard',
          #     classes: 'my-4',
          #     data: { turbo_frame: 'content' }
          #   ) %>
          def bui_pagination(current_page:, total_pages:, path:, theme: :default, size: :medium,
                             window: 2, show_info: false, per_page: nil, classes: '', 
                             form: nil, **options)
            render BetterUi::General::Pagination::Component.new(
              current_page: current_page,
              total_pages: total_pages,
              path: path,
              theme: theme,
              size: size,
              window: window,
              show_info: show_info,
              per_page: per_page,
              classes: classes,
              **options
            )
          end
        end
      end
    end
  end
end
