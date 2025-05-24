module BetterUi
  module General
    module Components
      module Alert
        module AlertHelper
          # Render un alert con le opzioni specificate
          #
          # @param options [Hash] opzioni per il componente
          #
          # @option options [String] :title (nil) titolo dell'alert
          # @option options [String] :message (nil) contenuto dell'alert
          # @option options [Symbol] :theme (:default) :default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet
          # @option options [String] :icon (nil) nome dell'icona (usa default se nil)
          # @option options [Symbol] :icon_position (:left) :left, :right posizione dell'icona
          # @option options [Boolean] :dismissible (false) se l'alert può essere chiuso
          # @option options [Symbol] :rounded (:medium) :none, :small, :medium, :large, :full arrotondamento degli angoli
          # @option options [Symbol] :importance (:medium) :high, :medium, :low livello di importanza per accessibilità
          # @option options [Boolean] :html_content (false) se il messaggio contiene HTML
          # @option options [String] :classes (nil) classi CSS aggiuntive
          #
          # @return [String] HTML del componente
          def bui_alert(**options)
            render BetterUi::General::Alert::Component.new(**options)
          end
        end
      end
    end
  end
end
