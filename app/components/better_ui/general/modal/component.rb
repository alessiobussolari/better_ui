module BetterUi
  module General
    module Modal
      class Component < BetterUi::Component
        renders_one :trigger
        renders_one :modal
        
        attr_reader :close_on_backdrop, :close_on_escape, :lock_scroll, :classes, :html_options

        # Inizializzazione del wrapper component
        def initialize(
          close_on_backdrop: true,
          close_on_escape: true,
          lock_scroll: true,
          classes: nil,
          **html_options
        )
          @close_on_backdrop = close_on_backdrop
          @close_on_escape = close_on_escape
          @lock_scroll = lock_scroll
          @classes = classes
          @html_options = html_options
          
          validate_params
        end

        # Combina tutte le classi per il wrapper
        def wrapper_classes
          [@classes, @html_options[:class]].compact.join(" ")
        end

        # Restituisce gli attributi per il wrapper principale (con controller Stimulus)
        def wrapper_attributes
          {
            class: wrapper_classes,
            'data-controller': 'bui-modal',
            'data-bui-modal-close-on-backdrop-value': close_on_backdrop,
            'data-bui-modal-close-on-escape-value': close_on_escape,
            'data-bui-modal-lock-scroll-value': lock_scroll
          }.merge(@html_options.except(:class))
        end
      end
    end
  end
end
