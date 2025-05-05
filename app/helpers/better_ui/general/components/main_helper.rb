module BetterUi
  module General
    module Components
      module MainHelper
        # Renderizza il componente Main
        # @param padding [Boolean] Se applicare il padding al contenitore principale
        # @param inner_padding [Boolean] Se applicare il padding al contenitore interno
        # @param rounded [Symbol] Tipo di border-radius del contenitore interno (:none, :small, :medium, :large, :full), default :small
        # @param shadow [Symbol] Tipo di ombra del contenitore interno (:none, :sm, :md, :lg), default :md
        # @param with_sidebar [Boolean] Se lasciare lo spazio per la sidebar
        # @param with_navbar [Boolean] Se lasciare lo spazio per la navbar
        # @param content_classes [String] Classi CSS aggiuntive per il contenitore principale
        def bui_main(
          padding: true, 
          inner_padding: true, 
          rounded: :small, 
          shadow: :md, 
          with_sidebar: true, 
          with_navbar: true, 
          content_classes: nil, 
          &block
        )
          render BetterUi::Application::MainComponent.new(
            padding: padding,
            inner_padding: inner_padding,
            rounded: rounded,
            shadow: shadow,
            with_sidebar: with_sidebar,
            with_navbar: with_navbar,
            content_classes: content_classes
          ), &block
        end
      end
    end
  end
end 