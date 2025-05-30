module BetterUi
  module General
    module Progress
      class Component < ViewComponent::Base
        # Classi base sempre presenti
        PROGRESS_BASE_CLASSES = "relative w-full bg-gray-200 rounded-full overflow-hidden"

        # Classi per la barra di progresso
        PROGRESS_BAR_BASE_CLASSES = "h-full transition-all duration-300 ease-in-out"

        # Dimensioni della progress bar con classi Tailwind dirette
        PROGRESS_SIZES = {
          small: "h-2",
          medium: "h-4",
          large: "h-6"
        }

        # Temi di progress bar con classi Tailwind dirette
        PROGRESS_THEMES = {
          default: "bg-gray-600",
          white: "bg-white border border-gray-300",
          red: "bg-red-600",
          rose: "bg-rose-600",
          orange: "bg-orange-600",
          green: "bg-green-600",
          blue: "bg-blue-600",
          yellow: "bg-yellow-600",
          violet: "bg-violet-600"
        }

        # Classi per il background container
        PROGRESS_CONTAINER_THEMES = {
          default: "bg-gray-200",
          white: "bg-gray-100",
          red: "bg-red-100",
          rose: "bg-rose-100",
          orange: "bg-orange-100",
          green: "bg-green-100",
          blue: "bg-blue-100",
          yellow: "bg-yellow-100",
          violet: "bg-violet-100"
        }

        # @param value [Integer] percentuale di completamento (0-100)
        # @param theme [Symbol] :default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet
        # @param size [Symbol] :small, :medium, :large
        # @param label [Boolean] mostra etichetta con percentuale
        # @param classes [String] classi CSS aggiuntive per il container
        # @param html_options [Hash] opzioni HTML per il container
        def initialize(
          value: 0,
          theme: :white,
          size: :medium,
          label: false,
          classes: nil,
          **html_options
        )
          @value = [ 0, [ value.to_i, 100 ].min ].max # Clamp tra 0 e 100
          @theme = theme.to_sym
          @size = size.to_sym
          @label = label
          @classes = classes
          @html_options = html_options

          validate_params
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

        # Restituisce il valore percentuale
        attr_reader :value

        # Verifica se mostrare l'etichetta
        def show_label?
          @label
        end

        private

        def validate_params
          validate_theme
          validate_size
        end

        def validate_theme
          valid_themes = PROGRESS_THEMES.keys
          unless valid_themes.include?(@theme)
            raise ArgumentError, "Il tema deve essere uno tra: #{valid_themes.join(', ')}"
          end
        end

        def validate_size
          valid_sizes = PROGRESS_SIZES.keys
          unless valid_sizes.include?(@size)
            raise ArgumentError, "La dimensione deve essere una tra: #{valid_sizes.join(', ')}"
          end
        end

        # Genera le classi per la dimensione
        def get_size_class
          PROGRESS_SIZES[@size] || PROGRESS_SIZES[:medium]
        end

        # Genera le classi per il tema della barra
        def get_theme_class
          PROGRESS_THEMES[@theme] || PROGRESS_THEMES[:white]
        end

        # Genera le classi per il tema del container
        def get_container_theme_class
          PROGRESS_CONTAINER_THEMES[@theme] || PROGRESS_CONTAINER_THEMES[:white]
        end
      end
    end
  end
end
