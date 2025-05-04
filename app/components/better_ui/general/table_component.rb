module BetterUi
  module General
    class TableComponent < ViewComponent::Base
      attr_reader :data, :headers, :caption, :striped, :hoverable, :bordered, :compact, :classes, :variant, :rounded, :footer,
                  :header_rows_partial, :body_row_partial, :footer_rows_partial
      
      # Costanti per configurazione stili
      TABLE_THEMES = {
        default: "bui-table--default",
        white:   "bui-table--white",
        red:     "bui-table--red",
        rose:    "bui-table--rose",
        orange:  "bui-table--orange",
        green:   "bui-table--green",
        blue:    "bui-table--blue",
        yellow:  "bui-table--yellow",
        violet:  "bui-table--violet"
      }.freeze
      
      # Opzioni di bordi arrotondati standardizzati
      TABLE_RADIUS = {
        none: "bui-table--radius-none",
        small: "bui-table--radius-small",
        medium: "bui-table--radius-medium",
        large: "bui-table--radius-large",
        full: "bui-table--radius-full"
      }.freeze
      
      def initialize(data:, headers: nil, caption: nil, striped: false, hoverable: false, bordered: true, compact: false, classes: nil, variant: :default, rounded: :small, footer: nil, header_rows_partial: nil, body_row_partial: nil, footer_rows_partial: nil)
        @data = data || []
        @headers = headers
        @caption = caption
        @striped = !!striped
        @hoverable = !!hoverable
        @bordered = !!bordered
        @compact = !!compact
        @classes = classes
        @variant = (TABLE_THEMES.key?(variant.to_sym) ? variant.to_sym : :default)
        @rounded = (TABLE_RADIUS.key?(rounded.to_sym) ? rounded.to_sym : :small)
        @footer = footer.is_a?(Array) ? footer : nil  # Valida che sia un array
        @header_rows_partial = header_rows_partial
        @body_row_partial = body_row_partial
        @footer_rows_partial = footer_rows_partial
      end

      def table_classes
        [
          "bui-table",
          get_theme_class,
          @bordered ? "bui-table--bordered" : nil,
          @striped ? "bui-table--striped" : nil,
          @hoverable ? "bui-table--hoverable" : nil,
          @compact ? "bui-table--compact" : nil,
          @classes
        ].compact.join(" ")
      end

      def table_container_classes
        [
          "bui-table__container",
          get_border_radius_class
        ].compact.join(" ")
      end

      def get_border_radius_class
        TABLE_RADIUS[@rounded] || TABLE_RADIUS[:small]
      end
      
      def get_theme_class
        TABLE_THEMES[@variant] || TABLE_THEMES[:default]
      end

      def caption_classes
        "bui-table__caption"
      end

      def thead_classes
        "bui-table__header"
      end

      def tbody_classes
        "bui-table__body"
      end
      
      def tfoot_classes
        "bui-table__footer"
      end

      def tr_classes(index)
        "bui-table__row"
      end

      def th_classes
        [
          "bui-table__cell",
          "bui-table__cell--header"
        ].compact.join(" ")
      end

      def td_classes
        "bui-table__cell"
      end
      
      def tf_classes
        [
          "bui-table__cell",
          "bui-table__cell--footer"
        ].compact.join(" ")
      end

      def headers_for_display
        return @headers if @headers.present?
        return [] if @data.empty?
        
        case first_item = @data.first
        when Hash
          first_item.keys
        when -> (item) { item.respond_to?(:attributes) }
          first_item.attributes.keys - %w[id created_at updated_at]
        else
          []
        end
      end
      
      # Ottiene il valore di una cella in modo consistente
      def get_cell_value(row, header)
        if row.is_a?(Hash)
          row[header.to_s] || row[header.to_sym] || "—"
        elsif row.respond_to?(header.to_sym)
          row.send(header.to_sym)
        elsif row.is_a?(Array) && headers_for_display.index(header)
          row[headers_for_display.index(header)] || "—"
        else
          "—"
        end
      end

      def render?
        @data.present?
      end
    end
  end
end 