# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Input
        module Select
          module SelectHelper
            # Renders a Select component for selection fields from option lists.
            #
            # @param name [String] Name of the select field
            # @param options [Array<Hash>] Array of select options in format [{value: 'value', label: 'label'}, ...]
            # @param selected [String, Array, nil] Selected value or values
            # @param required [Boolean] Whether the field is required
            # @param disabled [Boolean] Whether the field is disabled
            # @param multiple [Boolean] Whether multiple options can be selected
            # @param theme [Symbol] Component theme (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
            # @param size [Symbol] Component size (:small, :medium, :large)
            # @param rounded [Symbol] Border radius (:none, :small, :medium, :large, :full)
            # @param placeholder [String, nil] Placeholder text for the field (creates an initial disabled option)
            # @param classes [String] Additional CSS classes
            # @param form [ActionView::Helpers::FormBuilder, nil] Optional Rails form builder
            # @param options_html [Hash] Additional HTML attributes for option tags
            # @param html_options [Hash] Additional HTML attributes for the select tag
            #
            # @return [String] Rendered HTML of the Select component
            #
            # @example Basic select
            #   <%= bui_input_select(name: 'country', options: [{value: 'it', label: 'Italy'}, {value: 'fr', label: 'France'}]) %>
            #
            # @example Select with selected option
            #   <%= bui_input_select(name: 'role', options: roles_array, selected: 'admin') %>
            #
            # @example Multiple select
            #   <%= bui_input_select(name: 'languages[]', options: languages_array, multiple: true, selected: ['en', 'fr']) %>
            #
            # @example Select with custom theme and size
            #   <%= bui_input_select(name: 'category', options: categories_array, theme: :blue, size: :large) %>
            #
            # @example With Rails form builder
            #   <%= form_with model: @user do |form| %>
            #     <%= bui_input_select(name: :country_id, options: countries_array, form: form, required: true) %>
            #   <% end %>
            def bui_input_select(name:, options:, selected: nil, required: false, disabled: false, 
                           multiple: false, theme: :default, size: :medium, rounded: :medium, 
                           placeholder: nil, classes: '', form: nil, options_html: {}, **html_options)
              
              render BetterUi::General::Input::Select::Component.new(
                name: name,
                options: options,
                selected: selected,
                required: required,
                disabled: disabled,
                multiple: multiple,
                theme: theme,
                size: size,
                rounded: rounded,
                placeholder: placeholder,
                classes: classes,
                form: form,
                options_html: options_html,
                **html_options
              )
            end
          end
        end
      end
    end
  end
end