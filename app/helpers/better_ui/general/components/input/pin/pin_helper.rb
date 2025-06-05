# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Input
        module Pin
          module PinHelper
            # Renderizza un componente Pin/OTP Input per inserimento codici di verifica numerici.
            #
            # @param name [String] Nome del campo pin (obbligatorio)
            # @param value [String] Valore del pin preimpostato
            # @param length [Integer] Numero di campi pin (4-8, default: 6)
            # @param placeholder [String] Placeholder per campi vuoti (default: '•')
            # @param required [Boolean] Se il campo è obbligatorio
            # @param disabled [Boolean] Se il campo è disabilitato
            # @param theme [Symbol] Tema del componente (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
            # @param size [Symbol] Dimensione del componente (:small, :medium, :large)
            # @param form [ActionView::Helpers::FormBuilder, nil] Form builder Rails opzionale
            # @param classes [String] Classi CSS aggiuntive
            # @param options [Hash] Opzioni aggiuntive per attributi HTML
            #
            # @return [String] HTML del componente Pin renderizzato
            #
            # @example Uso base per codice OTP
            #   <%= bui_input_pin(name: 'verification_code') %>
            #
            # @example Con lunghezza personalizzata e tema
            #   <%= bui_input_pin(name: 'pin_code', length: 4, theme: :blue, size: :large) %>
            #
            # @example Con Rails form builder
            #   <%= form_with model: @user do |form| %>
            #     <%= bui_input_pin(name: :otp_code, form: form, value: @user.otp_code) %>
            #   <% end %>
            #
            # @example Con validazione e attributi personalizzati
            #   <%= bui_input_pin(
            #         name: 'sms_code',
            #         length: 6,
            #         required: true,
            #         placeholder: '_',
            #         theme: :green,
            #         classes: 'my-custom-class',
            #         id: 'sms-verification'
            #       ) %>
            #
            # @example Per codice bancario a 8 cifre
            #   <%= bui_input_pin(
            #         name: 'bank_code',
            #         length: 8,
            #         theme: :violet,
            #         size: :small,
            #         placeholder: '0'
            #       ) %>
            def bui_input_pin(name:, value: '', length: 6, placeholder: '•', required: false, disabled: false,
                              theme: :default, size: :medium, form: nil, classes: '', **options)
              render BetterUi::General::Input::Pin::Component.new(
                name: name,
                value: value,
                length: length,
                placeholder: placeholder,
                required: required,
                disabled: disabled,
                theme: theme,
                size: size,
                form: form,
                classes: classes,
                **options
              )
            end
          end
        end
      end
    end
  end
end
