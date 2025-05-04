module BetterUi
  module General
    class ButtonComponent < ViewComponent::Base
      attr_reader :label, :type, :size, :full_width, :disabled, 
                  :icon, :icon_position, :href, :method, :data, :classes, :id, :rounded

      # Temi di bottoni disponibili con classi CSS personalizzate
      BUTTON_THEME = {
        default: "bui-button--default",
        white: "bui-button--white",
        red: "bui-button--red",
        rose: "bui-button--rose",
        orange: "bui-button--orange",
        green: "bui-button--green",
        blue: "bui-button--blue",
        yellow: "bui-button--yellow",
        violet: "bui-button--violet"
      }

      # Dimensioni disponibili con classi CSS personalizzate
      BUTTON_SIZES = {
        small: "bui-button--small",
        medium: "bui-button--medium",
        large: "bui-button--large"
      }
      
      # Border radius disponibili con classi CSS personalizzate
      BUTTON_RADIUS = {
        none: "bui-button--radius-none",
        small: "bui-button--radius-small",
        medium: "bui-button--radius-medium",
        large: "bui-button--radius-large",
        full: "bui-button--radius-full"
      }
      
      # Stati e comportamenti del bottone
      BUTTON_STATES = {
        disabled: "bui-button--disabled",
        full_width: "bui-button--full-width"
      }
      
      # Layout e stili comuni
      BUTTON_LAYOUT = {
        default: "bui-btn-layout-default",
        focus: "bui-btn-focus"
      }

      # Inizializzazione del componente
      def initialize(
        label: nil,
        type: :default,
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
        rounded: :small
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
      end

      # Determina se il bottone è un link o un button
      def link?
        @href.present?
      end

      # Combina tutte le classi
      def combined_classes
        [
          "bui-button", # Classe base per tutti i bottoni
          get_border_radius_class,
          get_button_type_classes,
          get_button_size_classes,
          @full_width ? BUTTON_STATES[:full_width] : "",
          @disabled ? BUTTON_STATES[:disabled] : "",
          @classes
        ].compact.join(" ")
      end
      
      def get_button_type_classes
        BUTTON_THEME[@type] || BUTTON_THEME[:default]
      end
      
      def get_border_radius_class
        BUTTON_RADIUS[@rounded] || BUTTON_RADIUS[:small]
      end
      
      def get_button_size_classes
        BUTTON_SIZES[@size] || BUTTON_SIZES[:medium]
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
        render BetterUi::General::IconComponent.new(
          name: icon_name,
          size: icon_size,
          fixed_width: true
        )
      end
    end
  end
end 