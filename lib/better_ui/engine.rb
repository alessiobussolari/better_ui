require 'view_component'
require 'redcarpet'
require 'tailwindcss-rails'
require 'coderay'
require 'font-awesome-sass'

module BetterUi
  class Engine < ::Rails::Engine
    isolate_namespace BetterUi
    
    # Configurazione per rendere disponibili gli assets all'applicazione host
    initializer 'better_ui.assets' do |app|
      app.config.assets.paths << root.join('app', 'assets', 'stylesheets')
      app.config.assets.paths << root.join('app', 'assets', 'images')
    end
    
    # Assicuriamo che gli helper siano correttamente caricati
    config.autoload_paths << root.join('app', 'helpers')
    
    # Configurazione per rendere disponibili i componenti all'applicazione host
    initializer 'better_ui.view_helpers' do
      require_relative '../../app/helpers/better_ui_application_helper'
      
      ActiveSupport.on_load :action_controller do
        helper BetterUi::ApplicationHelper
      end
      
      ActiveSupport.on_load :action_view do
        include BetterUi::ApplicationHelper
      end
    end
    
    # Configurazione per ViewComponent
    config.view_component.preview_paths << root.join('test', 'components', 'previews')
    
    # Configurazione per Lookbook in sviluppo e test
    initializer 'better_ui.lookbook' do
      if defined?(Lookbook) && (Rails.env.development? || Rails.env.test?)
        # Carica esplicitamente le dipendenze per le funzionalità avanzate di Lookbook
        begin
          require 'listen'
          require 'action_cable'
        rescue LoadError => e
          # Log che le dipendenze opzionali non sono disponibili
          puts "NOTA: Alcune funzionalità avanzate di Lookbook potrebbero non essere disponibili: #{e.message}"
        end
        
        config.lookbook = Lookbook
      end
    end
  end
end
