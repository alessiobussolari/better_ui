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
          #   <%= bui_dropdown_item(text: "Modifica") %>
          #
          # @example Con icona
          #   <%= bui_dropdown_item(text: "Elimina", icon: "trash") %>
          #
          # @example Come link
          #   <%= bui_dropdown_item(text: "Profilo", href: "/profile", icon: "user") %>
          #
          # @example Con tema colorato
          #   <%= bui_dropdown_item(text: "Azione pericolosa", theme: :red, icon: "trash") %>
          #
          # @example Disabilitato
          #   <%= bui_dropdown_item(text: "Non disponibile", disabled: true) %>
          #
          def bui_dropdown_item(
            text:,
            icon: nil,
            href: nil,
            theme: :default,
            disabled: false,
            active: false,
            classes: '',
            **options
          )
            render BetterUi::General::Dropdown::ItemComponent.new(
              text: text,
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
