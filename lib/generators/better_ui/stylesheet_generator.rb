# frozen_string_literal: true

module BetterUi
  module Generators
    class StylesheetGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)
      
      desc "Genera un foglio di stile SCSS di base per personalizzare i componenti di BetterUi"
      
      class_option :prefix, type: :string, default: "custom", 
                  desc: "Prefisso da utilizzare per il foglio di stile (default: 'custom')"
      
      def create_stylesheet
        template "components_stylesheet.scss", 
                File.join("app/assets/stylesheets", "#{options[:prefix]}_better_ui_components.scss")
      end
      
      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end 