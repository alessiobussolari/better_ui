# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Dropdown
        module ItemHelper
          ##
          # Crea un elemento del menu dropdown.
          #
          # @param text [String] Il testo dell'elemento (obbligatorio)
          # @param icon [String] Il nome dell'icona da mostrare ("edit", "trash", "share", "user", "cog", "logout")
          # @param href [String] L'URL per renderlo un link
          # @param theme [Symbol] Il tema colore (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
          # @param disabled [Boolean] Se l'elemento è disabilitato
          # @param active [Boolean] Se l'elemento è attivo/selezionato
          # @param classes [String] Classi CSS aggiuntive
          # @param options [Hash] Attributi HTML aggiuntivi
          #
          # @return [String] Il markup HTML dell'elemento dropdown
          #
          # @example Uso base
          #   <%= bui_dropdown_item("Modifica") %>
          #
          # @example Con icona
          #   <%= bui_dropdown_item("Elimina", icon: "trash") %>
          #
          # @example Come link
          #   <%= bui_dropdown_item("Profilo", href: "/profile", icon: "user") %>
          #
          # @example Con tema colorato
          #   <%= bui_dropdown_item("Azione pericolosa", theme: :red, icon: "trash") %>
          #
          # @example Disabilitato
          #   <%= bui_dropdown_item("Non disponibile", disabled: true) %>
          #
          # @example Uso con sintassi keyword (backward compatible)
          #   <%= bui_dropdown_item(text: "Modifica legacy") %>
          #
          def bui_dropdown_item(
            text = nil,
            icon: nil,
            href: nil,
            theme: :default,
            disabled: false,
            active: false,
            classes: '',
            **options
          )
            # Supporta sia sintassi posizionale che keyword per backward compatibility
            item_text = text || options.delete(:text)
            
            render BetterUi::General::Dropdown::ItemComponent.new(
              text: item_text,
              icon: icon,
              href: href,
              theme: theme,
              disabled: disabled,
              active: active,
              classes: classes,
              **options
            )
          end
        end
      end
    end
  end
end
