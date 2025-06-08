module BetterUi
  module General
    module Button
      class Component < ViewComponent::Base
        attr_reader :text, :theme, :size, :full_width, :disabled,
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
          purple: "bg-purple-500 text-white hover:bg-purple-600 focus:ring-purple-500"
        }

        # Dimensioni con classi Tailwind dirette - Sistema uniforme 7 livelli
        BUTTON_SIZES = {
          xxs: "px-1 py-0.5 text-xs", # Extra extra small
          xs: "px-1.5 py-1 text-xs", # Extra small
          sm: "px-2.5 py-1.5 text-xs", # Small
          md: "px-4 py-2 text-sm", # Medium (default)
          lg: "px-6 py-3 text-base", # Large
          xl: "px-8 py-4 text-lg", # Extra large
          xxl: "px-10 py-5 text-xl" # Extra extra large
        }

        # Border radius con classi Tailwind dirette
        BUTTON_RADIUS = {
          none: "rounded-none",
          xxs: "rounded-sm",
          xs: "rounded",
          sm: "rounded-md",
          md: "rounded-lg",
          lg: "rounded-xl",
          xl: "rounded-2xl",
          xxl: "rounded-3xl",
          full: "rounded-full"
        }

        BUTTON_ICON_POSITION = {
          left: :left,
          right: :right
        }

        # Inizializzazione del componente
        def initialize(
          text: nil,
          theme: :white,
          size: :md,
          full_width: false,
          disabled: false,
          icon: nil,
          icon_position: :left,
          href: nil,
          method: nil,
          data: {},
          classes: nil,
          id: nil,
          rounded: :md,
          button_type: :button,
          **html_options
        )
          @text = text
          @theme = theme.to_sym
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
          @button_type || "button"
        end

        # Helper per renderizzare le icone
        def render_icon(icon_name)
          # Mappa le dimensioni del bottone alle dimensioni dell'icona
          icon_size = case @size
                      when :xxs then :xxs
                      when :xs then :xs
                      when :sm then :sm
                      when :md then :md
                      when :lg then :lg
                      when :xl then :xl
                      when :xxl then :xxl
                      else :md
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
          @text.present? || @icon.present? || content.present?
        end

        private

        [
          { constant: :BUTTON_THEME, var: :@theme, default: :white, method: :get_button_type_classes },
          { constant: :BUTTON_RADIUS, var: :@rounded, default: :xs, method: :get_border_radius_class },
          { constant: :BUTTON_SIZES, var: :@size, default: :md, method: :get_button_size_classes }
        ].each do |config|
          define_method config[:method] do
            constant_hash = self.class.const_get(config[:constant])
            value = instance_variable_get(config[:var])
            constant_hash[value] || constant_hash[config[:default]]
          end
        end


        def validate_params
          validate_theme # ← SENZA @theme
          validate_size # ← SENZA @size
          validate_icon_position
          validate_rounded
        end

        [
          { values: BUTTON_THEME.keys, method: :validate_theme, param: 'theme', var: :@theme },
          { values: BUTTON_SIZES.keys, method: :validate_size, param: 'size', var: :@size },
          { values: BUTTON_ICON_POSITION.keys, method: :validate_icon_position, param: 'icon_position', var: :@icon_position },
          { values: BUTTON_RADIUS.keys, method: :validate_rounded, param: 'rounded', var: :@rounded },
        ].each do |validation|
          define_method validation[:method] do
            value = instance_variable_get(validation[:var])
            unless validation[:values].include?(value)
              raise ArgumentError, "#{self.class.name} - parametro '#{validation[:param]}' con valore '#{value}' non è valido. Deve essere uno tra: #{validation[:values].join(', ')}"
            end
          end
        end

      end
    end
  end
end
