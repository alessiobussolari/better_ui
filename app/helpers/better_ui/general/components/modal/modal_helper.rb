module BetterUi
  module General
    module Components
      module Modal
        module ModalHelper
          # Helper per renderizzare un modal con trigger e contenuto
          #
          # @param close_on_backdrop [Boolean] Se chiudere il modal cliccando sul backdrop
          # @param close_on_escape [Boolean] Se chiudere il modal premendo Escape
          # @param lock_scroll [Boolean] Se bloccare lo scroll del body quando il modal è aperto
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
          # @option size [Symbol] :sm (max-w-sm) Modal piccolo
          # @option size [Symbol] :md (max-w-md, default) Modal medio
          # @option size [Symbol] :lg (max-w-2xl) Modal grande
          #
          # @option rounded [Symbol] :none (rounded-none) Nessun border radius
          # @option rounded [Symbol] :sm (rounded-md) Border radius piccolo
          # @option rounded [Symbol] :md (rounded-lg, default) Border radius medio
          # @option rounded [Symbol] :lg (rounded-xl) Border radius grande
          # @option rounded [Symbol] :full (rounded-full) Border radius completo
          #
          # @return [String] HTML del modal
          #
          # @example Utilizzo base con button trigger
          #   <%= bui_modal do |modal| %>
          #     <% modal.with_trigger(label: "Apri Modal", as: :button, type: :primary) %>
          #     <% modal.with_modal(title: "Conferma azione") do %>
          #       <p>Sei sicuro di voler continuare?</p>
          #     <% end %>
          #   <% end %>
          #
          # @example Con link trigger
          #   <%= bui_modal do |modal| %>
          #     <% modal.with_trigger(label: "Visualizza dettagli", as: :link, variant: :underline) %>
          #     <% modal.with_modal(title: "Dettagli elemento", theme: :blue, size: :lg) do %>
          #       <p>Informazioni dettagliate sull'elemento selezionato.</p>
          #     <% end %>
          #   <% end %>
          #
          # @example Modal con configurazione avanzata
          #   <%= bui_modal(close_on_backdrop: false, lock_scroll: false) do |modal| %>
          #     <% modal.with_trigger(label: "Elimina", as: :button, type: :red, size: :sm) %>
          #     <% modal.with_modal(title: "Elimina elemento", theme: :red, backdrop: true, closable: true) do %>
          #       <p>Sei sicuro di voler eliminare questo elemento?</p>
          #       <p class="text-sm text-gray-600 mt-2">Questa azione non può essere annullata.</p>
          #       
          #       <div class="flex justify-end space-x-3 mt-6">
          #         <%= bui_button(text: "Annulla", theme: :white, size: :md) %>
          #         <%= bui_button(text: "Elimina", theme: :red, size: :md) %>
          #       </div>
          #     <% end %>
          #   <% end %>
          def bui_modal(
            close_on_backdrop: true,
            close_on_escape: true,
            lock_scroll: true,
            classes: nil,
            **html_options,
            &block
          )
            render BetterUi::General::Modal::Component.new(
              close_on_backdrop: close_on_backdrop,
              close_on_escape: close_on_escape,
              lock_scroll: lock_scroll,
              classes: classes,
              **html_options
            ), &block
          end
        end
      end
    end
  end
end
