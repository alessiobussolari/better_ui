# frozen_string_literal: true

require 'test_helper'
require 'generators/better_ui/stylesheet_generator'

module BetterUi
  module Generators
    class StylesheetGeneratorTest < Rails::Generators::TestCase
      tests StylesheetGenerator
      destination Rails.root.join('tmp/generators')
      setup :prepare_destination

      test "genera il file CSS corretto con il prefisso predefinito" do
        run_generator
        assert_file "app/assets/stylesheets/custom_better_ui_components.css"
      end

      test "genera il file CSS corretto con un prefisso personalizzato" do
        run_generator ["--prefix=my"]
        assert_file "app/assets/stylesheets/my_better_ui_components.css"
      end

      test "il file CSS generato contiene le sezioni necessarie" do
        run_generator
        assert_file "app/assets/stylesheets/custom_better_ui_components.css" do |content|
          assert_match(/1\. VARIABILI/, content)
          assert_match(/2\. COMPONENTI GENERALI/, content)
          assert_match(/3\. COMPONENTI APPLICATIVI/, content)
          assert_match(/4\. PERSONALIZZAZIONI/, content)
        end
      end
    end
  end
end 