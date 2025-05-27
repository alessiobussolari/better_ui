module BetterUi
  module General
    module Button
      class Component < ViewComponent::Base
        attr_reader :label, :type, :size, :full_width, :disabled, 
                    :icon, :icon_position, :href, :method, :data, :classes, :id, :rounded, :button_type, :html_options

        # Classi base sempre presenti
        BUTTON_BASE_CLASSES = "inline-flex items-center justify-center font-medium transition-colors duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2"

        # Temi di bottoni con classi Tailwind dirette
        BUTTON_THEME = {
          default: "bg-black text-white hover:bg-gray-900 focus:ring-gray-900",
          white: "bg-white text-black border border-gray-300 hover:bg-gray-50 focus:ring-gray-400",
          red: "bg-red-500 text-white hover:bg-red-600 focus:ring-red-500",
          rose: "bg-rose-500 text-white hover:bg-rose-600 focus:ring-rose-500",
          orange: "bg-orange-500 text-white hover:bg-orange-600 focus:ring-orange-500",
          green: "bg-green-500 text-white hover:bg-green-600 focus:ring-green-500",
          blue: "bg-blue-500 text-white hover:bg-blue-600 focus:ring-blue-500",
          yellow: "bg-yellow-500 text-black hover:bg-yellow-600 focus:ring-yellow-500",
          violet: "bg-violet-500 text-white hover:bg-violet-600 focus:ring-violet-500",
          purple: "bg-purple-500 text-white hover:bg-purple-600 focus:ring-purple-500",
        }

        # Dimensioni con classi Tailwind dirette
        BUTTON_SIZES = {
          small: "px-2.5 py-1.5 text-xs",
          medium: "px-4 py-2 text-sm",
          large: "px-6 py-3 text-base"
        }
        
        # Border radius con classi Tailwind dirette
        BUTTON_RADIUS = {
          none: "rounded-none",
          small: "rounded-md",
          medium: "rounded-lg",
          large: "rounded-xl",
          full: "rounded-full"
        }

        # Inizializzazione del componente
        def initialize(
          label: nil,
          type: :white,
          size: :medium,
          full_width: false,
          disabled: false,
          icon: nil,
          icon_position: :left,
          href: nil,
          method: nil,
          data: {},
          classes: nil,
          id: nil,
          rounded: :medium,
          button_type: :button,
          **html_options
        )
          @label = label
          @type = type.to_sym
          @size = size.to_sym
          @full_width = full_width
          @disabled = disabled
          @icon = icon
          @icon_position = icon_position.to_sym
          @href = href
          @method = method
          @data = data
          @classes = classes
          @id = id
          @rounded = rounded.to_sym
          @button_type = button_type.to_sym
          @html_options = html_options

          validate_params
        end

        # Determina se il bottone è un link o un button
        def link?
          @href.present?
        end

        # Combina tutte le classi
        def combined_classes
          [
            BUTTON_BASE_CLASSES,
            get_button_type_classes,
            get_button_size_classes,
            get_border_radius_class,
            @full_width ? "w-full" : nil,
            @disabled ? "opacity-50 cursor-not-allowed" : nil,
            @classes,
            @html_options[:class]
          ].compact.join(" ")
        end
        
        def get_button_type_classes
          BUTTON_THEME[@type] || BUTTON_THEME[:white]
        end
        
        def get_border_radius_class
          BUTTON_RADIUS[@rounded] || BUTTON_RADIUS[:medium]
        end
        
        def get_button_size_classes
          BUTTON_SIZES[@size] || BUTTON_SIZES[:medium]
        end
        
        # Restituisce gli attributi per il bottone
        def button_attributes
          attrs = {
            class: combined_classes,
            type: button_type,
            id: @id
          }
          
          attrs[:disabled] = true if @disabled
          attrs[:data] = @data if @data.present?
          
          # Aggiungi altri attributi HTML se presenti
          @html_options.except(:class).each do |key, value|
            attrs[key] = value
          end
          
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
          
          # Aggiungi altri attributi HTML se presenti
          @html_options.except(:class).each do |key, value|
            attrs[key] = value
          end
          
          attrs
        end
        
        def button_type
          @button_type || 'button'
        end

        # Helper per renderizzare le icone
        def render_icon(icon_name)
          # Mappa le dimensioni del bottone alle dimensioni dell'icona
          icon_size = case @size
                     when :large
                       :large
                     when :small
                       :small
                     else
                       :medium
                     end
          
          # Utilizziamo il componente Icon
          render BetterUi::General::Icon::Component.new(
            name: icon_name,
            size: icon_size,
            fixed_width: true
          )
        end

        # Verifica se rendere il componente
        def render?
          @label.present? || @icon.present? || content.present?
        end

        private

        def validate_params
          validate_type
          validate_size
          validate_icon_position
          validate_rounded
        end

        def validate_type
          unless BUTTON_THEME.keys.include?(@type)
            raise ArgumentError, "Il tipo deve essere uno tra: #{BUTTON_THEME.keys.join(', ')}"
          end
        end

        def validate_size
          unless BUTTON_SIZES.keys.include?(@size)
            raise ArgumentError, "La dimensione deve essere una tra: #{BUTTON_SIZES.keys.join(', ')}"
          end
        end

        def validate_icon_position
          unless [:left, :right].include?(@icon_position)
            raise ArgumentError, "La posizione dell'icona deve essere :left o :right"
          end
        end

        def validate_rounded
          unless BUTTON_RADIUS.keys.include?(@rounded)
            raise ArgumentError, "Il bordo deve essere uno tra: #{BUTTON_RADIUS.keys.join(', ')}"
          end
        end
      end
    end
  end
end
