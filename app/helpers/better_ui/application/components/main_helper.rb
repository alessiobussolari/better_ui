module BetterUi
  module Application
    module Components
      module MainHelper
        # Helper per creare il contenitore principale dell'applicazione
        def bui_main(**options, &block)
          render BetterUi::Application::MainComponent.new(**options), &block
        end
      end
    end
  end
end
