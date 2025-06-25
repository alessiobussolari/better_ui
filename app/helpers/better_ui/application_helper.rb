module BetterUi
  module ApplicationHelper
    # Inclusione dei moduli aggregatori per i componenti application
    # Questo assicura che tutti gli helper specifici dei componenti siano disponibili.

    # General Components
    include General::Components::Accordion::AccordionHelper
    include General::Components::Alert::AlertHelper
    include General::Components::Avatar::AvatarHelper
    include General::Components::Badge::BadgeHelper
    include General::Components::Breadcrumb::BreadcrumbHelper
    include General::Components::Button::ButtonHelper
    include General::Components::Divider::DividerHelper
    include General::Components::Dropdown::DropdownHelper
    include General::Components::Dropdown::ItemHelper
    include General::Components::Dropdown::DividerHelper
    include General::Components::Grid::GridHelper
    include General::Components::Heading::HeadingHelper
    include General::Components::Icon::IconHelper
    include General::Components::Link::LinkHelper
    include General::Components::Modal::ModalHelper
    include General::Components::Pagination::PaginationHelper
    include General::Components::Panel::PanelHelper
    include General::Components::Progress::ProgressHelper
    include General::Components::Spinner::SpinnerHelper
    include General::Components::Tag::TagHelper
    include General::Components::Tooltip::TooltipHelper
    include General::Components::Field::FieldHelper
    include General::Components::Text::TextHelper
    include General::Components::Container::ContainerHelper
    include General::Components::Dropdown::DropdownHelper

    include General::Components::Table::TableHelper
  
    include General::Components::Tabs::TabsHelper
    include General::Components::Tabs::TabHelper
    include General::Components::Tabs::PanelHelper

    # General Form Components
    include General::Components::Input::Checkbox::CheckboxHelper
    include General::Components::Input::Radio::RadioHelper
    include General::Components::Input::RadioGroup::RadioGroupHelper
    include General::Components::Input::Select::SelectHelper
    include General::Components::Input::Text::TextHelper
    include General::Components::Input::Textarea::TextareaHelper
    include General::Components::Input::Toggle::ToggleHelper
    include General::Components::Input::Rating::RatingHelper
    include General::Components::Input::Pin::PinHelper

    # Application Components
    include Application::Components::Main::MainHelper
    include Application::Components::Navbar::NavbarHelper
    include Application::Components::Sidebar::SidebarHelper
    include Application::Components::Card::CardHelper
  end
end
