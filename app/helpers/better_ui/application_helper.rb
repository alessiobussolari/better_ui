module BetterUi
  module ApplicationHelper
    # Inclusione dei moduli aggregatori per i componenti application
    # Questo assicura che tutti gli helper specifici dei componenti siano disponibili.

    # General Components
    include General::Components::Alert::AlertHelper
    include General::Components::Avatar::AvatarHelper
    include General::Components::Badge::BadgeHelper
    include General::Components::Breadcrumb::BreadcrumbHelper
    include General::Components::Button::ButtonHelper
    include General::Components::Card::CardHelper
    include General::Components::Container::ContainerHelper
    include General::Components::Divider::DividerHelper
    include General::Components::Heading::HeadingHelper
    include General::Components::Icon::IconHelper
    include General::Components::Link::LinkHelper
    include General::Components::Panel::PanelHelper
    include General::Components::Progress::ProgressHelper
    include General::Components::Spinner::SpinnerHelper

    include General::Components::Table::TableHelper
    include General::Components::Table::TbodyHelper
    include General::Components::Table::TdHelper
    include General::Components::Table::TfootHelper
    include General::Components::Table::ThHelper
    include General::Components::Table::TheadHelper
    include General::Components::Table::TrHelper

    include General::Components::Tag::TagHelper
    include General::Components::Tooltip::TooltipHelper

    # Application Components
    include Application::Components::Main::MainHelper
    include Application::Components::Navbar::NavbarHelper
    include Application::Components::Sidebar::SidebarHelper
  end
end
