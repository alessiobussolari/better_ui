# frozen_string_literal: true

module BetterUi
  module Application
    module Sidebar
      class BrandComponent < ViewComponent::Base
        attr_reader :name, :logo, :url, :compact
        
        # @param name [String] Nome dell'applicazione
        # @param logo [String] URL dell'immagine logo
        # @param url [String] URL di destinazione al click
        # @param compact [Boolean] Se visualizzare in modalità compatta
        def initialize(name:, logo: nil, url: '/', compact: false)
          @name = name
          @logo = logo
          @url = url
          @compact = compact
        end
      end
    end
  end
end 