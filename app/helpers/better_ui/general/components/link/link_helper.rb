module BetterUi
  module General
    module Components
      module Link
        module LinkHelper
          # Genera un link usando BetterUi::General::Link::Component
          #
          # @param label [String] testo del link
          # @param href [String] URL di destinazione (nil per semplice testo)
          # @param theme [Symbol] tema del colore (:default, :white, etc.)
          # @param orientation [Symbol] orientamento (:horizontal, :vertical)
          # @param style [Symbol] stile (:default, :underline, :bold, :text)
          # @param size [Symbol] dimensione (:small, :medium, :large)
          # @param icon [String] icona opzionale
          # @param active [Boolean] stato attivo del link
          # @param disabled [Boolean] stato disabilitato del link
          # @param data [Hash] attributi data
          # @param method [Symbol] metodo HTTP (per Turbo)
          # @param target [String] target del link
          # @param html_options [Hash] opzioni HTML aggiuntive
          # @return [String] HTML del link renderizzato
          #
          # @example Uso base
          #   bui_link("Home", href: "/")
          #   bui_link("Contatti", href: "/contact", theme: :blue)
          #
          # @example Con icona
          #   bui_link("Dashboard", href: "/admin", icon: "home", theme: :green)
          #
          # @example Link attivo
          #   bui_link("Pagina corrente", href: "/current", active: true)
          #
          # @example Link disabilitato (diventa span)
          #   bui_link("Non disponibile", disabled: true)
          #
          # @example Con attributi Turbo
          #   bui_link("Elimina", href: "/delete", method: :delete,
          #            data: { confirm: "Sei sicuro?" }, theme: :red)
          #
          # @example Con opzioni avanzate
          #   bui_link(
          #     "Link esterno",
          #     href: "https://example.com",
          #     theme: :violet,
          #     orientation: :vertical,
          #     style: :bold,
          #     size: :large,
          #     icon: "external-link",
          #     target: "_blank",
          #     id: "external-link",
          #     class: "custom-link"
          #   )
          def bui_link(
            label,
            href: nil,
            theme: :white,
            orientation: :horizontal,
            style: :default,
            size: :medium,
            icon: nil,
            active: false,
            disabled: false,
            data: {},
            method: nil,
            target: nil,
            **html_options,
            &block
          )
            render BetterUi::General::Link::Component.new(
              label: label,
              href: href,
              theme: theme,
              orientation: orientation,
              style: style,
              size: size,
              icon: icon,
              active: active,
              disabled: disabled,
              data: data,
              method: method,
              target: target,
              **html_options
            ), &block
          end
        end
      end
    end
  end
end
