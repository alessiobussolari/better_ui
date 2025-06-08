module BetterUi
  module General
    module Table
      class Component < ViewComponent::Base
        attr_reader :data, :headers, :caption, :size, :striped, :hoverable, :bordered, :compact, :minimal, :footer,
                    :header_rows_partial, :body_row_partial, :footer_rows_partial, :thead_partial, :tfoot_partial

        # Classi base sempre presenti
        TABLE_BASE_CLASSES = "w-full table-auto border-collapse"

        # Temi di colore con classi Tailwind dirette
        TABLE_THEME = {
          default: "bg-gray-50 text-gray-900",
          white: "bg-white text-gray-900",
          red: "bg-red-50 text-red-900",
          rose: "bg-rose-50 text-rose-900",
          orange: "bg-orange-50 text-orange-900",
          green: "bg-green-50 text-green-900",
          blue: "bg-blue-50 text-blue-900",
          yellow: "bg-yellow-50 text-yellow-900",
          violet: "bg-violet-50 text-violet-900"
        }.freeze

        # Opzioni di bordi arrotondati con classi Tailwind dirette
        TABLE_RADIUS = {
          none: "rounded-none",
          small: "rounded-md",
          medium: "rounded-lg",
          large: "rounded-xl",
          full: "rounded-full"
        }.freeze

        # Dimensioni con classi Tailwind dirette - Sistema uniforme 7 livelli
        TABLE_SIZE_CLASSES = {
          xxs: "text-xs [&_th]:px-2 [&_th]:py-1 [&_td]:px-2 [&_td]:py-1",
          xs: "text-xs [&_th]:px-2 [&_th]:py-2 [&_td]:px-2 [&_td]:py-2",
          sm: "text-sm [&_th]:px-3 [&_th]:py-2 [&_td]:px-3 [&_td]:py-2",
          md: "text-sm [&_th]:px-4 [&_th]:py-3 [&_td]:px-4 [&_td]:py-3",
          lg: "text-base [&_th]:px-5 [&_th]:py-4 [&_td]:px-5 [&_td]:py-4",
          xl: "text-lg [&_th]:px-6 [&_th]:py-5 [&_td]:px-6 [&_td]:py-5",
          xxl: "text-xl [&_th]:px-8 [&_th]:py-6 [&_td]:px-8 [&_td]:py-6"
        }.freeze


        # Classi per container
        CONTAINER_BASE_CLASSES = "overflow-x-auto"

        # Classi per elementi della tabella
        THEAD_CLASSES = "bg-gray-100 border-b border-gray-200"
        TBODY_CLASSES = ""
        TFOOT_CLASSES = "bg-gray-50 border-t border-gray-200"
        TR_CLASSES = "border-b border-gray-100 hover:bg-gray-50"
        TH_CLASSES = "px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
        TD_CLASSES = "px-4 py-3 text-sm text-gray-900"
        TF_CLASSES = "px-4 py-3 text-sm font-medium text-gray-900"
        CAPTION_CLASSES = "mb-2 text-sm text-gray-600 text-left"

        def initialize(
          data: nil,
          headers: nil,
          caption: nil,
          theme: :default,
          radius: :sm,
          size: :md,
          striped: false,
          hoverable: false,
          bordered: false,
          compact: false,
          minimal: false,
          footer: nil,
          header_rows_partial: nil,
          body_row_partial: nil,
          footer_rows_partial: nil,
          thead_partial: nil,
          tfoot_partial: nil,
          **html_options
        )
          @data = data || []
          @headers = headers
          @caption = caption
          @theme = theme.to_sym
          @radius = radius.to_sym
          @size = size.to_sym
          # Flag boolean combinabili
          @striped = !!striped
          @hoverable = !!hoverable
          @bordered = !!bordered
          @compact = !!compact
          @minimal = !!minimal
          @footer = footer.is_a?(Array) ? footer : nil
          @header_rows_partial = header_rows_partial
          @body_row_partial = body_row_partial
          @footer_rows_partial = footer_rows_partial
          @thead_partial = thead_partial
          @tfoot_partial = tfoot_partial
          @html_options = html_options

          validate_params
        end

        # Combina tutte le classi per la tabella
        def combined_classes
          [
            TABLE_BASE_CLASSES,
            get_theme_class,
            get_size_class,
            @bordered ? "border border-gray-200" : nil,
            @striped ? "[&_tbody_tr:nth-child(odd)]:bg-gray-50" : nil,
            @hoverable ? "[&_tbody_tr]:hover:bg-gray-50" : nil,
            @compact ? "[&_td]:py-1 [&_th]:py-1" : nil,
            @minimal ? "border-0" : nil,
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
            CONTAINER_BASE_CLASSES,
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
          TABLE_RADIUS[@radius] || TABLE_RADIUS[:sm]
        end

        def get_theme_class
          TABLE_THEME[@theme] || TABLE_THEME[:default]
        end

        def get_size_class
          TABLE_SIZE_CLASSES[@size] || TABLE_SIZE_CLASSES[:md]
        end


        def caption_classes
          CAPTION_CLASSES
        end

        def thead_classes
          THEAD_CLASSES
        end

        def tbody_classes
          TBODY_CLASSES
        end

        def tfoot_classes
          TFOOT_CLASSES
        end

        def tr_classes(index)
          TR_CLASSES
        end

        def th_classes
          TH_CLASSES
        end

        def td_classes
          TD_CLASSES
        end

        def tf_classes
          TF_CLASSES
        end

        def headers_for_display
          return @headers if @headers.present?
          return [] if @data.empty?

          case first_item = @data.first
          when Hash
            first_item.keys
          when ->(item) { item.respond_to?(:attributes) }
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
          true
        end

        private

        def validate_params
          validate_theme
          validate_radius
          validate_size
        end

        def validate_theme
          unless TABLE_THEME.keys.include?(@theme)
            raise ArgumentError, "Il tema deve essere uno tra: #{TABLE_THEME.keys.join(', ')}"
          end
        end

        def validate_radius
          unless TABLE_RADIUS.keys.include?(@radius)
            raise ArgumentError, "Il radius deve essere uno tra: #{TABLE_RADIUS.keys.join(', ')}"
          end
        end

        def validate_size
          unless TABLE_SIZE_CLASSES.keys.include?(@size)
            raise ArgumentError, "La size deve essere una tra: #{TABLE_SIZE_CLASSES.keys.join(', ')}"
          end
        end
      end
    end
  end
end
