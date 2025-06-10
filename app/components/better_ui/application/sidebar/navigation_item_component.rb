# frozen_string_literal: true

module BetterUi
  module Application
    module Sidebar
      class NavigationItemComponent < BetterUi::Component
        attr_reader :label, :href, :icon, :badge, :state, :item_type, :target, :method, :data

delegate :bui_icon, :bui_badge, to: :helpers

        # Costanti conformi alle regole
        NAVIGATION_ITEM_STATE_CLASSES = {
          default: "text-gray-600 hover:text-gray-900 hover:bg-gray-50",
          active: "bg-gray-100 text-gray-900",
          disabled: "text-gray-400 cursor-not-allowed",
          loading: "text-gray-400 cursor-wait"
        }.freeze

        NAVIGATION_ITEM_TYPE_CLASSES = {
          link: "group flex items-center px-2 py-2 text-sm font-medium rounded-md",
          button: "group flex items-center w-full px-2 py-2 text-sm font-medium rounded-md text-left",
          static: "group flex items-center px-2 py-2 text-sm font-medium"
        }.freeze

        # Sistema renders_many per sotto-elementi
        renders_many :children, "BetterUi::Application::Sidebar::NavigationItemComponent"

        # Configurazione automatica con validazione
        configure_attributes({
          state: {
            var: :@state,
            default: :default,
            constants: [:NAVIGATION_ITEM_STATE_CLASSES],
            methods: [:get_state_class]
          },
          item_type: {
            var: :@item_type,
            default: :link,
            constants: [:NAVIGATION_ITEM_TYPE_CLASSES],
            methods: [:get_item_type_class]
          }
        })

        def initialize(
          label:,
          href: nil,
          icon: nil,
          badge: nil,
          state: :default,
          item_type: :link,
          target: nil,
          method: nil,
          data: {},
          **html_options
        )
          @label = label
          @href = href
          @icon = icon
          @badge = badge
          @state = state.to_sym
          @item_type = item_type.to_sym
          @target = target
          @method = method
          @data = data || {}
          @html_options = html_options
          
          validate_params  # ⚠️ OBBLIGATORIO - Validazione automatica
        end

        def item_classes
          [
            get_item_type_class,  # Metodo generato automaticamente
            get_state_class,      # Metodo generato automaticamente
            @html_options[:class]
          ].compact.join(" ")
        end

        def icon_classes
          base_classes = %w[mr-3 flex-shrink-0 h-6 w-6]
          
          case @state
          when :active
            base_classes << "text-gray-500"
          when :disabled
            base_classes << "text-gray-400"
          else
            base_classes << "text-gray-400 group-hover:text-gray-500"
          end
          
          base_classes.join(" ")
        end

        def has_icon?
          @icon.present?
        end

        def has_badge?
          @badge.present?
        end

        def has_children?
          children.any?
        end

        def is_link?
          @href.present? && @state != :disabled
        end

        def is_active?
          @state == :active
        end

        def is_disabled?
          @state == :disabled
        end

        def link_options
          options = {
            class: item_classes,
            data: @data
          }
          
          options[:target] = @target if @target.present?
          options[:method] = @method if @method.present?
          
          options
        end

        def section_id
          "sidebar-section-#{label.parameterize}"
        end

        def collapsible?
          has_children?
        end

        def button_classes
          base_classes = %w[
            group w-full flex items-center pr-2 py-2 text-left text-sm font-medium
            rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500
          ]
          
          case @state
          when :active
            base_classes << "bg-gray-100 text-gray-900"
          when :disabled
            base_classes << "text-gray-400 cursor-not-allowed"
          else
            base_classes << "text-gray-600 hover:text-gray-900 hover:bg-gray-50"
          end
          
          base_classes.join(" ")
        end

        def chevron_classes
          %w[
            ml-3 h-5 w-5 flex-shrink-0 transform transition-transform duration-150
            group-hover:text-gray-400
          ].join(" ")
        end

        def children_classes
          %w[
            mt-1 space-y-1 pl-4 border-l border-gray-200
          ].join(" ")
        end
      end
    end
  end
end