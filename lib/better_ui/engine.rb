module BetterUi
  class Engine < ::Rails::Engine
    isolate_namespace BetterUi

    initializer "better_ui.view_helpers" do
      ActiveSupport.on_load :action_controller do
        helper BetterUi::ApplicationHelper if defined?(BetterUi::ApplicationHelper)
      end

      ActiveSupport.on_load :action_view do
        include BetterUi::ApplicationHelper if defined?(BetterUi::ApplicationHelper)
      end
    end
  end
end
