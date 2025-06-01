# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Datetime
        # @label Datetime
        class ComponentPreview < ViewComponent::Preview
          # @!group Esempi Base

          # @label Con Helper
          # @param name text "Nome del campo input"
          # @param type select { choices: [date, month, week, time] } "Tipo datetime"
          # @param value text "Valore del campo"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param min text "Valore minimo"
          # @param max text "Valore massimo"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [small, medium, large] } "Dimensione del componente"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
          # @param classes text "Classi CSS aggiuntive"

          # @notes
          #
          # ## Utilizzo Base
          # Il componente Datetime Input è un campo unificato per tutti i tipi di input temporali HTML5.
          # Supporta date, month, week e time con validazione automatica dei formati.
          #
          # ## Casi d'Uso Comuni
          # - **Date**: Selezione di date per eventi, scadenze, nascite (YYYY-MM-DD)
          # - **Month**: Selezione di mesi per report, fatturazione (YYYY-MM)
          # - **Week**: Selezione di settimane per pianificazione, timesheet (YYYY-WXX)
          # - **Time**: Selezione di orari per appuntamenti, meeting (HH:MM)
          #
          # ## Variabili Principali
          # - **name**: nome del campo input (obbligatorio)
          # - **type**: tipo datetime (:date, :month, :week, :time)
          # - **value**: valore nel formato appropriato per il tipo
          # - **required**: se il campo è obbligatorio
          # - **disabled**: se il campo è disabilitato
          # - **min/max**: range di valori selezionabili
          # - **theme**: tema colore (default, white, red, rose, orange, green, blue, yellow, violet)
          # - **size**: dimensione (small, medium, large)
          # - **rounded**: border radius (none, small, medium, large, full)
          # - **classes**: classi CSS aggiuntive
          #
          # ## Esempi Codice
          # ```erb
          # <!-- Uso unificato con type -->
          # <%= bui_input_datetime(name: 'event_date', type: :date) %>
          # <%= bui_input_datetime(name: 'report_month', type: :month, theme: :blue) %>
          # <%= bui_input_datetime(name: 'work_week', type: :week, size: :large) %>
          # <%= bui_input_datetime(name: 'meeting_time', type: :time, theme: :green) %>
          #
          # <!-- Helper di convenienza -->
          # <%= bui_input_date(name: 'birthdate', required: true) %>
          # <%= bui_input_month(name: 'invoice_month', min: '2024-01', max: '2024-12') %>
          # <%= bui_input_week(name: 'schedule_week') %>
          # <%= bui_input_time(name: 'appointment_time') %>
          #
          # <!-- Con Rails form builder -->
          # <%= form_with model: @event do |form| %>
          #   <%= bui_input_date(name: :start_date, form: form, theme: :blue, required: true) %>
          #   <%= bui_input_time(name: :start_time, form: form, theme: :green) %>
          # <% end %>
          # ```
          
          def default(
            name: "datetime_field",
            type: :date,
            value: "",
            required: false,
            disabled: false,
            min: "",
            max: "",
            theme: :default,
            size: :medium,
            rounded: :medium,
            classes: ""
          )
            normalized = normalize_params!(
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
              classes: classes
            )

            render_with_template(locals: normalized)
          end

          # @label Istanziazione Diretta
          # @param name text "Nome del campo input"
          # @param type select { choices: [date, month, week, time] } "Tipo datetime"
          # @param value text "Valore del campo"
          # @param required toggle "Campo obbligatorio"
          # @param disabled toggle "Campo disabilitato"
          # @param min text "Valore minimo"
          # @param max text "Valore massimo"
          # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema del componente"
          # @param size select { choices: [small, medium, large] } "Dimensione del componente"
          # @param rounded select { choices: [none, small, medium, large, full] } "Border radius"
          # @param classes text "Classi CSS aggiuntive"
          def raw(
            name: "datetime_field",
            type: :date,
            value: "",
            required: false,
            disabled: false,
            min: "",
            max: "",
            theme: :default,
            size: :medium,
            rounded: :medium,
            classes: ""
          )
            normalized = normalize_params!(
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
              classes: classes
            )

            render BetterUi::General::Input::Datetime::Component.new(**normalized)
          end

          # @!endgroup

          private

          def normalize_params!(options)
            # Normalizzazione parametri
            options[:type] = options[:type].to_sym if options[:type].is_a?(String)
            options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
            options[:size] = options[:size].to_sym if options[:size].is_a?(String)
            options[:rounded] = options[:rounded].to_sym if options[:rounded].is_a?(String)

            # Pulizia valori vuoti
            options[:value] = nil if options[:value].is_a?(String) && options[:value].strip.empty?
            options[:min] = nil if options[:min].is_a?(String) && options[:min].strip.empty?
            options[:max] = nil if options[:max].is_a?(String) && options[:max].strip.empty?
            options[:classes] = '' if options[:classes].is_a?(String) && options[:classes].strip.empty?

            options
          end
        end
      end
    end
  end
end