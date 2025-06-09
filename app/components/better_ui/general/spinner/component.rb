module BetterUi
  module General
    module Spinner
      class Component < BetterUi::Component
        attr_reader :theme, :size, :style, :label

        # Classi base sempre presenti
        SPINNER_BASE_CLASSES = "inline-flex items-center gap-2"

        # Dimensioni SVG con classi Tailwind dirette - Sistema uniforme 7 livelli
        SPINNER_SIZE_CLASSES = {
          xxs: "w-3 h-3",      # 12px - Extra extra small
          xs: "w-3.5 h-3.5",   # 14px - Extra small
          sm: "w-4 h-4",       # 16px - Small
          md: "w-6 h-6",       # 24px - Medium (default)
          lg: "w-8 h-8",       # 32px - Large
          xl: "w-10 h-10",     # 40px - Extra large
          xxl: "w-12 h-12"     # 48px - Extra extra large
        }.freeze

        # Temi colore con classi Tailwind dirette
        SPINNER_THEME_CLASSES = {
          default: "text-gray-900",
          white: "text-white",
          red: "text-red-500",
          rose: "text-rose-500",
          orange: "text-orange-500",
          green: "text-green-500",
          blue: "text-blue-500",
          yellow: "text-yellow-500",
          violet: "text-violet-500"
        }.freeze

        # Stili con classi Tailwind dirette
        SPINNER_STYLE_CLASSES = {
          default: "",
          outline: "opacity-75"
        }.freeze

        configure_attributes({
          theme: {
            var: :@theme,
            default: :default,
            constants: [:SPINNER_THEME_CLASSES],
            methods: [:get_theme_class]
          },
          size: {
            var: :@size,
            default: :md,
            constants: [:SPINNER_SIZE_CLASSES],
            methods: [:get_size_class]
          },
          style: {
            var: :@style,
            default: :default,
            constants: [:SPINNER_STYLE_CLASSES],
            methods: [:get_style_class]
          }
        })

        def initialize(theme: :default, size: :md, style: :default, label: nil, **html_options)
          @theme = theme.to_sym
          @size = size.to_sym
          @style = style.to_sym
          @label = label
          @html_options = html_options

          validate_params
        end

        def combined_classes
          [
            SPINNER_BASE_CLASSES,
            get_theme_class,
            get_style_class,
            @html_options[:class]
          ].compact.join(" ")
        end

        def container_attributes
          @html_options.except(:class).merge(class: combined_classes)
        end

        def svg_classes
          get_size_class
        end

        def show_label?
          @label.present?
        end

        private
      end
    end
  end
end
