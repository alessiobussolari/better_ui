require 'view_component'
require 'redcarpet'
require 'tailwindcss-rails'
require 'coderay'

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
    config.view_component.preview_paths << root.join('spec', 'components', 'previews')
  end
end
