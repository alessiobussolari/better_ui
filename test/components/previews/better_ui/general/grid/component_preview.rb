# frozen_string_literal: true

# @notes
#
# ## Utilizzo Sistema Grid
# Il sistema Grid fornisce due componenti che lavorano insieme:
# - `bui_grid`: contenitore con layout CSS Grid
# - `bui_grid_cell`: elementi figli con controllo posizionamento
#
# ## Casi d'Uso Comuni
# - **Layout responsive**: E-commerce, gallery, dashboard
# - **Posizionamento preciso**: Header/sidebar/content layouts
# - **Cards dinamiche**: Contenuti di dimensioni variabili
# - **Layout prodotti**: Griglia responsive per cataloghi
# - **Dashboard**: Layout complessi con celle di diverse dimensioni
#
# ## Variabili Principali Grid Container
# - **cols**: colonne (1-12, :auto, :none) o responsive {sm: 1, md: 2, lg: 3, xl: 4}
# - **rows**: righe (1-6, :auto, :none) o responsive
# - **gap**: spaziatura (:none, :small, :medium, :large) o responsive
# - **flow**: direzione (:row, :col, :row_dense, :col_dense)
# - **align_items**: allineamento verticale (:start, :center, :end, :stretch)
# - **justify_items**: allineamento orizzontale (:start, :center, :end, :stretch)
#
# ## Variabili Principali Grid Cell
# - **col**: span colonne (1-12, :auto, :full) o responsive
# - **row**: span righe (1-6, :auto, :full) o responsive
# - **col_start**: posizione inizio colonna (1-13, :auto) o responsive
# - **col_end**: posizione fine colonna (1-13, :auto) o responsive
# - **justify_self**: allineamento orizzontale cella (:auto, :start, :center, :end, :stretch)
# - **align_self**: allineamento verticale cella (:auto, :start, :center, :end, :stretch)
#
# ## Esempi Codice
# ```erb
# <%= bui_grid(cols: 3, gap: :medium) do %>
#   <%= bui_grid_cell do %>Contenuto<% end %>
#   <%= bui_grid_cell(col: 2) do %>Contenuto largo<% end %>
# <% end %>
#
# <%= bui_grid(cols: {sm: 1, md: 2, lg: 3}, gap: :large) do %>
#   <%= bui_grid_cell(col: {sm: 1, lg: 2}) do %>Responsive<% end %>
# <% end %>
#
# <%= bui_grid(cols: 4, rows: 3) do %>
#   <%= bui_grid_cell(col_start: 2, col_end: 4) do %>Posizionato<% end %>
# <% end %>
# ```
module BetterUi
  module General
    module Grid
      class ComponentPreview < Lookbook::Preview
        # @param cols select { choices: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12] }
        # @param gap select { choices: ["none", "small", "medium", "large"] }
        # @param flow select { choices: ["row", "col", "row_dense", "col_dense"] }
        # @param align_items select { choices: [nil, "start", "center", "end", "stretch"] }
        # @param justify_items select { choices: [nil, "start", "center", "end", "stretch"] }
        # @param classes text
        def default(
          cols: 3,
          gap: "medium",
          flow: "row", 
          align_items: nil,
          justify_items: nil,
          classes: ""
        )
          normalized = normalize_params!(
            cols: cols,
            gap: gap.to_sym,
            flow: flow.to_sym,
            align_items: align_items&.to_sym,
            justify_items: justify_items&.to_sym,
            classes: classes
          )
          
          render_with_template(locals: normalized)
        end

        # @param cols select { choices: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12] }
        # @param gap select { choices: ["none", "small", "medium", "large"] }
        # @param flow select { choices: ["row", "col", "row_dense", "col_dense"] }
        # @param align_items select { choices: [nil, "start", "center", "end", "stretch"] }
        # @param justify_items select { choices: [nil, "start", "center", "end", "stretch"] }
        # @param classes text
        def raw(
          cols: 3,
          gap: "medium",
          flow: "row",
          align_items: nil,
          justify_items: nil,
          classes: ""
        )
          normalized = normalize_params!(
            cols: cols,
            gap: gap.to_sym,
            flow: flow.to_sym,
            align_items: align_items&.to_sym,
            justify_items: justify_items&.to_sym,
            classes: classes
          )
          
          render BetterUi::General::Grid::Component.new(**normalized) do
            content_tag(:div, "Cell 1", class: "bg-blue-100 p-4 rounded text-center") +
            render(BetterUi::General::Grid::CellComponent.new(col: 2)) do
              content_tag(:div, "Cell Span 2", class: "bg-red-100 p-4 rounded text-center")
            end +
            content_tag(:div, "Cell 3", class: "bg-green-100 p-4 rounded text-center") +
            render(BetterUi::General::Grid::CellComponent.new(col: 1, row: 2)) do
              content_tag(:div, "Tall Cell", class: "bg-yellow-100 p-4 rounded text-center h-full")
            end +
            content_tag(:div, "Cell 5", class: "bg-purple-100 p-4 rounded text-center") +
            content_tag(:div, "Cell 6", class: "bg-pink-100 p-4 rounded text-center")
          end
        end

        def responsive_layout
          render BetterUi::General::Grid::Component.new(
            cols: {sm: 1, md: 2, lg: 3, xl: 4}, 
            gap: {sm: :small, lg: :medium}
          ) do
            6.times.map do |i|
              render(BetterUi::General::Grid::CellComponent.new(col: {sm: 1, lg: 2})) do
                content_tag(:div, "Prodotto #{i + 1}", class: "bg-indigo-100 p-4 rounded text-center")
              end
            end.join.html_safe
          end
        end

        def dashboard_layout
          render BetterUi::General::Grid::Component.new(cols: 12, rows: 6, gap: :medium) do
            # Header
            render(BetterUi::General::Grid::CellComponent.new(col: :full, row: 1)) do
              content_tag(:div, "Header Navigation", class: "bg-slate-100 p-4 rounded text-center font-semibold")
            end +
            # Sidebar
            render(BetterUi::General::Grid::CellComponent.new(col: 2, row: 4)) do
              content_tag(:div, "Sidebar Menu", class: "bg-blue-100 p-4 rounded text-center h-full")
            end +
            # Main Content
            render(BetterUi::General::Grid::CellComponent.new(col: 8, row: 4)) do
              content_tag(:div, "Main Content Area", class: "bg-green-100 p-4 rounded text-center h-full")
            end +
            # Widgets
            render(BetterUi::General::Grid::CellComponent.new(col: 2, row: 4)) do
              content_tag(:div, "Widgets Panel", class: "bg-orange-100 p-4 rounded text-center h-full")
            end +
            # Footer
            render(BetterUi::General::Grid::CellComponent.new(col: :full, row: 1)) do
              content_tag(:div, "Footer", class: "bg-gray-100 p-4 rounded text-center")
            end
          end
        end

        def advanced_positioning
          render BetterUi::General::Grid::Component.new(cols: 6, rows: 4, gap: :medium) do
            # Posizionamento specifico
            render(BetterUi::General::Grid::CellComponent.new(col_start: 1, col_end: 3, row_start: 1, row_end: 3)) do
              content_tag(:div, "Area 1-3, 1-3", class: "bg-red-100 p-4 rounded text-center h-full")
            end +
            render(BetterUi::General::Grid::CellComponent.new(col_start: 4, col_end: 7, row_start: 1, row_end: 2)) do
              content_tag(:div, "Area 4-6, 1", class: "bg-blue-100 p-4 rounded text-center")
            end +
            render(BetterUi::General::Grid::CellComponent.new(col_start: 4, col_end: 5, row_start: 2, row_end: 4)) do
              content_tag(:div, "Area 4, 2-3", class: "bg-green-100 p-4 rounded text-center h-full")
            end +
            render(BetterUi::General::Grid::CellComponent.new(col_start: 5, col_end: 7, row_start: 2, row_end: 4)) do
              content_tag(:div, "Area 5-6, 2-3", class: "bg-yellow-100 p-4 rounded text-center h-full")
            end +
            render(BetterUi::General::Grid::CellComponent.new(col_start: 1, col_end: 7, row_start: 3, row_end: 5)) do
              content_tag(:div, "Area Full Width Bottom", class: "bg-purple-100 p-4 rounded text-center")
            end
          end
        end

        private

        def normalize_params!(**params)
          params.compact
        end
      end
    end
  end
end
