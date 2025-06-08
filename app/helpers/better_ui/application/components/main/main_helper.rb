module BetterUi
  module Application
    module Components
      module Main
        module MainHelper
          # Helper per creare il contenitore principale dell'applicazione
          #
          # @param padding [Boolean] Se applicare il padding al contenitore principale, default true
          # @param inner_padding [Boolean] Se applicare il padding al contenitore interno, default true
          # @param rounded [Symbol] Tipo di border-radius del contenitore interno (:none, :sm, :md, :lg, :full), default :sm
          # @param shadow [Symbol] Tipo di ombra del contenitore interno (:none, :sm, :md, :lg), default :md
          # @param with_sidebar [Boolean] Se lasciare lo spazio per la sidebar, default true
          # @param sidebar_width [Symbol] Larghezza della sidebar (:sm, :md, :lg, :xl), default :md
          # @param classes [String] Classi CSS aggiuntive per il contenitore principale
          # @param form [Nil] Parametro form per compatibilità con form builder (non utilizzato)
          # @param block [Proc] Blocco contenente il contenuto del main
          #
          # @return [String] HTML del componente main
          #
          # @example Main base
          #   <%= bui_main %>
          # 
          # @example Main con tema
          #   <%= bui_main(rounded: :md, shadow: :lg) %>
          #
          # @example Main senza sidebar
          #   <%= bui_main(with_sidebar: false) %>
          #
          # @example Main con padding personalizzati
          #   <%= bui_main(padding: false, inner_padding: true) %>
          #
          # @example Main con classi aggiuntive
          #   <%= bui_main(
          #     classes: "my-8",
          #     data: { controller: "main" }
          #   ) %>
          def bui_main(
            padding: true,
            inner_padding: true,
            rounded: :sm,
            shadow: :md,
            with_sidebar: true,
            sidebar_width: :md,
            classes: nil,
            form: nil, 
            **options,
            &block
          )
            render BetterUi::Application::Main::Component.new(
              padding: padding,
              inner_padding: inner_padding,
              rounded: rounded,
              shadow: shadow,
              with_sidebar: with_sidebar,
              sidebar_width: sidebar_width,
              classes: classes,
              **options
            ), &block
          end
        end
      end
    end
  end
end
