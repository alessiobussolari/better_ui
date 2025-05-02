module BetterUi
  module General
    class HeadingComponent < ViewComponent::Base
      attr_reader :text, :level, :variant, :size, :align, :classes, :icon, :subtitle, :with_divider

      # Varianti di colore disponibili
      VARIANTS = {
        default: {
          heading: "text-gray-900",
          subtitle: "text-gray-600",
          divider: "border-gray-200"
        },
        primary: {
          heading: "text-orange-700",
          subtitle: "text-orange-500",
          divider: "border-orange-300"
        },
        success: {
          heading: "text-green-700",
          subtitle: "text-green-500",
          divider: "border-green-300"
        },
        warning: {
          heading: "text-yellow-700",
          subtitle: "text-yellow-500",
          divider: "border-yellow-300"
        },
        danger: {
          heading: "text-red-700",
          subtitle: "text-red-500",
          divider: "border-red-300"
        },
        info: {
          heading: "text-blue-700",
          subtitle: "text-blue-500",
          divider: "border-blue-300"
        },
        light: {
          heading: "text-gray-100",
          subtitle: "text-gray-300",
          divider: "border-gray-700"
        }
      }

      # Dimensioni disponibili
      SIZES = {
        xs: {
          heading: "text-lg", 
          subtitle: "text-sm"
        },
        sm: {
          heading: "text-xl", 
          subtitle: "text-base"
        },
        md: {
          heading: "text-2xl", 
          subtitle: "text-lg"
        },
        lg: {
          heading: "text-3xl", 
          subtitle: "text-xl"
        },
        xl: {
          heading: "text-4xl", 
          subtitle: "text-2xl"
        },
        xxl: {
          heading: "text-5xl", 
          subtitle: "text-3xl"
        }
      }

      # Allineamenti disponibili
      ALIGNMENTS = {
        left: "text-left",
        center: "text-center",
        right: "text-right"
      }

      # Inizializzazione del componente
      def initialize(
        text: nil,
        level: 2,
        variant: :default,
        size: :md,
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
          VARIANTS.fetch(@variant, VARIANTS[:default])[:heading],
          SIZES.fetch(@size, SIZES[:md])[:heading],
          ALIGNMENTS.fetch(@align, ALIGNMENTS[:left]),
          "font-bold",
          @classes
        ].compact.join(" ")
      end

      # Genera le classi per il sottotitolo
      def subtitle_classes
        [
          VARIANTS.fetch(@variant, VARIANTS[:default])[:subtitle],
          SIZES.fetch(@size, SIZES[:md])[:subtitle],
          ALIGNMENTS.fetch(@align, ALIGNMENTS[:left]),
          "mt-1"
        ].compact.join(" ")
      end

      # Genera le classi per il divisore
      def divider_classes
        [
          "border-t",
          "mt-2",
          VARIANTS.fetch(@variant, VARIANTS[:default])[:divider]
        ].compact.join(" ")
      end

      # Genera le classi per il container
      def container_classes
        [
          "mb-4",
          @with_divider ? "pb-2" : ""
        ].compact.join(" ")
      end
    end
  end
end 