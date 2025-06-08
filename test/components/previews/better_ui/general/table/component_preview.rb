module BetterUi
  module General
    module Table
      class ComponentPreview < Lookbook::Preview
        # @!group Esempi Base

        # @label Con Helper
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema"
        # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione"
        # @param bordered toggle "Bordi"
        # @param striped toggle "Righe alternate"
        # @param hoverable toggle "Hover"
        # @param compact toggle "Modalità compatta"
        # @param minimal toggle "Modalità minimale"
        def default(theme: :default, size: :md, bordered: true, striped: false, hoverable: false, compact: false, minimal: false)
          render_with_template(locals: {
            theme: theme.to_sym,
            size: size.to_sym,
            bordered: bordered,
            striped: striped,
            hoverable: hoverable,
            compact: compact,
            minimal: minimal
          })
        end

        # @label Istanziazione Diretta
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema"
        # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione"
        # @param bordered toggle "Bordi"
        # @param striped toggle "Righe alternate"
        # @param hoverable toggle "Hover"
        # @param compact toggle "Modalità compatta"
        # @param minimal toggle "Modalità minimale"
        def raw(theme: :default, size: :md, bordered: true, striped: false, hoverable: false, compact: false, minimal: false)
          render_with_template(locals: {
            theme: theme.to_sym,
            size: size.to_sym,
            bordered: bordered,
            striped: striped,
            hoverable: hoverable,
            compact: compact,
            minimal: minimal
          })
        end

        # @!endgroup

        # ## 📦 **SUB-COMPONENTI MODULARI**
        #
        # **6 Componenti Separati:**
        # - `BetterUi::General::Table::TheadComponent` - Header
        # - `BetterUi::General::Table::TbodyComponent` - Body (striped, hoverable)
        # - `BetterUi::General::Table::TfootComponent` - Footer
        # - `BetterUi::General::Table::TrComponent` - Righe (highlighted)
        # - `BetterUi::General::Table::ThComponent` - Header cells (sortable, scope)
        # - `BetterUi::General::Table::TdComponent` - Data cells (align, compact)
        #
        # ## 🔧 **HELPER MODULARI**
        # ```ruby
        # bui_thead         # Header section
        # bui_tbody         # Body section
        # bui_tfoot         # Footer section
        # bui_tr            # Table row
        # bui_th            # Header cell
        # bui_td            # Data cell
        # ```
        #
        # ## ⚙️ **PARAMETRI SUB-COMPONENTI**
        #
        # **TbodyComponent:**
        # - `striped: true/false` - Righe alternate automatiche
        # - `hoverable: true/false` - Effetti hover
        #
        # **TrComponent:**
        # - `highlighted: true/false` - Evidenzia la riga
        #
        # **ThComponent:**
        # - `sortable: true/false` - Header cliccabile
        # - `sorted: true/false` - Indica se è ordinato
        # - `sort_direction: :asc/:desc` - Direzione ordinamento
        # - `scope: "col"/"row"` - Attributo scope HTML
        #
        # **TdComponent:**
        # - `align: :left/:center/:right` - Allineamento testo
        # - `compact: true/false` - Padding ridotto
        #
        # ## 🚀 **ESEMPIO UTILIZZO MODULARE**
        # ```ruby
        # bui_table(theme: :blue, bordered: true) do
        #   bui_thead do
        #     bui_tr do
        #       bui_th("Nome", sortable: true, sorted: true, sort_direction: :asc)
        #       bui_th("Email")
        #       bui_th("Ruolo", scope: "col")
        #     end
        #   end
        #
        #   bui_tbody(striped: true, hoverable: true) do
        #     bui_tr(highlighted: true) do
        #       bui_td("Mario Rossi")
        #       bui_td("mario@example.com", align: :center)
        #       bui_td("Admin", compact: true)
        #     end
        #   end
        #
        #   bui_tfoot do
        #     bui_tr do
        #       bui_td("Totale", colspan: 3, align: :center)
        #     end
        #   end
        # end
        # ```
      end
    end
  end
end
