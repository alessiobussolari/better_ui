# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Rating
        class ComponentPreview < ViewComponent::Preview
          # @!group Esempi Base

          # @label Con Helper
          # @param name text "Nome del campo rating"
          # @param value number "Valore rating (0-5)"
          # @param max number "Massimo rating"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del componente"
          # @param classes text "Classi CSS aggiuntive"
          
          def default(
            name: "rating_field",
            value: 0,
            max: 5,
            theme: :default,
            size: :md,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              max: max,
              theme: theme,
              size: size,
              classes: classes
            )

            render_with_template(locals: normalized)
          end

          # @label Istanziazione Diretta
          def raw(
            name: "rating_field",
            value: 0,
            max: 5,
            theme: :default,
            size: :md,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              max: max,
              theme: theme,
              size: size,
              classes: classes
            )

            render BetterUi::General::Input::Rating::Component.new(**normalized)
          end

          private

          def normalize_params!(options)
            options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
            options[:size] = options[:size].to_sym if options[:size].is_a?(String)
            options[:value] = options[:value].to_i if options[:value].is_a?(String)
            options[:max] = options[:max].to_i if options[:max].is_a?(String)
            options[:classes] = '' if options[:classes].is_a?(String) && options[:classes].strip.empty?
            options
          end
        end
      end
    end
  end
end
