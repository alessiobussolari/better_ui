module BetterUi
  # Includi esplicitamente gli helper
  require_relative 'better_ui/general_helper'
  require_relative 'better_ui/application_helper'
  require_relative 'better_ui/form_helper'
  
  module Helper
    # Estendi il modulo con ActiveSupport::Concern per funzionalità helper
    extend ActiveSupport::Concern
    
    # Includi gli helper disponibili
    include BetterUi::GeneralHelper
    include BetterUi::ApplicationHelper
    include BetterUi::FormHelper
  end
end
