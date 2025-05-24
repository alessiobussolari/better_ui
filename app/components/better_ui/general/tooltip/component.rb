module BetterUi
  module General
    module Tooltip
      class Component < ViewComponent::Base
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
        }

        # Dimensioni del tooltip con classi Tailwind dirette
        TOOLTIP_SIZES = {
          small: "px-1.5 py-0.5 text-xs",
          medium: "px-2 py-1 text-sm",
          large: "px-3 py-2 text-base"
        }

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
        }

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
        }

        # Classi per le frecce del tooltip - Filled
        TOOLTIP_ARROW_BASE_CLASSES = "absolute w-2 h-2 transform rotate-45"

        TOOLTIP_ARROW_POSITIONS = {
          top: "top-full left-1/2 -translate-x-1/2 -mt-1",
          right: "right-full top-1/2 -translate-y-1/2 -mr-1",
          bottom: "bottom-full left-1/2 -translate-x-1/2 -mb-1",
          left: "left-full top-1/2 -translate-y-1/2 -ml-1"
        }

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
        }

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
        }

        # @param text [String] testo del tooltip
        # @param theme [Symbol] :default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet
        # @param position [Symbol] :top, :right, :bottom, :left posizione del tooltip
        # @param size [Symbol] :small, :medium, :large dimensione del tooltip
        # @param style [Symbol] :filled, :outline stile del tooltip
        # @param classes [String] classi CSS aggiuntive per il container
        # @param html_options [Hash] opzioni HTML per il container
        def initialize(
          text: nil,
          theme: :white,
          position: :top,
          size: :medium,
          style: :filled,
          classes: nil,
          **html_options
        )
          @text = text
          @theme = theme.to_sym
          @position = position.to_sym
          @size = size.to_sym
          @style = style.to_sym
          @classes = classes
          @html_options = html_options

          validate_params
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

        # Genera le classi per la posizione
        def get_position_class
          TOOLTIP_POSITIONS[@position] || TOOLTIP_POSITIONS[:top]
        end

        # Genera le classi per la dimensione
        def get_size_class
          TOOLTIP_SIZES[@size] || TOOLTIP_SIZES[:medium]
        end

        # Genera le classi per il tema
        def get_theme_class
          if @style == :outline
            TOOLTIP_OUTLINE_THEMES[@theme] || TOOLTIP_OUTLINE_THEMES[:white]
          else
            TOOLTIP_FILLED_THEMES[@theme] || TOOLTIP_FILLED_THEMES[:white]
          end
        end

        # Genera le classi per la posizione della freccia
        def get_arrow_position_class
          TOOLTIP_ARROW_POSITIONS[@position] || TOOLTIP_ARROW_POSITIONS[:top]
        end

        # Genera le classi per il tema della freccia
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

        private

        def validate_params
          validate_theme
          validate_position
          validate_size
          validate_style
        end

        def validate_theme
          valid_themes = TOOLTIP_FILLED_THEMES.keys
          unless valid_themes.include?(@theme)
            raise ArgumentError, "Il tema deve essere uno tra: #{valid_themes.join(', ')}"
          end
        end

        def validate_position
          valid_positions = TOOLTIP_POSITIONS.keys
          unless valid_positions.include?(@position)
            raise ArgumentError, "La posizione deve essere una tra: #{valid_positions.join(', ')}"
          end
        end

        def validate_size
          valid_sizes = TOOLTIP_SIZES.keys
          unless valid_sizes.include?(@size)
            raise ArgumentError, "La dimensione deve essere una tra: #{valid_sizes.join(', ')}"
          end
        end

        def validate_style
          valid_styles = [:filled, :outline]
          unless valid_styles.include?(@style)
            raise ArgumentError, "Lo stile deve essere uno tra: #{valid_styles.join(', ')}"
          end
        end
      end
    end
  end
end
