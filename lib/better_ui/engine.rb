require 'view_component'
require 'redcarpet'
require 'tailwindcss-rails'

module BetterUi
  class Engine < ::Rails::Engine
    isolate_namespace BetterUi
    
    # Configurazione per rendere disponibili gli assets all'applicazione host
    initializer 'better_ui.assets' do |app|
      app.config.assets.paths << root.join('app', 'assets', 'stylesheets')
      app.config.assets.paths << root.join('app', 'assets', 'images')
    end
    
    # Configurazione per rendere disponibili i componenti all'applicazione host
    initializer 'better_ui.view_helpers' do
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
