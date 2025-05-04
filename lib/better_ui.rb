require "better_ui/version"
require "better_ui/engine"

module BetterUi
  class Configuration
    attr_accessor :button_defaults, :alert_defaults, :card_defaults, :tabs_defaults
    
    def initialize
      @button_defaults = {}
      @alert_defaults = {}
      @card_defaults = {}
      @tabs_defaults = {}
    end
  end
  
  class << self
    def configuration
      @configuration ||= Configuration.new
    end
    
    def configure
      yield(configuration) if block_given?
    end
    
    # Metodo utile per accedere al percorso degli stilesheets
    def stylesheets_path
      File.join(File.dirname(__FILE__), '..', 'app', 'assets', 'stylesheets')
    end
  end
end

# Caricamento dei generator
require 'rails/generators'
if defined?(Rails::Generators)
  require 'generators/better_ui/stylesheet_generator'
  require 'generators/better_ui/install_generator'
end
