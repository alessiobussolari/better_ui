module BetterUi
  module General
    module Components
      module AlertHelper
        # Render un alert con le opzioni specificate
        #
        # @param options [Hash] opzioni per il componente
        #
        # @option options [String] :title (nil) titolo dell'alert
        # @option options [String] :message (nil) contenuto dell'alert
        # @option options [Symbol] :theme (:default) :default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet
        # @option options [String] :icon (nil) nome dell'icona (usa default se nil)
        # @option options [Boolean] :dismissible (false) se l'alert può essere chiuso
        #
        # @return [String] HTML del componente
        def bui_alert(**options)
          render BetterUi::General::AlertComponent.new(**options)
        end
      end
    end
  end
end
