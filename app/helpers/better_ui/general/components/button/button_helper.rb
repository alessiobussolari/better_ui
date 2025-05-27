module BetterUi
  module General
    module Components
      module Button
        module ButtonHelper
          # Helper per renderizzare un bottone
          #
          # @param label [String] Testo del bottone
          # @param type [Symbol] Tipo del bottone (:default, :white, :red, etc.)
          # @param size [Symbol] Dimensione del bottone (:small, :medium, :large)
          # @param full_width [Boolean] Larghezza completa
          # @param disabled [Boolean] Stato disabilitato
          # @param icon [String] Nome icona (opzionale)
          # @param icon_position [Symbol] Posizione icona (:left, :right)
          # @param href [String] URL per il link (opzionale)
          # @param method [Symbol] Metodo HTTP (opzionale)
          # @param data [Hash] Attributi data
          # @param classes [String] Classi CSS aggiuntive
          # @param id [String] ID elemento
          # @param rounded [Symbol] Tipo di border-radius (:none, :small, :medium, :large, :full)
          # @param html_options [Hash] Opzioni HTML aggiuntive
          # @params button_type [Symbol] Tipo di bottone (:button, :submit, :reset)
          #
          # @return [String] HTML del bottone
          def bui_button(
            label: nil,
            type: :white,
            size: :medium,
            full_width: false,
            disabled: false,
            icon: nil,
            icon_position: :left,
            href: nil,
            method: nil,
            data: {},
            classes: nil,
            id: nil,
            rounded: :medium,
            button_type: :button,
            **html_options,
            &block
          )
            render BetterUi::General::Button::Component.new(
              label: label,
              type: type,
              size: size,
              full_width: full_width,
              disabled: disabled,
              icon: icon,
              icon_position: icon_position,
              href: href,
              method: method,
              data: data,
              classes: classes,
              id: id,
              rounded: rounded,
              button_type: button_type,
              **html_options
            ), &block
          end
        end
      end
    end
  end
end
