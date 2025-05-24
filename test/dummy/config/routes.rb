Rails.application.routes.draw do
  mount BetterUi::Engine => "/better_ui"
  mount Lookbook::Engine => "/lookbook" if Rails.env.development?
  
  # Route per test spinner
  get 'test/spinner', to: 'test#spinner'
end
