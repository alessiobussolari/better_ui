module BetterUi
  module General
    module Components
      module Breadcrumb
        module BreadcrumbHelper
          # Helper per renderizzare un breadcrumb
          #
          # @param items [Array] Array di items del breadcrumb
          # @param separator [Symbol] Tipo di separatore (:chevron, :slash, :arrow, :dot, :pipe)
          # @param theme [Symbol] Tema del breadcrumb (:default, :white, :red, etc.)
          # @param size [Symbol] Dimensione del testo (:small, :medium, :large)
          # @param classes [String] Classi CSS aggiuntive
          # @param html_options [Hash] Opzioni HTML aggiuntive
          #
          # @return [String] HTML del breadcrumb
          def bui_breadcrumb(
            items: [],
            separator: :chevron,
            theme: :white,
            size: :medium,
            classes: nil,
            **html_options
          )
            render BetterUi::General::Breadcrumb::Component.new(
              items: items,
              separator: separator,
              theme: theme,
              size: size,
              classes: classes,
              **html_options
            )
          end
        end
      end
    end
  end
end
