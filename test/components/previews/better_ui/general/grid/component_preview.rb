module BetterUi
  module General
    module Grid
      class ComponentPreview < Lookbook::Preview
        
        # @group Con Helper
        # @label Con Helper
        # @param cols_sm select { choices: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12] } "Colonne SM"
        # @param cols_md select { choices: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12] } "Colonne MD"
        # @param cols_lg select { choices: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12] } "Colonne LG"
        # @param gap_sm select { choices: [none, xs, sm, md, lg, xl, xxl] } "Gap SM"
        # @param gap_md select { choices: [none, xs, sm, md, lg, xl, xxl] } "Gap MD"
        # @param gap_lg select { choices: [none, xs, sm, md, lg, xl, xxl] } "Gap LG"
        # @param rows_sm select { choices: [none, 1, 2, 3, 4, 5, 6] } "Righe SM"
        # @param rows_md select { choices: [none, 1, 2, 3, 4, 5, 6] } "Righe MD"
        # @param rows_lg select { choices: [none, 1, 2, 3, 4, 5, 6] } "Righe LG"
        # @param started_sm select { choices: [none, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, auto] } "Started SM"
        # @param started_md select { choices: [none, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, auto] } "Started MD"
        # @param started_lg select { choices: [none, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, auto] } "Started LG"
        # @param ended_sm select { choices: [none, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, auto] } "Ended SM"
        # @param ended_md select { choices: [none, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, auto] } "Ended MD"
        # @param ended_lg select { choices: [none, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, auto] } "Ended LG"
        # @param row_started_sm select { choices: [none, 1, 2, 3, 4, 5, 6, auto] } "Row Started SM"
        # @param row_started_md select { choices: [none, 1, 2, 3, 4, 5, 6, auto] } "Row Started MD"
        # @param row_started_lg select { choices: [none, 1, 2, 3, 4, 5, 6, auto] } "Row Started LG"
        # @param row_ended_sm select { choices: [none, 1, 2, 3, 4, 5, 6, auto] } "Row Ended SM"
        # @param row_ended_md select { choices: [none, 1, 2, 3, 4, 5, 6, auto] } "Row Ended MD"
        # @param row_ended_lg select { choices: [none, 1, 2, 3, 4, 5, 6, auto] } "Row Ended LG"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema"
        # @param padding select { choices: [none, xs, sm, md, lg, xl, xxl] } "Padding"
        # @param rounded select { choices: [none, xs, sm, md, lg, xl, full] } "Border radius"
        # @param justify select { choices: [start, center, end, stretch] } "Justify items"
        # @param align select { choices: [start, center, end, stretch] } "Align items"
        # @param with_items toggle "Usa items configurabili"
        # **Esempi di utilizzo con helper:**
        # ```erb
        # # Grid semplice responsive
        # <%= bui_grid(cols: {sm: 1, md: 2, lg: 3}, gap: {sm: :sm, lg: :lg}) do %>
        #   <div>Item 1</div>
        #   <div>Item 2</div>
        #   <div>Item 3</div>
        # <% end %>
        #
        # # Grid con items configurabili
        # <%= bui_grid(cols: {sm: 1, lg: 4}, gap: {sm: :md}) do |grid| %>
        #   <% grid.with_item(span: {lg: 2}) do %>
        #     Featured item (2 colonne)
        #   <% end %>
        #   <% grid.with_item do %>
        #     Normal item
        #   <% end %>
        # <% end %>
        #
        # # Grid per dashboard
        # <%= bui_grid(
        #   cols: {sm: 1, md: 2, lg: 4}, 
        #   gap: {sm: :md, lg: :lg},
        #   theme: :blue,
        #   padding: :lg
        # ) do %>
        #   <%= bui_card(theme: :white) { "Card 1" } %>
        #   <%= bui_card(theme: :white) { "Card 2" } %>
        #   <%= bui_card(theme: :white) { "Card 3" } %>
        #   <%= bui_card(theme: :white) { "Card 4" } %>
        # <% end %>
        # ```
        def default(
          cols_sm: 1,
          cols_md: 2,
          cols_lg: 3,
          gap_sm: :sm,
          gap_md: :md,
          gap_lg: :lg,
          rows_sm: 2,
          rows_md: 2,
          rows_lg: :none,
          started_sm: :none,
          started_md: :none,
          started_lg: :none,
          ended_sm: :none,
          ended_md: :none,
          ended_lg: :none,
          row_started_sm: :none,
          row_started_md: :none,
          row_started_lg: :none,
          row_ended_sm: :none,
          row_ended_md: :none,
          row_ended_lg: :none,
          theme: :white,
          padding: :md,
          rounded: :md,
          justify: :start,
          align: :start,
          with_items: false
        )
          # Normalizza parametri da Lookbook
          normalized = normalize_params!(
            cols_sm: cols_sm, cols_md: cols_md, cols_lg: cols_lg,
            gap_sm: gap_sm, gap_md: gap_md, gap_lg: gap_lg,
            rows_sm: rows_sm, rows_md: rows_md, rows_lg: rows_lg,
            started_sm: started_sm, started_md: started_md, started_lg: started_lg,
            ended_sm: ended_sm, ended_md: ended_md, ended_lg: ended_lg,
            row_started_sm: row_started_sm, row_started_md: row_started_md, row_started_lg: row_started_lg,
            row_ended_sm: row_ended_sm, row_ended_md: row_ended_md, row_ended_lg: row_ended_lg,
            theme: theme, padding: padding, rounded: rounded,
            justify: justify, align: align, with_items: with_items
          )
          
          # Costruisce gli hash responsive dai parametri normalizzati
          cols = build_responsive_hash(:cols, normalized)
          gap = build_responsive_hash(:gap, normalized)
          rows = build_responsive_hash(:rows, normalized)
          started = build_responsive_hash(:started, normalized)
          ended = build_responsive_hash(:ended, normalized)
          row_started = build_responsive_hash(:row_started, normalized)
          row_ended = build_responsive_hash(:row_ended, normalized)
          
          # Implementazione con helper bui_grid
          # 
          # Esempi di utilizzo:
          # <%= bui_grid(cols: {sm: 1, lg: 3}, gap: {sm: :md}) %>
          # <%= bui_grid(cols: {sm: 2, lg: 4}, gap: {sm: :sm, lg: :lg}, theme: :blue) %>
          # <%= bui_grid(cols: {sm: 1, md: 2}, gap: {sm: :md}, padding: :lg) %>
          
          render_with_template locals: {
            cols: cols,
            gap: gap,
            rows: rows,
            started: started,
            ended: ended,
            row_started: row_started,
            row_ended: row_ended,
            theme: normalized[:theme],
            padding: normalized[:padding],
            rounded: normalized[:rounded],
            justify: normalized[:justify],
            align: normalized[:align],
            with_items: normalized[:with_items]
          }
        end
        
        # @group Componente Raw
        # @label Componente Raw
        # @param cols_sm select { choices: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12] } "Colonne SM"
        # @param cols_md select { choices: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12] } "Colonne MD"
        # @param cols_lg select { choices: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12] } "Colonne LG"
        # @param gap_sm select { choices: [none, xs, sm, md, lg, xl, xxl] } "Gap SM"
        # @param gap_md select { choices: [none, xs, sm, md, lg, xl, xxl] } "Gap MD"
        # @param gap_lg select { choices: [none, xs, sm, md, lg, xl, xxl] } "Gap LG"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema"
        # @param padding select { choices: [none, xs, sm, md, lg, xl, xxl] } "Padding"
        # @param rounded select { choices: [none, xs, sm, md, lg, xl, full] } "Border radius"
        # @param justify select { choices: [start, center, end, stretch] } "Justify items"
        # @param align select { choices: [start, center, end, stretch] } "Align items"
        # @param with_items toggle "Usa items configurabili"
        def raw(
          cols_sm: 1,
          cols_md: 2,
          cols_lg: 3,
          gap_sm: :sm,
          gap_md: :md,
          gap_lg: :lg,
          rows_sm: :none,
          rows_md: :none,
          rows_lg: :none,
          started_sm: :none,
          started_md: :none,
          started_lg: :none,
          ended_sm: :none,
          ended_md: :none,
          ended_lg: :none,
          row_started_sm: :none,
          row_started_md: :none,
          row_started_lg: :none,
          row_ended_sm: :none,
          row_ended_md: :none,
          row_ended_lg: :none,
          theme: :white,
          padding: :md,
          rounded: :md,
          justify: :start,
          align: :start,
          with_items: false
        )
          # Normalizza parametri da Lookbook
          normalized = normalize_params!(
            cols_sm: cols_sm, cols_md: cols_md, cols_lg: cols_lg,
            gap_sm: gap_sm, gap_md: gap_md, gap_lg: gap_lg,
            theme: theme, padding: padding, rounded: rounded,
            justify: justify, align: align, with_items: with_items
          )
          
          # Implementazione diretta del componente
          # 
          # Esempi di utilizzo:
          # <%= render Component.new(cols: {sm: 1, lg: 3}, gap: {sm: :md}) %>
          # <%= render Component.new(cols: {sm: 2, lg: 4}, gap: {sm: :sm, lg: :lg}) %>
          
          cols = { sm: normalized[:cols_sm], md: normalized[:cols_md], lg: normalized[:cols_lg] }
          gap = { sm: normalized[:gap_sm], md: normalized[:gap_md], lg: normalized[:gap_lg] }
          
          if normalized[:with_items]
            render BetterUi::General::Grid::Component.new(
              cols: cols,
              gap: gap,
              theme: normalized[:theme],
              padding: normalized[:padding],
              rounded: normalized[:rounded],
              justify: normalized[:justify],
              align: normalized[:align]
            ) do |grid|
              content_tag(:div) do
                grid.with_item(span: { lg: 2 }) do
                  content_tag(:div, "Featured Item (2 cols)", 
                    class: "bg-blue-100 border border-blue-200 p-4 rounded text-center text-blue-800")
                end
                
                grid.with_item do
                  content_tag(:div, "Item 1", 
                    class: "bg-gray-100 border border-gray-200 p-4 rounded text-center")
                end
                
                grid.with_item do
                  content_tag(:div, "Item 2", 
                    class: "bg-gray-100 border border-gray-200 p-4 rounded text-center")
                end
                
                grid.with_item(started: { lg: 2 }, ended: { lg: 4 }) do
                  content_tag(:div, "Positioned Item", 
                    class: "bg-green-100 border border-green-200 p-4 rounded text-center text-green-800")
                end
                
                grid.with_item do
                  content_tag(:div, "Item 3", 
                    class: "bg-gray-100 border border-gray-200 p-4 rounded text-center")
                end
                
                grid.with_item do
                  content_tag(:div, "Item 4", 
                    class: "bg-gray-100 border border-gray-200 p-4 rounded text-center")
                end
              end
            end
          else
            render BetterUi::General::Grid::Component.new(
              cols: cols,
              gap: gap,
              theme: normalized[:theme],
              padding: normalized[:padding],
              rounded: normalized[:rounded],
              justify: normalized[:justify],
              align: normalized[:align]
            ) do
              content_tag(:div) do
                items = []
                items << content_tag(:div, "Grid Item 1", 
                  class: "bg-blue-100 border border-blue-200 p-4 rounded text-center")
                items << content_tag(:div, "Grid Item 2", 
                  class: "bg-green-100 border border-green-200 p-4 rounded text-center")
                items << content_tag(:div, "Grid Item 3", 
                  class: "bg-yellow-100 border border-yellow-200 p-4 rounded text-center")
                items << content_tag(:div, "Grid Item 4", 
                  class: "bg-purple-100 border border-purple-200 p-4 rounded text-center")
                items << content_tag(:div, "Grid Item 5", 
                  class: "bg-red-100 border border-red-200 p-4 rounded text-center")
                items << content_tag(:div, "Grid Item 6", 
                  class: "bg-indigo-100 border border-indigo-200 p-4 rounded text-center")
                safe_join(items)
              end
            end
          end
        end
        
        private
        
        def normalize_params!(options)
          # Normalizza parametri numerici da Lookbook (string -> integer)
          options[:cols_sm] = options[:cols_sm].to_i if options[:cols_sm].is_a?(String)
          options[:cols_md] = options[:cols_md].to_i if options[:cols_md].is_a?(String)
          options[:cols_lg] = options[:cols_lg].to_i if options[:cols_lg].is_a?(String)
          
          # Normalizza parametri rows (può essere numero o symbol)
          options[:rows_sm] = normalize_value(options[:rows_sm])
          options[:rows_md] = normalize_value(options[:rows_md])
          options[:rows_lg] = normalize_value(options[:rows_lg])
          
          # Normalizza parametri started/ended (può essere numero o symbol)
          options[:started_sm] = normalize_value(options[:started_sm])
          options[:started_md] = normalize_value(options[:started_md])
          options[:started_lg] = normalize_value(options[:started_lg])
          options[:ended_sm] = normalize_value(options[:ended_sm])
          options[:ended_md] = normalize_value(options[:ended_md])
          options[:ended_lg] = normalize_value(options[:ended_lg])
          
          # Normalizza parametri row_started/row_ended (può essere numero o symbol)
          options[:row_started_sm] = normalize_value(options[:row_started_sm])
          options[:row_started_md] = normalize_value(options[:row_started_md])
          options[:row_started_lg] = normalize_value(options[:row_started_lg])
          options[:row_ended_sm] = normalize_value(options[:row_ended_sm])
          options[:row_ended_md] = normalize_value(options[:row_ended_md])
          options[:row_ended_lg] = normalize_value(options[:row_ended_lg])
          
          # Normalizza parametri symbol da Lookbook (string -> symbol)
          options[:gap_sm] = options[:gap_sm].to_sym if options[:gap_sm].is_a?(String)
          options[:gap_md] = options[:gap_md].to_sym if options[:gap_md].is_a?(String)
          options[:gap_lg] = options[:gap_lg].to_sym if options[:gap_lg].is_a?(String)
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:padding] = options[:padding].to_sym if options[:padding].is_a?(String)
          options[:rounded] = options[:rounded].to_sym if options[:rounded].is_a?(String)
          options[:justify] = options[:justify].to_sym if options[:justify].is_a?(String)
          options[:align] = options[:align].to_sym if options[:align].is_a?(String)
          
          # Normalizza parametri boolean da Lookbook
          options[:with_items] = options[:with_items] == true || options[:with_items] == "true"
          
          options
        end
        
        def normalize_value(value)
          return nil if value == :none || value == "none" || value.nil?
          return value.to_i if value.to_s.match?(/^\d+$/)
          value.to_sym
        end
        
        def build_responsive_hash(type, options)
          hash = {}
          
          # Costruisce hash responsive dai parametri _sm, _md, _lg
          [:sm, :md, :lg].each do |breakpoint|
            key = "#{type}_#{breakpoint}".to_sym
            value = options[key]
            
            # Aggiunge al hash solo se il valore non è nil o :none
            unless value.nil? || value == :none
              hash[breakpoint] = value
            end
          end
          
          # Ritorna nil se l'hash è vuoto, altrimenti l'hash
          hash.empty? ? nil : hash
        end
        
        def generate_grid_items(count = 6)
          colors = %w[blue green yellow purple red indigo]
          
          (1..count).map do |i|
            color = colors[(i - 1) % colors.length]
            content_tag(:div, "Grid Item #{i}", 
              class: "bg-#{color}-100 border border-#{color}-200 p-4 rounded text-center")
          end
        end
      end
    end
  end
end
