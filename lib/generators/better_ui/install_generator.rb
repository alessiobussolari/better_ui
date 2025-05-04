# frozen_string_literal: true

module BetterUi
  module Generators
    # Generatore per l'installazione di Better UI in un'applicazione Rails
    #
    # Questo generatore:
    # 1. Aggiunge le dipendenze necessarie
    # 2. Monta l'engine nelle routes
    # 3. Aggiunge gli asset all'applicazione
    # 4. Crea un file di configurazione initializer
    # 5. Genera i file di stile personalizzabili (opzionalmente)
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)
      
      desc "Installa Better UI nell'applicazione Rails"
      
      class_option :skip_routes, type: :boolean, default: false,
                  desc: "Salta l'aggiunta del mount engine nelle routes"
      class_option :skip_stylesheets, type: :boolean, default: false,
                  desc: "Salta la generazione dei file di stile personalizzabili"
      class_option :skip_config, type: :boolean, default: false,
                  desc: "Salta la creazione del file di configurazione"
      
      def mount_engine
        return if options[:skip_routes]
        
        route_file = "config/routes.rb"
        
        if File.exist?(route_file)
          mount_code = "  mount BetterUi::Engine => '/better_ui'"
          
          append_to_file route_file, injectible_routes(mount_code)
          
          say "Engine di Better UI montato in #{route_file}", :green
        else
          say "File routes.rb non trovato. Salta il montaggio dell'engine.", :yellow
        end
      end
      
      def copy_initializer
        return if options[:skip_config]
        
        template "initializer.rb", "config/initializers/better_ui.rb"
        say "File di configurazione creato in config/initializers/better_ui.rb", :green
      end
      
      def add_assets
        application_css = "app/assets/stylesheets/application.css"
        application_scss = "app/assets/stylesheets/application.scss"
        
        file_to_update = if File.exist?(application_scss)
          application_scss
        elsif File.exist?(application_css)
          application_css
        else
          nil
        end
        
        if file_to_update
          if file_to_update.end_with?('.css')
            inject_into_file file_to_update, " *= require better_ui/application\n", before: " */\n"
          else
            append_to_file file_to_update, "\n@import 'better_ui/application';\n"
          end
          
          say "Better UI assets aggiunti a #{file_to_update}", :green
        else
          say "File CSS dell'applicazione non trovato. Salta l'aggiunta degli assets.", :yellow
        end
      end
      
      def create_stylesheets
        return if options[:skip_stylesheets]
        
        generate "better_ui:stylesheet"
        say "Fogli di stile personalizzabili generati", :green
      end
      
      def show_instructions
        say "\n========================================================", :green
        say "Better UI installato con successo!", :green
        say "========================================================", :green
        say "\nPer utilizzare i componenti nella tua applicazione:", :blue
        say "- Accedi a http://localhost:3000/better_ui per vedere la documentazione", :blue
        say "- Utilizza i componenti nel tuo codice, ad esempio:", :blue
        say "  <%= render BetterUi::General::ButtonComponent.new(label: 'Clicca qui') %>", :blue
        say "\nPer personalizzare i componenti, modifica i file in:", :blue
        say "  app/assets/stylesheets/components/", :blue
        say "- I file *_overrides.scss contengono le classi vuote per le personalizzazioni", :blue
        say "\nPer configurare i valori predefiniti, modifica:", :blue
        say "  config/initializers/better_ui.rb", :blue
        say "\n========================================================\n", :green
      end
      
      private
      
      def injectible_routes(mount_code)
        "\n#{mount_code}\n"
      end
    end
  end
end 