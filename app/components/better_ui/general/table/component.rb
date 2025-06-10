module BetterUi
  module General
    module Table
      class Component < BetterUi::Component
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
          xs: "rounded",
          sm: "rounded-md",
          md: "rounded-lg",
          lg: "rounded-xl",
          xl: "rounded-2xl",
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
        CAPTION_CLASSES = "mb-2 text-sm text-gray-600 text-left"

        # Definizione dei sub-componenti con renders_one e renders_many
        renders_one :caption, CaptionComponent
        renders_one :thead, TheadComponent
        renders_one :tbody, TbodyComponent
        renders_one :tfoot, TfootComponent  # ← AGGIUNTO

        configure_attributes({
          theme: {
            var: :@theme,
            default: :default,
            constants: [:TABLE_THEME],
            methods: [:get_theme_class]
          },
          radius: {
            var: :@radius,
            default: :sm,
            constants: [:TABLE_RADIUS],
            methods: [:get_radius_class]
          },
          size: {
            var: :@size,
            default: :md,
            constants: [:TABLE_SIZE_CLASSES],
            methods: [:get_size_class]
          }
        })

        attr_reader :data, :headers, :striped, :hoverable, :bordered, :compact, :minimal

        def initialize(
          data: nil,
          headers: nil,
          theme: :default,
          radius: :sm,
          size: :md,
          striped: false,
          hoverable: false,
          bordered: false,
          compact: false,
          minimal: false,
          **html_options
        )
          super()
          @data = data || []
          @headers = headers
          @theme = theme.to_sym
          @radius = radius.to_sym
          @size = size.to_sym
          @striped = !!striped
          @hoverable = !!hoverable
          @bordered = !!bordered
          @compact = !!compact
          @minimal = !!minimal
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
      end
    end
  end
end
