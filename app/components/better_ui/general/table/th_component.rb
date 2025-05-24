module BetterUi
  module General
    module Table
      class ThComponent < ViewComponent::Base
        attr_reader :theme, :sortable, :sorted, :sort_direction, :scope

        def initialize(
          theme: :default, 
          sortable: false, 
          sorted: false, 
          sort_direction: :asc, 
          scope: "col",
          **html_options
        )
          @theme = theme.to_sym
          @sortable = !!sortable
          @sorted = !!sorted
          @sort_direction = sort_direction.to_sym
          @scope = scope
          @html_options = html_options
        end

        def th_classes
          [
            "px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider",
            @sortable ? "cursor-pointer hover:bg-gray-200" : nil,
            @sorted ? "bg-gray-200" : nil,
            @html_options[:class]
          ].compact.join(" ")
        end

        def th_attributes
          attrs = @html_options.except(:class)
          attrs[:class] = th_classes
          attrs[:scope] = @scope
          attrs
        end

        def sort_icon
          return unless @sortable
          
          if @sorted
            @sort_direction == :asc ? "↑" : "↓"
          else
            "↕"
          end
        end
      end
    end
  end
end
