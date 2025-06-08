# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Input
        module RadioGroup
          # Helper per creare gruppi di radio button Better UI
          module RadioGroupHelper
            # Genera un gruppo completo di radio button con stili Better UI
            #
            # @param name [String] Nome del campo radio (comune a tutto il gruppo)
            # @param options [Array<Hash>] Array di opzioni per ogni radio button
            # @param selected [String, nil] Valore dell'opzione selezionata
            # @param theme [Symbol] Tema del componente (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
            # @param size [Symbol] Dimensione del componente (:sm, :md, :lg)
            # @param rounded [Symbol] Border radius (:none, :sm, :md, :lg, :full)
            # @param direction [Symbol] Direzione del gruppo (:vertical, :horizontal)
            # @param required [Boolean] Se il gruppo è obbligatorio
            # @param disabled [Boolean] Se il gruppo è disabilitato
            # @param classes [String] Classi CSS aggiuntive per il contenitore
            # @param form [ActionView::Helpers::FormBuilder, nil] Form builder Rails opzionale
            # @param html_options [Hash] Opzioni HTML aggiuntive per ogni radio
            # @return [String] HTML del gruppo radio renderizzato
            #
            # @example Gruppo radio base - Selezione genere
            #   bui_input_radio_group(
            #     name: "gender",
            #     options: [
            #       { value: "male", label: "Maschio" },
            #       { value: "female", label: "Femmina" },
            #       { value: "other", label: "Altro" }
            #     ]
            #   )
            #
            # @example Gruppo radio con tema e selezione
            #   bui_input_radio_group(
            #     name: "priority",
            #     options: [
            #       { value: "low", label: "Bassa", theme: :green },
            #       { value: "medium", label: "Media", theme: :yellow },
            #       { value: "high", label: "Alta", theme: :red }
            #     ],
            #     selected: "medium",
            #     size: :lg
            #   )
            #
            # @example Gruppo radio orizzontale con Rails form
            #   <%= form_with model: @user do |form| %>
            #     <%= bui_input_radio_group(
            #       name: :role,
            #       options: [
            #         { value: "admin", label: "Amministratore" },
            #         { value: "user", label: "Utente" },
            #         { value: "guest", label: "Ospite" }
            #       ],
            #       selected: @user.role,
            #       direction: :horizontal,
            #       form: form
            #     ) %>
            #   <% end %>
            #
            # @example Gruppo radio con validazione e attributi HTML
            #   bui_input_radio_group(
            #     name: "notification_type",
            #     options: [
            #       { value: "email", label: "Email" },
            #       { value: "sms", label: "SMS" },
            #       { value: "push", label: "Push Notification" }
            #     ],
            #     required: true,
            #     theme: :blue,
            #     html_options: { data: { action: "change->form#validateNotification" } }
            #   )
            #
            # @example Gruppo radio con temi personalizzati per opzione
            #   bui_input_radio_group(
            #     name: "status",
            #     options: [
            #       { value: "active", label: "Attivo", theme: :green },
            #       { value: "pending", label: "In Sospeso", theme: :yellow },
            #       { value: "inactive", label: "Inattivo", theme: :red }
            #     ],
            #     selected: "active",
            #     direction: :horizontal
            #   )
            #
            def bui_input_radio_group(name:, options:, selected: nil, theme: :default, size: :md, 
                                     rounded: :full, direction: :vertical, required: false, disabled: false,
                                     classes: '', form: nil, **html_options)
              container_classes = [
                'space-y-2',
                direction == :horizontal ? 'flex flex-wrap gap-6' : 'space-y-2',
                classes
              ].compact.join(' ')

              content_tag(:div, class: container_classes) do
                options.map do |option|
                  option_theme = option[:theme] || theme
                  option_classes = option[:classes] || ''
                  
                  render BetterUi::General::Input::Radio::Component.new(
                    name: name,
                    value: option[:value],
                    label: option[:label],
                    checked: selected.to_s == option[:value].to_s,
                    theme: option_theme,
                    size: size,
                    rounded: rounded,
                    required: required,
                    disabled: disabled || option[:disabled],
                    classes: option_classes,
                    form: form,
                    **html_options
                  )
                end.join.html_safe
              end
            end
          end
        end
      end
    end
  end
end