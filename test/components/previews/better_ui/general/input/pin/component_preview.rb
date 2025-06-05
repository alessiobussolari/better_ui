# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Pin
        # @label Input Pin/OTP
        class ComponentPreview < ViewComponent::Preview

          #
          # ## Utilizzo Base
          # Componente Pin/OTP Input per inserimento codici di verifica numerici con campi separati
          # che si comportano come un unico input intelligente. Ideale per autenticazione 2FA,
          # SMS codes, PIN bancari e qualsiasi scenario di verifica sicura.
          #
          # ## Funzionalità Chiave
          # - **Auto-focus progressivo**: Focus automatico su campo successivo dopo inserimento
          # - **Backspace intelligente**: Cancellazione e navigazione all'indietro naturale
          # - **Paste support**: Incolla codici interi con distribuzione automatica sui campi
          # - **Validazione integrata**: Solo caratteri numerici, lunghezza esatta
          # - **Navigazione tastiera**: Arrow keys, Tab, Escape supportati
          # - **Eventi completion**: Dispatcha eventi quando codice è completo
          #
          # ## Casi d'Uso Comuni
          # - **Autenticazione 2FA**: Google Authenticator, app autenticazione
          # - **Verifica SMS**: Codici ricevuti via messaggio
          # - **Login bancario**: PIN per transazioni sicure
          # - **Conferma email**: Codici verifica registrazione
          # - **Sicurezza app**: Unlock applicazioni sensibili
          #
          # ## Variabili Principali
          # - **name**: nome del campo (obbligatorio)
          # - **value**: valore preimpostato
          # - **length**: numero campi (4-8, default: 6)
          # - **placeholder**: placeholder campi vuoti (default: '•')
          # - **required**: se obbligatorio
          # - **disabled**: se disabilitato
          # - **theme**: colori disponibili (default, white, red, rose, orange, green, blue, yellow, violet)
          # - **size**: dimensioni disponibili (small, medium, large)
          # - **form**: Rails form builder support
          #
          # ## Esempi Codice
          # ```erb
          # <%# OTP base 6 cifre %>
          # <%= bui_input_pin(name: 'verification_code') %>
          #
          # <%# PIN bancario 4 cifre %>
          # <%= bui_input_pin(name: 'pin_code', length: 4, theme: :blue, size: :large) %>
          #
          # <%# Con Rails form builder %>
          # <%= form_with model: @user do |form| %>
          #   <%= bui_input_pin(name: :otp_code, form: form, required: true) %>
          # <% end %>
          #
          # <%# SMS code con placeholder personalizzato %>
          # <%= bui_input_pin(name: 'sms_code', placeholder: '_', theme: :green) %>
          #
          # <%# Codice sicurezza 8 cifre %>
          # <%= bui_input_pin(name: 'security_code', length: 8, size: :small) %>
          # ```

          # @!group Esempi Base

          # @label Con Helper
          # @param name text "Nome del campo"
          # @param value text "Valore preimpostato"
          # @param length number "Numero campi pin (4-8)"
          # @param placeholder text "Placeholder per campi vuoti"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema colore"
          # @param size select { choices: [small, medium, large] } "Dimensione"
          # @param classes text "Classi CSS aggiuntive"
          def default(
            name: "verification_code",
            value: "",
            length: 6,
            placeholder: "•",
            required: false,
            disabled: false,
            theme: :default,
            size: :medium,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              length: length,
              placeholder: placeholder,
              required: required,
              disabled: disabled,
              theme: theme,
              size: size,
              classes: classes
            )
            render_with_template(locals: normalized)
          end

          # @label Istanziazione Diretta
          # @param name text "Nome del campo"
          # @param value text "Valore preimpostato"
          # @param length number "Numero campi pin (4-8)"
          # @param placeholder text "Placeholder per campi vuoti"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema colore"
          # @param size select { choices: [small, medium, large] } "Dimensione"
          # @param classes text "Classi CSS aggiuntive"
          def raw(
            name: "verification_code",
            value: "",
            length: 6,
            placeholder: "•",
            required: false,
            disabled: false,
            theme: :default,
            size: :medium,
            classes: ""
          )
            normalized = normalize_params!(
              name: name,
              value: value,
              length: length,
              placeholder: placeholder,
              required: required,
              disabled: disabled,
              theme: theme,
              size: size,
              classes: classes
            )
            render BetterUi::General::Input::Pin::Component.new(**normalized)
          end

          # @!endgroup

          private

          def normalize_params!(**params)
            {
              name: params[:name],
              value: params[:value],
              length: params[:length].to_i,
              placeholder: params[:placeholder],
              required: params[:required],
              disabled: params[:disabled],
              theme: params[:theme].to_sym,
              size: params[:size].to_sym,
              classes: params[:classes]
            }
          end
        end
      end
    end
  end
end
