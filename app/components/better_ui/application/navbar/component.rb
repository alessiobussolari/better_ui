# frozen_string_literal: true

module BetterUi
  module Application
    module Navbar
      class Component < ViewComponent::Base
        # Include degli helper per utilizzare bui_icon e bui_avatar
        include BetterUi::General::Components::Icon::IconHelper
        include BetterUi::General::Components::Avatar::AvatarHelper
        
        attr_reader :theme, :shadow, :border, :actions, :classes, :with_sidebar, :sidebar_width

        # Temi navbar con classi Tailwind dirette
        NAVBAR_THEME = {
          default: "bg-white text-gray-900 border-gray-200",
          white: "bg-white text-gray-900 border-gray-200",
          red: "bg-red-50 text-red-900 border-red-200",
          rose: "bg-rose-50 text-rose-900 border-rose-200",
          orange: "bg-orange-50 text-orange-900 border-orange-200",
          green: "bg-green-50 text-green-900 border-green-200",
          blue: "bg-blue-50 text-blue-900 border-blue-200",
          yellow: "bg-yellow-50 text-yellow-900 border-yellow-200",
          violet: "bg-violet-50 text-violet-900 border-violet-200"
        }.freeze

        # Ombre navbar con classi Tailwind dirette
        NAVBAR_SHADOW = {
          none: "",
          small: "shadow-sm",
          medium: "shadow-md",
          large: "shadow-lg"
        }.freeze
        
        # Larghezze sidebar con valori numerici per utilizzo in classi custom
        NAVBAR_SIDEBAR_WIDTH = {
          sm: 48,
          md: 64,
          lg: 72,
          xl: 80
        }.freeze

        # @param theme [Symbol] Tema colori (default, white, red, rose, orange, green, blue, yellow, violet), default :default
        # @param shadow [Symbol] Tipo di ombra (none, small, medium, large), default :sm
        # @param border [Boolean] Se mostrare il bordo inferiore, default true
        # @param actions [Array] Array di azioni/pulsanti a destra
        # @param classes [String] Classi CSS aggiuntive
        # @param with_sidebar [Boolean] Se la navbar è affiancata a una sidebar, default false
        # @param sidebar_width [Symbol] Larghezza della sidebar affiancata (:sm, :md, :lg, :xl), default :md
        def initialize(
          theme: :default,
          shadow: :sm,
          border: false,
          actions: [],
          classes: nil,
          with_sidebar: false,
          sidebar_width: :md
        )
          @theme = theme.to_sym
          @shadow = shadow.to_sym
          @border = border
          @actions = actions || []
          @classes = classes
          @with_sidebar = with_sidebar
          @sidebar_width = sidebar_width.to_sym

          validate_params
        end

        def container_classes
          base_classes = %w[fixed top-0 right-0 h-[81px] px-6 py-4 z-50]
          
          # Width e posizionamento con sidebar
          if with_sidebar
            case @sidebar_width
            when :sm
              base_classes << "left-48"  # w-48 = 12rem = 192px
            when :md
              base_classes << "left-64"  # w-64 = 16rem = 256px  
            when :lg
              base_classes << "left-72"  # w-72 = 18rem = 288px
            when :xl
              base_classes << "left-80"  # w-80 = 20rem = 320px
            else
              base_classes << "left-64"  # default md
            end
          else
            base_classes << "left-0 right-0"
          end

          # Tema
          base_classes.concat(theme_classes.split)

          # Shadow
          base_classes << shadow_class if shadow != :none

          # Border
          base_classes << "border-b" if border

          # Classi aggiuntive
          base_classes << classes if classes.present?

          base_classes.compact.join(" ")
        end

        def has_actions?
          actions.present? && actions.any?
        end

        private

        def theme_classes
          NAVBAR_THEME[@theme] || NAVBAR_THEME[:default]
        end

        def shadow_class
          NAVBAR_SHADOW[@shadow] || NAVBAR_SHADOW[:sm]
        end
        
        def validate_params
          validate_theme
          validate_shadow
          validate_sidebar_width if with_sidebar
        end
        
        def validate_theme
          unless NAVBAR_THEME.keys.include?(@theme)
            raise ArgumentError, "Il tema deve essere uno tra: #{NAVBAR_THEME.keys.join(', ')}"
          end
        end
        
        def validate_shadow
          unless NAVBAR_SHADOW.keys.include?(@shadow)
            raise ArgumentError, "L'ombra deve essere una tra: #{NAVBAR_SHADOW.keys.join(', ')}"
          end
        end
        
        def validate_sidebar_width
          unless NAVBAR_SIDEBAR_WIDTH.keys.include?(@sidebar_width)
            raise ArgumentError, "La larghezza della sidebar deve essere una tra: #{NAVBAR_SIDEBAR_WIDTH.keys.join(', ')}"
          end
        end
      end
    end
  end
end
