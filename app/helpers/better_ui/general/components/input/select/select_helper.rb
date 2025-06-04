# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Input
        module Select
          module SelectHelper
            # Renderizza un componente Select personalizzato con ricerca, animazioni e multi-selezione.
            #
            # @param name [String] Nome del campo select (obbligatorio)
            # @param options [Array<Hash>] Array di opzioni nel formato [{value: 'value', label: 'label'}, ...]
            # @param selected [String, Array, nil] Valore/i selezionato/i
            # @param required [Boolean] Se il campo è obbligatorio
            # @param disabled [Boolean] Se il campo è disabilitato
            # @param multiple [Boolean] Se multiple opzioni possono essere selezionate
            # @param searchable [Boolean] Se abilitare la ricerca
            # @param theme [Symbol] Tema del componente (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
            # @param size [Symbol] Dimensione del componente (:small, :medium, :large)
            # @param rounded [Symbol] Border radius (:none, :small, :medium, :large, :full)
            # @param placeholder [String] Testo placeholder per il trigger
            # @param search_placeholder [String] Testo placeholder per il campo search
            # @param max_height [String] Altezza massima del dropdown (default: "300px")
            # @param form [ActionView::Helpers::FormBuilder, nil] Form builder Rails opzionale
            # @param classes [String] Classi CSS aggiuntive
            # @param options [Hash] Opzioni aggiuntive per attributi HTML
            #
            # @return [String] HTML del componente Select renderizzato
            #
            # @example Uso base
            #   <%= bui_input_select(name: 'country', options: [{value: 'it', label: 'Italia'}, {value: 'us', label: 'USA'}]) %>
            #
            # @example Con selezione multipla
            #   <%= bui_input_select(name: 'skills', multiple: true, options: skills_options) %>
            #
            # @example Con ricerca e temi
            #   <%= bui_input_select(name: 'category', searchable: true, theme: :blue, options: categories) %>
            #
            # @example Con dimensioni personalizzate
            #   <%= bui_input_select(name: 'priority', size: :large, options: priorities, selected: 'high') %>
            #
            # @example Con Rails form builder
            #   <%= form_with model: @user do |form| %>
            #     <%= bui_input_select(name: :role, form: form, options: role_options, theme: :green) %>
            #   <% end %>
            #
            # @example Con opzioni avanzate
            #   <%= bui_input_select(
            #         name: 'tags', 
            #         multiple: true, 
            #         searchable: true,
            #         placeholder: 'Seleziona tag...',
            #         search_placeholder: 'Cerca tag...',
            #         max_height: '200px',
            #         options: tag_options,
            #         selected: ['ruby', 'rails']
            #       ) %>
            def bui_input_select(name:, options:, selected: nil, required: false, disabled: false, 
                                 multiple: false, searchable: true, theme: :default, size: :medium, 
                                 rounded: :medium, placeholder: nil, search_placeholder: nil, 
                                 max_height: "300px", form: nil, classes: '', **html_options)
              render BetterUi::General::Input::Select::Component.new(
                name: name,
                options: options,
                selected: selected,
                required: required,
                disabled: disabled,
                multiple: multiple,
                searchable: searchable,
                theme: theme,
                size: size,
                rounded: rounded,
                placeholder: placeholder,
                search_placeholder: search_placeholder,
                max_height: max_height,
                form: form,
                classes: classes,
                **html_options
              )
            end
          end
        end
      end
    end
  end
end
