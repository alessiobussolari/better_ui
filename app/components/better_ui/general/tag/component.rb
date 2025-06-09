# frozen_string_literal: true

module BetterUi
  module General
    module Tag
      class Component < BetterUi::Component
        # Classi base sempre presenti
        TAG_BASE_CLASSES = "inline-flex items-center justify-center font-medium transition-colors duration-200 bui-tag".freeze

        # Dimensioni con classi Tailwind dirette - Sistema uniforme 7 livelli
        TAG_SIZE_CLASSES = {
          xxs: "text-xs px-1.5 py-0.5 rounded-sm",      # Extra extra small
          xs: "text-xs px-2 py-0.5 rounded",            # Extra small
          sm: "text-xs px-2 py-1 rounded",              # Small
          md: "text-sm px-3 py-1.5 rounded-md",         # Medium (default)
          lg: "text-base px-4 py-2 rounded-lg",         # Large
          xl: "text-lg px-5 py-2.5 rounded-lg",         # Extra large
          xxl: "text-xl px-6 py-3 rounded-xl"           # Extra extra large
        }.freeze

        # Temi filled con classi Tailwind dirette
        TAG_THEME_FILLED_CLASSES = {
          default: "bg-gray-100 text-gray-800",
          white: "bg-white text-gray-700 border border-gray-200",
          red: "bg-red-100 text-red-800",
          rose: "bg-rose-100 text-rose-800",
          orange: "bg-orange-100 text-orange-800",
          green: "bg-green-100 text-green-800",
          blue: "bg-blue-100 text-blue-800",
          yellow: "bg-yellow-100 text-yellow-800",
          violet: "bg-violet-100 text-violet-800"
        }.freeze

        # Temi outline con classi Tailwind dirette
        TAG_THEME_OUTLINE_CLASSES = {
          default: "bg-transparent border border-gray-300 text-gray-700 hover:bg-gray-50",
          white: "bg-transparent border border-gray-300 text-gray-700 hover:bg-gray-50",
          red: "bg-transparent border border-red-300 text-red-700 hover:bg-red-50",
          rose: "bg-transparent border border-rose-300 text-rose-700 hover:bg-rose-50",
          orange: "bg-transparent border border-orange-300 text-orange-700 hover:bg-orange-50",
          green: "bg-transparent border border-green-300 text-green-700 hover:bg-green-50",
          blue: "bg-transparent border border-blue-300 text-blue-700 hover:bg-blue-50",
          yellow: "bg-transparent border border-yellow-300 text-yellow-700 hover:bg-yellow-50",
          violet: "bg-transparent border border-violet-300 text-violet-700 hover:bg-violet-50"
        }.freeze

        TAG_STYLE_CLASSES = {
          filled: :filled,
          outline: :outline
        }.freeze

        configure_attributes({
          theme: {
            var: :@theme,
            default: :white,
            constants: [:TAG_THEME_FILLED_CLASSES, :TAG_THEME_OUTLINE_CLASSES],
            methods: [:get_theme_filled_class, :get_theme_outline_class]
          },
          size: {
            var: :@size,
            default: :md,
            constants: [:TAG_SIZE_CLASSES],
            methods: [:get_size_class]
          },
          style: {
            var: :@style,
            default: :filled,
            constants: [:TAG_STYLE_CLASSES],
            methods: [:get_style_class]
          }
        })

        def initialize(text:, theme: :white, size: :md, style: :filled, **options)
          @text = text
          @theme = theme.to_sym
          @size = size.to_sym
          @style = style.to_sym
          @options = options

          validate_params
        end

        private

        attr_reader :text, :theme, :size, :style, :options

        def tag_classes
          [
            TAG_BASE_CLASSES,
            get_size_class,
            get_theme_classes,
            @options[:class]
          ].compact.join(" ")
        end

        def get_theme_classes
          if @style == :outline
            get_theme_outline_class
          else
            get_theme_filled_class
          end
        end

      end
    end
  end
end
