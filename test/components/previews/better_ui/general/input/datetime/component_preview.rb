# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Datetime
        class ComponentPreview < ViewComponent::Preview
          # @!group Esempi Base

          # @label Con Helper
          # @param name text "Nome del campo datetime"
          # @param value text "Valore del campo"
          # @param type select { choices: [datetime-local, date, time, month, week] } "Tipo del campo"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del componente"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
          # @param classes text "Classi CSS aggiuntive"
          
          def default(
            name: "datetime_field",
            value: "",
            type: "datetime-local",
            required: false,
            disabled: false,
            theme: :default,
            size: :md,
            rounded: :medium,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              type: type,
              required: required,
              disabled: disabled,
              theme: theme,
              size: size,
              rounded: rounded,
              classes: classes
            )

            render_with_template(locals: normalized)
          end

          # @label Istanziazione Diretta
          def raw(
            name: "datetime_field",
            value: "",
            type: "datetime-local",
            required: false,
            disabled: false,
            theme: :default,
            size: :md,
            rounded: :medium,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              type: type,
              required: required,
              disabled: disabled,
              theme: theme,
              size: size,
              rounded: rounded,
              classes: classes
            )

            render BetterUi::General::Input::Datetime::Component.new(**normalized)
          end

          private

          def normalize_params!(options)
            options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
            options[:size] = options[:size].to_sym if options[:size].is_a?(String)
            options[:rounded] = options[:rounded].to_sym if options[:rounded].is_a?(String)
            options[:type] = options[:type].to_s if options[:type].is_a?(Symbol)
            options[:classes] = '' if options[:classes].is_a?(String) && options[:classes].strip.empty?
            options
          end
        end
      end
    end
  end
end
