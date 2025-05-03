# frozen_string_literal: true

module BetterUi
  module Generators
    class StylesheetGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)
      
      desc "Genera un foglio di stile SCSS di base per personalizzare i componenti di BetterUi"
      
      class_option :prefix, type: :string, default: "custom", 
                  desc: "Prefisso da utilizzare per il foglio di stile (default: 'custom')"
      
      def create_stylesheet
        # Crea il file principale
        template "components_stylesheet.scss", 
                File.join("app/assets/stylesheets", "#{options[:prefix]}_better_ui_components.scss")
        
        # Crea la directory dei componenti se non esiste
        directory = File.join("app/assets/stylesheets", "components")
        FileUtils.mkdir_p(directory) unless File.directory?(directory)
        
        # Copia i file dei singoli componenti
        copy_file "components/_variables.scss", File.join(directory, "_variables.scss")
        copy_file "components/_button.scss", File.join(directory, "_button.scss")
        copy_file "components/_heading.scss", File.join(directory, "_heading.scss")
      end
      
      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end 