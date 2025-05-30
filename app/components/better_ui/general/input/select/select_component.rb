# frozen_string_literal: true

module BetterUi
  module General
    module Input
      module Select
        class SelectComponent < ViewComponent::Base
          attr_reader :name, :options, :selected, :required, :disabled, :multiple, :options_html, :classes, :html_options

          BASE_SELECT_CLASSES = "h-10 px-3 py-2 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500 sm:text-sm disabled:bg-gray-100 disabled:cursor-not-allowed"
          # @param name [String] Nome del campo
          # @param options [Array] Opzioni del select ([{value => label}, {value => label}, ...])
          # @param selected [String, Array] Valore selezionato
          # @param required [Boolean] Se il campo è obbligatorio
          # @param disabled [Boolean] Se il campo è disabilitato
          # @param multiple [Boolean] Se il select è multiplo
          # @param options_html [Hash] Opzioni HTML aggiuntive per le option
          # @param classes [String] Classi del campo
          # @param html_options [Hash] Opzioni HTML del campo
          def initialize(name:, options:, selected: nil, required: false, disabled: false, multiple: false, options_html: {}, classes: '', **html_options)
            @name = name
            @type = :select
            @required = required
            @disabled = disabled
            @options = options.map { |option| { value: option[:value], label: option[:label] } }
            @selected = selected
            @multiple = multiple
            @options_html = options_html
            @classes = BASE_SELECT_CLASSES + classes

            puts "Optionssssssssssssssssssssssss: #{selected}" 
          end
        end
      end
    end
  end
end 