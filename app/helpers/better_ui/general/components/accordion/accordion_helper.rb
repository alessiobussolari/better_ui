# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Accordion
        module AccordionHelper
          # Rendering di un accordion con item collassabili/espandibili
          #
          # @param multiple [Boolean] se permettere multipli item aperti contemporaneamente
          # @param theme [Symbol] tema di colore per l'accordion
          # @param variant [Symbol] variante visuale dell'accordion
          # @param size [Symbol] dimensione del testo e padding
          # @param classes [String] classi CSS aggiuntive per il wrapper
          # @param options [Hash] attributi HTML aggiuntivi da passare al componente
          # @return [String] HTML renderizzato dell'accordion
          #
          # @example Uso base standalone
          #   <%= bui_accordion do |accordion| %>
          #     <%= accordion.with_item(title: "Domanda 1") do %>
          #       <p>Risposta alla prima domanda</p>
          #     <% end %>
          #   <% end %>
          #
          # @example Con tema e configurazioni
          #   <%= bui_accordion(multiple: true, theme: :blue, size: :lg) do |accordion| %>
          #     <%= accordion.with_item(title: "FAQ 1", expanded: true) do %>
          #       <p>Contenuto della prima FAQ</p>
          #     <% end %>
          #     <%= accordion.with_item(title: "FAQ 2") do %>
          #       <p>Contenuto della seconda FAQ</p>
          #     <% end %>
          #   <% end %>
          #
          # @example Con varianti stilistiche
          #   <%= bui_accordion(variant: :separated, theme: :green) do |accordion| %>
          #     <%= accordion.with_item(title: "Sezione 1") do %>
          #       <div>Contenuto complesso con HTML</div>
          #     <% end %>
          #   <% end %>
          #
          # @example Con attributi HTML aggiuntivi
          #   <%= bui_accordion(id: "faq-accordion", "data-testid": "main-faq") do |accordion| %>
          #     <%= accordion.with_item(title: "Come funziona?") do %>
          #       <p>Spiegazione dettagliata...</p>
          #     <% end %>
          #   <% end %>
          #
          # @example Con item disabilitati e icone personalizzate
          #   <%= bui_accordion(theme: :violet, size: :sm) do |accordion| %>
          #     <%= accordion.with_item(title: "Disponibile", icon: "check-circle") do %>
          #       <p>Questa sezione è disponibile</p>
          #     <% end %>
          #     <%= accordion.with_item(title: "Non disponibile", disabled: true) do %>
          #       <p>Questa sezione è disabilitata</p>
          #     <% end %>
          #   <% end %>
          def bui_accordion(multiple: false, theme: :default, variant: :bordered, size: :md, 
                           classes: '', **options, &block)
            render BetterUi::General::Accordion::Component.new(
              multiple: multiple,
              theme: theme,
              variant: variant,
              size: size,
              classes: classes,
              **options
            ), &block
          end
        end
      end
    end
  end
end
