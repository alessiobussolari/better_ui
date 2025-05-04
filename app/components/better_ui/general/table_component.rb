module BetterUi
  module General
    class TableComponent < ViewComponent::Base
      attr_reader :data, :headers, :caption, :striped, :hoverable, :bordered, :compact, :classes, :variant, :rounded, :footer,
                  :header_rows_partial, :body_row_partial, :footer_rows_partial
      
      # Costanti per configurazione stili
      TABLE_THEMES = {
        default: { base: "bui-table-default", border: "bui-table-border-default", bg: "bui-table-bg-default", text: "bui-table-text-default" },
        white:   { base: "bui-table-white",   border: "bui-table-border-white",   bg: "bui-table-bg-white",   text: "bui-table-text-white" },
        red:     { base: "bui-table-red",     border: "bui-table-border-red",     bg: "bui-table-bg-red",     text: "bui-table-text-red" },
        rose:    { base: "bui-table-rose",    border: "bui-table-border-rose",    bg: "bui-table-bg-rose",    text: "bui-table-text-rose" },
        orange:  { base: "bui-table-orange",  border: "bui-table-border-orange",  bg: "bui-table-bg-orange",  text: "bui-table-text-orange" },
        green:   { base: "bui-table-green",   border: "bui-table-border-green",   bg: "bui-table-bg-green",   text: "bui-table-text-green" },
        blue:    { base: "bui-table-blue",    border: "bui-table-border-blue",    bg: "bui-table-bg-blue",    text: "bui-table-text-blue" },
        yellow:  { base: "bui-table-yellow",  border: "bui-table-border-yellow",  bg: "bui-table-bg-yellow",  text: "bui-table-text-yellow" },
        violet:  { base: "bui-table-violet",  border: "bui-table-border-violet",  bg: "bui-table-bg-violet",  text: "bui-table-text-violet" }
      }.freeze
      
      # Opzioni di bordi arrotondati standardizzati
      TABLE_RADIUS = {
        none: "bui-table-radius-none",
        small: "bui-table-radius-small",
        medium: "bui-table-radius-medium",
        large: "bui-table-radius-large",
        full: "bui-table-radius-full"
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
          "bui-table-base",
          @bordered ? "bui-table-bordered" : nil,
          @classes
        ].compact.join(" ")
      end

      def table_container_classes
        [
          "bui-table-container",
          get_border_radius_class
        ].compact.join(" ")
      end

      def get_border_radius_class
        TABLE_RADIUS[@rounded] || TABLE_RADIUS[:small]
      end

      def caption_classes
        [
          "bui-table-caption",
          get_theme_bg_color,
          get_theme_text_class,
          @bordered ? "bui-table-caption-bordered #{get_theme_border_color}" : nil
        ].compact.join(" ")
      end

      def thead_classes
        "bui-table-header"
      end

      def tbody_classes
        @striped ? "bui-table-row-striped" : nil
      end
      
      def tfoot_classes
        "bui-table-footer"
      end

      def tr_classes(index)
        [
          @hoverable ? "bui-table-row-hover" : nil,
          @striped ? nil : (index.odd? ? "bui-table-row-alternate" : nil)
        ].compact.join(" ")
      end

      def th_classes
        [
          @compact ? "bui-table-cell-compact" : "bui-table-cell",
          get_theme_bg_color,
          get_theme_text_class,
          @bordered ? "bui-table-cell-bordered #{get_theme_border_color}" : nil
        ].compact.join(" ")
      end

      def td_classes
        [
          @compact ? "bui-table-cell-compact" : "bui-table-cell",
          @bordered ? "bui-table-cell-bordered #{get_theme_border_color}" : nil
        ].compact.join(" ")
      end
      
      def tf_classes
        [
          @compact ? "bui-table-cell-compact" : "bui-table-cell",
          "bui-table-footer-cell",
          get_theme_bg_color,
          get_theme_text_class,
          @bordered ? "bui-table-cell-bordered #{get_theme_border_color}" : nil
        ].compact.join(" ")
      end
      
      def get_theme_base_class
        TABLE_THEMES[@variant][:base] || TABLE_THEMES[:default][:base]
      end
      
      def get_theme_border_color
        TABLE_THEMES[@variant][:border] || TABLE_THEMES[:default][:border]
      end
      
      def get_theme_bg_color
        TABLE_THEMES[@variant][:bg] || TABLE_THEMES[:default][:bg]
      end
      
      def get_theme_text_class
        TABLE_THEMES[@variant][:text] || TABLE_THEMES[:default][:text]
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