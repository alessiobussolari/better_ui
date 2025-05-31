# frozen_string_literal: true

module BetterUi
  module Application
    module Main
      class Component < ViewComponent::Base
        attr_reader :padding, :inner_padding, :rounded, :shadow, :with_sidebar, :sidebar_width, :classes

        # Arrotondamento bordi con classi Tailwind dirette
        MAIN_ROUNDED = {
          none: "",
          small: "rounded-lg",
          medium: "rounded-xl",
          large: "rounded-2xl",
          full: "rounded-full"
        }.freeze

        # Ombre con classi Tailwind dirette
        MAIN_SHADOW = {
          none: "",
          small: "shadow-sm",
          medium: "shadow-md", 
          large: "shadow-lg"
        }.freeze
        
        # Padding con classi Tailwind dirette
        MAIN_PADDING = {
          true: "p-6",
          false: "p-0"
        }.freeze
        
        # Classi layout per sidebar
        MAIN_LAYOUT = {
          sidebar: { sm: "pl-48", md: "pl-64", lg: "pl-72", xl: "pl-80" },  # Con Sidebar
          none: ""              # Senza sidebar
        }.freeze
        
        # Larghezza sidebar (deve corrispondere a SIDEBAR_WIDTHS del componente Sidebar)
        MAIN_SIDEBAR_WIDTH = {
          sm: 48,
          md: 64,
          lg: 72,
          xl: 80
        }.freeze
        
        # @param padding [Boolean] Se applicare il padding al contenitore principale
        # @param inner_padding [Boolean] Se applicare il padding al contenitore interno
        # @param rounded [Symbol] Tipo di border-radius del contenitore interno (:none, :small, :medium, :large, :full), default :small
        # @param shadow [Symbol] Tipo di ombra del contenitore interno (:none, :small, :medium, :large), default :medium
        # @param with_sidebar [Boolean] Se lasciare lo spazio per la sidebar
        # @param sidebar_width [Symbol] Larghezza della sidebar (:sm, :md, :lg, :xl), default :md
        # @param classes [String] Classi CSS aggiuntive per il contenitore principale
        def initialize(
          padding: true,
          inner_padding: true,
          rounded: :small,
          shadow: :medium,
          with_sidebar: true,
          sidebar_width: :md,
          classes: nil
        )
          @padding = padding
          @inner_padding = inner_padding
          @rounded = rounded.to_sym
          @shadow = shadow.to_sym
          @with_sidebar = with_sidebar
          @sidebar_width = sidebar_width.to_sym
          @classes = classes
          
          validate_params
        end


        
        private
        
        def get_layout_class
          if with_sidebar
            MAIN_LAYOUT[:sidebar][@sidebar_width] || MAIN_LAYOUT[:sidebar][:md]
          else
            MAIN_LAYOUT[:none]
          end
        end
        
        def get_padding_class(enabled)
          MAIN_PADDING[enabled] || MAIN_PADDING[false]
        end
        
        def get_rounded_class
          MAIN_ROUNDED[@rounded] || MAIN_ROUNDED[:small]
        end
        
        def get_shadow_class
          MAIN_SHADOW[@shadow] || MAIN_SHADOW[:medium]
        end
        
        def validate_params
          validate_rounded
          validate_shadow
          validate_sidebar_width if with_sidebar
        end
        
        def validate_rounded
          unless MAIN_ROUNDED.keys.include?(@rounded)
            raise ArgumentError, "L'arrotondamento deve essere uno tra: #{MAIN_ROUNDED.keys.join(', ')}"
          end
        end
        
        def validate_shadow
          unless MAIN_SHADOW.keys.include?(@shadow)
            raise ArgumentError, "L'ombra deve essere una tra: #{MAIN_SHADOW.keys.join(', ')}"
          end
        end
        
        def validate_sidebar_width
          unless MAIN_SIDEBAR_WIDTH.keys.include?(@sidebar_width)
            raise ArgumentError, "La larghezza della sidebar deve essere una tra: #{MAIN_SIDEBAR_WIDTH.keys.join(', ')}"
          end
        end
      end
    end
  end
end
