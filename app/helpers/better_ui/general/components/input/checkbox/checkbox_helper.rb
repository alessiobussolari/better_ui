# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Input
        module Checkbox
          module CheckboxHelper
            # Renderizza un componente Checkbox con tutti i parametri disponibili.
            #
            # @param name [String] Nome del campo checkbox (obbligatorio)
            # @param value [String] Valore del checkbox (default: "1")
            # @param checked [Boolean] Se il checkbox è selezionato
            # @param required [Boolean] Se il campo è obbligatorio
            # @param disabled [Boolean] Se il campo è disabilitato
            # @param indeterminate [Boolean] Se il checkbox è in stato indeterminate
            # @param label [String, nil] Testo della label associata al checkbox
            # @param label_position [Symbol] Posizione della label (:left, :right)
            # @param theme [Symbol] Tema del componente (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
            # @param size [Symbol] Dimensione del componente (:sm, :md, :lg)
            # @param rounded [Symbol] Border radius (:none, :sm, :md, :lg, :full)
            # @param classes [String] Classi CSS aggiuntive
            # @param form [ActionView::Helpers::FormBuilder, nil] Form builder Rails opzionale
            # @param options [Hash] Opzioni aggiuntive per l'input (es. data attributes, aria attributes)
            #
            # @return [String] HTML del componente Checkbox renderizzato
            #
            # @example Uso base
            #   <%= bui_input_checkbox(name: 'accept_terms') %>
            #
            # @example Con label
            #   <%= bui_input_checkbox(name: 'newsletter', label: 'Iscriviti alla newsletter', checked: true) %>
            #
            # @example Con label a sinistra
            #   <%= bui_input_checkbox(name: 'terms', label: 'Accetto i termini e condizioni', label_position: :left, required: true) %>
            #
            # @example Con tema e dimensione personalizzati
            #   <%= bui_input_checkbox(name: 'important', label: 'Importante', theme: :green, size: :lg) %>
            #
            # @example Con border radius personalizzato
            #   <%= bui_input_checkbox(name: 'rounded_option', label: 'Opzione arrotondata', rounded: :full) %>
            #
            # @example Con classi aggiuntive
            #   <%= bui_input_checkbox(name: 'custom', label: 'Campo personalizzato', classes: 'mb-4', checked: true) %>
            #
            # @example Con attributi HTML aggiuntivi
            #   <%= bui_input_checkbox(name: 'data-field', label: 'Campo obbligatorio', 'data-validation': 'required', 'aria-describedby': 'help-text') %>
            #
            # @example Con Rails form builder
            #   <%= form_with model: @user do |form| %>
            #     <%= bui_input_checkbox(name: :terms_accepted, label: 'Accetto i termini', form: form, theme: :green, required: true) %>
            #   <% end %>
            #
            # @example Stato indeterminate
            #   <%= bui_input_checkbox(name: 'partial_selection', label: 'Selezione parziale', indeterminate: true, theme: :blue) %>
            def bui_input_checkbox(name:, value: '1', checked: false, required: false, disabled: false,
                                   indeterminate: false, label: nil, label_position: :right, theme: :default, 
                                   size: :md, rounded: :md, classes: '', form: nil, **options)
              render BetterUi::General::Input::Checkbox::Component.new(
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
                form: form,
                **options
              )
            end
          end
        end
      end
    end
  end
end
