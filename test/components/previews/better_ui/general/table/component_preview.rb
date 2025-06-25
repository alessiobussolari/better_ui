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
        # ## 🔧 **ARCHITETTURA A 4 LIVELLI**
        # La tabella utilizza `renders_one` e `renders_many` per una struttura modulare:
        # - Table → Section (thead/tbody/tfoot) → Row (tr) → Cell (th/td)
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
        # ## 🚀 **ESEMPIO UTILIZZO CON RENDERS_ONE/MANY**
        # ```ruby
        # bui_table(theme: :blue, bordered: true) do |table|
        #   table.with_thead do |thead|
        #     thead.with_row do |row|
        #       row.with_header("Nome", sortable: true, sorted: true, sort_direction: :asc)
        #       row.with_header("Email")
        #       row.with_header("Ruolo", scope: "col")
        #     end
        #   end
        #
        #   table.with_tbody(striped: true, hoverable: true) do |tbody|
        #     tbody.with_row(highlighted: true) do |row|
        #       row.with_cell("Mario Rossi")
        #       row.with_cell("mario@example.com", align: :center)
        #       row.with_cell("Admin", compact: true)
        #     end
        #   end
        #
        #   table.with_tfoot do |tfoot|
        #     tfoot.with_row do |row|
        #       row.with_cell("Totale", colspan: 3, align: :center)
        #     end
        #   end
        # end
        # ```
      end
    end
  end
end
