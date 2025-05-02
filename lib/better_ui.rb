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
  end
end

# Caricamento del generator
require 'rails/generators'
require 'generators/better_ui/stylesheet_generator' if defined?(Rails::Generators)
