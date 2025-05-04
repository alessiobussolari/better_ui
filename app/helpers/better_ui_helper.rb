module BetterUi
  # Includi esplicitamente il GeneralHelper
  require_relative 'better_ui/general_helper'
  
  module Helper
    # Estendi il modulo con ActiveSupport::Concern per funzionalità helper
    extend ActiveSupport::Concern
    
    # Includi gli helper disponibili
    include BetterUi::GeneralHelper
  end
end 