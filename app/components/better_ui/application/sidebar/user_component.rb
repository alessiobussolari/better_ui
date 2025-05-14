# frozen_string_literal: true

module BetterUi
  module Application
    module Sidebar
      class UserComponent < ViewComponent::Base
        attr_reader :name, :email, :avatar, :role, :compact
        
        # @param name [String] Nome utente
        # @param email [String] Email utente
        # @param avatar [String] URL immagine avatar
        # @param role [String] Ruolo dell'utente 
        # @param compact [Boolean] Se visualizzare in modalità compatta
        def initialize(name:, email: nil, avatar: nil, role: nil, compact: false)
          @name = name
          @email = email
          @avatar = avatar
          @role = role
          @compact = compact
        end
      end
    end
  end
end 