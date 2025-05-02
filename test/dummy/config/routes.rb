Rails.application.routes.draw do
  # Monta Lookbook solo in ambiente di sviluppo e test
  if Rails.env.development? || Rails.env.test?
    mount Lookbook::Engine, at: "/components" if defined?(Lookbook)
  end
  
  # Monta l'engine BetterUi
  mount BetterUi::Engine => "/better_ui"
  
  # Redirigi la root all'engine
  root to: redirect('/better_ui')
end
