# frozen_string_literal: true

module BetterUi
  module General
    module Text
      class Component < BetterUi::Component
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
          violet: "text-violet-600"
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

        configure_attributes({
          theme: {
            var: :@theme,
            default: :default,
            constants: [:TEXT_THEME_CLASSES],
            methods: [:get_theme_class]
          },
          size: {
            var: :@size,
            default: :md,
            constants: [:TEXT_SIZE_CLASSES],
            methods: [:get_size_class]
          },
          align: {
            var: :@align,
            default: :left,
            constants: [:TEXT_ALIGN_CLASSES],
            methods: [:get_align_class]
          },
          weight: {
            var: :@weight,
            default: :normal,
            constants: [:TEXT_WEIGHT_CLASSES],
            methods: [:get_weight_class]
          },
          style: {
            var: :@style,
            default: :normal,
            constants: [:TEXT_STYLE_CLASSES],
            methods: [:get_style_class]
          }
        })

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
          @classes = classes
          @html_options = html_options
          super(theme: theme, size: size, align: align, weight: weight, style: style)
        end

        attr_reader :text, :classes, :html_options

        # Combina tutte le classi CSS
        def combined_classes
          [
            TEXT_BASE_CLASSES,
            get_theme_class,
            get_size_class,
            get_align_class,
            get_weight_class,
            get_style_class,
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
      end
    end
  end
end
