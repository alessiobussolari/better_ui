module BetterUi
  module GeneralHelper
    # Inclusione degli helper esistenti per i componenti form
    include BetterUi::General::Components::Button::ButtonHelper if defined?(BetterUi::General::Components::Button::ButtonHelper)
    include BetterUi::General::Components::Panel::PanelHelper if defined?(BetterUi::General::Components::Panel::PanelHelper)
    include BetterUi::General::Components::Table::TableHelper if defined?(BetterUi::General::Components::Table::TableHelper)
    include BetterUi::General::Components::Badge::BadgeHelper if defined?(BetterUi::General::Components::Badge::BadgeHelper)
    include BetterUi::General::Components::Avatar::AvatarHelper if defined?(BetterUi::General::Components::Avatar::AvatarHelper)
    include BetterUi::General::Components::Icon::IconHelper if defined?(BetterUi::General::Components::Icon::IconHelper)
    include BetterUi::General::Components::Link::LinkHelper if defined?(BetterUi::General::Components::Link::LinkHelper)
    include BetterUi::General::Components::Heading::HeadingHelper if defined?(BetterUi::General::Components::Heading::HeadingHelper)
    include BetterUi::General::Components::Breadcrumb::BreadcrumbHelper if defined?(BetterUi::General::Components::Breadcrumb::BreadcrumbHelper)
    include BetterUi::General::Components::Spinner::SpinnerHelper if defined?(BetterUi::General::Components::Spinner::SpinnerHelper)
    include BetterUi::General::Components::Divider::DividerHelper if defined?(BetterUi::General::Components::Divider::DividerHelper)
    include BetterUi::General::Components::Alert::AlertHelper if defined?(BetterUi::General::Components::Alert::AlertHelper)
    include BetterUi::General::Components::Tooltip::TooltipHelper if defined?(BetterUi::General::Components::Tooltip::TooltipHelper)
    include BetterUi::General::Components::Progress::ProgressHelper if defined?(BetterUi::General::Components::Progress::ProgressHelper)
    include BetterUi::General::Components::Tag::TagHelper if defined?(BetterUi::General::Components::Tag::TagHelper)
  end
end
