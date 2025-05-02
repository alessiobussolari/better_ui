if defined?(Lookbook)
  Lookbook.configure do |config|
    # Cancella eventuali percorsi predefiniti e configura esplicitamente solo quelli della gemma
    config.preview_paths = []
    config.preview_paths << BetterUi::Engine.root.join('test/components/previews')
    
    # Configura il titolo della pagina Lookbook
    config.page_title = 'BetterUI - Catalogo Componenti'
    
    # Configura i tag principali in modo esplicito
    config.preview_display_names = {
      'BetterUi::General' => 'Componenti Generali',
      'BetterUi::Application' => 'Componenti Applicazione',
      'BetterUi::Website' => 'Componenti Sito Web'
    }
    
    # Per supportare i componenti ViewComponent
    config.listen_for_changes = {
      component: 'app/components/**/*.rb',
      preview: 'test/components/previews/**/*_preview.rb',
      template: 'app/components/**/*.erb'
    }
    
    # Imposta la localizzazione per l'italiano
    config.locale = :it
    
    # Abilita la ricarica automatica in sviluppo
    config.auto_refresh = true if Rails.env.development?
  end
end 