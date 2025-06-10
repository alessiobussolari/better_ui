# frozen_string_literal: true

module BetterUi
  module General
    module Tabs
      class TabComponent < BetterUi::Component
        include BetterUi::General::Components::Icon::IconHelper

        TAB_THEME_ACTIVE_CLASSES = {
          default: 'bg-white text-gray-900 shadow-sm',
          blue: 'bg-blue-600 text-white',
          red: 'bg-red-600 text-white',
          green: 'bg-green-600 text-white',
          yellow: 'bg-yellow-600 text-white',
          violet: 'bg-violet-600 text-white',
          orange: 'bg-orange-600 text-white',
          rose: 'bg-rose-600 text-white',
          white: 'bg-white text-gray-900'
        }.freeze

        TAB_THEME_INACTIVE_CLASSES = {
          default: 'text-gray-500 hover:text-gray-700',
          blue: 'text-blue-600 hover:text-blue-700',
          red: 'text-red-600 hover:text-red-700',
          green: 'text-green-600 hover:text-green-700',
          yellow: 'text-yellow-600 hover:text-yellow-700',
          violet: 'text-violet-600 hover:text-violet-700',
          orange: 'text-orange-600 hover:text-orange-700',
          rose: 'text-rose-600 hover:text-rose-700',
          white: 'text-gray-600 hover:text-gray-700'
        }.freeze

        TAB_SIZE_CLASSES = {
          xxs: 'px-1 py-0.5 text-xs',
          xs: 'px-2 py-1 text-xs',
          sm: 'px-3 py-1.5 text-sm',
          md: 'px-4 py-2 text-base',
          lg: 'px-6 py-3 text-lg',
          xl: 'px-8 py-4 text-xl',
          xxl: 'px-10 py-5 text-2xl'
        }.freeze

        configure_attributes({
          theme: {
            var: :@theme,
            default: :default,
            constants: [:TAB_THEME_ACTIVE_CLASSES, :TAB_THEME_INACTIVE_CLASSES],
            methods: [:get_theme_active_class, :get_theme_inactive_class]
          },
          size: {
            var: :@size,
            default: :md,
            constants: [:TAB_SIZE_CLASSES],
            methods: [:get_size_class]
          }
        })

        def initialize(text:, target:, active: false, icon: nil, disabled: false, badge: nil, 
                      theme: :default, size: :md, classes: '', **options)
          @text = text
          @target = target
          @active = active
          @icon = icon
          @disabled = disabled
          @badge = badge
          @theme = theme
          @size = size
          @classes = classes
          @options = options

          validate_params
        end

        private

        attr_reader :text, :target, :active, :icon, :disabled, :badge, :theme, :size, :classes, :options



        def tab_attributes
          theme_classes = active ? get_theme_active_class : get_theme_inactive_class
          
          base_classes = [
            'inline-flex items-center justify-center gap-2 font-medium rounded-md transition-colors',
            'focus:outline-none focus:ring-blue-500',
            get_size_class,
            theme_classes,
            disabled ? 'opacity-50 cursor-not-allowed' : 'cursor-pointer',
            classes
          ].compact.join(' ')

          {
            class: base_classes,
            role: 'tab',
            'aria-selected': active.to_s,
            'aria-controls': target,
            'data-bui-tabs-target': 'tab',
            'data-target': target,
            'data-action': disabled ? '' : 'click->bui-tabs#switchTab keydown->bui-tabs#keydown',
            tabindex: active ? '0' : '-1',
            id: "tab-#{target}"
          }.merge(options)
        end

        def has_icon?
          icon.present?
        end

        def has_badge?
          badge.present?
        end
      end
    end
  end
end
