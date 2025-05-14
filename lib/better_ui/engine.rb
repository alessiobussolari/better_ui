require 'view_component'
require 'redcarpet'
require 'tailwindcss-rails'
require 'coderay'
require 'font-awesome-sass'
begin
  require 'lookbook'
rescue LoadError
  # Lookbook non è richiesto, è una dipendenza opzionale
end
begin
  require 'listen'
rescue LoadError
  # Listen non è richiesto, è una dipendenza opzionale
end
begin
  require 'action_cable'
rescue LoadError
  # ActionCable non è richiesto, è una dipendenza opzionale
end

module BetterUi
  # Engine Rails per Better UI
  # Gestisce l'isolamento del namespace, le dipendenze, gli asset e le configurazioni
  class Engine < ::Rails::Engine
    isolate_namespace BetterUi

    # Configurazione per rendere disponibili gli assets all'applicazione host
    initializer 'better_ui.assets' do |app|
      # Aggiungi i percorsi asset
      app.config.assets.paths << root.join('app', 'assets', 'stylesheets')
      app.config.assets.paths << root.join('app', 'assets', 'images')
      app.config.assets.paths << root.join('app', 'assets', 'fonts')

      # Aggiungi i file SCSS e CSS alla precompilazione
      if app.config.respond_to?(:assets)
        app.config.assets.precompile += %w( 
          better_ui/application.css
          better_ui/components/*.css
          better_ui/components/**/*.css
          better_ui/components/index.css
        )
      end

      # Configurazione per Propshaft se disponibile
      if defined?(Propshaft) && app.config.respond_to?(:asset_host)
        app.config.asset_host = app.config.asset_host
      end
    end

    # Assicuriamo che gli helper siano correttamente caricati
    config.autoload_paths << root.join('app', 'helpers')
    config.eager_load_paths << root.join('app', 'helpers')

    # Caricamento dei componenti helper
    initializer 'better_ui.load_helpers', before: :load_config_initializers do
      # Carica prima i componenti singoli general
      Dir.glob(root.join('app/helpers/better_ui/general/components/*.rb')).sort.each do |component|
        require component
      end

      # Carica i componenti singoli application
      Dir.glob(root.join('app/helpers/better_ui/application/components/*.rb')).sort.each do |component|
        require component
      end

      # Poi carica il general_helper che li unisce tutti
      require_relative '../../app/helpers/better_ui/general_helper' if File.exist?(root.join('app/helpers/better_ui/general_helper.rb'))

      # Poi carica l'application_helper
      require_relative '../../app/helpers/better_ui/application_helper' if File.exist?(root.join('app/helpers/better_ui/application_helper.rb'))

      # Infine carica il modulo principale
      require_relative '../../app/helpers/better_ui_helper' if File.exist?(root.join('app/helpers/better_ui_helper.rb'))
    end

    # Configurazione per rendere disponibili i componenti all'applicazione host
    initializer 'better_ui.view_helpers' do      
      ActiveSupport.on_load :action_controller do
        helper BetterUi::Helper if defined?(BetterUi::Helper)
      end

      ActiveSupport.on_load :action_view do
        include BetterUi::Helper if defined?(BetterUi::Helper)
      end
    end

    # Configurazione per ViewComponent
    config.view_component.preview_paths ||= []
    config.view_component.preview_paths << root.join('test', 'components', 'previews')

    # Configurazione per Lookbook in sviluppo e test
    if defined?(Lookbook)
      initializer 'better_ui.lookbook' do
        if Rails.env.development? || Rails.env.test?
          config.lookbook = Lookbook
        end
      end
    end

    # Configurazione per l'uso personalizzato dei componenti
    initializer 'better_ui.custom_configuration', before: :load_config_initializers do |app|
      app.config.to_prepare do
        BetterUi.configure do |config|
          # Configurazione di default, può essere sovrascritta dall'applicazione host
        end
      end
    end
  end
end
