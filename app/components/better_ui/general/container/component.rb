# frozen_string_literal: true

module BetterUi
  module General
    module Container
      class Component < BetterUi::Component
        attr_reader :html_content, :fluid, :size, :padding, :theme, :border

        # Classi base sempre presenti
        CONTAINER_BASE_CLASSES = "mx-auto"

        # Dimensioni del container - SIZE invece di MAX_WIDTH per coerenza
        CONTAINER_SIZE_CLASSES = {
          xxs: "max-w-xs",      # 320px
          xs: "max-w-sm",       # 384px
          sm: "max-w-md",       # 448px
          md: "max-w-lg",       # 512px
          lg: "max-w-xl",       # 576px
          xl: "max-w-2xl",      # 672px
          xxl: "max-w-4xl",     # 896px
          fluid: "max-w-none w-full"  # Full width
        }.freeze

        # Padding con classi Tailwind dirette - Sistema uniforme 7 livelli
        CONTAINER_PADDING_CLASSES = {
          none: "p-0",          # Nessun padding
          xxs: "p-1",           # Extra extra small
          xs: "p-2",            # Extra small
          sm: "p-4",            # Small
          md: "p-6",            # Medium (default)
          lg: "p-8",            # Large
          xl: "p-10",           # Extra large
          xxl: "p-12"           # Extra extra large
        }.freeze

        # Temi con classi Tailwind dirette - SOLO i 9 colori standard
        CONTAINER_THEME_CLASSES = {
          default: "bg-gray-800",           # Scuro per sfondi scuri
          white: "bg-white",               # Chiaro per sfondi chiari
          red: "bg-red-50",
          rose: "bg-rose-50",
          orange: "bg-orange-50",
          green: "bg-green-50",
          blue: "bg-blue-50",
          yellow: "bg-yellow-50",
          violet: "bg-violet-50"
        }.freeze

        # Temi per testo - LOGICA CORRETTA
        CONTAINER_TEXT_THEME_CLASSES = {
          default: "text-white",            # Testo bianco per sfondi scuri
          white: "text-gray-900",           # Testo nero per sfondi chiari
          red: "text-red-900",
          rose: "text-rose-900",
          orange: "text-orange-900",
          green: "text-green-900",
          blue: "text-blue-900",
          yellow: "text-yellow-900",
          violet: "text-violet-900"
        }.freeze

        # Border theme con classi Tailwind dirette
        CONTAINER_BORDER_THEME_CLASSES = {
          default: "border-gray-600",
          white: "border-gray-200",
          red: "border-red-200",
          rose: "border-rose-200",
          orange: "border-orange-200",
          green: "border-green-200",
          blue: "border-blue-200",
          yellow: "border-yellow-200",
          violet: "border-violet-200"
        }.freeze

        # Configurazione con validazione automatica
        configure_attributes({
          size: {
            var: :@size,
            default: :lg,
            constants: [:CONTAINER_SIZE_CLASSES],
            methods: [:get_size_class]
          },
          padding: {
            var: :@padding,
            default: :md,
            constants: [:CONTAINER_PADDING_CLASSES],
            methods: [:get_padding_class]
          },
          theme: {
            var: :@theme,
            default: :white,
            constants: [:CONTAINER_THEME_CLASSES, :CONTAINER_TEXT_THEME_CLASSES, :CONTAINER_BORDER_THEME_CLASSES],
            methods: [:get_theme_class, :get_text_theme_class, :get_border_theme_class]
          }
        })

        def initialize(
          html_content: nil,
          fluid: false,
          size: :lg,
          padding: :md,
          theme: :white,
          border: false,
          **html_options
        )
          @html_content = html_content
          @fluid = fluid
          @size = fluid ? :fluid : size.to_sym
          @padding = padding.to_sym
          @theme = theme.to_sym
          @border = border
          @html_options = html_options

          validate_params  # ⚠️ OBBLIGATORIO - Chiamata alla validazione automatica
          super(**html_options)
        end

        private

        def container_classes
          classes = [CONTAINER_BASE_CLASSES]
          classes << get_size_class
          classes << get_padding_class
          classes << get_theme_class
          classes << get_text_theme_class
          
          if @border
            classes << "border"
            classes << get_border_theme_class
          end
          
          classes.compact.join(" ")
        end

        def wrapper_attributes
          {
            class: container_classes
          }.merge(@html_options.except(:class))
        end
      end
    end
  end
end