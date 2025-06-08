# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Input
        module Textarea
          module TextareaHelper
            # Renderizza un componente Textarea con tutti i parametri disponibili.
            #
            # @param name [String] Nome del campo textarea (obbligatorio)
            # @param value [String, nil] Valore del campo
            # @param placeholder [String, nil] Placeholder del campo
            # @param required [Boolean] Se il campo è obbligatorio
            # @param disabled [Boolean] Se il campo è disabilitato
            # @param rows [Integer] Numero di righe per la textarea
            # @param theme [Symbol] Tema del componente (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
            # @param size [Symbol] Dimensione del componente (:sm, :md, :lg)
            # @param rounded [Symbol] Border radius (:none, :sm, :md, :lg, :full)
            # @param classes [String] Classi CSS aggiuntive
            # @param form [ActionView::Helpers::FormBuilder, nil] Form builder Rails opzionale
            # @param options [Hash] Opzioni aggiuntive per la textarea (es. data attributes, aria attributes)
            #
            # @return [String] HTML del componente Textarea renderizzato
            #
            # @example Uso base
            #   <%= bui_input_textarea(name: 'description') %>
            #
            # @example Con placeholder e validazione
            #   <%= bui_input_textarea(name: 'message', placeholder: 'Inserisci il tuo messaggio', required: true) %>
            #
            # @example Con numero di righe personalizzato
            #   <%= bui_input_textarea(name: 'content', rows: 5, placeholder: 'Contenuto lungo...') %>
            #
            # @example Con tema e dimensione personalizzati
            #   <%= bui_input_textarea(name: 'feedback', theme: :blue, size: :lg, rows: 4) %>
            #
            # @example Con border radius personalizzato
            #   <%= bui_input_textarea(name: 'notes', rounded: :lg, rows: 3, placeholder: 'Note aggiuntive') %>
            #
            # @example Con classi aggiuntive
            #   <%= bui_input_textarea(name: 'custom', classes: 'mb-4', rows: 6, placeholder: 'Campo personalizzato') %>
            #
            # @example Con attributi HTML aggiuntivi
            #   <%= bui_input_textarea(name: 'data-field', rows: 4, 'data-validation': 'required', 'aria-label': 'Campo textarea') %>
            #
            # @example Con Rails form builder
            #   <%= form_with model: @post do |form| %>
            #     <%= bui_input_textarea(name: :content, form: form, theme: :blue, rows: 8, placeholder: 'Contenuto del post') %>
            #   <% end %>
            def bui_input_textarea(name:, value: nil, placeholder: nil, required: false, disabled: false,
                                   rows: 3, theme: :default, size: :md, rounded: :md, classes: '', form: nil, **options)
              render BetterUi::General::Input::Textarea::Component.new(
                name: name,
                value: value,
                placeholder: placeholder,
                required: required,
                disabled: disabled,
                rows: rows,
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
