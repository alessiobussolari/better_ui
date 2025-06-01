module BetterUi
  module General
    module Components
      module Modal
        module ModalHelper
          # Helper per renderizzare un modal
          #
          # @param title [String] Il titolo del modal (obbligatorio)
          # @param theme [Symbol] Il tema dell'header del modal
          # @param size [Symbol] La dimensione del modal
          # @param rounded [Symbol] Il border radius del modal
          # @param backdrop [Boolean] Se mostrare l'overlay di sfondo cliccabile
          # @param closable [Boolean] Se mostrare il pulsante di chiusura
          # @param classes [String] Classi CSS aggiuntive per il contenitore
          # @param html_options [Hash] Attributi HTML aggiuntivi
          #
          # @option theme [Symbol] :default (default) Header con sfondo grigio chiaro
          # @option theme [Symbol] :white Header con sfondo bianco
          # @option theme [Symbol] :red Header con sfondo rosso chiaro
          # @option theme [Symbol] :rose Header con sfondo rosa chiaro
          # @option theme [Symbol] :orange Header con sfondo arancione chiaro
          # @option theme [Symbol] :green Header con sfondo verde chiaro
          # @option theme [Symbol] :blue Header con sfondo blu chiaro
          # @option theme [Symbol] :yellow Header con sfondo giallo chiaro
          # @option theme [Symbol] :violet Header con sfondo violetto chiaro
          #
          # @option size [Symbol] :small (max-w-sm) Modal piccolo
          # @option size [Symbol] :medium (max-w-md, default) Modal medio
          # @option size [Symbol] :large (max-w-2xl) Modal grande
          #
          # @option rounded [Symbol] :none (rounded-none) Nessun border radius
          # @option rounded [Symbol] :small (rounded-md) Border radius piccolo
          # @option rounded [Symbol] :medium (rounded-lg, default) Border radius medio
          # @option rounded [Symbol] :large (rounded-xl) Border radius grande
          # @option rounded [Symbol] :full (rounded-full) Border radius completo
          #
          # @return [String] HTML del modal
          #
          # @example Utilizzo base
          #   <%= bui_modal(title: "Conferma azione") do %>
          #     <p>Sei sicuro di voler continuare?</p>
          #   <% end %>
          #
          # @example Con tema, dimensione e border radius
          #   <%= bui_modal(title: "Attenzione", theme: :red, size: :large, rounded: :large) do %>
          #     <p>Questa azione non può essere annullata.</p>
          #   <% end %>
          #
          # @example Senza backdrop
          #   <%= bui_modal(title: "Informazioni", backdrop: false) do %>
          #     <p>Contenuto del modal senza overlay di sfondo.</p>
          #   <% end %>
          #
          # @example Non chiudibile
          #   <%= bui_modal(title: "Caricamento", closable: false) do %>
          #     <p>Operazione in corso...</p>
          #   <% end %>
          #
          # @example Con bottoni di azione
          #   <%= bui_modal(title: "Elimina elemento", theme: :red) do %>
          #     <p>Sei sicuro di voler eliminare questo elemento?</p>
          #     <p class="text-sm text-gray-600 mt-2">Questa azione non può essere annullata.</p>
          #     
          #     <div class="flex justify-end space-x-3 mt-6">
          #       <%= bui_button(label: "Annulla", type: :white, size: :medium) %>
          #       <%= bui_button(label: "Elimina", type: :red, size: :medium) %>
          #     </div>
          #   <% end %>
          def bui_modal(
            title:,
            theme: :default,
            size: :medium,
            rounded: :medium,
            backdrop: true,
            closable: true,
            classes: nil,
            **html_options,
            &block
          )
            render BetterUi::General::Modal::Component.new(
              title: title,
              theme: theme,
              size: size,
              rounded: rounded,
              backdrop: backdrop,
              closable: closable,
              classes: classes,
              **html_options
            ), &block
          end
        end
      end
    end
  end
end
