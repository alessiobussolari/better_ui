# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Input
        module Text
          module TextHelper
            # Renderizza un componente Text Input con tutti i parametri disponibili.
            #
            # @param name [String] Nome del campo input (obbligatorio)
            # @param value [String, nil] Valore del campo
            # @param placeholder [String, nil] Placeholder del campo
            # @param required [Boolean] Se il campo è obbligatorio
            # @param disabled [Boolean] Se il campo è disabilitato
            # @param type [Symbol] Tipo del campo input (:text, :password, :email, :tel, :url, :number, :search, :color)
            # @param theme [Symbol] Tema del componente (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
            # @param size [Symbol] Dimensione del componente (:small, :medium, :large)
            # @param rounded [Symbol] Border radius (:none, :small, :medium, :large, :full)
            # @param classes [String] Classi CSS aggiuntive
            # @param form [ActionView::Helpers::FormBuilder, nil] Form builder Rails opzionale
            # @param options [Hash] Opzioni aggiuntive per l'input (es. data attributes, aria attributes)
            #
            # @return [String] HTML del componente Text Input renderizzato
            #
            # @example Uso base
            #   <%= bui_input_text(name: 'email') %>
            #
            # @example Con placeholder e validazione
            #   <%= bui_input_text(name: 'email', placeholder: 'Inserisci la tua email', required: true) %>
            #
            # @example Con tema e dimensione personalizzati
            #   <%= bui_input_text(name: 'search', theme: :blue, size: :large, placeholder: 'Cerca...') %>
            #
            # @example Con border radius personalizzato
            #   <%= bui_input_text(name: 'username', rounded: :full, placeholder: 'Username') %>
            #
            # @example Con classi aggiuntive
            #   <%= bui_input_text(name: 'custom', classes: 'mb-4', placeholder: 'Campo personalizzato') %>
            #
            # @example Con attributi HTML aggiuntivi
            #   <%= bui_input_text(name: 'data-field', 'data-validation': 'email', 'aria-label': 'Campo email') %>
            #
            # @example Con Rails form builder
            #   <%= form_with model: @user do |form| %>
            #     <%= bui_input_text(name: :email, form: form, theme: :blue, placeholder: 'Email utente') %>
            #   <% end %>
            def bui_input_text(name:, value: nil, placeholder: nil, required: false, disabled: false,
                               type: :text, theme: :default, size: :medium, rounded: :medium, classes: '', form: nil, **options)
              render BetterUi::General::Input::Text::Component.new(
                name: name,
                value: value,
                placeholder: placeholder,
                required: required,
                disabled: disabled,
                type: type,
                theme: theme,
                size: size,
                rounded: rounded,
                classes: classes,
                form: form,
                **options
              )
            end

            # Helper specifici per ogni tipo di input

            # Input di tipo password
            def bui_input_password(name:, value: nil, placeholder: nil, required: false, disabled: false,
                                  theme: :default, size: :medium, rounded: :medium, classes: '', form: nil, **options)
              bui_input_text(
                name: name, value: value, placeholder: placeholder, required: required, disabled: disabled,
                type: :password, theme: theme, size: size, rounded: rounded, classes: classes, form: form, **options
              )
            end

            # Input di tipo email
            def bui_input_email(name:, value: nil, placeholder: nil, required: false, disabled: false,
                               theme: :default, size: :medium, rounded: :medium, classes: '', form: nil, **options)
              bui_input_text(
                name: name, value: value, placeholder: placeholder, required: required, disabled: disabled,
                type: :email, theme: theme, size: size, rounded: rounded, classes: classes, form: form, **options
              )
            end

            # Input di tipo tel
            def bui_input_tel(name:, value: nil, placeholder: nil, required: false, disabled: false,
                             theme: :default, size: :medium, rounded: :medium, classes: '', form: nil, **options)
              bui_input_text(
                name: name, value: value, placeholder: placeholder, required: required, disabled: disabled,
                type: :tel, theme: theme, size: size, rounded: rounded, classes: classes, form: form, **options
              )
            end

            # Input di tipo url
            def bui_input_url(name:, value: nil, placeholder: nil, required: false, disabled: false,
                             theme: :default, size: :medium, rounded: :medium, classes: '', form: nil, **options)
              bui_input_text(
                name: name, value: value, placeholder: placeholder, required: required, disabled: disabled,
                type: :url, theme: theme, size: size, rounded: rounded, classes: classes, form: form, **options
              )
            end

            # Input di tipo number
            def bui_input_number(name:, value: nil, placeholder: nil, required: false, disabled: false,
                                theme: :default, size: :medium, rounded: :medium, classes: '', form: nil, **options)
              bui_input_text(
                name: name, value: value, placeholder: placeholder, required: required, disabled: disabled,
                type: :number, theme: theme, size: size, rounded: rounded, classes: classes, form: form, **options
              )
            end

            # Input di tipo search
            def bui_input_search(name:, value: nil, placeholder: nil, required: false, disabled: false,
                                theme: :default, size: :medium, rounded: :medium, classes: '', form: nil, **options)
              bui_input_text(
                name: name, value: value, placeholder: placeholder, required: required, disabled: disabled,
                type: :search, theme: theme, size: size, rounded: rounded, classes: classes, form: form, **options
              )
            end




            # Input di tipo color
            def bui_input_color(name:, value: nil, placeholder: nil, required: false, disabled: false,
                               theme: :default, size: :medium, rounded: :medium, classes: '', form: nil, **options)
              bui_input_text(
                name: name, value: value, placeholder: placeholder, required: required, disabled: disabled,
                type: :color, theme: theme, size: size, rounded: rounded, classes: classes, form: form, **options
              )
            end
          end
        end
      end
    end
  end
end
