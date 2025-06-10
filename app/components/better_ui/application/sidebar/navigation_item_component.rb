# frozen_string_literal: true

module BetterUi
  module Application
    module Sidebar
      class NavigationItemComponent < BetterUi::Component
        attr_reader :label, :href, :icon, :badge, :state, :item_type, :target, :method, :data, :is_child, :child_level

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

        # Costanti per styling dei child items
        NAVIGATION_ITEM_CHILD_CLASSES = {
          level_1: "group flex items-center py-2 text-xs font-medium rounded-md text-gray-500 hover:text-gray-800 hover:bg-gray-50",
          level_2: "group flex items-center py-2 text-xs font-medium rounded-md text-gray-500 hover:text-gray-800 hover:bg-gray-50",
          level_3: "group flex items-center py-2 text-xs font-medium rounded-md text-gray-500 hover:text-gray-800 hover:bg-gray-50"
        }.freeze

        NAVIGATION_ITEM_CHILD_PADDING_CLASSES = {
          level_1: "px-2 pl-6",
          level_2: "px-2 pl-8",
          level_3: "px-2 pl-10"
        }.freeze

        NAVIGATION_ITEM_CHILD_ICON_CLASSES = {
          level_1: "mr-2 flex-shrink-0 h-4 w-4",
          level_2: "mr-2 flex-shrink-0 h-3 w-3",
          level_3: "mr-2 flex-shrink-0 h-3 w-3"
        }.freeze

        # Sistema renders_many per sotto-elementi
        renders_many :children, "BetterUi::Application::Sidebar::NavigationItemComponent" do |**options|
          # Calcola automaticamente il child_level basato sul livello corrente
          current_level = @child_level || 0
          new_child_level = current_level + 1
          
          # Passa automaticamente is_child: true e incrementa child_level
          options.merge!(
            is_child: true,
            child_level: new_child_level
          )
          
          options
        end

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
          is_child: false,
          child_level: 0,
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
          @is_child = is_child
          @child_level = child_level
          @html_options = html_options
          
          validate_params  # ⚠️ OBBLIGATORIO - Validazione automatica
        end

        def item_classes
          if is_child?
            [
              get_child_level_class,
              get_child_padding_class,
              @html_options[:class]
            ].compact.join(" ")
          else
            [
              get_item_type_class,  # Metodo generato automaticamente
              get_state_class,      # Metodo generato automaticamente
              @html_options[:class]
            ].compact.join(" ")
          end
        end

        def icon_classes
          if is_child?
            base_classes = get_child_icon_class.split(" ")
          else
            base_classes = %w[mr-3 flex-shrink-0 h-6 w-6]
          end
          
          case @state
          when :active
            base_classes << "text-gray-500"
          when :disabled
            base_classes << "text-gray-400"
          else
            base_classes << "text-gray-300 group-hover:text-gray-400"
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

        def is_child?
          @is_child
        end

        def child_level
          @child_level
        end

        private

        def get_child_level_class
          case @child_level
          when 1
            NAVIGATION_ITEM_CHILD_CLASSES[:level_1]
          when 2
            NAVIGATION_ITEM_CHILD_CLASSES[:level_2]
          when 3
            NAVIGATION_ITEM_CHILD_CLASSES[:level_3]
          else
            ""
          end
        end

        def get_child_padding_class
          case @child_level
          when 1
            NAVIGATION_ITEM_CHILD_PADDING_CLASSES[:level_1]
          when 2
            NAVIGATION_ITEM_CHILD_PADDING_CLASSES[:level_2]
          when 3
            NAVIGATION_ITEM_CHILD_PADDING_CLASSES[:level_3]
          else
            ""
          end
        end

        def get_child_icon_class
          case @child_level
          when 1
            NAVIGATION_ITEM_CHILD_ICON_CLASSES[:level_1]
          when 2
            NAVIGATION_ITEM_CHILD_ICON_CLASSES[:level_2]
          when 3
            NAVIGATION_ITEM_CHILD_ICON_CLASSES[:level_3]
          else
            "mr-3 flex-shrink-0 h-6 w-6"
          end
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
            group w-full flex items-center px-2 py-2 text-left text-sm font-medium
            rounded-md focus:outline-none
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
            mt-1 space-y-1 border-l border-gray-200
          ].join(" ")
        end
      end
    end
  end
end