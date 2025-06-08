# frozen_string_literal: true

module BetterUi
  module General
    module Dropdown
      class Component < ViewComponent::Base
        include BetterUi::General::Components::Icon::IconHelper
        
        attr_reader :trigger, :position, :theme, :size, :rounded, :animation, :fullwidth, :show_chevron, :selectable, :classes, :html_options

        # Classi base spostate nel template HTML per migliore leggibilità

        # Temi per il trigger del dropdown con classi Tailwind dirette
        DROPDOWN_TRIGGER_THEME = {
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
        DROPDOWN_TRIGGER_SIZE = {
          xxs: "px-1 py-0.5 text-xs",     # Extra extra small
          xs: "px-2 py-1 text-xs",        # Extra small
          sm: "px-3 py-1.5 text-sm",      # Small
          md: "px-4 py-2 text-sm",        # Medium (default)
          lg: "px-6 py-3 text-base",      # Large
          xl: "px-8 py-4 text-lg",        # Extra large
          xxl: "px-10 py-5 text-xl"       # Extra extra large
        }.freeze

        # Border radius con classi Tailwind dirette
        DROPDOWN_ROUNDED = {
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
        DROPDOWN_POSITION = {
          bottom: "top-full left-0",
          top: "bottom-full left-0",
          left: "top-0 right-full mr-2",
          right: "top-0 left-full ml-2"
        }.freeze

        # Animazioni del dropdown
        DROPDOWN_ANIMATION = {
          fade: "transition-opacity duration-150",
          slide: "transition-all duration-150 transform",
          none: ""
        }.freeze

        # Stili per full-width del trigger
        DROPDOWN_FULLWIDTH = {
          true => "w-full text-left justify-start",
          false => "inline-flex justify-center"
        }.freeze

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
          @position = position.to_sym
          @theme = theme.to_sym
          @size = size.to_sym
          @rounded = rounded.to_sym
          @animation = animation.to_sym
          @fullwidth = fullwidth
          @show_chevron = show_chevron
          @selectable = selectable
          @classes = classes
          @html_options = html_options

          validate_params
        end

        def fullwidth_classes
          [
            get_fullwidth_classes
          ].compact.join(" ")
        end

        # Restituisce solo le classi dinamiche per il trigger
        def dynamic_trigger_classes
          [
            get_trigger_theme_classes,
            get_trigger_size_classes,
            get_trigger_rounded_classes
          ].compact.join(" ")
        end

        # Restituisce solo le classi dinamiche per il menu
        def dynamic_menu_classes
          [
            get_position_classes,
            get_animation_classes,
            get_menu_rounded_classes
          ].compact.join(" ")
        end

        # Metodi per attributi rimossi - ora gestiti direttamente nel template HTML

        # Verifica se rendere il componente
        def render?
          @trigger.present?
        end

        private

        # Definizione dinamica dei metodi get
        [
          { constant: 'DROPDOWN_TRIGGER_THEME', method: :get_trigger_theme_classes, var: :@theme, default: :default },
          { constant: 'DROPDOWN_TRIGGER_SIZE', method: :get_trigger_size_classes, var: :@size, default: :md },
          { constant: 'DROPDOWN_ROUNDED', method: :get_trigger_rounded_classes, var: :@rounded, default: :md },
          { constant: 'DROPDOWN_ROUNDED', method: :get_menu_rounded_classes, var: :@rounded, default: :md },
          { constant: 'DROPDOWN_POSITION', method: :get_position_classes, var: :@position, default: :bottom },
          { constant: 'DROPDOWN_ANIMATION', method: :get_animation_classes, var: :@animation, default: :fade },
          { constant: 'DROPDOWN_FULLWIDTH', method: :get_fullwidth_classes, var: :@fullwidth, default: false }
        ].each do |config|
          define_method(config[:method]) do
            constant_value = self.class.const_get(config[:constant])
            value = instance_variable_get(config[:var])
            constant_value[value] || constant_value[config[:default]]
          end
        end

        def validate_params
          validate_theme
          validate_size
          validate_rounded
          validate_position
          validate_animation
        end

        # Definizione dinamica delle validazioni
        [
          { values: DROPDOWN_TRIGGER_THEME.keys, method: :validate_theme, param: 'tema', var: :@theme },
          { values: DROPDOWN_TRIGGER_SIZE.keys, method: :validate_size, param: 'dimensione', var: :@size },
          { values: DROPDOWN_ROUNDED.keys, method: :validate_rounded, param: 'border radius', var: :@rounded },
          { values: DROPDOWN_POSITION.keys, method: :validate_position, param: 'posizione', var: :@position },
          { values: DROPDOWN_ANIMATION.keys, method: :validate_animation, param: 'animazione', var: :@animation }
        ].each do |config|
          define_method(config[:method]) do
            value = instance_variable_get(config[:var])
            unless config[:values].include?(value)
              raise ArgumentError, "#{config[:param].capitalize} non valido: #{value}. Valori supportati: #{config[:values].join(', ')}"
            end
          end
        end
      end
    end
  end
end
