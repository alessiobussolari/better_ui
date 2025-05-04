BetterUi::Engine.routes.draw do
  # Montaggio di Lookbook come root
  mount Lookbook::Engine, at: "/"
end
