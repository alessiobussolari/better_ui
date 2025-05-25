module BetterUi
  module Application
    module Components
      module Main
        module MainHelper
          # Helper per creare il contenitore principale dell'applicazione
          #
          # @param padding [Boolean] Se applicare il padding al contenitore principale, default true
          # @param inner_padding [Boolean] Se applicare il padding al contenitore interno, default true
          # @param rounded [Symbol] Tipo di border-radius del contenitore interno (:none, :small, :medium, :large, :full), default :small
          # @param shadow [Symbol] Tipo di ombra del contenitore interno (:none, :sm, :md, :lg), default :md
          # @param with_sidebar [Boolean] Se lasciare lo spazio per la sidebar, default true
          # @param with_navbar [Boolean] Se lasciare lo spazio per la navbar, default true
          # @param classes [String] Classi CSS aggiuntive per il contenitore principale
          # @param block [Proc] Blocco contenente il contenuto del main
          #
          # @return [String] HTML del componente main
          def bui_main(
            padding: true,
            inner_padding: true,
            rounded: :small,
            shadow: :md,
            with_sidebar: true,
            with_navbar: true,
            classes: nil,
            &block
          )
            render BetterUi::Application::Main::Component.new(
              padding: padding,
              inner_padding: inner_padding,
              rounded: rounded,
              shadow: shadow,
              with_sidebar: with_sidebar,
              with_navbar: with_navbar,
              classes: classes
            ), &block
          end
        end
      end
    end
  end
end
