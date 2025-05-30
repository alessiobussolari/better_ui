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

        # Padding con classi Tailwind dirette
        PANEL_PADDING_CLASSES = {
          none: "p-0",
          small: "p-2",
          medium: "p-4",
          large: "p-6"
        }

        # Radius con classi Tailwind dirette
        PANEL_RADIUS_CLASSES = {
          none: "rounded-none",
          small: "rounded",
          medium: "rounded-md",
          large: "rounded-lg",
          full: "rounded-full"
        }

        # @param title [String] titolo del pannello (opzionale)
        # @param body [String] contenuto HTML del pannello (opzionale)
        # @param header [String] header personalizzato (opzionale)
        # @param footer [String] footer del pannello (opzionale)
        # @param theme [Symbol] tema del colore (:default, :white, etc.)
        # @param style [Symbol] stile (:default, :flat, :raised, :bordered)
        # @param padding [Symbol] padding interno (:none, :small, :medium, :large)
        # @param radius [Symbol] raggio dei bordi (:none, :small, :medium, :large, :full)
        # @param html_options [Hash] opzioni HTML aggiuntive
        def initialize(
          title: nil,
          body: nil,
          header: nil,
          footer: nil,
          theme: :white,
          style: :default,
          padding: :medium,
          radius: :small,
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

        def get_text_theme_class
          PANEL_TEXT_THEME_CLASSES[@theme] || PANEL_TEXT_THEME_CLASSES[:white]
        end

        def get_border_theme_class
          # Usa lo stesso colore del bordo principale ma più leggero per i separatori interni
          case @theme
          when :default
            "border-gray-600"
          when :white
            "border-gray-100"
          when :red
            "border-red-100"
          when :rose
            "border-rose-100"
          when :orange
            "border-orange-100"
          when :green
            "border-green-100"
          when :blue
            "border-blue-100"
          when :yellow
            "border-yellow-100"
          when :violet
            "border-violet-100"
          else
            "border-gray-100"
          end
        end

        def get_style_class
          PANEL_STYLE_CLASSES[@style] || PANEL_STYLE_CLASSES[:default]
        end

        def get_radius_class
          PANEL_RADIUS_CLASSES[@radius] || PANEL_RADIUS_CLASSES[:small]
        end

        def get_padding_class
          PANEL_PADDING_CLASSES[@padding] || PANEL_PADDING_CLASSES[:medium]
        end

        def validate_params
          validate_theme
          validate_style
          validate_padding
          validate_radius
        end

        def validate_theme
          unless PANEL_THEME_CLASSES.keys.include?(@theme)
            raise ArgumentError, "Il tema deve essere uno tra: #{PANEL_THEME_CLASSES.keys.join(', ')}"
          end
        end

        def validate_style
          unless PANEL_STYLE_CLASSES.keys.include?(@style)
            raise ArgumentError, "Lo stile deve essere uno tra: #{PANEL_STYLE_CLASSES.keys.join(', ')}"
          end
        end

        def validate_padding
          unless PANEL_PADDING_CLASSES.keys.include?(@padding)
            raise ArgumentError, "Il padding deve essere uno tra: #{PANEL_PADDING_CLASSES.keys.join(', ')}"
          end
        end

        def validate_radius
          unless PANEL_RADIUS_CLASSES.keys.include?(@radius)
            raise ArgumentError, "Il raggio deve essere uno tra: #{PANEL_RADIUS_CLASSES.keys.join(', ')}"
          end
        end
      end
    end
  end
end
