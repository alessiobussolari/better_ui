# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Input
        module Rating
          module RatingHelper
            # Renderizza un componente Rating (Input) interattivo con stelle per valutazioni e feedback.
            #
            # @param name [String] Nome del campo rating (obbligatorio se non readonly)
            # @param value [Float, Integer] Valore del rating attuale (0.0 - max_stars)
            # @param max_stars [Integer] Numero massimo di stelle (default: 5)
            # @param readonly [Boolean] Se il rating è in sola lettura
            # @param half_stars [Boolean] Se supportare mezze stelle
            # @param theme [Symbol] Tema del componente (:default, :yellow, :orange, :red, :pink, :purple, :blue, :green, :gray)
            # @param size [Symbol] Dimensione del componente (:small, :medium, :large)
            # @param show_value [Boolean] Se mostrare il valore numerico accanto alle stelle
            # @param form [ActionView::Helpers::FormBuilder, nil] Form builder Rails opzionale
            # @param classes [String] Classi CSS aggiuntive
            # @param options [Hash] Opzioni aggiuntive per attributi HTML
            #
            # @return [String] HTML del componente Rating renderizzato
            #
            # @example Uso base per inserimento rating
            #   <%= bui_input_rating(name: 'review_rating') %>
            #
            # @example Rating read-only per visualizzazione
            #   <%= bui_input_rating(value: 4.5, readonly: true, show_value: true) %>
            #
            # @example Con tema e dimensioni personalizzate
            #   <%= bui_input_rating(name: 'quality', theme: :orange, size: :large, max_stars: 10) %>
            #
            # @example Con Rails form builder
            #   <%= form_with model: @review do |form| %>
            #     <%= bui_input_rating(name: :rating, form: form, value: @review.rating, show_value: true) %>
            #   <% end %>
            #
            # @example Rating con mezze stelle e valore preimpostato
            #   <%= bui_input_rating(
            #         name: 'service_rating',
            #         value: 3.5,
            #         half_stars: true,
            #         theme: :green,
            #         size: :medium,
            #         show_value: true
            #       ) %>
            def bui_input_rating(name: nil, value: 0, max_stars: 5, readonly: false, half_stars: true,
                                 theme: :default, size: :medium, show_value: false, form: nil,
                                 classes: '', **options)
              render BetterUi::General::Input::Rating::Component.new(
                name: name,
                value: value,
                max_stars: max_stars,
                readonly: readonly,
                half_stars: half_stars,
                theme: theme,
                size: size,
                show_value: show_value,
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
