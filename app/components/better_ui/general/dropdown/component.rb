# frozen_string_literal: true

module BetterUi
  module General
    module Dropdown
      class Component < BetterUi::Component
        # Delega per rendere disponibile bui_icon nel template
        delegate :bui_icon, to: :helpers

        # Classi base spostate nel template HTML per migliore leggibilità

        # Temi per il trigger del dropdown con classi Tailwind dirette
        DROPDOWN_THEME_CLASSES = {
          default: "bg-white border-gray-300 text-gray-700 hover:bg-gray-50 focus:ring-blue-500",
          white: "bg-white border-gray-300 text-gray-900 hover:bg-gray-50 focus:ring-gray-500",
          red: "bg-red-600 border-red-600 text-white hover:bg-red-700 focus:ring-red-500",
          rose: "bg-rose-600 border-rose-600 text-white hover:bg-rose-700 focus:ring-rose-500",
          orange: "bg-orange-600 border-orange-600 text-white hover:bg-orange-700 focus:ring-orange-500",
          green: "bg-green-600 border-green-600 text-white hover:bg-green-700 focus:ring-green-500",
          blue: "bg-blue-600 border-blue-600 text-white hover:bg-blue-700 focus:ring-blue-500",
          yellow: "bg-yellow-500 border-yellow-500 text-white hover:bg-yellow-600 focus:ring-yellow-500",
          violet: "bg-violet-600 border-violet-600 text-white hover:bg-violet-700 focus:ring-violet-500"
        }.freeze

        # Dimensioni del trigger con classi Tailwind dirette - Sistema uniforme 7 livelli
        DROPDOWN_SIZE_CLASSES = {
          xxs: "px-1 py-0.5 text-xs",     # Extra extra small
          xs: "px-2 py-1 text-xs",        # Extra small
          sm: "px-3 py-1.5 text-sm",      # Small
          md: "px-4 py-2 text-sm",        # Medium (default)
          lg: "px-6 py-3 text-base",      # Large
          xl: "px-8 py-4 text-lg",        # Extra large
          xxl: "px-10 py-5 text-xl"       # Extra extra large
        }.freeze

        # Border radius con classi Tailwind dirette
        DROPDOWN_ROUNDED_CLASSES = {
          none: "rounded-none",
          xxs: "rounded-sm",
          xs: "rounded",
          sm: "rounded-md",
          md: "rounded-lg",
          lg: "rounded-xl",
          xl: "rounded-2xl",
          xxl: "rounded-3xl",
          full: "rounded-full"
        }.freeze

        # Posizioni del menu dropdown
        DROPDOWN_POSITION_CLASSES = {
          bottom: "top-full left-0 mt-2 origin-top-left",
          top: "bottom-full left-0 mb-2 origin-bottom-left",
          left: "top-0 right-full mr-2 origin-top-right",
          right: "top-0 left-full ml-2 origin-top-left"
        }.freeze

        # Animazioni del dropdown
        DROPDOWN_ANIMATION_CLASSES = {
          fade: "transition-opacity duration-150",
          slide: "transition-all duration-150 transform",
          none: ""
        }.freeze

        # Stili per full-width del trigger
        DROPDOWN_FULLWIDTH_CLASSES = {
          true => "w-full text-left justify-start",
          false => "inline-flex justify-center"
        }.freeze

        configure_attributes({
          theme: {
            var: :@theme,
            default: :default,
            constants: [:DROPDOWN_THEME_CLASSES],
            methods: [:get_trigger_theme_class]
          },
          size: {
            var: :@size,
            default: :md,
            constants: [:DROPDOWN_SIZE_CLASSES],
            methods: [:get_trigger_size_class]
          },
          rounded: {
            var: :@rounded,
            default: :md,
            constants: [:DROPDOWN_ROUNDED_CLASSES],
            methods: [:get_rounded_class]
          },
          position: {
            var: :@position,
            default: :bottom,
            constants: [:DROPDOWN_POSITION_CLASSES],
            methods: [:get_position_class]
          },
          animation: {
            var: :@animation,
            default: :fade,
            constants: [:DROPDOWN_ANIMATION_CLASSES],
            methods: [:get_animation_class]
          },
          fullwidth: {
            var: :@fullwidth,
            default: false,
            constants: [:DROPDOWN_FULLWIDTH_CLASSES],
            methods: [:get_fullwidth_class]
          }
        })

        def initialize(
          trigger:,
          position: :bottom,
          theme: :default,
          size: :md,
          rounded: :md,
          animation: :fade,
          fullwidth: false,
          show_chevron: true,
          selectable: false,
          classes: nil,
          **html_options
        )
          @trigger = trigger
          @fullwidth = fullwidth
          @show_chevron = show_chevron
          @selectable = selectable
          @classes = classes
          @position = position
          @html_options = html_options

          super(theme: theme, size: size, rounded: rounded, position: position, animation: animation)
        end

        def fullwidth_classes
          [
            get_fullwidth_class
          ].compact.join(" ")
        end

        # Restituisce solo le classi dinamiche per il trigger
        def dynamic_trigger_classes
          [
            get_trigger_theme_class,
            get_trigger_size_class,
            get_rounded_class
          ].compact.join(" ")
        end

        # Restituisce solo le classi dinamiche per il menu
        def dynamic_menu_classes
          classes = [
            get_position_class,
            get_animation_class,
            get_rounded_class
          ].compact.join(" ")
          
          classes
        end

        # Verifica se rendere il componente
        def render?
          @trigger.present?
        end



        private
      end
    end
  end
end
