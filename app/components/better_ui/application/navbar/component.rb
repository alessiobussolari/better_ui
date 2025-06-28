# frozen_string_literal: true

module BetterUi
  module Application
    module Navbar
      class Component < BetterUi::Component
        # Include degli helper per utilizzare bui_icon e bui_avatar
        include BetterUi::General::Components::Icon::IconHelper
        include BetterUi::General::Components::Avatar::AvatarHelper
        include BetterUi::General::Components::Button::ButtonHelper
        include BetterUi::General::Components::Dropdown::DropdownHelper
        
        # Deleghe per i componenti
        renders_one :avatar, "BetterUi::General::Avatar::Component"
        renders_one :user_dropdown, "BetterUi::General::Dropdown::Component"
        renders_many :icon_buttons, "BetterUi::General::Button::Component"
        
        attr_reader :border, :actions, :with_sidebar, :show_avatar, :show_user_dropdown, :show_icon_buttons

        # Costanti per dimensioni
        NAVBAR_SIZE_CLASSES = {
          sm: "h-[65px] px-4 py-2",
          md: "h-[77px] px-6 py-4",
          lg: "h-[97px] px-8 py-6"
        }.freeze

        # Costanti per temi colore (SOLO i 9 colori specificati)
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

        # Costanti per varianti stilistiche (SENZA colori hardcoded)
        NAVBAR_VARIANT_CLASSES = {
          default: "backdrop-blur-sm",
          solid: "",
          transparent: "bg-transparent border-transparent",
          glass: "backdrop-blur-md bg-opacity-80"
        }.freeze

        # Costanti per ombre
        NAVBAR_SHADOW_CLASSES = {
          none: "",
          sm: "shadow-sm",
          md: "shadow-md",
          lg: "shadow-lg"
        }.freeze
        
        # Costanti per larghezze sidebar
        NAVBAR_SIDEBAR_WIDTH_CLASSES = {
          sm: "left-48",
          md: "left-64",
          lg: "left-72",
          xl: "left-80"
        }.freeze

        # Costanti per temi delle azioni button
        NAVBAR_ACTION_BUTTON_THEME_CLASSES = {
          default: "bg-gray-100 text-gray-700 hover:bg-gray-200",
          white: "bg-white text-gray-700 hover:bg-gray-50",
          red: "bg-red-100 text-red-700 hover:bg-red-200",
          rose: "bg-rose-100 text-rose-700 hover:bg-rose-200",
          orange: "bg-orange-100 text-orange-700 hover:bg-orange-200",
          green: "bg-green-100 text-green-700 hover:bg-green-200",
          blue: "bg-blue-100 text-blue-700 hover:bg-blue-200",
          yellow: "bg-yellow-100 text-yellow-700 hover:bg-yellow-200",
          violet: "bg-violet-100 text-violet-700 hover:bg-violet-200"
        }.freeze

        # Costanti per temi delle azioni icon
        NAVBAR_ACTION_ICON_THEME_CLASSES = {
          default: "text-gray-600 hover:text-gray-900 hover:bg-gray-100",
          white: "text-gray-600 hover:text-gray-900 hover:bg-white",
          red: "text-red-600 hover:text-red-900 hover:bg-red-50",
          rose: "text-rose-600 hover:text-rose-900 hover:bg-rose-50",
          orange: "text-orange-600 hover:text-orange-900 hover:bg-orange-50",
          green: "text-green-600 hover:text-green-900 hover:bg-green-50",
          blue: "text-blue-600 hover:text-blue-900 hover:bg-blue-50",
          yellow: "text-yellow-600 hover:text-yellow-900 hover:bg-yellow-50",
          violet: "text-violet-600 hover:text-violet-900 hover:bg-violet-50"
        }.freeze

        # Sistema configure_attributes per validazione automatica
        configure_attributes({
          size: {
            var: :@size,
            default: :md,
            constants: [:NAVBAR_SIZE_CLASSES],
            methods: [:get_size_class]
          },
          theme: {
            var: :@theme,
            default: :default,
            constants: [:NAVBAR_THEME_CLASSES],
            methods: [:get_theme_class]
          },
          variant: {
            var: :@variant,
            default: :default,
            constants: [:NAVBAR_VARIANT_CLASSES],
            methods: [:get_variant_class]
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
          },
          action_button_theme: {
            var: :@action_button_theme,
            default: :default,
            constants: [:NAVBAR_ACTION_BUTTON_THEME_CLASSES],
            methods: [:get_action_button_theme_class]
          },
          action_icon_theme: {
            var: :@action_icon_theme,
            default: :default,
            constants: [:NAVBAR_ACTION_ICON_THEME_CLASSES],
            methods: [:get_action_icon_theme_class]
          }
        })

        # @param size [Symbol] Dimensione navbar (:sm, :md, :lg), default :md
        # @param theme [Symbol] Tema colori (default, white, red, rose, orange, green, blue, yellow, violet), default :default
        # @param variant [Symbol] Variante stilistica (:default, :solid, :transparent, :glass), default :default
        # @param shadow [Symbol] Tipo di ombra (none, sm, md, lg), default :sm
        # @param border [Boolean] Se mostrare il bordo inferiore, default false
        # @param actions [Array] Array di azioni/pulsanti a destra
        # @param with_sidebar [Boolean] Se la navbar è affiancata a una sidebar, default false
        # @param sidebar_width [Symbol] Larghezza della sidebar affiancata (:sm, :md, :lg, :xl), default :md
        # @param action_button_theme [Symbol] Tema per i button nelle azioni, default :default
        # @param action_icon_theme [Symbol] Tema per le icone nelle azioni, default :default
        # @param show_avatar [Boolean] Se mostrare l'avatar, default false
        # @param show_user_dropdown [Boolean] Se mostrare il dropdown utente, default false
        # @param show_icon_buttons [Boolean] Se mostrare i pulsanti icona, default false
        def initialize(
          size: :md,
          theme: :default,
          variant: :default,
          shadow: :sm,
          border: false,
          actions: [],
          with_sidebar: false,
          sidebar_width: :md,
          action_button_theme: :default,
          action_icon_theme: :default,
          show_avatar: false,
          show_user_dropdown: false,
          show_icon_buttons: false,
          **html_options
        )
          # Attributi semplici (non necessitano validazione)
          @border = border
          @actions = actions || []
          @with_sidebar = with_sidebar
          @show_avatar = show_avatar
          @show_user_dropdown = show_user_dropdown
          @show_icon_buttons = show_icon_buttons
          @html_options = html_options
          
          # Attributi configurabili (gestiti da configure_attributes)
          @size = size.to_sym
          @theme = theme.to_sym
          @variant = variant.to_sym
          @shadow = shadow.to_sym
          @sidebar_width = sidebar_width.to_sym
          @action_button_theme = action_button_theme.to_sym
          @action_icon_theme = action_icon_theme.to_sym

          validate_params
          super(**html_options)
        end

        def container_classes
          base_classes = %w[fixed top-0 right-0 z-50]
          
          # Size - metodo generato automaticamente
          base_classes.concat(get_size_class.split)
          
          # Width e posizionamento con sidebar
          if with_sidebar
            base_classes << get_sidebar_width_class  # Metodo generato automaticamente
          else
            base_classes << "left-0 right-0"
          end

          # Tema - metodo generato automaticamente
          base_classes.concat(get_theme_class.split)

          # Variant - metodo generato automaticamente
          variant_class = get_variant_class
          base_classes.concat(variant_class.split) if variant_class.present?

          # Shadow - metodo generato automaticamente
          shadow_class = get_shadow_class
          base_classes << shadow_class if shadow_class.present?

          # Border
          base_classes << "border-b" if border

          base_classes.compact.join(" ")
        end

        def has_actions?
          actions.present? && actions.any?
        end

        def render_action_content(action)
          case action[:type]
          when :button
            render(BetterUi::General::Button::Component.new(
              text: action[:text],
              theme: @action_button_theme,
              size: :sm,
              **action.except(:type, :text)
            ))
          when :icon
            render(BetterUi::General::Icon::Component.new(
              name: action[:icon],
              theme: @action_icon_theme,
              size: :md,
              **action.except(:type, :icon)
            ))
          else
            action[:content] || ""
          end
        end

        def actions
          @actions || []
        end
        
        def has_avatar?
          @show_avatar && avatar.present?
        end
        
        def has_user_dropdown?
          @show_user_dropdown && user_dropdown.present?
        end
        
        def has_icon_buttons?
          @show_icon_buttons && icon_buttons.any?
        end
        
        def has_right_section?
          has_actions? || has_avatar? || has_user_dropdown? || has_icon_buttons?
        end

        # Attributi per il wrapper principale (header)
        def wrapper_attributes
          {
            class: container_classes,
            'data-controller': 'bui-navbar'
          }.merge(@html_options.except(:class))
        end
      end
    end
  end
end
