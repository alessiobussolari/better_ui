# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Input
        module Datetime
          module DatetimeHelper
            # Crea un campo input datetime unificato
            #
            # @param name [String] Nome del campo input (obbligatorio)
            # @param type [Symbol] Tipo del campo datetime (default: :date)
            #   Valori disponibili: :date, :month, :week, :time
            # @param value [String] Valore del campo nel formato appropriato per il tipo
            # @param required [Boolean] Se il campo è obbligatorio (default: false)
            # @param disabled [Boolean] Se il campo è disabilitato (default: false)
            # @param min [String] Valore minimo selezionabile nel formato appropriato
            # @param max [String] Valore massimo selezionabile nel formato appropriato
            # @param theme [Symbol] Tema del componente (default: :default)
            #   Valori disponibili: :default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet
            # @param size [Symbol] Dimensione del componente (default: :md)
            #   Valori disponibili: :sm, :md, :lg
            # @param rounded [Symbol] Border radius (default: :md)
            #   Valori disponibili: :none, :sm, :md, :lg, :full
            # @param classes [String] Classi CSS aggiuntive
            # @param form [ActionView::Helpers::FormBuilder] Form builder Rails opzionale per integrazione con form
            # @param options [Hash] Attributi HTML aggiuntivi da passare all'elemento input
            # @return [String] HTML del componente datetime input renderizzato
            #
            # @example Uso base per date
            #   <%= bui_input_datetime(name: 'birthdate', type: :date) %>
            #
            # @example Input per mese con validazione
            #   <%= bui_input_datetime(name: 'report_month', type: :month, required: true, min: '2024-01', max: '2024-12') %>
            #
            # @example Input per settimana con tema
            #   <%= bui_input_datetime(name: 'work_week', type: :week, theme: :blue, size: :lg) %>
            #
            # @example Input per time con stili personalizzati
            #   <%= bui_input_datetime(name: 'meeting_time', type: :time, theme: :green, rounded: :full) %>
            #
            # @example Con Rails form builder
            #   <%= form_with model: @event do |form| %>
            #     <%= bui_input_datetime(name: :start_date, type: :date, form: form, theme: :blue, required: true) %>
            #     <%= bui_input_datetime(name: :start_time, type: :time, form: form, theme: :green) %>
            #   <% end %>
            def bui_input_datetime(name:, type: :date, value: nil, required: false, disabled: false, 
                                   min: nil, max: nil, theme: :default, size: :md, rounded: :md, 
                                   classes: '', form: nil, **options)
              render BetterUi::General::Input::Datetime::Component.new(
                name: name,
                type: type,
                value: value,
                required: required,
                disabled: disabled,
                min: min,
                max: max,
                theme: theme,
                size: size,
                rounded: rounded,
                classes: classes,
                form: form,
                **options
              )
            end

            # Helper convenienza per input date
            def bui_input_date(name:, **options)
              bui_input_datetime(name: name, type: :date, **options)
            end

            # Helper convenienza per input month
            def bui_input_month(name:, **options)
              bui_input_datetime(name: name, type: :month, **options)
            end

            # Helper convenienza per input week
            def bui_input_week(name:, **options)
              bui_input_datetime(name: name, type: :week, **options)
            end

            # Helper convenienza per input time
            def bui_input_time(name:, **options)
              bui_input_datetime(name: name, type: :time, **options)
            end
          end
        end
      end
    end
  end
end