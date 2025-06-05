# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Input
        module Toggle
          module ToggleHelper
            # Renderizza un componente Toggle/Switch moderno per sostituire i checkbox tradizionali.
            #
            # @param name [String] Nome del campo toggle (obbligatorio)
            # @param value [String] Valore del toggle quando è attivo (default: "1")
            # @param checked [Boolean] Se il toggle è attivo
            # @param required [Boolean] Se il campo è obbligatorio
            # @param disabled [Boolean] Se il campo è disabilitato
            # @param label [String, nil] Testo della label associata al toggle
            # @param label_position [Symbol] Posizione della label (:left, :right)
            # @param theme [Symbol] Tema del componente (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
            # @param size [Symbol] Dimensione del componente (:small, :medium, :large)
            # @param form [ActionView::Helpers::FormBuilder, nil] Form builder Rails opzionale
            # @param classes [String] Classi CSS aggiuntive
            # @param options [Hash] Opzioni aggiuntive per attributi HTML
            #
            # @return [String] HTML del componente Toggle renderizzato
            #
            # @example Uso base
            #   <%= bui_input_toggle(name: 'notifications') %>
            #
            # @example Con label e stato iniziale
            #   <%= bui_input_toggle(name: 'dark_mode', label: 'Modalità scura', checked: true) %>
            #
            # @example Con tema e dimensioni
            #   <%= bui_input_toggle(name: 'premium', label: 'Account Premium', theme: :green, size: :large) %>
            #
            # @example Con posizione label e stato disabilitato
            #   <%= bui_input_toggle(name: 'maintenance', label: 'Modalità manutenzione', label_position: :left, disabled: true) %>
            #
            # @example Con Rails form builder
            #   <%= form_with model: @user do |form| %>
            #     <%= bui_input_toggle(name: :email_notifications, form: form, label: 'Notifiche email', theme: :blue) %>
            #     <%= bui_input_toggle(name: :sms_notifications, form: form, label: 'Notifiche SMS', theme: :green) %>
            #   <% end %>
            #
            # @example Con attributi HTML personalizzati
            #   <%= bui_input_toggle(
            #         name: 'api_access', 
            #         label: 'Accesso API',
            #         theme: :violet,
            #         size: :small,
            #         required: true,
            #         data: { action: 'toggle-api-access' },
            #         'aria-describedby': 'api-help-text'
            #       ) %>
            def bui_input_toggle(name:, value: '1', checked: false, required: false, disabled: false, 
                                 label: nil, label_position: :right, theme: :default, size: :medium, 
                                 form: nil, classes: '', **options)
              render BetterUi::General::Input::Toggle::Component.new(
                name: name,
                value: value,
                checked: checked,
                required: required,
                disabled: disabled,
                label: label,
                label_position: label_position,
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
