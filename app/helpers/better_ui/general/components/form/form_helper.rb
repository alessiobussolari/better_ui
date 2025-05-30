# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Form
        module FormHelper
          # @param url [String] URL del form
          # @param method [Symbol] Metodo del form
          # @param options [Hash] Opzioni del form
          # @return [BetterUi::General::FormComponent] Componente del form
          def bui_form(url:, method: :post, **options, &block)
            render BetterUi::General::Form::Component.new(
              url: url,
              method: method,
              **options
            ), &block
          end
        end
      end
    end
  end
end
