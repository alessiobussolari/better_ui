# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Toggle
        class ComponentPreview < ViewComponent::Preview
          # @!group Esempi Base

          # @label Con Helper
          # @param name text "Nome del campo toggle"
          # @param value text "Valore del toggle"
          # @param checked toggle "Toggle attivato"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del componente"
          # @param classes text "Classi CSS aggiuntive"
          
          def default(
            name: "toggle_field",
            value: "1",
            checked: false,
            required: false,
            disabled: false,
            theme: :default,
            size: :md,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              checked: checked,
              required: required,
              disabled: disabled,
              theme: theme,
              size: size,
              classes: classes
            )

            render_with_template(locals: normalized)
          end

          # @label Istanziazione Diretta
          # @param name text "Nome del campo toggle"
          # @param value text "Valore del toggle"
          # @param checked toggle "Toggle attivato"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del componente"
          # @param classes text "Classi CSS aggiuntive"
          def raw(
            name: "toggle_field",
            value: "1",
            checked: false,
            required: false,
            disabled: false,
            theme: :default,
            size: :md,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              checked: checked,
              required: required,
              disabled: disabled,
              theme: theme,
              size: size,
              classes: classes
            )

            render BetterUi::General::Input::Toggle::Component.new(**normalized)
          end

          private

          def normalize_params!(options)
            options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
            options[:size] = options[:size].to_sym if options[:size].is_a?(String)
            options[:classes] = '' if options[:classes].is_a?(String) && options[:classes].strip.empty?
            options
          end
        end
      end
    end
  end
end
