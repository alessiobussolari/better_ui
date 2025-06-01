# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Dropdown
        module DividerHelper
          ##
          # Crea un divisore per separare gruppi di elementi nel menu dropdown.
          #
          # @param classes [String] Classi CSS aggiuntive
          # @param options [Hash] Attributi HTML aggiuntivi
          #
          # @return [String] Il markup HTML del divisore dropdown
          #
          # @example Uso base
          #   <%= bui_dropdown_divider %>
          #
          # @example Con classi personalizzate
          #   <%= bui_dropdown_divider(classes: "my-4") %>
          #
          def bui_dropdown_divider(classes: '', **options)
            render BetterUi::General::Dropdown::DividerComponent.new(
              classes: classes,
              **options
            )
          end
        end
      end
    end
  end
end
