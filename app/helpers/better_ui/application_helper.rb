module BetterUi
  module ApplicationHelper
    # Inclusione di tutti i componenti application
    include BetterUi::Application::Components::SidebarHelper
    include BetterUi::Application::Components::MainHelper
  end
end
