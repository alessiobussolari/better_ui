# frozen_string_literal: true

module BetterUi
  module Generators
    # Generatore per creare file SCSS personalizzati per i componenti BetterUI
    #
    # Questo generatore crea:
    # 1. Un foglio di stile principale che importa tutti i componenti usando @use/@forward
    # 2. File di override per ogni componente che permettono personalizzazioni senza modificare i file originali
    # 3. Un file indice che raccoglie tutti gli override usando @forward
    class StylesheetGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)
      
      desc "Genera un foglio di stile SCSS di base per personalizzare i componenti di BetterUI"
      
      # Opzioni configurabili
      class_option :prefix, type: :string, default: "custom", 
                  desc: "Prefisso da utilizzare per il foglio di stile (default: 'custom')"
      class_option :path, type: :string, default: "app/assets/stylesheets", 
                  desc: "Path dove installare i file CSS all'interno della cartella app (default: 'app/assets/stylesheets')"
      
      # Lista dei file dei componenti da gestire
      COMPONENT_FILES = [
        '_variables.scss', 
        '_button.scss', 
        '_heading.scss', 
        '_breadcrumb.scss', 
        '_link.scss', 
        '_panel.scss', 
        '_icon.scss', 
        '_table.scss', 
        '_badge.scss', 
        '_spinner.scss', 
        '_avatar.scss',
        '_card.scss'
      ].freeze
      
      # Crea il foglio di stile principale
      def create_stylesheet
        # Crea il file principale che importa tutti i componenti
        template "components_stylesheet.scss", 
                File.join(options[:path], "#{options[:prefix]}_better_ui.scss")
        
        # Crea la directory dei componenti se non esiste
        directory = File.join(options[:path], "components")
        FileUtils.mkdir_p(directory) unless File.directory?(directory)
        
        # Crea il file indice che raccoglie tutti gli override
        template "index.scss", File.join(directory, "_index.scss")
      end

      # Crea i file di override per ogni componente
      def create_overrides
        # Crea la directory dei componenti se non esiste
        directory = File.join(options[:path], "components")
        FileUtils.mkdir_p(directory) unless File.directory?(directory)
        
        # Crea i file di override per ogni componente
        COMPONENT_FILES.each do |filename|
          # Nome del file di override (es. _button_overrides.scss)
          override_filename = filename.sub('.scss', '_overrides.scss')
          override_path = File.join(directory, override_filename)
          
          # Crea il file di override solo se non esiste già
          unless File.exist?(override_path)
            # Percorso del file template originale
            template_path = File.join(self.class.source_root, "components", filename)
            
            # Se il file template esiste, crea il file di override basato su di esso
            if File.exist?(template_path)
              original_content = File.read(template_path)
              override_content = generate_empty_override(original_content, filename)
              create_file override_path, override_content
            end
          end
        end
      end
      
      # Mostra le istruzioni README dopo l'esecuzione del generatore
      def show_readme
        readme "README" if behavior == :invoke
      end
      
      private
      
      # Genera un file di override vuoto con le stesse classi del file originale
      # 
      # @param content [String] Il contenuto del file SCSS originale
      # @param filename [String] Il nome del file del componente
      # @return [String] Il contenuto formattato del file di override
      def generate_empty_override(content, filename)
        # Estrae il nome del componente dal nome file (es. "_button.scss" -> "button")
        component_name = filename.sub('_', '').sub('.scss', '')
        
        # Intestazione del file di override
        result = "/* ==============================\n"
        result += " * #{component_name.capitalize} Component Overrides\n"
        result += " * ==============================\n"
        result += " * Questo file contiene le classi vuote per sovrascrivere gli stili di default.\n"
        result += " * Aggiungi qui le tue personalizzazioni.\n"
        result += " */\n\n"
        
        # Aggiungiamo il layer di Tailwind se presente nell'originale
        if content.include?('@layer components')
          result += "@layer components {\n"
          layer_present = true
        end
        
        # Estrae le classi principali (Block) usando regex
        class_matches = content.scan(/\.(bui-[a-zA-Z0-9_-]+)\s*\{/)
        class_matches.flatten.uniq.each do |css_class|
          result += layer_present ? "  " : ""
          result += ".#{css_class} {\n    // Aggiungi personalizzazioni qui\n#{layer_present ? "  " : ""}}\n\n"
        end
        
        # Estrae classi modifier (es. &--small, &__icon, ecc.)
        modifier_matches = content.scan(/&([a-zA-Z0-9_-]+)\s*\{/)
        if !modifier_matches.empty?
          # Raggruppa i modifier per classe principale
          main_classes = class_matches.flatten.uniq
          main_classes.each do |main_class|
            # Estrae tutti i modifier di questa classe principale
            class_content = extract_class_block(content, main_class)
            modifiers = class_content.scan(/&([a-zA-Z0-9_-]+)\s*\{/).flatten.uniq
            
            if !modifiers.empty?
              result += layer_present ? "  " : ""
              result += ".#{main_class} {\n"
              
              modifiers.each do |modifier|
                result += layer_present ? "    " : "  "
                result += "&#{modifier} {\n      // Aggiungi personalizzazioni qui\n#{layer_present ? "    " : "  "}}\n\n"
              end
              
              result += layer_present ? "  " : ""
              result += "}\n\n"
            end
          end
        end
        
        # Chiude il layer se presente
        result += "}\n" if layer_present
        
        result
      end
      
      # Estrae il blocco di codice relativo a una classe CSS specifica
      #
      # @param content [String] Il contenuto del file SCSS completo
      # @param css_class [String] Il nome della classe CSS da estrarre
      # @return [String] Il blocco di codice della classe
      def extract_class_block(content, css_class)
        regex = /\.(#{css_class})\s*\{((?:[^{}]|\{(?:[^{}]|\{[^{}]*\})*\})*)\}/m
        match = content.match(regex)
        match ? match[2] : ""
      end
    end
  end
end 