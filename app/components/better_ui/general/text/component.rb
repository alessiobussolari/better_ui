# frozen_string_literal: true

module BetterUi
  module General
    module Text
      class Component < ViewComponent::Base
        attr_reader :text, :theme, :size, :align, :weight, :style, :classes, :html_options

        # Classi base sempre presenti
        TEXT_BASE_CLASSES = "block"

        # Temi colore con classi Tailwind dirette
        TEXT_THEME_CLASSES = {
          default: "text-gray-900",      # Testo nero standard
          white: "text-white",           # Testo bianco
          red: "text-red-600",
          rose: "text-rose-600",
          orange: "text-orange-600",
          green: "text-green-600",
          blue: "text-blue-600",
          yellow: "text-yellow-600",
          violet: "text-violet-600",
          purple: "text-purple-600",
          gray: "text-gray-600",
          muted: "text-gray-500"
        }.freeze

        # Dimensioni con classi Tailwind dirette - Sistema uniforme 7 livelli  
        TEXT_SIZE_CLASSES = {
          xxs: "text-xs",        # Extra extra small
          xs: "text-xs",         # Extra small
          sm: "text-sm",         # Small 
          md: "text-base",       # Medium (default)
          lg: "text-lg",         # Large
          xl: "text-xl",         # Extra large
          xxl: "text-2xl"        # Extra extra large
        }.freeze

        # Allineamenti con classi Tailwind dirette
        TEXT_ALIGN_CLASSES = {
          left: "text-left",
          center: "text-center",
          right: "text-right",
          justify: "text-justify"
        }.freeze

        # Peso font con classi Tailwind dirette
        TEXT_WEIGHT_CLASSES = {
          thin: "font-thin",
          light: "font-light",
          normal: "font-normal",
          medium: "font-medium",
          semibold: "font-semibold",
          bold: "font-bold",
          extrabold: "font-extrabold"
        }.freeze

        # Stili con classi Tailwind dirette
        TEXT_STYLE_CLASSES = {
          normal: "",
          italic: "italic",
          underline: "underline",
          line_through: "line-through"
        }.freeze

        # @param text [String] testo da mostrare (opzionale se si usa blocco)
        # @param theme [Symbol] tema del colore (:default, :white, :red, :blue, etc.)
        # @param size [Symbol] dimensione (:xxs, :xs, :sm, :md, :lg, :xl, :xxl)
        # @param align [Symbol] allineamento (:left, :center, :right, :justify)
        # @param weight [Symbol] peso font (:thin, :light, :normal, :md, :semibold, :bold, :extrabold)
        # @param style [Symbol] stile (:normal, :italic, :underline, :line_through)
        # @param classes [String] classi CSS aggiuntive
        # @param html_options [Hash] opzioni HTML aggiuntive
        def initialize(
          text: nil,
          theme: :default,
          size: :md,
          align: :left,
          weight: :normal,
          style: :normal,
          classes: '',
          **html_options
        )
          @text = text
          @theme = theme.to_sym
          @size = size.to_sym
          @align = align.to_sym
          @weight = weight.to_sym
          @style = style.to_sym
          @classes = classes
          @html_options = html_options

          validate_params
          super()
        end

        # Combina tutte le classi CSS
        def combined_classes
          [
            TEXT_BASE_CLASSES,
            get_theme_classes,
            get_size_classes,
            get_align_classes,
            get_weight_classes,
            get_style_classes,
            @classes,
            @html_options[:class]
          ].compact.join(" ")
        end

        # Attributi HTML per l'elemento
        def text_attributes
          attrs = @html_options.except(:class)
          attrs[:class] = combined_classes
          attrs
        end

        # Determina se il componente ha contenuto da renderizzare
        def render?
          @text.present? || content.present?
        end

        # Contenuto da mostrare (testo diretto o contenuto blocco)
        def text_content
          @text.present? ? @text : content
        end

        private

        def validate_params
          validate_theme
          validate_size
          validate_align
          validate_weight
          validate_style
        end

        def validate_theme
          unless TEXT_THEME_CLASSES.key?(@theme)
            valid_themes = TEXT_THEME_CLASSES.keys
            raise ArgumentError, "Il tema deve essere uno tra: #{valid_themes.join(', ')}"
          end
        end

        def validate_size
          unless TEXT_SIZE_CLASSES.key?(@size)
            valid_sizes = TEXT_SIZE_CLASSES.keys
            raise ArgumentError, "La dimensione deve essere una tra: #{valid_sizes.join(', ')}"
          end
        end

        def validate_align
          unless TEXT_ALIGN_CLASSES.key?(@align)
            valid_aligns = TEXT_ALIGN_CLASSES.keys
            raise ArgumentError, "L'allineamento deve essere uno tra: #{valid_aligns.join(', ')}"
          end
        end

        def validate_weight
          unless TEXT_WEIGHT_CLASSES.key?(@weight)
            valid_weights = TEXT_WEIGHT_CLASSES.keys
            raise ArgumentError, "Il peso deve essere uno tra: #{valid_weights.join(', ')}"
          end
        end

        def validate_style
          unless TEXT_STYLE_CLASSES.key?(@style)
            valid_styles = TEXT_STYLE_CLASSES.keys
            raise ArgumentError, "Lo stile deve essere uno tra: #{valid_styles.join(', ')}"
          end
        end

        def get_theme_classes
          TEXT_THEME_CLASSES[@theme]
        end

        def get_size_classes
          TEXT_SIZE_CLASSES[@size]
        end

        def get_align_classes
          TEXT_ALIGN_CLASSES[@align]
        end

        def get_weight_classes
          TEXT_WEIGHT_CLASSES[@weight]
        end

        def get_style_classes
          TEXT_STYLE_CLASSES[@style]
        end
      end
    end
  end
end
