module BetterUi
  module General
    class ButtonComponent < ViewComponent::Base
      attr_reader :label, :type, :size, :outline, :full_width, :disabled, 
                  :icon, :icon_position, :href, :method, :data, :classes, :id

      # Tipi di bottoni disponibili con classi Tailwind staticamente definite
      BUTTON_TYPES = {
        primary: "bg-blue-600 hover:bg-blue-700 text-white",
        secondary: "bg-gray-200 hover:bg-gray-300 text-gray-800",
        success: "bg-green-600 hover:bg-green-700 text-white",
        danger: "bg-red-600 hover:bg-red-700 text-white",
        warning: "bg-yellow-500 hover:bg-yellow-600 text-white",
        info: "bg-sky-500 hover:bg-sky-600 text-white",
        light: "bg-white hover:bg-gray-100 text-gray-800 border border-gray-300",
        dark: "bg-gray-800 hover:bg-gray-900 text-white"
      }

      # Classi per bottoni outline
      OUTLINE_BUTTON_TYPES = {
        primary: "bg-transparent text-blue-600 border-blue-600 border hover:text-white hover:bg-blue-600",
        secondary: "bg-transparent text-gray-800 border-gray-200 border hover:text-white hover:bg-gray-200",
        success: "bg-transparent text-green-600 border-green-600 border hover:text-white hover:bg-green-600",
        danger: "bg-transparent text-red-600 border-red-600 border hover:text-white hover:bg-red-600",
        warning: "bg-transparent text-yellow-500 border-yellow-500 border hover:text-white hover:bg-yellow-500",
        info: "bg-transparent text-sky-500 border-sky-500 border hover:text-white hover:bg-sky-500",
        light: "bg-transparent text-gray-800 border-gray-300 border hover:text-gray-900 hover:bg-gray-100",
        dark: "bg-transparent text-gray-800 border-gray-800 border hover:text-white hover:bg-gray-800"
      }

      # Dimensioni disponibili
      BUTTON_SIZES = {
        sm: "py-1 px-2 text-sm",
        md: "py-2 px-4 text-base",
        lg: "py-3 px-6 text-lg"
      }

      # Inizializzazione del componente
      def initialize(
        label: nil,
        type: :primary,
        size: :md,
        outline: false,
        full_width: false,
        disabled: false,
        icon: nil,
        icon_position: :left,
        href: nil,
        method: nil,
        data: {},
        classes: nil,
        id: nil
      )
        @label = label
        @type = type.to_sym
        @size = size.to_sym
        @outline = outline
        @full_width = full_width
        @disabled = disabled
        @icon = icon
        @icon_position = icon_position.to_sym
        @href = href
        @method = method
        @data = data
        @classes = classes
        @id = id
      end

      # Determina se il bottone è un link o un button
      def link?
        @href.present?
      end

      # Combina tutte le classi
      def combined_classes
        [
          "inline-flex items-center justify-center rounded-md font-medium",
          "transition-colors focus:outline-none focus:ring-2 focus:ring-offset-2",
          get_button_type_classes,
          get_button_size_classes,
          @full_width ? "w-full" : "",
          @disabled ? "opacity-50 cursor-not-allowed" : "",
          @classes
        ].compact.join(" ")
      end
      
      def get_button_type_classes
        if @outline
          get_outline_button_classes
        else
          get_solid_button_classes
        end
      end
      
      def get_solid_button_classes
        case @type
        when :primary
          "bg-orange-500 text-white hover:bg-orange-600 focus:ring-orange-500"
        when :secondary
          "bg-gray-200 text-gray-800 hover:bg-gray-300 focus:ring-gray-300"
        when :success
          "bg-green-500 text-white hover:bg-green-600 focus:ring-green-500"
        when :danger
          "bg-red-500 text-white hover:bg-red-600 focus:ring-red-500"
        when :warning
          "bg-amber-500 text-white hover:bg-amber-600 focus:ring-amber-500"
        when :info
          "bg-blue-500 text-white hover:bg-blue-600 focus:ring-blue-500"
        when :light
          "bg-white text-gray-800 border border-gray-300 hover:bg-gray-100 focus:ring-gray-300"
        when :dark
          "bg-gray-800 text-white hover:bg-gray-900 focus:ring-gray-800"
        else
          "bg-orange-500 text-white hover:bg-orange-600 focus:ring-orange-500"
        end
      end
      
      def get_outline_button_classes
        case @type
        when :primary
          "bg-transparent text-orange-500 border-2 border-orange-500 hover:bg-orange-50 focus:ring-orange-500"
        when :secondary
          "bg-transparent text-gray-800 border-2 border-gray-300 hover:bg-gray-50 focus:ring-gray-300"
        when :success
          "bg-transparent text-green-500 border-2 border-green-500 hover:bg-green-50 focus:ring-green-500"
        when :danger
          "bg-transparent text-red-500 border-2 border-red-500 hover:bg-red-50 focus:ring-red-500"
        when :warning
          "bg-transparent text-amber-500 border-2 border-amber-500 hover:bg-amber-50 focus:ring-amber-500"
        when :info
          "bg-transparent text-blue-500 border-2 border-blue-500 hover:bg-blue-50 focus:ring-blue-500"
        when :light
          "bg-transparent text-gray-800 border-2 border-gray-300 hover:bg-gray-50 focus:ring-gray-300"
        when :dark
          "bg-transparent text-gray-800 border-2 border-gray-800 hover:bg-gray-50 focus:ring-gray-800"
        else
          "bg-transparent text-orange-500 border-2 border-orange-500 hover:bg-orange-50 focus:ring-orange-500"
        end
      end
      
      def get_button_size_classes
        case @size
        when :sm
          "py-1 px-2.5 text-xs"
        when :lg
          "py-2.5 px-6 text-base"
        else # :md
          "py-2 px-4 text-sm"
        end
      end
      
      # Restituisce gli attributi per il bottone
      def button_attributes
        attrs = {
          class: combined_classes,
          type: "button",
          id: @id
        }
        
        attrs[:disabled] = true if @disabled
        attrs[:data] = @data if @data.present?
        attrs
      end
      
      # Restituisce gli attributi per il link
      def link_attributes
        attrs = {
          class: combined_classes,
          id: @id
        }
        
        attrs[:data] = @data.merge(turbo_method: @method) if @method.present?
        attrs[:data] = @data if @data.present? && !@method.present?
        attrs[:href] = @disabled ? nil : @href
        attrs[:role] = "button"
        attrs[:tabindex] = @disabled ? "-1" : "0"
        attrs[:aria] = { disabled: @disabled } if @disabled
        
        attrs
      end
      
      # Helper per renderizzare le icone
      def render_icon(icon_name)
        # Utilizziamo il componente Icon
        render BetterUi::General::IconComponent.new(
          name: icon_name,
          size: @size == :lg ? :lg : :md,
          fixed_width: true
        )
      end
    end
  end
end 