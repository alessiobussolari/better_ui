module BetterUi
  module General
    module Panel
      class Component < BetterUi::Component
        attr_reader :header, :footer, :body, :title, :padding, :theme, :style, :rounded, :size

        # Classi base sempre presenti
        PANEL_BASE_CLASSES = "overflow-hidden"

        # Temi con classi Tailwind dirette - LOGICA CORRETTA
        PANEL_THEME_CLASSES = {
          default: "bg-gray-800 border-gray-700",        # Scuro per sfondi scuri
          white: "bg-white border-gray-200",             # Chiaro per sfondi chiari
          red: "bg-red-50 border-red-200",
          rose: "bg-rose-50 border-rose-200",
          orange: "bg-orange-50 border-orange-200",
          green: "bg-green-50 border-green-200",
          blue: "bg-blue-50 border-blue-200",
          yellow: "bg-yellow-50 border-yellow-200",
          violet: "bg-violet-50 border-violet-200"
        }.freeze

        # Temi per testo - LOGICA CORRETTA
        PANEL_TEXT_THEME_CLASSES = {
          default: "text-white",                         # Testo bianco per sfondi scuri
          white: "text-gray-900",                        # Testo nero per sfondi chiari
          red: "text-red-900",
          rose: "text-rose-900",
          orange: "text-orange-900",
          green: "text-green-900",
          blue: "text-blue-900",
          yellow: "text-yellow-900",
          violet: "text-violet-900"
        }.freeze

        # Stili con classi Tailwind dirette
        PANEL_STYLE_CLASSES = {
          default: "border shadow-sm",
          flat: "border-0",
          raised: "border shadow-lg",
          bordered: "border-2"
        }.freeze

        # Padding con classi Tailwind dirette - Sistema uniforme 7 livelli
        PANEL_PADDING_CLASSES = {
          none: "p-0",           # Nessun padding
          xxs: "p-1",           # Extra extra small
          xs: "p-1.5",          # Extra small
          sm: "p-2",            # Small
          md: "p-4",            # Medium (default)
          lg: "p-6",            # Large
          xl: "p-8",            # Extra large
          xxl: "p-10"           # Extra extra large
        }.freeze

        # Rounded con classi Tailwind dirette
        PANEL_ROUNDED_CLASSES = {
          none: "rounded-none",
          xxs: "rounded-sm",
          xs: "rounded",
          sm: "rounded-md",
          md: "rounded-lg",
          lg: "rounded-xl",
          xl: "rounded-2xl",
          xxl: "rounded-3xl",
          full: "rounded-full"
        }.freeze

        PANEL_SIZE_CLASSES = {
          auto: "",
          xs: "w-xs",
          sm: "w-sm",
          md: "w-md",
          lg: "w-lg",
          xl: "w-xl",
          xxl: "w-2xl",
          full: "w-full"
        }.freeze

        # Border theme con classi Tailwind dirette
        PANEL_BORDER_THEME_CLASSES = {
          default: "border-gray-600",
          white: "border-gray-100",
          red: "border-red-100",
          rose: "border-rose-100",
          orange: "border-orange-100",
          green: "border-green-100",
          blue: "border-blue-100",
          yellow: "border-yellow-100",
          violet: "border-violet-100"
        }.freeze

        configure_attributes({
          theme: {
            var: :@theme,
            default: :white,
            constants: [:PANEL_THEME_CLASSES, :PANEL_TEXT_THEME_CLASSES, :PANEL_BORDER_THEME_CLASSES],
            methods: [:get_theme_class, :get_text_theme_class, :get_border_theme_class]
          },
          style: {
            var: :@style,
            default: :default,
            constants: [:PANEL_STYLE_CLASSES],
            methods: [:get_style_class]
          },
          rounded: {
            var: :@rounded,
            default: :sm,
            constants: [:PANEL_ROUNDED_CLASSES],
            methods: [:get_rounded_class]
          },
          padding: {
            var: :@padding,
            default: :md,
            constants: [:PANEL_PADDING_CLASSES],
            methods: [:get_padding_class]
          },
          size: {
            var: :@size,
            default: :auto,
            constants: [:PANEL_SIZE_CLASSES],
            methods: [:get_size_class]
          }
        })

        # @param title [String] titolo del pannello (opzionale)
        # @param body [String] contenuto HTML del pannello (opzionale)
        # @param header [String] header personalizzato (opzionale)
        # @param footer [String] footer del pannello (opzionale)
        # @param theme [Symbol] tema del colore (:default, :white, etc.)
        # @param style [Symbol] stile (:default, :flat, :raised, :bordered)
        # @param padding [Symbol] padding interno (:none, :sm, :md, :lg)
        # @param rounded [Symbol] raggio dei bordi (:none, :sm, :md, :lg, :full)
        # @param html_options [Hash] opzioni HTML aggiuntive
        def initialize(
          title: nil,
          body: nil,
          header: nil,
          footer: nil,
          theme: :white,
          style: :default,
          padding: :md,
          rounded: :sm,
          size: :auto,
          **html_options
        )
          @title = title
          @body = body
          @header = header
          @footer = footer
          @theme = theme.to_sym
          @style = style.to_sym
          @padding = padding.to_sym
          @rounded = rounded.to_sym
          @size = size.to_sym
          @html_options = html_options

          validate_params
        end

        # Combina tutte le classi CSS per il panel
        def combined_classes
          [
            PANEL_BASE_CLASSES,
            get_theme_class,
            get_style_class,
            get_rounded_class,
            get_padding_class,  # CORREZIONE: Aggiunto il padding che mancava
            get_size_class,
            @html_options[:class]
          ].compact.join(" ")
        end

        # Restituisce gli attributi HTML per il panel
        def panel_attributes
          attrs = @html_options.except(:class)
          attrs[:class] = combined_classes
          attrs
        end

        # Classi per l'header
        def header_classes
          [
            "border-b",
            get_border_theme_class,
            get_text_theme_class,
          ].compact.join(" ")
        end

        # Classi per il body
        def body_classes
          [ 
            "w-full flex flex-col content-center",
            get_text_theme_class,
          ].compact.join(" ")
        end

        # Classi per il footer
        def footer_classes
          [
            "border-t",
            get_border_theme_class,
            get_text_theme_class,
          ].compact.join(" ")
        end

        # Classi per il title
        def title_classes
          [
            "font-semibold text-lg leading-6",
            get_text_theme_class
          ].compact.join(" ")
        end

        # Determina se il pannello deve essere renderizzato
        def render?
          @body.present? || @header.present? || @footer.present? || content.present?
        end

        # Determina se mostrare l'header
        def show_header?
          @header.present? || @title.present?
        end

        # Determina se mostrare il body
        def show_body?
          @body.present? || content.present?
        end

        # Determina se mostrare il footer
        def show_footer?
          @footer.present?
        end

        private

      end
    end
  end
end
