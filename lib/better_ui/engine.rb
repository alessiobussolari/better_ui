require 'view_component'
require 'redcarpet'
require 'tailwindcss-rails'
require 'coderay'
require 'font-awesome-sass'
require 'lookbook'
require 'listen'
require 'action_cable'

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
    config.eager_load_paths << root.join('app', 'helpers')
    
    # Caricamento dei componenti helper
    initializer 'better_ui.load_helpers', before: :load_config_initializers do
      # Carica prima i componenti singoli
      Dir.glob(root.join('app/helpers/better_ui/general/components/*.rb')).sort.each do |component|
        require component
      end
      
      # Poi carica il general_helper che li unisce tutti
      require_relative '../../app/helpers/better_ui/general_helper'
      
      # Infine carica il modulo principale
      require_relative '../../app/helpers/better_ui_helper'
    end
    
    # Configurazione per rendere disponibili i componenti all'applicazione host
    initializer 'better_ui.view_helpers' do      
      ActiveSupport.on_load :action_controller do
        helper BetterUi::Helper
      end
      
      ActiveSupport.on_load :action_view do
        include BetterUi::Helper
      end
    end
    
    # Configurazione per ViewComponent
    config.view_component.preview_paths << root.join('test', 'components', 'previews')
    
    # Configurazione per Lookbook in sviluppo e test
    initializer 'better_ui.lookbook' do
      if Rails.env.development? || Rails.env.test?
        config.lookbook = Lookbook
      end
    end
  end
end
