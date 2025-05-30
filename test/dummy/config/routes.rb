Rails.application.routes.draw do
  mount BetterUi::Engine => "/better_ui"
  mount Lookbook::Engine => "/lookbook"
end
