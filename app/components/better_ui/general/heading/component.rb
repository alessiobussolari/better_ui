module BetterUi
  module General
    module Heading
      class Component < ViewComponent::Base
        attr_reader :level, :theme, :align, :size, :style, :icon, :subtitle, :with_divider

        # Classi base sempre presenti
        HEADING_BASE_CLASSES = "font-bold leading-tight"

        # Temi con classi Tailwind dirette - LOGICA CORRETTA
        HEADING_THEME_CLASSES = {
          default: "text-white",         # Testo bianco (per sfondi scuri)
          white: "text-gray-900",        # Testo nero (per sfondi chiari)
          red: "text-red-500",
          rose: "text-rose-500",
          orange: "text-orange-500",
          green: "text-green-500",
          blue: "text-blue-500",
          yellow: "text-yellow-600",
          violet: "text-violet-500",
          purple: "text-purple-500"
        }

        # Allineamenti con classi Tailwind dirette
        HEADING_ALIGN_CLASSES = {
          left: "text-left",
          center: "text-center",
          right: "text-right"
        }

        # Dimensioni base (verranno combinate con level)
        HEADING_SIZE_CLASSES = {
          small: {
            1 => "text-2xl sm:text-3xl",
            2 => "text-xl sm:text-2xl",
            3 => "text-lg sm:text-xl",
            4 => "text-base sm:text-lg",
            5 => "text-sm sm:text-base",
            6 => "text-xs sm:text-sm"
          },
          medium: {
            1 => "text-3xl sm:text-4xl",
            2 => "text-2xl sm:text-3xl",
            3 => "text-xl sm:text-2xl",
            4 => "text-lg sm:text-xl",
            5 => "text-base sm:text-lg",
            6 => "text-sm sm:text-base"
          },
          large: {
            1 => "text-4xl sm:text-5xl",
            2 => "text-3xl sm:text-4xl",
            3 => "text-2xl sm:text-3xl",
            4 => "text-xl sm:text-2xl",
            5 => "text-lg sm:text-xl",
            6 => "text-base sm:text-lg"
          }
        }

        # Stili con classi Tailwind dirette
        HEADING_STYLE_CLASSES = {
          normal: "",
          bold: "font-extrabold",
          italic: "italic",
          underline: "underline"
        }

        # Temi per subtitle - LOGICA CORRETTA
        HEADING_SUBTITLE_THEME_CLASSES = {
          default: "text-gray-300",      # Testo grigio chiaro (per sfondi scuri)
          white: "text-gray-600",        # Testo grigio scuro (per sfondi chiari)
          red: "text-red-400",
          rose: "text-rose-400",
          orange: "text-orange-400",
          green: "text-green-400",
          blue: "text-blue-400",
          yellow: "text-yellow-500",
          violet: "text-violet-400"
        }

        # Temi per divider - LOGICA CORRETTA
        HEADING_DIVIDER_THEME_CLASSES = {
          default: "border-gray-700",      # Bordo grigio scuro (per sfondi scuri)
          white: "border-gray-200",        # Bordo grigio chiaro (per sfondi chiari)
          red: "border-red-200",
          rose: "border-rose-200",
          orange: "border-orange-200",
          green: "border-green-200",
          blue: "border-blue-200",
          yellow: "border-yellow-200",
          violet: "border-violet-200"
        }

        # @param level [Integer] livello del heading (1-6)
        # @param theme [Symbol] tema del colore (:default, :white, etc.)
        # @param align [Symbol] allineamento (:left, :center, :right)
        # @param size [Symbol] dimensione (:small, :medium, :large)
        # @param style [Symbol] stile (:normal, :bold, :italic, :underline)
        # @param icon [String] icona opzionale
        # @param subtitle [String] sottotitolo opzionale
        # @param with_divider [Boolean] mostra linea divisoria
        # @param html_options [Hash] opzioni HTML per il container
        def initialize(
          level: 2,
          theme: :white,
          align: :left,
          size: :medium,
          style: :normal,
          icon: nil,
          subtitle: nil,
          with_divider: false,
          **html_options
        )
          @level = level.to_i.clamp(1, 6)
          @theme = theme.to_sym
          @align = align.to_sym
          @size = size.to_sym
          @style = style.to_sym
          @icon = icon
          @subtitle = subtitle
          @with_divider = with_divider
          @html_options = html_options
          
          validate_params
        end

        # Combina tutte le classi per il heading
        def heading_classes
          [
            HEADING_BASE_CLASSES,
            get_theme_class,
            get_align_class,
            get_size_class,
            get_style_class,
            @html_options[:class]
          ].compact.join(" ")
        end

        # Classi per il container principale
        def container_classes
          "mb-4"
        end

        # Classi per il subtitle
        def subtitle_classes
          return "" unless @subtitle.present?
          
          [
            "mt-1 text-sm",
            get_subtitle_theme_class,
            get_align_class
          ].compact.join(" ")
        end

        # Classi per il divider
        def divider_classes
          return "" unless @with_divider
          
          [
            "mt-2 border-t",
            get_divider_theme_class
          ].compact.join(" ")
        end

        # Classi per l'icona
        def icon_classes
          return "" unless @icon.present?
          "mr-2 inline-block"
        end

        # Restituisce gli attributi HTML per il heading
        def heading_attributes
          attrs = @html_options.except(:class)
          attrs[:class] = heading_classes
          attrs
        end

        # Tag del heading basato sul level
        def heading_tag
          "h#{@level}"
        end

        # Determina se mostrare l'icona
        def show_icon?
          @icon.present?
        end

        # Determina se mostrare il subtitle
        def show_subtitle?
          @subtitle.present?
        end

        # Determina se mostrare il divider
        def show_divider?
          @with_divider
        end
        
        private
        
        def get_theme_class
          HEADING_THEME_CLASSES[@theme] || HEADING_THEME_CLASSES[:white]
        end
        
        def get_align_class
          HEADING_ALIGN_CLASSES[@align] || HEADING_ALIGN_CLASSES[:left]
        end
        
        def get_size_class
          size_map = HEADING_SIZE_CLASSES[@size] || HEADING_SIZE_CLASSES[:medium]
          size_map[@level] || size_map[2]
        end
        
        def get_style_class
          HEADING_STYLE_CLASSES[@style] || HEADING_STYLE_CLASSES[:normal]
        end

        def get_subtitle_theme_class
          HEADING_SUBTITLE_THEME_CLASSES[@theme] || HEADING_SUBTITLE_THEME_CLASSES[:white]
        end

        def get_divider_theme_class
          HEADING_DIVIDER_THEME_CLASSES[@theme] || HEADING_DIVIDER_THEME_CLASSES[:white]
        end
        
        def validate_params
          validate_theme
          validate_align
          validate_size
          validate_style
        end
        
        def validate_theme
          unless HEADING_THEME_CLASSES.keys.include?(@theme)
            raise ArgumentError, "Il tema deve essere uno tra: #{HEADING_THEME_CLASSES.keys.join(', ')}"
          end
        end
        
        def validate_align
          unless HEADING_ALIGN_CLASSES.keys.include?(@align)
            raise ArgumentError, "L'allineamento deve essere uno tra: #{HEADING_ALIGN_CLASSES.keys.join(', ')}"
          end
        end
        
        def validate_size
          unless HEADING_SIZE_CLASSES.keys.include?(@size)
            raise ArgumentError, "La dimensione deve essere una tra: #{HEADING_SIZE_CLASSES.keys.join(', ')}"
          end
        end
        
        def validate_style
          unless HEADING_STYLE_CLASSES.keys.include?(@style)
            raise ArgumentError, "Lo stile deve essere uno tra: #{HEADING_STYLE_CLASSES.keys.join(', ')}"
          end
        end
      end
    end
  end
end
