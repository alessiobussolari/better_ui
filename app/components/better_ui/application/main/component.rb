# frozen_string_literal: true

module BetterUi
  module Application
    module Main
      class Component < ViewComponent::Base
        attr_reader :padding, :inner_padding, :rounded, :shadow, :with_sidebar, :with_navbar, :classes

        # @param padding [Boolean] Se applicare il padding al contenitore principale
        # @param inner_padding [Boolean] Se applicare il padding al contenitore interno
        # @param rounded [Symbol] Tipo di border-radius del contenitore interno (:none, :small, :medium, :large, :full), default :small
        # @param shadow [Symbol] Tipo di ombra del contenitore interno (:none, :sm, :md, :lg), default :md
        # @param with_sidebar [Boolean] Se lasciare lo spazio per la sidebar
        # @param with_navbar [Boolean] Se lasciare lo spazio per la navbar
        # @param classes [String] Classi CSS aggiuntive per il contenitore principale
        def initialize(
          padding: true,
          inner_padding: true,
          rounded: :small,
          shadow: :md,
          with_sidebar: true,
          with_navbar: true,
          classes: nil
        )
          @padding = padding
          @inner_padding = inner_padding
          @rounded = rounded.to_sym
          @shadow = shadow.to_sym
          @with_sidebar = with_sidebar
          @with_navbar = with_navbar
          @classes = classes
        end

        def container_classes
          base_classes = %w[w-full min-h-screen]

          # Gestione layout per sidebar e navbar
          if with_sidebar && with_navbar
            base_classes << "pl-64 pt-16" # Spazio per sidebar + navbar
          elsif with_sidebar
            base_classes << "pl-64" # Solo sidebar
          elsif with_navbar
            base_classes << "pt-16" # Solo navbar
          end

          # Padding del contenitore principale
          base_classes << (padding ? "p-6" : "p-0")

          # Classi aggiuntive
          base_classes << classes if classes.present?

          base_classes.compact.join(" ")
        end

        def inner_container_classes
          base_classes = %w[w-full]

          # Padding interno
          base_classes << (inner_padding ? "p-6" : "p-0")

          # Background
          base_classes << "bg-white"

          # Border radius
          case rounded
          when :none
            # Nessun border radius
          when :small
            base_classes << "rounded-lg"
          when :medium
            base_classes << "rounded-xl"
          when :large
            base_classes << "rounded-2xl"
          when :full
            base_classes << "rounded-full"
          else
            base_classes << "rounded-lg" # Default
          end

          # Shadow
          case shadow
          when :none
            # Nessuna ombra
          when :sm
            base_classes << "shadow-sm"
          when :md
            base_classes << "shadow-md"
          when :lg
            base_classes << "shadow-lg"
          else
            base_classes << "shadow-md" # Default
          end

          base_classes.compact.join(" ")
        end
      end
    end
  end
end
