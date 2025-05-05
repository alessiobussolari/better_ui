module BetterUi
  module General
    class ProgressComponent < ViewComponent::Base
      # Temi di progressbar disponibili
      PROGRESS_THEME = {
        default: "bui-progress--default",
        white: "bui-progress--white",
        red: "bui-progress--red",
        rose: "bui-progress--rose",
        orange: "bui-progress--orange",
        green: "bui-progress--green",
        blue: "bui-progress--blue",
        yellow: "bui-progress--yellow",
        violet: "bui-progress--violet",
        gray: "bui-progress--gray"
      }

      # Tipi di progress disponibili
      PROGRESS_TYPE = {
        linear: "bui-progress--linear",
        circular: "bui-progress--circular"
      }

      # Orientamenti disponibili (solo per tipo linear)
      PROGRESS_ORIENTATION = {
        horizontal: "bui-progress--horizontal",
        vertical: "bui-progress--vertical"
      }

      # Modalità disponibili
      PROGRESS_MODE = {
        determinate: "bui-progress--determinate",
        indeterminate: "bui-progress--indeterminate"
      }

      # Stili disponibili
      PROGRESS_STYLE = {
        filled: "bui-progress--filled",
        outline: "bui-progress--outline",
        flat: "bui-progress--flat"
      }

      # Dimensioni disponibili
      PROGRESS_SIZE = {
        small: "bui-progress--small",
        medium: "bui-progress--medium",
        large: "bui-progress--large"
      }

      # @param value [Integer] percentuale di completamento (0-100)
      # @param type [Symbol] linear o circular
      # @param orientation [Symbol] horizontal o vertical (solo per tipo linear)
      # @param mode [Symbol] determinate o indeterminate
      # @param theme [Symbol] default, white, red, rose, orange, green, blue, yellow, violet, gray
      # @param style [Symbol] filled, outline, flat
      # @param size [Symbol] small, medium, large
      # @param label [Boolean] mostra etichetta con percentuale
      # @param html_options [Hash] opzioni HTML per il container
      def initialize(
        value: 0,
        type: :linear,
        orientation: :horizontal,
        mode: :determinate,
        theme: :default,
        style: :filled,
        size: :medium,
        label: false,
        **html_options
      )
        @value = value.to_i.clamp(0, 100)
        @type = type.to_sym
        @orientation = orientation.to_sym
        @mode = mode.to_sym
        @theme = theme.to_sym
        @style = style.to_sym
        @size = size.to_sym
        @label = label
        @html_options = html_options
        
        validate_params
      end
      
      # Calcola la circonferenza del cerchio per la versione circolare
      def circle_circumference
        2 * Math::PI * 20 # raggio 20
      end
      
      # Calcola lo spazio vuoto per la versione circolare
      def circle_dash_offset
        circle_circumference * (1 - @value / 100.0)
      end

      # Determina se è in modalità determinate
      def determinate?
        @mode == :determinate
      end
      
      # Determina se è in modalità indeterminate
      def indeterminate?
        @mode == :indeterminate
      end
      
      # Determina se è di tipo linear
      def linear?
        @type == :linear
      end
      
      # Determina se è di tipo circular
      def circular?
        @type == :circular
      end

      # Combina tutte le classi
      def combined_classes
        classes = [
          "bui-progress", # Classe base per tutti i progress
          get_type_class,
          get_mode_class,
          get_theme_class,
          get_style_class,
          get_size_class,
          @html_options[:class]
        ]
        
        # Aggiunge orientation solo se è linear
        classes << get_orientation_class if linear?
        
        classes.compact.join(" ")
      end
      
      # Restituisce gli attributi HTML per il progress
      def progress_attributes
        attrs = @html_options.except(:class)
        attrs[:class] = combined_classes
        attrs
      end
      
      # Restituisce gli stili inline per la barra
      def bar_inline_styles
        if linear? && determinate?
          "width: #{@value}%"
        else
          ""
        end
      end
      
      # Restituisce gli stili inline per il circle SVG
      def circle_inline_styles
        if circular? && indeterminate?
          "animation: bui-progress-spin 1.5s linear infinite"
        else
          "transition: stroke-dashoffset 0.3s ease"
        end
      end
      
      private
      
      def get_type_class
        PROGRESS_TYPE[@type] || PROGRESS_TYPE[:linear]
      end
      
      def get_orientation_class
        PROGRESS_ORIENTATION[@orientation] || PROGRESS_ORIENTATION[:horizontal]
      end
      
      def get_mode_class
        PROGRESS_MODE[@mode] || PROGRESS_MODE[:determinate]
      end
      
      def get_theme_class
        PROGRESS_THEME[@theme] || PROGRESS_THEME[:default]
      end
      
      def get_style_class
        PROGRESS_STYLE[@style] || PROGRESS_STYLE[:filled]
      end
      
      def get_size_class
        PROGRESS_SIZE[@size] || PROGRESS_SIZE[:medium]
      end
      
      def validate_params
        validate_type
        validate_orientation
        validate_mode
        validate_theme
        validate_style
        validate_size
      end
      
      def validate_type
        unless PROGRESS_TYPE.keys.include?(@type)
          raise ArgumentError, "Il tipo deve essere uno tra: #{PROGRESS_TYPE.keys.join(', ')}"
        end
      end
      
      def validate_orientation
        return unless linear?
        
        unless PROGRESS_ORIENTATION.keys.include?(@orientation)
          raise ArgumentError, "L'orientamento deve essere uno tra: #{PROGRESS_ORIENTATION.keys.join(', ')}"
        end
      end
      
      def validate_mode
        unless PROGRESS_MODE.keys.include?(@mode)
          raise ArgumentError, "La modalità deve essere una tra: #{PROGRESS_MODE.keys.join(', ')}"
        end
      end
      
      def validate_theme
        unless PROGRESS_THEME.keys.include?(@theme)
          raise ArgumentError, "Il tema deve essere uno tra: #{PROGRESS_THEME.keys.join(', ')}"
        end
      end
      
      def validate_style
        unless PROGRESS_STYLE.keys.include?(@style)
          raise ArgumentError, "Lo stile deve essere uno tra: #{PROGRESS_STYLE.keys.join(', ')}"
        end
      end
      
      def validate_size
        unless PROGRESS_SIZE.keys.include?(@size)
          raise ArgumentError, "La dimensione deve essere una tra: #{PROGRESS_SIZE.keys.join(', ')}"
        end
      end
    end
  end
end
