module BetterUi
  module General
    module Progress
      class Component < BetterUi::Component
        # Classi base sempre presenti
        PROGRESS_BASE_CLASSES = "relative w-full bg-gray-200 rounded-full overflow-hidden"

        # Classi per la barra di progresso
        PROGRESS_BAR_BASE_CLASSES = "h-full transition-all duration-300 ease-in-out"

        # Dimensioni della progress bar con classi Tailwind dirette - Sistema uniforme 7 livelli
        PROGRESS_SIZE_CLASSES = {
          xxs: "h-1",          # Extra extra small
          xs: "h-1.5",         # Extra small
          sm: "h-2",           # Small
          md: "h-4",           # Medium (default)
          lg: "h-6",           # Large
          xl: "h-8",           # Extra large
          xxl: "h-10"          # Extra extra large
        }.freeze

        # Temi di progress bar con classi Tailwind dirette
        PROGRESS_THEME_CLASSES = {
          default: "bg-gray-600",
          white: "bg-white border border-gray-300",
          red: "bg-red-600",
          rose: "bg-rose-600",
          orange: "bg-orange-600",
          green: "bg-green-600",
          blue: "bg-blue-600",
          yellow: "bg-yellow-600",
          violet: "bg-violet-600"
        }.freeze

        # Classi per il background container
        PROGRESS_CONTAINER_THEME_CLASSES = {
          default: "bg-gray-200",
          white: "bg-gray-100",
          red: "bg-red-100",
          rose: "bg-rose-100",
          orange: "bg-orange-100",
          green: "bg-green-100",
          blue: "bg-blue-100",
          yellow: "bg-yellow-100",
          violet: "bg-violet-100"
        }.freeze

        configure_attributes({
          theme: {
            var: :@theme,
            default: :white,
            constants: [:PROGRESS_THEME_CLASSES, :PROGRESS_CONTAINER_THEME_CLASSES],
            methods: [:get_theme_class, :get_container_theme_class]
          },
          size: {
            var: :@size,
            default: :md,
            constants: [:PROGRESS_SIZE_CLASSES],
            methods: [:get_size_class]
          }
        })

        attr_reader :value, :label, :classes, :html_options

        # @param value [Integer] percentuale di completamento (0-100)
        # @param theme [Symbol] :default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet
        # @param size [Symbol] :xxs, :xs, :sm, :md, :lg, :xl, :xxl
        # @param label [Boolean] mostra etichetta con percentuale
        # @param classes [String] classi CSS aggiuntive per il container
        # @param html_options [Hash] opzioni HTML per il container
        def initialize(
          value: 0,
          theme: :white,
          size: :md,
          label: false,
          classes: nil,
          **html_options
        )
          @value = [ 0, [ value.to_i, 100 ].min ].max # Clamp tra 0 e 100
          @label = label
          @classes = classes
          @html_options = html_options

          super(theme: theme, size: size)
        end

        # Combina tutte le classi per il container
        def combined_classes
          [
            PROGRESS_BASE_CLASSES,
            get_size_class,
            get_container_theme_class,
            @classes,
            @html_options[:class]
          ].compact.join(" ")
        end

        # Combina tutte le classi per la barra di progresso
        def bar_classes
          [
            PROGRESS_BAR_BASE_CLASSES,
            get_theme_class
          ].compact.join(" ")
        end

        # Restituisce gli attributi per il container della progress bar
        def progress_attributes
          attrs = {
            class: combined_classes,
            role: "progressbar",
            "aria-valuenow": @value,
            "aria-valuemin": 0,
            "aria-valuemax": 100,
            "aria-label": "Progresso: #{@value}%"
          }

          # Aggiungi altri attributi HTML se presenti
          @html_options.except(:class).each do |key, value|
            attrs[key] = value
          end

          attrs
        end

        # Restituisce gli attributi per la barra di progresso
        def bar_attributes
          {
            class: bar_classes,
            style: "width: #{@value}%"
          }
        end

        # Verifica se mostrare l'etichetta
        def show_label?
          @label
        end
      end
    end
  end
end
