module BetterUi
  module General
    module Panel
      class Component < ViewComponent::Base
        attr_reader :header, :footer, :body, :title, :padding, :theme, :style, :radius

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
        }

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
        }

        # Stili con classi Tailwind dirette
        PANEL_STYLE_CLASSES = {
          default: "border shadow-sm",
          flat: "border-0",
          raised: "border shadow-lg",
          bordered: "border-2"
        }

        # Padding con classi Tailwind dirette - Sistema uniforme 7 livelli
        PANEL_PADDING_CLASSES = {
          xxs: "p-1",           # Extra extra small
          xs: "p-1.5",          # Extra small
          sm: "p-2",            # Small
          md: "p-4",            # Medium (default)
          lg: "p-6",            # Large
          xl: "p-8",            # Extra large
          xxl: "p-10"           # Extra extra large
        }

        # Radius con classi Tailwind dirette
        PANEL_RADIUS_CLASSES = {
          none: "rounded-none",
          xxs: "rounded-sm",
          xs: "rounded",
          sm: "rounded-md",
          md: "rounded-lg",
          lg: "rounded-xl",
          xl: "rounded-2xl",
          xxl: "rounded-3xl",
          full: "rounded-full"
        }

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
        }

        # @param title [String] titolo del pannello (opzionale)
        # @param body [String] contenuto HTML del pannello (opzionale)
        # @param header [String] header personalizzato (opzionale)
        # @param footer [String] footer del pannello (opzionale)
        # @param theme [Symbol] tema del colore (:default, :white, etc.)
        # @param style [Symbol] stile (:default, :flat, :raised, :bordered)
        # @param padding [Symbol] padding interno (:none, :sm, :md, :lg)
        # @param radius [Symbol] raggio dei bordi (:none, :sm, :md, :lg, :full)
        # @param html_options [Hash] opzioni HTML aggiuntive
        def initialize(
          title: nil,
          body: nil,
          header: nil,
          footer: nil,
          theme: :white,
          style: :default,
          padding: :md,
          radius: :sm,
          **html_options
        )
          @title = title
          @body = body
          @header = header
          @footer = footer
          @theme = theme.to_sym
          @style = style.to_sym
          @padding = padding.to_sym
          @radius = radius.to_sym
          @html_options = html_options

          validate_params
        end

        # Combina tutte le classi CSS per il panel
        def combined_classes
          [
            PANEL_BASE_CLASSES,
            get_theme_class,
            get_style_class,
            get_radius_class,
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
            get_padding_class
          ].compact.join(" ")
        end

        # Classi per il body
        def body_classes
          [
            get_text_theme_class,
            get_padding_class
          ].compact.join(" ")
        end

        # Classi per il footer
        def footer_classes
          [
            "border-t",
            get_border_theme_class,
            get_text_theme_class,
            get_padding_class
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

        def get_theme_class
          PANEL_THEME_CLASSES[@theme] || PANEL_THEME_CLASSES[:white]
        end

        [
          { constant: :PANEL_THEME_CLASSES, var: :@theme, default: :white, method: :get_theme_class },
          { constant: :PANEL_TEXT_THEME_CLASSES, var: :@theme, default: :white, method: :get_text_theme_class },
          { constant: :PANEL_BORDER_THEME_CLASSES, var: :@theme, default: :white, method: :get_border_theme_class },
          { constant: :PANEL_STYLE_CLASSES, var: :@style, default: :default, method: :get_style_class },
          { constant: :PANEL_RADIUS_CLASSES, var: :@radius, default: :sm, method: :get_radius_class },
          { constant: :PANEL_PADDING_CLASSES, var: :@padding, default: :md, method: :get_padding_class }
        ].each do |config|
          define_method config[:method] do
            constant_hash = self.class.const_get(config[:constant])
            value = instance_variable_get(config[:var])
            constant_hash[value] || constant_hash[config[:default]]
          end
        end

        def validate_params
          validate_theme
          validate_style
          validate_padding
          validate_radius
        end

        [
          { values: PANEL_THEME_CLASSES.keys, method: :validate_theme, param: 'theme', var: :@theme },
          { values: PANEL_STYLE_CLASSES.keys, method: :validate_style, param: 'style', var: :@style },
          { values: PANEL_PADDING_CLASSES.keys, method: :validate_padding, param: 'padding', var: :@padding },
          { values: PANEL_RADIUS_CLASSES.keys, method: :validate_radius, param: 'radius', var: :@radius },
        ].each do |validation|
          define_method validation[:method] do
            value = instance_variable_get(validation[:var])
            unless validation[:values].include?(value)
              raise ArgumentError, "#{self.class.name} - parametro '#{validation[:param]}' con valore '#{value}' non è valido. Deve essere uno tra: #{validation[:values].join(', ')}"
            end
          end
        end
      end
    end
  end
end
