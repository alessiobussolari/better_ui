module BetterUi
  module General
    module Components
      module Card
        module CardHelper
          # Helper per renderizzare una card
          #
          # @param options [Hash] opzioni per il componente
          # @option options [Symbol] :theme (:white) tema del colore (:default, :white, :red, etc.)
          # @option options [Symbol] :style (:default) stile (:default, :flat, :raised, :bordered)
          # @option options [Symbol] :padding (:medium) padding interno (:none, :small, :medium, :large)
          # @option options [Symbol] :radius (:medium) raggio dei bordi (:none, :small, :medium, :large, :full)
          # @param block [Block] blocco per il contenuto della card
          # @return [String] HTML della card


          def bui_card(
            theme: :white,
            style: :default,
            padding: :medium,
            radius: :medium,
            **options,
            &block
          )
            render BetterUi::General::Card::Component.new(
              theme: theme,
              style: style,
              padding: padding,
              radius: radius,
              **options
            ), &block
          end
        end
      end
    end
  end
end
