module BetterUi
  module General
    module Divider
      class Component < ViewComponent::Base
        attr_reader :theme, :orientation, :style, :size, :label, :height, :classes

        # Classi base sempre presenti
        DIVIDER_BASE_CLASSES = "my-4"

        # Temi con classi Tailwind dirette - LOGICA CORRETTA
        DIVIDER_THEME_CLASSES = {
          default: "border-white",         # Bordo bianco (per sfondi scuri)
          white: "border-gray-300",        # Bordo grigio (per sfondi chiari)
          red: "border-red-500",
          rose: "border-rose-500",
          orange: "border-orange-500",
          green: "border-green-500",
          blue: "border-blue-500",
          yellow: "border-yellow-500",
          violet: "border-violet-500"
        }

        # Orientamento con classi Tailwind dirette
        DIVIDER_ORIENTATION_CLASSES = {
          horizontal: "w-full border-t",
          vertical: "h-full border-l"
        }

        # Stili di linea con classi Tailwind dirette
        DIVIDER_STYLE_CLASSES = {
          solid: "border-solid",
          dashed: "border-dashed",
          dotted: "border-dotted",
          double: "border-double"
        }

        # Dimensioni con classi Tailwind dirette
        DIVIDER_SIZE_CLASSES = {
          thin: {
            horizontal: "border-t",
            vertical: "border-l"
          },
          medium: {
            horizontal: "border-t-2",
            vertical: "border-l-2"
          },
          thick: {
            horizontal: "border-t-4",
            vertical: "border-l-4"
          }
        }

        # Classi per label con classi Tailwind dirette - LOGICA CORRETTA
        DIVIDER_LABEL_THEME_CLASSES = {
          default: "text-white bg-transparent px-3",     # Testo bianco trasparente (per sfondi scuri)
          white: "text-gray-900 bg-white px-3",          # Testo nero su bianco (per sfondi chiari)
          red: "text-red-500 bg-white px-3",
          rose: "text-rose-500 bg-white px-3",
          orange: "text-orange-500 bg-white px-3",
          green: "text-green-500 bg-white px-3",
          blue: "text-blue-500 bg-white px-3",
          yellow: "text-yellow-600 bg-white px-3",
          violet: "text-violet-500 bg-white px-3"
        }

        # @param theme [Symbol] tema del divider (:default, :white, etc.)
        # @param orientation [Symbol] orientamento del divider (:horizontal, :vertical)
        # @param style [Symbol] stile della linea (:solid, :dashed, :dotted, :double)
        # @param size [Symbol] dimensione della linea (:thin, :medium, :thick)
        # @param label [String] testo opzionale da mostrare al centro del divider
        # @param height [String] altezza per divider verticale (es. "100px", "100%")
        # @param classes [String] classi CSS aggiuntive
        # @param html_options [Hash] opzioni HTML per il container
        def initialize(
          theme: :white,
          orientation: :horizontal,
          style: :solid,
          size: :medium,
          label: nil,
          height: nil,
          classes: nil,
          **html_options
        )
          @theme = theme.to_sym
          @orientation = orientation.to_sym
          @style = style.to_sym
          @size = size.to_sym
          @label = label
          @height = height
          @classes = classes
          @html_options = html_options

          validate_params
        end

        # Combina tutte le classi per il container
        def combined_classes
          base_classes = []

          if @label.present? && @orientation == :horizontal
            # Per divider con label orizzontale: flex layout
            base_classes = [
              "flex items-center text-center",
              get_theme_class,
              get_style_class
            ]
          else
            # Per divider normale
            base_classes = [
              DIVIDER_BASE_CLASSES,
              get_orientation_class,
              get_theme_class,
              get_style_class,
              get_size_class
            ]
          end

          [ *base_classes, @classes, @html_options[:class] ].compact.join(" ")
        end

        # Classi per il label
        def label_classes
          return "" unless @label.present?

          [
            "relative z-10 text-sm font-medium",
            get_label_theme_class
          ].compact.join(" ")
        end

        # Classi per le linee before/after quando c'è un label
        def label_line_classes
          return "" unless @label.present? && @orientation == :horizontal

          [
            "flex-1 h-px",
            get_theme_class,
            get_style_class
          ].compact.join(" ")
        end

        # Genera gli attributi di stile inline necessari
        def inline_styles
          return nil unless @orientation == :vertical && @height.present?
          "height: #{@height};"
        end

        # Restituisce gli attributi per il divider
        def divider_attributes
          attrs = {
            class: combined_classes
          }

          # Aggiungi stile inline se presente
          attrs[:style] = inline_styles if inline_styles.present?

          # Aggiungi altri attributi HTML se presenti
          @html_options.except(:class).each do |key, value|
            attrs[key] = value
          end

          attrs
        end

        # Determina se mostrare il label
        def show_label?
          @label.present? && @orientation == :horizontal
        end

        private

        def get_theme_class
          DIVIDER_THEME_CLASSES[@theme] || DIVIDER_THEME_CLASSES[:white]
        end

        def get_orientation_class
          DIVIDER_ORIENTATION_CLASSES[@orientation] || DIVIDER_ORIENTATION_CLASSES[:horizontal]
        end

        def get_style_class
          DIVIDER_STYLE_CLASSES[@style] || DIVIDER_STYLE_CLASSES[:solid]
        end

        def get_size_class
          size_map = DIVIDER_SIZE_CLASSES[@size] || DIVIDER_SIZE_CLASSES[:medium]
          size_map[@orientation] || size_map[:horizontal]
        end

        def get_label_theme_class
          DIVIDER_LABEL_THEME_CLASSES[@theme] || DIVIDER_LABEL_THEME_CLASSES[:white]
        end

        def validate_params
          validate_theme
          validate_orientation
          validate_style
          validate_size
        end

        def validate_theme
          unless DIVIDER_THEME_CLASSES.keys.include?(@theme)
            raise ArgumentError, "Il tema deve essere uno tra: #{DIVIDER_THEME_CLASSES.keys.join(', ')}"
          end
        end

        def validate_orientation
          unless DIVIDER_ORIENTATION_CLASSES.keys.include?(@orientation)
            raise ArgumentError, "L'orientamento deve essere uno tra: #{DIVIDER_ORIENTATION_CLASSES.keys.join(', ')}"
          end
        end

        def validate_style
          unless DIVIDER_STYLE_CLASSES.keys.include?(@style)
            raise ArgumentError, "Lo stile deve essere uno tra: #{DIVIDER_STYLE_CLASSES.keys.join(', ')}"
          end
        end

        def validate_size
          unless DIVIDER_SIZE_CLASSES.keys.include?(@size)
            raise ArgumentError, "La dimensione deve essere una tra: #{DIVIDER_SIZE_CLASSES.keys.join(', ')}"
          end
        end
      end
    end
  end
end
