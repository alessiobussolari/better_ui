Rails.application.routes.draw do
  mount BetterUi::Engine => "/better_ui"
  
  # Redirigo la root al mountable engine
  root to: redirect('/better_ui')
end
