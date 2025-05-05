# frozen_string_literal: true

module BetterUi
  module Application
    class MainComponent < ViewComponent::Base
      attr_reader :padding, :inner_padding, :rounded, :shadow, :with_sidebar, :with_navbar, :content_classes

      # Opzioni di bordi arrotondati standardizzati
      CONTAINER_RADIUS = {
        none: 'bui-main__container--radius-none',
        small: 'bui-main__container--radius-small',
        medium: 'bui-main__container--radius-medium',
        large: 'bui-main__container--radius-large',
        full: 'bui-main__container--radius-full'
      }.freeze

      # Opzioni di ombra standardizzate
      CONTAINER_SHADOW = {
        none: 'bui-main__container--shadow-none',
        sm: 'bui-main__container--shadow-sm',
        md: 'bui-main__container--shadow-md', 
        lg: 'bui-main__container--shadow-lg'
      }.freeze

      # @param padding [Boolean] Se applicare il padding al contenitore principale
      # @param inner_padding [Boolean] Se applicare il padding al contenitore interno
      # @param rounded [Symbol] Tipo di border-radius del contenitore interno (:none, :small, :medium, :large, :full), default :small
      # @param shadow [Symbol] Tipo di ombra del contenitore interno (:none, :sm, :md, :lg), default :md
      # @param with_sidebar [Boolean] Se lasciare lo spazio per la sidebar
      # @param with_navbar [Boolean] Se lasciare lo spazio per la navbar
      # @param content_classes [String] Classi CSS aggiuntive per il contenitore principale
      def initialize(
        padding: true, 
        inner_padding: true, 
        rounded: :small, 
        shadow: :md, 
        with_sidebar: true, 
        with_navbar: true, 
        content_classes: nil
      )
        @padding = padding
        @inner_padding = inner_padding
        @rounded = rounded.to_sym
        @shadow = shadow.to_sym
        @with_sidebar = with_sidebar
        @with_navbar = with_navbar
        @content_classes = content_classes
      end

      def container_classes
        [
          "bui-main",
          padding ? "bui-main--with-padding" : "bui-main--no-padding",
          with_sidebar ? "bui-main--with-sidebar" : "bui-main--no-sidebar",
          with_navbar ? "bui-main--with-navbar" : "bui-main--no-navbar",
          content_classes
        ].compact.join(" ")
      end

      def inner_container_classes
        [
          "bui-main__container",
          inner_padding ? "bui-main__container--with-padding" : "bui-main__container--no-padding",
          get_border_radius_class,
          get_shadow_class
        ].compact.join(" ")
      end

      def get_border_radius_class
        CONTAINER_RADIUS[@rounded] || CONTAINER_RADIUS[:small]
      end

      def get_shadow_class
        CONTAINER_SHADOW[@shadow] || CONTAINER_SHADOW[:md]
      end
    end
  end
end 