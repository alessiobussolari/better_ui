module BetterUi
  module General
    class TableComponent < ViewComponent::Base
      attr_reader :data, :headers, :caption, :striped, :hoverable, :bordered, :compact, :classes, :variant, :rounded, :footer,
                  :header_rows_partial, :body_row_partial, :footer_rows_partial
      
      # Temi di colore disponibili
      TABLE_THEME = {
        default: "bui-table--default",
        white:   "bui-table--white",
        red:     "bui-table--red",
        rose:    "bui-table--rose",
        orange:  "bui-table--orange",
        green:   "bui-table--green",
        blue:    "bui-table--blue",
        yellow:  "bui-table--yellow",
        violet:  "bui-table--violet",
        gray:    "bui-table--gray"
      }.freeze
      
      # Opzioni di bordi arrotondati standardizzati
      TABLE_RADIUS = {
        none: "bui-table--radius-none",
        small: "bui-table--radius-small",
        medium: "bui-table--radius-medium",
        large: "bui-table--radius-large",
        full: "bui-table--radius-full"
      }.freeze
      
      # Orientamenti disponibili
      TABLE_ORIENTATION = {
        horizontal: "bui-table--horizontal",
        vertical: "bui-table--vertical"
      }.freeze
      
      # Stili disponibili
      TABLE_STYLE = {
        default: "bui-table--style-default",
        bordered: "bui-table--style-bordered",
        striped: "bui-table--style-striped",
        compact: "bui-table--style-compact",
        minimal: "bui-table--style-minimal"
      }.freeze
      
      def initialize(
        data:, 
        headers: nil, 
        caption: nil, 
        theme: :default, 
        orientation: :horizontal, 
        style: :default, 
        radius: :small, 
        striped: false, 
        hoverable: false, 
        bordered: false, 
        compact: false, 
        footer: nil, 
        header_rows_partial: nil, 
        body_row_partial: nil, 
        footer_rows_partial: nil,
        **html_options
      )
        @data = data || []
        @headers = headers
        @caption = caption
        @theme = theme.to_sym
        @orientation = orientation.to_sym
        @style = style.to_sym
        @radius = radius.to_sym
        # Mantieni queste flag per retrocompatibilità
        @striped = !!striped
        @hoverable = !!hoverable
        @bordered = !!bordered
        @compact = !!compact
        @footer = footer.is_a?(Array) ? footer : nil
        @header_rows_partial = header_rows_partial
        @body_row_partial = body_row_partial
        @footer_rows_partial = footer_rows_partial
        @html_options = html_options
        
        validate_params
      end

      # Combina tutte le classi per la tabella
      def combined_classes
        [
          "bui-table",
          get_theme_class,
          get_orientation_class,
          get_style_class,
          @bordered ? "bui-table--bordered" : nil,
          @striped ? "bui-table--striped" : nil,
          @hoverable ? "bui-table--hoverable" : nil,
          @compact ? "bui-table--compact" : nil,
          @html_options[:class]
        ].compact.join(" ")
      end

      # Restituisce gli attributi HTML per la tabella
      def table_attributes
        attrs = @html_options.except(:class)
        attrs[:class] = combined_classes
        attrs
      end

      # Combina le classi per il container
      def table_container_classes
        [
          "bui-table__container",
          get_radius_class
        ].compact.join(" ")
      end
      
      # Restituisce gli attributi HTML per il container
      def container_attributes
        {
          class: table_container_classes
        }
      end

      def get_radius_class
        TABLE_RADIUS[@radius] || TABLE_RADIUS[:small]
      end
      
      def get_theme_class
        TABLE_THEME[@theme] || TABLE_THEME[:default]
      end

      def get_orientation_class
        TABLE_ORIENTATION[@orientation] || TABLE_ORIENTATION[:horizontal]
      end

      def get_style_class
        TABLE_STYLE[@style] || TABLE_STYLE[:default]
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
      
      private
      
      def validate_params
        validate_theme
        validate_orientation
        validate_style
        validate_radius
      end
      
      def validate_theme
        unless TABLE_THEME.keys.include?(@theme)
          raise ArgumentError, "Il tema deve essere uno tra: #{TABLE_THEME.keys.join(', ')}"
        end
      end
      
      def validate_orientation
        unless TABLE_ORIENTATION.keys.include?(@orientation)
          raise ArgumentError, "L'orientamento deve essere uno tra: #{TABLE_ORIENTATION.keys.join(', ')}"
        end
      end
      
      def validate_style
        unless TABLE_STYLE.keys.include?(@style)
          raise ArgumentError, "Lo stile deve essere uno tra: #{TABLE_STYLE.keys.join(', ')}"
        end
      end
      
      def validate_radius
        unless TABLE_RADIUS.keys.include?(@radius)
          raise ArgumentError, "Il radius deve essere uno tra: #{TABLE_RADIUS.keys.join(', ')}"
        end
      end
    end
  end
end 