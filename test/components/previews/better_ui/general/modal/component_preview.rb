# frozen_string_literal: true

module BetterUi
  module General
    module Modal
      class ComponentPreview < ViewComponent::Preview
        # @notes
        #
        # ## Utilizzo Base
        # Il componente Modal fornisce un sistema completo con trigger (button/link) e modal content.
        # Include controller Stimulus per gestire l'apertura/chiusura e tutte le interazioni.
        #
        # ## Casi d'Uso Comuni
        # - **Dialoghi di conferma**: Trigger button + modal conferma con azioni
        # - **Form modali**: Link trigger + modal con form di inserimento
        # - **Messaggi informativi**: Button info + modal con dettagli
        # - **Gallerie immagini**: Link trigger + modal con contenuto multimediale
        # - **Processi guidati**: Button trigger + modal con wizard step-by-step
        #
        # ## Variabili Principali
        # - **Trigger**: `as` (:button, :link), `label`, `type`/`variant`
        # - **Modal**: `title`, `theme`, `size`, `backdrop`, `closable`
        # - **Controller**: `close_on_backdrop`, `close_on_escape`, `lock_scroll`
        #
        # ## Esempi Codice
        # ```erb
        # <%= bui_modal do |modal| %>
        #   <% modal.with_trigger(label: "Apri Modal", as: :button, type: :primary) %>
        #   <% modal.with_modal(title: "Conferma") do %>
        #     <p>Contenuto modal</p>
        #   <% end %>
        # <% end %>
        # 
        # <%= bui_modal(close_on_backdrop: false) do |modal| %>
        #   <% modal.with_trigger(label: "Dettagli", as: :link, variant: :underline) %>
        #   <% modal.with_modal(title: "Informazioni", theme: :blue, size: :large) do %>
        #     <p>Contenuto dettagliato</p>
        #   <% end %>
        # <% end %>
        # ```

        # @!group Esempi Base

        # @label Con Helper
        # @param trigger_label text "Testo del trigger"
        # @param trigger_as select { choices: [button, link] }
        # @param trigger_type select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] }
        # @param modal_title text "Titolo del modal"
        # @param modal_theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] }
        # @param modal_size select { choices: [xxs, xs, sm, md, lg, xl, xxl] }
        # @param modal_backdrop toggle "Mostra overlay di sfondo"
        # @param modal_closable toggle "Mostra pulsante di chiusura"
        # @param close_on_backdrop toggle "Chiudi cliccando backdrop"
        # @param close_on_escape toggle "Chiudi con tasto Escape"
        # @param lock_scroll toggle "Blocca scroll del body"
        def default(
          trigger_label: "Apri Modal",
          trigger_as: :button,
          trigger_type: :default,
          modal_title: "Conferma eliminazione",
          modal_theme: :default,
          modal_size: :md,
          modal_backdrop: true,
          modal_closable: true,
          close_on_backdrop: true,
          close_on_escape: true,
          lock_scroll: true
        )
          normalized = normalize_params!(
            trigger_label: trigger_label,
            trigger_as: trigger_as&.to_sym,
            trigger_type: trigger_type&.to_sym,
            modal_title: modal_title,
            modal_theme: modal_theme&.to_sym,
            modal_size: modal_size&.to_sym,
            modal_backdrop: modal_backdrop,
            modal_closable: modal_closable,
            close_on_backdrop: close_on_backdrop,
            close_on_escape: close_on_escape,
            lock_scroll: lock_scroll
          )
          render_with_template(locals: normalized)
        end

        # @label Istanziazione Diretta
        # @param trigger_label text "Testo del trigger"
        # @param trigger_as select { choices: [button, link] }
        # @param trigger_type select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] }
        # @param modal_title text "Titolo del modal"
        # @param modal_theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] }
        # @param modal_size select { choices: [xxs, xs, sm, md, lg, xl, xxl] }
        # @param modal_backdrop toggle "Mostra overlay di sfondo"
        # @param modal_closable toggle "Mostra pulsante di chiusura"
        # @param close_on_backdrop toggle "Chiudi cliccando backdrop"
        # @param close_on_escape toggle "Chiudi con tasto Escape"
        # @param lock_scroll toggle "Blocca scroll del body"
        def raw(
          trigger_label: "Apri Modal",
          trigger_as: :button,
          trigger_type: :default,
          modal_title: "Conferma eliminazione",
          modal_theme: :default,
          modal_size: :md,
          modal_backdrop: true,
          modal_closable: true,
          close_on_backdrop: true,
          close_on_escape: true,
          lock_scroll: true
        )
          normalized = normalize_params!(
            trigger_label: trigger_label,
            trigger_as: trigger_as&.to_sym,
            trigger_type: trigger_type&.to_sym,
            modal_title: modal_title,
            modal_theme: modal_theme&.to_sym,
            modal_size: modal_size&.to_sym,
            modal_backdrop: modal_backdrop,
            modal_closable: modal_closable,
            close_on_backdrop: close_on_backdrop,
            close_on_escape: close_on_escape,
            lock_scroll: lock_scroll
          )
          render_with_template(locals: normalized)
        end

        # @!endgroup

        private

        def normalize_params!(
          trigger_label:, trigger_as:, trigger_type:,
          modal_title:, modal_theme:, modal_size:, modal_backdrop:, modal_closable:,
          close_on_backdrop:, close_on_escape:, lock_scroll:
        )
          {
            trigger_label: trigger_label,
            trigger_as: trigger_as,
            trigger_type: trigger_type,
            modal_title: modal_title,
            modal_theme: modal_theme,
            modal_size: modal_size,
            modal_backdrop: modal_backdrop,
            modal_closable: modal_closable,
            close_on_backdrop: close_on_backdrop,
            close_on_escape: close_on_escape,
            lock_scroll: lock_scroll
          }
        end
      end
    end
  end
end
