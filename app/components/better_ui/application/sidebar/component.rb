# frozen_string_literal: true

module BetterUi
  module Application
    module Sidebar
      class Component < BetterUi::Component
        attr_reader :width, :position, :theme, :shadow

        # renders_one e renders_many per la nuova struttura
        renders_one :header, "BetterUi::Application::Sidebar::HeaderComponent"
        renders_one :footer, "BetterUi::Application::Sidebar::FooterComponent"
        renders_many :navigation_sections, "BetterUi::Application::Sidebar::NavigationSectionComponent"

        # Costanti seguendo le regole del progetto
        SIDEBAR_WIDTH_CLASSES = {
          sm: "w-48",
          md: "w-64",
          lg: "w-72",
          xl: "w-80"
        }.freeze

        SIDEBAR_POSITION_CLASSES = {
          left: "left-0",
          right: "right-0"
        }.freeze

        SIDEBAR_THEME_CLASSES = {
          default: "bg-white text-gray-900",
          white: "bg-white text-gray-900",
          red: "bg-red-50 text-red-900",
          rose: "bg-rose-50 text-rose-900",
          orange: "bg-orange-50 text-orange-900",
          green: "bg-green-50 text-green-900",
          blue: "bg-blue-50 text-blue-900",
          yellow: "bg-yellow-50 text-yellow-900",
          violet: "bg-violet-50 text-violet-900"
        }.freeze

        SIDEBAR_SHADOW_CLASSES = {
          none: "",
          sm: "shadow-sm",
          md: "shadow-md",
          lg: "shadow-lg",
          xl: "shadow-xl"
        }.freeze

        # Configurazione con validazione automatica
        configure_attributes({
          width: {
            var: :@width,
            default: :md,
            constants: [:SIDEBAR_WIDTH_CLASSES],
            methods: [:get_width_class]
          },
          position: {
            var: :@position,
            default: :left,
            constants: [:SIDEBAR_POSITION_CLASSES],
            methods: [:get_position_class]
          },
          theme: {
            var: :@theme,
            default: :default,
            constants: [:SIDEBAR_THEME_CLASSES],
            methods: [:get_theme_class]
          },
          shadow: {
            var: :@shadow,
            default: :lg,
            constants: [:SIDEBAR_SHADOW_CLASSES],
            methods: [:get_shadow_class]
          }
        })

        def initialize(
          width: :md,
          position: :left,
          theme: :default,
          shadow: :lg,
          **html_options
        )
          @width = width.to_sym
          @position = position.to_sym
          @theme = theme.to_sym
          @shadow = shadow.to_sym
          @html_options = html_options
          
          validate_params  # Validazione automatica generata da configure_attributes
        end

        def wrapper_classes
          classes = [
            "fixed top-0 h-full z-40 transition-transform duration-300 ease-in-out",
            get_width_class,
            get_position_class,
            get_theme_class,
            get_shadow_class
          ]
          
          classes << @html_options[:class] if @html_options[:class].present?
          
          classes.compact.join(" ")
        end

        private

        def has_header?
          header.present?
        end

        def has_footer?
          footer.present?
        end

        def has_navigation_sections?
          navigation_sections.any?
        end
      end
    end
  end
end
