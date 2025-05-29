# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Checkbox
        class ComponentPreview < ViewComponent::Preview
          # @!group Esempi Base

          # @label Con Helper
          # @param name text "Nome del campo checkbox"
          # @param value text "Valore del checkbox"
          # @param checked toggle "Checkbox selezionato"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param indeterminate toggle "Stato indeterminate"
          # @param label text "Testo della label"
          # @param label_position select { choices: [left, right] } "Posizione della label"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [small, medium, large] } "Dimensione del componente"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
          # @param classes text "Classi CSS aggiuntive"
          # @param form toggle "Usa Rails form builder"

          #
          # ## Utilizzo Base
          # Il componente Checkbox per selezioni singole o multiple con supporto per label, temi e dimensioni personalizzati.
          #
          # ## Casi d'Uso Comuni
          # - Accettazione termini e condizioni con label
          # - Selezioni multiple in filtri
          # - Checkbox con stati personalizzati e accessibilità
          #
          # ## Variabili Principali
          # - **name**: nome del campo (obbligatorio)
          # - **label**: testo della label associata
          # - **label_position**: posizione label (left, right)
          # - **checked**: stato selezionato
          # - **theme**: tema colore (default, red, green, blue, etc.)
          # - **size**: dimensione (small, medium, large)
          # - **indeterminate**: stato parziale
          # - **form**: supporto Rails form builder
          #
          # ## Esempi Codice
          # ```erb
          # <%= bui_input_checkbox(name: 'accept_terms', label: 'Accetto i termini') %>
          # <%= bui_input_checkbox(name: 'newsletter', label: 'Newsletter', checked: true, theme: :green) %>
          # <%= bui_input_checkbox(name: 'important', label: 'Importante', label_position: :left) %>
          # <%= form_with model: @user do |form| %>
          #   <%= bui_input_checkbox(name: :terms, label: 'Termini', form: form) %>
          # <% end %>
          # ```
          
          def default(
            name: "checkbox_field",
            value: "1",
            checked: false,
            required: false,
            disabled: false,
            indeterminate: false,
            label: "Checkbox Label",
            label_position: :right,
            theme: :default,
            size: :medium,
            rounded: :medium,
            classes: "",
            form: false
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              checked: checked,
              required: required,
              disabled: disabled,
              indeterminate: indeterminate,
              label: label,
              label_position: label_position,
              theme: theme,
              size: size,
              rounded: rounded,
              classes: classes,
              form: form
            )

            render_with_template(locals: normalized)
          end

          # @label Istanziazione Diretta
          def raw(
            name: "checkbox_field",
            value: "1",
            checked: false,
            required: false,
            disabled: false,
            indeterminate: false,
            label: "Checkbox Label",
            label_position: :right,
            theme: :default,
            size: :medium,
            rounded: :medium,
            classes: "",
            form: false
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              checked: checked,
              required: required,
              disabled: disabled,
              indeterminate: indeterminate,
              label: label,
              label_position: label_position,
              theme: theme,
              size: size,
              rounded: rounded,
              classes: classes,
              form: form
            )

            render BetterUi::General::Input::Checkbox::Component.new(**normalized)
          end

          # @!endgroup

          private

          def normalize_params!(options)
            # Normalizzazione parametri
            options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
            options[:size] = options[:size].to_sym if options[:size].is_a?(String)
            options[:rounded] = options[:rounded].to_sym if options[:rounded].is_a?(String)
            options[:label_position] = options[:label_position].to_sym if options[:label_position].is_a?(String)

            # Pulizia valori vuoti
            options[:value] = '1' if options[:value].is_a?(String) && options[:value].strip.empty?
            options[:classes] = '' if options[:classes].is_a?(String) && options[:classes].strip.empty?
            options[:label] = nil if options[:label].is_a?(String) && options[:label].strip.empty?

            options
          end
        end
      end
    end
  end
end
