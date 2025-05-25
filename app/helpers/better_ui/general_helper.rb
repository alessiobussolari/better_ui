module BetterUi
  module GeneralHelper
    # Inclusione dei moduli aggregatori per i componenti generali
    # Questo assicura che tutti gli helper specifici dei componenti e dei loro sotto-componenti siano disponibili.

    include BetterUi::General::Components::Alert if defined?(BetterUi::General::Components::Alert)
    include BetterUi::General::Components::Avatar if defined?(BetterUi::General::Components::Avatar)
    include BetterUi::General::Components::Badge if defined?(BetterUi::General::Components::Badge)
    include BetterUi::General::Components::Breadcrumb if defined?(BetterUi::General::Components::Breadcrumb)
    include BetterUi::General::Components::Button if defined?(BetterUi::General::Components::Button)
    include BetterUi::General::Components::Divider if defined?(BetterUi::General::Components::Divider)
    include BetterUi::General::Components::Heading if defined?(BetterUi::General::Components::Heading)
    include BetterUi::General::Components::Icon if defined?(BetterUi::General::Components::Icon)
    include BetterUi::General::Components::Link if defined?(BetterUi::General::Components::Link)
    include BetterUi::General::Components::Panel if defined?(BetterUi::General::Components::Panel)
    include BetterUi::General::Components::Progress if defined?(BetterUi::General::Components::Progress)
    include BetterUi::General::Components::Spinner if defined?(BetterUi::General::Components::Spinner)
    include BetterUi::General::Components::Table if defined?(BetterUi::General::Components::Table)
    include BetterUi::General::Components::Tag if defined?(BetterUi::General::Components::Tag)
    include BetterUi::General::Components::Tooltip if defined?(BetterUi::General::Components::Tooltip)
  end
end
