module BetterUi
  module General
    class HeadingComponent < ViewComponent::Base
      attr_reader :level, :variant, :align, :classes

      # Varianti di colore disponibili
      HEADER_THEME = {
        default: "bui-heading--default",
        white: "bui-heading--white",
        red: "bui-heading--red",
        rose: "bui-heading--rose",
        orange: "bui-heading--orange",
        green: "bui-heading--green",
        blue: "bui-heading--blue",
        yellow: "bui-heading--yellow",
        violet: "bui-heading--violet"
      }

      # Allineamenti disponibili
      HEADER_ALIGNMENTS = {
        left: "bui-heading--left",
        center: "bui-heading--center",
        right: "bui-heading--right"
      }

      def initialize(
        level: 2,
        variant: :default,
        align: :left,
        classes: nil
      )
        @level = level.to_i.clamp(1, 6)
        @variant = variant.to_sym
        @align = align.to_sym
        @classes = classes
      end

      def heading_classes
        [
          "bui-heading",
          "bui-heading--#{@level}",
          HEADER_THEME.fetch(@variant, HEADER_THEME[:default]),
          HEADER_ALIGNMENTS.fetch(@align, HEADER_ALIGNMENTS[:left]),
          @classes
        ].compact.join(" ")
      end
    end
  end
end 