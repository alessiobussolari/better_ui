# frozen_string_literal: true

module BetterUi
  module General
    module Tabs
      class TabComponent < ViewComponent::Base
        include BetterUi::General::Components::Icon::IconHelper

        TAB_THEME_ACTIVE = {
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

        TAB_THEME_INACTIVE = {
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

        TAB_SIZE = {
          small: 'px-3 py-1.5 text-sm',
          medium: 'px-4 py-2 text-base',
          large: 'px-6 py-3 text-lg'
        }.freeze

        def initialize(text:, target:, active: false, icon: nil, disabled: false, badge: nil, 
                      theme: :default, size: :medium, classes: '', **options)
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

        def validate_params
          validate_theme
          validate_size
        end

        def validate_theme
          return if TAB_THEME_ACTIVE.key?(theme)

          raise ArgumentError, "Invalid theme: #{theme}. Must be one of #{TAB_THEME_ACTIVE.keys}"
        end

        def validate_size
          return if TAB_SIZE.key?(size)

          raise ArgumentError, "Invalid size: #{size}. Must be one of #{TAB_SIZE.keys}"
        end

        def tab_attributes
          theme_classes = active ? TAB_THEME_ACTIVE[theme] : TAB_THEME_INACTIVE[theme]
          
          base_classes = [
            'inline-flex items-center justify-center gap-2 font-medium rounded-md transition-colors',
            'focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500',
            TAB_SIZE[size],
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
