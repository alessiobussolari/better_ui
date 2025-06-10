# frozen_string_literal: true

module BetterUi
  module Application
    module Navbar
      class Component < BetterUi::Component
        # Include degli helper per utilizzare bui_icon e bui_avatar
        include BetterUi::General::Components::Icon::IconHelper
        include BetterUi::General::Components::Avatar::AvatarHelper
        
        attr_reader :border, :actions, :classes, :with_sidebar

        # Temi navbar con classi Tailwind dirette
        NAVBAR_THEME_CLASSES = {
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
        NAVBAR_SHADOW_CLASSES = {
          none: "",
          sm: "shadow-sm",
          md: "shadow-md",
          lg: "shadow-lg"
        }.freeze
        
        # Larghezze sidebar con classi CSS
        NAVBAR_SIDEBAR_WIDTH_CLASSES = {
          sm: "left-48",
          md: "left-64",
          lg: "left-72",
          xl: "left-80"
        }.freeze

        # Solo gli attributi che necessitano validazione e getter automatici
        configure_attributes({
          theme: {
            var: :@theme,
            default: :default,
            constants: [:NAVBAR_THEME_CLASSES],
            methods: [:get_theme_class]
          },
          shadow: {
            var: :@shadow,
            default: :sm,
            constants: [:NAVBAR_SHADOW_CLASSES],
            methods: [:get_shadow_class]
          },
          sidebar_width: {
            var: :@sidebar_width,
            default: :md,
            constants: [:NAVBAR_SIDEBAR_WIDTH_CLASSES],
            methods: [:get_sidebar_width_class]
          }
        })

        # @param theme [Symbol] Tema colori (default, white, red, rose, orange, green, blue, yellow, violet), default :default
        # @param shadow [Symbol] Tipo di ombra (none, sm, md, lg), default :sm
        # @param border [Boolean] Se mostrare il bordo inferiore, default false
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
          sidebar_width: :md,
          **html_options
        )
          # Attributi semplici (non necessitano validazione)
          @border = border
          @actions = actions || []
          @classes = classes
          @with_sidebar = with_sidebar
          
          # Attributi configurabili (gestiti da configure_attributes)
          @theme = theme.to_sym
          @shadow = shadow.to_sym
          @sidebar_width = sidebar_width.to_sym
          @html_options = html_options

          validate_params
        end

        def container_classes
          base_classes = %w[fixed top-0 right-0 h-[81px] px-6 py-4 z-50]
          
          # Width e posizionamento con sidebar
          if with_sidebar
            base_classes << get_sidebar_width_class  # Metodo generato automaticamente
          else
            base_classes << "left-0 right-0"
          end

          # Tema - metodo generato automaticamente
          base_classes.concat(get_theme_class.split)

          # Shadow - metodo generato automaticamente
          shadow_class = get_shadow_class
          base_classes << shadow_class if shadow_class.present?

          # Border
          base_classes << "border-b" if border

          # Classi aggiuntive
          base_classes << classes if classes.present?

          base_classes.compact.join(" ")
        end

        def has_actions?
          actions.present? && actions.any?
        end
      end
    end
  end
end
