module BetterUi
  module ApplicationHelper
    # Inclusione dei moduli aggregatori per i componenti application
    # Questo assicura che tutti gli helper specifici dei componenti siano disponibili.

    include BetterUi::Application::Components::Main if defined?(BetterUi::Application::Components::Main)
    include BetterUi::Application::Components::Sidebar if defined?(BetterUi::Application::Components::Sidebar)
    include BetterUi::Application::Components::Navbar if defined?(BetterUi::Application::Components::Navbar)
  end
end
