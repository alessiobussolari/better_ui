module BetterUi
  class ButtonComponent < ViewComponent::Base
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

    # Classe CSS comune
    def base_class
      "better-ui-button inline-flex items-center justify-center rounded-md font-medium transition-colors focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
    end

    # Classe CSS per il tipo di bottone
    def type_class
      if @outline
        OUTLINE_BUTTON_TYPES[@type] || OUTLINE_BUTTON_TYPES[:primary]
      else
        BUTTON_TYPES[@type] || BUTTON_TYPES[:primary]
      end
    end

    # Classe CSS per la dimensione
    def size_class
      BUTTON_SIZES[@size] || BUTTON_SIZES[:md]
    end

    # Classe CSS per larghezza piena
    def width_class
      @full_width ? "w-full" : ""
    end

    # Combina tutte le classi
    def combined_classes
      [
        base_class,
        type_class,
        size_class,
        width_class,
        @classes
      ].compact.join(" ")
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
      # Implementazione base per le icone
      content_tag :i, "", class: "icon icon-#{icon_name}"
    end
  end
end 