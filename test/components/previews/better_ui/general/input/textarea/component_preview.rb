# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Textarea
        class ComponentPreview < ViewComponent::Preview
          # @!group Esempi Base

          # @label Con Helper
          # @param name text "Nome del campo textarea"
          # @param value text "Valore del textarea"
          # @param placeholder text "Placeholder del campo"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param rows number "Numero di righe"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del componente"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
          # @param classes text "Classi CSS aggiuntive"
          
          def default(
            name: "textarea_field",
            value: "",
            placeholder: "Inserisci il tuo messaggio...",
            required: false,
            disabled: false,
            rows: 4,
            theme: :default,
            size: :md,
            rounded: :medium,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              placeholder: placeholder,
              required: required,
              disabled: disabled,
              rows: rows,
              theme: theme,
              size: size,
              rounded: rounded,
              classes: classes
            )

            render_with_template(locals: normalized)
          end

          # @label Istanziazione Diretta
          # @param name text "Nome del campo textarea"
          # @param value text "Valore del textarea"
          # @param placeholder text "Placeholder del campo"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param rows number "Numero di righe"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione del componente"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
          # @param classes text "Classi CSS aggiuntive"
          def raw(
            name: "textarea_field",
            value: "",
            placeholder: "Inserisci il tuo messaggio...",
            required: false,
            disabled: false,
            rows: 4,
            theme: :default,
            size: :md,
            rounded: :medium,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              placeholder: placeholder,
              required: required,
              disabled: disabled,
              rows: rows,
              theme: theme,
              size: size,
              rounded: rounded,
              classes: classes
            )

            render BetterUi::General::Input::Textarea::Component.new(**normalized)
          end

          private

          def normalize_params!(options)
            options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
            options[:size] = options[:size].to_sym if options[:size].is_a?(String)
            options[:rounded] = options[:rounded].to_sym if options[:rounded].is_a?(String)
            options[:classes] = '' if options[:classes].is_a?(String) && options[:classes].strip.empty?
            options[:rows] = options[:rows].to_i if options[:rows].is_a?(String)
            options
          end
        end
      end
    end
  end
end
