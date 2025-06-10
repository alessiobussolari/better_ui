module BetterUi
  module General
    module Divider
      class Component < BetterUi::Component
        attr_reader :label, :height, :classes

        # Classi base sempre presenti
        DIVIDER_BASE_CLASSES = "my-4"

        # Temi con classi Tailwind dirette
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

        # Dimensioni con classi Tailwind dirette - Sistema uniforme 7 livelli
        DIVIDER_SIZE_CLASSES = {
          xxs: {
            horizontal: "border-t",
            vertical: "border-l"
          },
          xs: {
            horizontal: "border-t",
            vertical: "border-l"
          },
          sm: {
            horizontal: "border-t",
            vertical: "border-l"
          },
          md: {
            horizontal: "border-t-2",
            vertical: "border-l-2"
          },
          lg: {
            horizontal: "border-t-4",
            vertical: "border-l-4"
          },
          xl: {
            horizontal: "border-t-8",
            vertical: "border-l-8"
          },
          xxl: {
            horizontal: "border-t-8",
            vertical: "border-l-8"
          }
        }

        # Classi per label con classi Tailwind dirette
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

        # Configurazione automatica degli attributi
        configure_attributes({
          theme: {
            var: :@theme,
            default: :white,
            constants: [:DIVIDER_THEME_CLASSES, :DIVIDER_LABEL_THEME_CLASSES],
            methods: [:get_theme_class, :get_label_theme_class]
          },
          orientation: {
            var: :@orientation,
            default: :horizontal,
            constants: [:DIVIDER_ORIENTATION_CLASSES],
            methods: [:get_orientation_class]
          },
          style: {
            var: :@style,
            default: :solid,
            constants: [:DIVIDER_STYLE_CLASSES],
            methods: [:get_style_class]
          },
          size: {
            var: :@size,
            default: :md,
            constants: [:DIVIDER_SIZE_CLASSES],
            methods: [:get_size_class]
          }
        })

        def initialize(
          theme: :white,
          orientation: :horizontal,
          style: :solid,
          size: :md,
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

        # Override del metodo get_size_class per gestire la logica speciale
        def get_size_class
          size_map = DIVIDER_SIZE_CLASSES[@size] || DIVIDER_SIZE_CLASSES[:md]
          size_map[@orientation] || size_map[:horizontal]
        end
      end
    end
  end
end
