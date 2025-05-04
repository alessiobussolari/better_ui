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
        
        # Lista dei file dei componenti
        component_files = ['_variables.scss', '_button.scss', '_heading.scss', '_breadcrumb.scss', 
                          '_link.scss', '_panel.scss', '_icon.scss', '_table.scss', '_badge.scss', 
                          '_spinner.scss', '_avatar.scss']
        
        # Copia i file originali
        component_files.each do |filename|
          copy_file "components/#{filename}", File.join(directory, filename)
        end
      end

      def create_overrides
        # Crea la directory dei componenti se non esiste
        directory = File.join("app/assets/stylesheets", "components")
        FileUtils.mkdir_p(directory) unless File.directory?(directory)
        
        # Lista dei file dei componenti
        component_files = ['_variables.scss', '_button.scss', '_heading.scss', '_breadcrumb.scss', 
                          '_link.scss', '_panel.scss', '_icon.scss', '_table.scss', '_badge.scss', 
                          '_spinner.scss', '_avatar.scss']
        
        # Crea i file di override
        component_files.each do |filename|
          # Nome del file di override
          override_filename = filename.sub('.scss', '_overrides.scss')
          override_path = File.join(directory, override_filename)
          
          # Crea il file di override solo se non esiste già
          unless File.exist?(override_path)
            # Leggi il contenuto del file originale dalla directory templates
            template_path = File.join(self.class.source_root, "components", filename)
            
            # Se il file template esiste, crea il file di override
            if File.exist?(template_path)
              original_content = File.read(template_path)
              override_content = generate_empty_override(original_content, filename)
              create_file override_path, override_content
            end
          end
        end
      end
      
      def show_readme
        readme "README" if behavior == :invoke
      end
      
      private
      
      # Genera un file di override vuoto con le stesse classi del file originale
      def generate_empty_override(content, filename)
        component_name = filename.sub('_', '').sub('.scss', '')
        result = "/* ==============================\n"
        result += " * #{component_name.capitalize} Component Overrides\n"
        result += " * ==============================\n"
        result += " * Questo file contiene le classi vuote per sovrascrivere gli stili di default.\n"
        result += " * Aggiungi qui le tue personalizzazioni.\n"
        result += " */\n\n"
        
        # Estrae le classi tramite regex
        class_matches = content.scan(/\.(bui-[a-zA-Z0-9_-]+)\s*\{/)
        class_matches.flatten.uniq.each do |css_class|
          result += ".#{css_class} {\n  // Sovrascrivi qui gli stili per .#{css_class}\n}\n\n"
        end
        
        # Estrae anche classi annidate usando la sintassi SCSS
        nested_matches = content.scan(/\.(bui-[a-zA-Z0-9_-]+)\s*{[^{]*\.([\w-]+)\s*{/)
        nested_matches.each do |parent_class, child_class|
          result += ".#{parent_class} {\n  .#{child_class} {\n    // Sovrascrivi qui gli stili annidati\n  }\n}\n\n"
        end
        
        result
      end
    end
  end
end 