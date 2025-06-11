module BetterUi
  module General
    module Tooltip
      class Component < BetterUi::Component
        # Classi base sempre presenti
        TOOLTIP_BASE_CLASSES = "relative inline-block"

        # Classi base per il bubble del tooltip
        TOOLTIP_BUBBLE_BASE_CLASSES = "absolute z-50 px-2 py-1 text-sm rounded shadow-lg opacity-0 pointer-events-none transition-opacity duration-200"

        # Classi per la visibilità su hover
        TOOLTIP_HOVER_CLASSES = "group-hover:opacity-100"

        # Posizioni del tooltip con classi Tailwind dirette
        TOOLTIP_POSITIONS = {
          top: "bottom-full left-1/2 transform -translate-x-1/2 mb-2",
          right: "left-full top-1/2 transform -translate-y-1/2 ml-2",
          bottom: "top-full left-1/2 transform -translate-x-1/2 mt-2",
          left: "right-full top-1/2 transform -translate-y-1/2 mr-2"
        }.freeze

        # Dimensioni del tooltip con classi Tailwind dirette - Sistema uniforme 7 livelli
        TOOLTIP_SIZES = {
          xxs: "px-1 py-0.5 text-xs",        # Extra extra small
          xs: "px-1.5 py-0.5 text-xs",       # Extra small
          sm: "px-1.5 py-0.5 text-xs",       # Small
          md: "px-2 py-1 text-sm",           # Medium (default)
          lg: "px-3 py-2 text-base",         # Large
          xl: "px-4 py-2.5 text-lg",         # Extra large
          xxl: "px-5 py-3 text-xl"           # Extra extra large
        }.freeze

        # Temi di tooltip con classi Tailwind dirette - Stile filled
        TOOLTIP_FILLED_THEMES = {
          default: "bg-gray-900 text-white",
          white: "bg-white text-gray-900 border border-gray-200",
          red: "bg-red-600 text-white",
          rose: "bg-rose-600 text-white",
          orange: "bg-orange-600 text-white",
          green: "bg-green-600 text-white",
          blue: "bg-blue-600 text-white",
          yellow: "bg-yellow-600 text-white",
          violet: "bg-violet-600 text-white"
        }.freeze

        # Temi di tooltip con classi Tailwind dirette - Stile outline
        TOOLTIP_OUTLINE_THEMES = {
          default: "bg-white text-gray-900 border border-gray-900",
          white: "bg-gray-50 text-gray-900 border border-gray-300",
          red: "bg-white text-red-600 border border-red-600",
          rose: "bg-white text-rose-600 border border-rose-600",
          orange: "bg-white text-orange-600 border border-orange-600",
          green: "bg-white text-green-600 border border-green-600",
          blue: "bg-white text-blue-600 border border-blue-600",
          yellow: "bg-white text-yellow-600 border border-yellow-600",
          violet: "bg-white text-violet-600 border border-violet-600"
        }.freeze

        # Classi per le frecce del tooltip - Filled
        TOOLTIP_ARROW_BASE_CLASSES = "absolute w-2 h-2 transform rotate-45"

        TOOLTIP_ARROW_POSITIONS = {
          top: "top-full left-1/2 -translate-x-1/2 -mt-1",
          right: "right-full top-1/2 -translate-y-1/2 -mr-1",
          bottom: "bottom-full left-1/2 -translate-x-1/2 -mb-1",
          left: "left-full top-1/2 -translate-y-1/2 -ml-1"
        }.freeze

        TOOLTIP_ARROW_FILLED_THEMES = {
          default: "bg-gray-900",
          white: "bg-white border border-gray-200",
          red: "bg-red-600",
          rose: "bg-rose-600",
          orange: "bg-orange-600",
          green: "bg-green-600",
          blue: "bg-blue-600",
          yellow: "bg-yellow-600",
          violet: "bg-violet-600"
        }.freeze

        TOOLTIP_ARROW_OUTLINE_THEMES = {
          default: "bg-white border border-gray-900",
          white: "bg-gray-50 border border-gray-300",
          red: "bg-white border border-red-600",
          rose: "bg-white border border-rose-600",
          orange: "bg-white border border-orange-600",
          green: "bg-white border border-green-600",
          blue: "bg-white border border-blue-600",
          yellow: "bg-white border border-yellow-600",
          violet: "bg-white border border-violet-600"
        }.freeze

        # Stili disponibili per il tooltip
        TOOLTIP_STYLES = {
          filled: "filled",
          outline: "outline"
        }.freeze

        configure_attributes(
          theme: {
            var: :@theme,
            default: :white,
            constants: [:TOOLTIP_FILLED_THEMES],
            methods: [:get_theme_class]
          },
          position: {
            var: :@position,
            default: :top,
            constants: [:TOOLTIP_POSITIONS],
            methods: [:get_position_class]
          },
          size: {
            var: :@size,
            default: :md,
            constants: [:TOOLTIP_SIZES],
            methods: [:get_size_class]
          },
          style: {
            var: :@style,
            default: :filled,
            constants: [:TOOLTIP_STYLES],
            methods: []
          }
        )

        attr_reader :text, :classes, :html_options

        # @param text [String] testo del tooltip
        # @param theme [Symbol] :default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet
        # @param position [Symbol] :top, :right, :bottom, :left posizione del tooltip
        # @param size [Symbol] :xxs, :xs, :sm, :md, :lg, :xl, :xxl dimensione del tooltip
        # @param style [Symbol] :filled, :outline stile del tooltip
        # @param classes [String] classi CSS aggiuntive per il container
        # @param html_options [Hash] opzioni HTML per il container
        def initialize(
          text: nil,
          theme: :white,
          position: :top,
          size: :md,
          style: :filled,
          classes: nil,
          **html_options
        )
          super(theme: theme, position: position, size: size, style: style)
          @text = text
          @classes = classes
          @html_options = html_options
        end

        # Combina tutte le classi per il container
        def combined_classes
          [
            TOOLTIP_BASE_CLASSES,
            "group", # Necessario per il trigger hover
            @classes,
            @html_options[:class]
          ].compact.join(" ")
        end

        # Combina tutte le classi per il bubble del tooltip
        def bubble_classes
          [
            TOOLTIP_BUBBLE_BASE_CLASSES,
            get_position_class,
            get_size_class,
            get_theme_class,
            TOOLTIP_HOVER_CLASSES
          ].compact.join(" ")
        end

        # Combina tutte le classi per la freccia del tooltip
        def arrow_classes
          [
            TOOLTIP_ARROW_BASE_CLASSES,
            get_arrow_position_class,
            get_arrow_theme_class
          ].compact.join(" ")
        end

        # Restituisce gli attributi per il container del tooltip
        def tooltip_attributes
          attrs = {
            class: combined_classes,
            role: "tooltip",
            "data-tooltip": @text
          }

          # Aggiungi altri attributi HTML se presenti
          @html_options.except(:class).each do |key, value|
            attrs[key] = value
          end

          attrs
        end

        # Metodi get generati dinamicamente per position, size
        [
          { constant: :TOOLTIP_POSITIONS, var: :@position, default: :top, method: :get_position_class },
          { constant: :TOOLTIP_SIZES, var: :@size, default: :md, method: :get_size_class }
        ].each do |config|
          define_method config[:method] do
            constant_hash = self.class.const_get(config[:constant])
            value = instance_variable_get(config[:var])
            constant_hash[value] || constant_hash[config[:default]]
          end
        end

        # Metodo get per arrow position
        [
          { constant: :TOOLTIP_ARROW_POSITIONS, var: :@position, default: :top, method: :get_arrow_position_class }
        ].each do |config|
          define_method config[:method] do
            constant_hash = self.class.const_get(config[:constant])
            value = instance_variable_get(config[:var])
            constant_hash[value] || constant_hash[config[:default]]
          end
        end

        # Metodi get per tema (gestione speciale per filled/outline)
        def get_theme_class
          if @style == :outline
            TOOLTIP_OUTLINE_THEMES[@theme] || TOOLTIP_OUTLINE_THEMES[:white]
          else
            TOOLTIP_FILLED_THEMES[@theme] || TOOLTIP_FILLED_THEMES[:white]
          end
        end

        def get_arrow_theme_class
          if @style == :outline
            TOOLTIP_ARROW_OUTLINE_THEMES[@theme] || TOOLTIP_ARROW_OUTLINE_THEMES[:white]
          else
            TOOLTIP_ARROW_FILLED_THEMES[@theme] || TOOLTIP_ARROW_FILLED_THEMES[:white]
          end
        end

        # Verifica se il componente deve essere renderizzato
        def render?
          @text.present? && content.present?
        end
      end
    end
  end
end
