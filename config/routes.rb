BetterUi::Engine.routes.draw do
  # Route principale per la documentazione
  root to: 'docs#index'
  
  # Route per le pagine di documentazione generiche
  get 'docs/:page', to: 'docs#show', as: :docs_page
  
  # Route specifica per i componenti
  get 'docs/components/:component', to: 'docs#component', as: :docs_component
end
