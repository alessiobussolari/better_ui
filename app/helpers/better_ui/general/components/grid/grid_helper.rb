# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Grid
        module GridHelper
          # Helper per creare un contenitore grid CSS
          #
          # @param cols [Integer, Hash] Numero colonne (1-12, :auto, :none) o hash responsive {sm: 1, md: 2, lg: 3, xl: 4}
          # @param rows [Integer, Hash, nil] Numero righe (1-6, :auto, :none) o hash responsive
          # @param gap [Symbol, Hash] Spaziatura (:none, :small, :medium, :large) o hash responsive
          # @param flow [Symbol] Direzione flusso (:row, :col, :row_dense, :col_dense)
          # @param align_items [Symbol, nil] Allineamento verticale (:start, :center, :end, :stretch)
          # @param justify_items [Symbol, nil] Allineamento orizzontale (:start, :center, :end, :stretch)
          # @param classes [String] Classi CSS aggiuntive
          # @param id [String, nil] ID elemento
          # @param options [Hash] Attributi HTML aggiuntivi
          # @param block [Proc] Blocco contenente le celle grid
          #
          # @return [String] HTML del grid container
          #
          # @example Uso base
          #   <%= bui_grid(cols: 3, gap: :medium) do %>
          #     <%= content %>
          #   <% end %>
          #
          # @example Con responsive
          #   <%= bui_grid(cols: {sm: 1, md: 2, lg: 3, xl: 4}, gap: :large) do %>
          #     <%= content %>
          #   <% end %>
          #
          # @example Con righe e allineamento
          #   <%= bui_grid(cols: 2, rows: 3, gap: :medium, align_items: :center) do %>
          #     <%= content %>
          #   <% end %>
          #
          # @example Con flow e justify
          #   <%= bui_grid(cols: 4, flow: :col, justify_items: :center) do %>
          #     <%= content %>
          #   <% end %>
          #
          # @example Con attributi HTML aggiuntivi
          #   <%= bui_grid(cols: 3, id: "main-grid", data: {testid: "grid"}) do %>
          #     <%= content %>
          #   <% end %>
          def bui_grid(
            cols: 1,
            rows: nil,
            gap: :medium,
            flow: :row,
            align_items: nil,
            justify_items: nil,
            classes: '',
            id: nil,
            **options,
            &block
          )
            render BetterUi::General::Grid::Component.new(
              cols: cols,
              rows: rows,
              gap: gap,
              flow: flow,
              align_items: align_items,
              justify_items: justify_items,
              classes: classes,
              id: id,
              **options
            ), &block
          end

          # Helper per creare una cella grid con controllo posizionamento
          #
          # @param col [Integer, Hash, nil] Span colonne (1-12, :auto, :full) o hash responsive {sm: 1, md: 2, lg: 3}
          # @param row [Integer, Hash, nil] Span righe (1-6, :auto, :full) o hash responsive
          # @param col_start [Integer, Hash, nil] Posizione inizio colonna (1-13, :auto) o hash responsive
          # @param col_end [Integer, Hash, nil] Posizione fine colonna (1-13, :auto) o hash responsive
          # @param row_start [Integer, Hash, nil] Posizione inizio riga (1-7, :auto) o hash responsive
          # @param row_end [Integer, Hash, nil] Posizione fine riga (1-7, :auto) o hash responsive
          # @param justify_self [Symbol, nil] Allineamento orizzontale cella (:auto, :start, :center, :end, :stretch)
          # @param align_self [Symbol, nil] Allineamento verticale cella (:auto, :start, :center, :end, :stretch)
          # @param classes [String] Classi CSS aggiuntive
          # @param id [String, nil] ID elemento
          # @param options [Hash] Attributi HTML aggiuntivi
          # @param block [Proc] Blocco contenente il contenuto della cella
          #
          # @return [String] HTML della grid cell
          #
          # @example Uso base
          #   <%= bui_grid_cell do %>
          #     <div>Contenuto cella</div>
          #   <% end %>
          #
          # @example Con span colonne
          #   <%= bui_grid_cell(col: 2) do %>
          #     <div>Cella che occupa 2 colonne</div>
          #   <% end %>
          #
          # @example Con responsive
          #   <%= bui_grid_cell(col: {sm: 1, md: 2, lg: 3}) do %>
          #     <div>Cella responsive</div>
          #   <% end %>
          #
          # @example Con posizionamento specifico
          #   <%= bui_grid_cell(col_start: 2, col_end: 4) do %>
          #     <div>Cella dalla colonna 2 alla 4</div>
          #   <% end %>
          #
          # @example Con allineamento
          #   <%= bui_grid_cell(col: 2, justify_self: :center, align_self: :start) do %>
          #     <div>Cella centrata orizzontalmente</div>
          #   <% end %>
          def bui_grid_cell(
            col: nil,
            row: nil,
            col_start: nil,
            col_end: nil,
            row_start: nil,
            row_end: nil,
            justify_self: nil,
            align_self: nil,
            classes: '',
            id: nil,
            **options,
            &block
          )
            render BetterUi::General::Grid::CellComponent.new(
              col: col,
              row: row,
              col_start: col_start,
              col_end: col_end,
              row_start: row_start,
              row_end: row_end,
              justify_self: justify_self,
              align_self: align_self,
              classes: classes,
              id: id,
              **options
            ), &block
          end
        end
      end
    end
  end
end
