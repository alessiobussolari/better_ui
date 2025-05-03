module BetterUi
  module General
    class HeadingComponent < ViewComponent::Base
      attr_reader :text, :level, :variant, :size, :align, :classes, :icon, :subtitle, :with_divider

      # Varianti di colore disponibili
      HEADER_THEME = {
        default: {
          heading: "bui-header-default-heading",
          subtitle: "bui-header-default-subtitle",
          divider: "bui-header-default-divider"
        },
        white: {
          heading: "bui-header-white-heading",
          subtitle: "bui-header-white-subtitle",
          divider: "bui-header-white-divider"
        },
        red: {
          heading: "bui-header-red-heading",
          subtitle: "bui-header-red-subtitle",
          divider: "bui-header-red-divider"
        },
        rose: {
          heading: "bui-header-rose-heading",
          subtitle: "bui-header-rose-subtitle",
          divider: "bui-header-rose-divider"
        },
        orange: {
          heading: "bui-header-orange-heading",
          subtitle: "bui-header-orange-subtitle",
          divider: "bui-header-orange-divider"
        },
        green: {
          heading: "bui-header-green-heading",
          subtitle: "bui-header-green-subtitle",
          divider: "bui-header-green-divider"
        },
        blue: {
          heading: "bui-header-blue-heading",
          subtitle: "bui-header-blue-subtitle",
          divider: "bui-header-blue-divider"
        },
        yellow: {
          heading: "bui-header-yellow-heading",
          subtitle: "bui-header-yellow-subtitle",
          divider: "bui-header-yellow-divider"
        },
        violet: {
          heading: "bui-header-violet-heading",
          subtitle: "bui-header-violet-subtitle",
          divider: "bui-header-violet-divider"
        }
      }

      # Dimensioni disponibili
      HEADER_SIZES = {
        small: {
          heading: "bui-header-small-heading", 
          subtitle: "bui-header-small-subtitle"
        },
        medium: {
          heading: "bui-header-medium-heading", 
          subtitle: "bui-header-medium-subtitle"
        },
        large: {
          heading: "bui-header-large-heading", 
          subtitle: "bui-header-large-subtitle"
        }
      }

      # Allineamenti disponibili
      HEADER_ALIGNMENTS = {
        left: "bui-header-left",
        center: "bui-header-center",
        right: "bui-header-right"
      }

      # Inizializzazione del componente
      def initialize(
        text: nil,
        level: 2,
        variant: :default,
        size: :medium,
        align: :left,
        classes: nil,
        icon: nil,
        subtitle: nil,
        with_divider: false
      )
        @text = text
        @level = level.to_i.clamp(1, 6)
        @variant = variant.to_sym
        @size = size.to_sym
        @align = align.to_sym
        @classes = classes
        @icon = icon
        @subtitle = subtitle
        @with_divider = with_divider
      end

      # Genera le classi per l'heading
      def heading_classes
        [
          HEADER_THEME.fetch(@variant, HEADER_THEME[:default])[:heading],
          HEADER_SIZES.fetch(@size, HEADER_SIZES[:medium])[:heading],
          HEADER_ALIGNMENTS.fetch(@align, HEADER_ALIGNMENTS[:left]),
          "bui-header-heading-base",
          @classes
        ].compact.join(" ")
      end

      # Genera le classi per il sottotitolo
      def subtitle_classes
        [
          HEADER_THEME.fetch(@variant, HEADER_THEME[:default])[:subtitle],
          HEADER_SIZES.fetch(@size, HEADER_SIZES[:medium])[:subtitle],
          HEADER_ALIGNMENTS.fetch(@align, HEADER_ALIGNMENTS[:left]),
          "bui-header-subtitle-base"
        ].compact.join(" ")
      end

      # Genera le classi per il divisore
      def divider_classes
        [
          "bui-header-divider-base",
          HEADER_THEME.fetch(@variant, HEADER_THEME[:default])[:divider]
        ].compact.join(" ")
      end

      # Genera le classi per il container
      def container_classes
        @with_divider ? "bui-header-container-with-divider" : "bui-header-container-base"
      end
      
      # Helper per determinare la dimensione dell'icona in base alla dimensione dell'heading
      def get_icon_size
        case @size
        when :large
          :medium
        when :small
          :xsmall
        else
          :small
        end
      end
    end
  end
end 