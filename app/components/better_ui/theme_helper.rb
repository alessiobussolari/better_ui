# frozen_string_literal: true

module BetterUi
  module ThemeHelper
    # Colori principali del tema
    THEME_COLORS = {
      # Varianti cromatiche
      default: {
        bg: 'bg-black',
        text: 'text-white',
        hover: 'hover:bg-gray-900'
      },
      white: {
        bg: 'bg-white',
        text: 'text-black',
        hover: 'hover:bg-gray-100'
      },
      red: {
        bg: 'bg-red-500',
        text: 'text-white',
        hover: 'hover:bg-red-600'
      },
      rose: {
        bg: 'bg-rose-500',
        text: 'text-white',
        hover: 'hover:bg-rose-600'
      },
      orange: {
        bg: 'bg-orange-500',
        text: 'text-white',
        hover: 'hover:bg-orange-600'
      },
      green: {
        bg: 'bg-green-500',
        text: 'text-white',
        hover: 'hover:bg-green-600'
      },
      blue: {
        bg: 'bg-blue-500',
        text: 'text-white',
        hover: 'hover:bg-blue-600'
      },
      yellow: {
        bg: 'bg-yellow-500',
        text: 'text-black',
        hover: 'hover:bg-yellow-600'
      },
      violet: {
        bg: 'bg-violet-500',
        text: 'text-white',
        hover: 'hover:bg-violet-600'
      }
    }
    
    # Bordi del tema
    THEME_BORDERS = {
      default: 'border-gray-900',
      white: 'border-gray-200',
      red: 'border-red-600',
      rose: 'border-rose-600',
      orange: 'border-orange-600',
      green: 'border-green-600',
      blue: 'border-blue-600',
      yellow: 'border-yellow-600',
      violet: 'border-violet-600'
    }
    
    # NOTA: I valori di border-radius sono ora definiti nelle costanti specifiche di ogni componente
    # per garantire una nomenclatura standardizzata:
    # - none: nessun arrotondamento (rounded-none)
    # - small: arrotondamento piccolo (rounded-md)
    # - medium: arrotondamento medio (rounded-lg)
    # - large: arrotondamento grande (rounded-xl)
    # - full: arrotondamento completo (rounded-full)
    
    # Effetti hover
    THEME_HOVER = THEME_COLORS.transform_values { |v| v[:hover] }
    
    # Stili base comuni
    COMMON_STYLES = {
      shadow: 'shadow-sm',
      transitions: 'transition-all duration-200'
    }
    
    # Stili per elementi di layout
    LAYOUT_STYLES = {
      panel: {
        base: 'border shadow-sm',
        header: 'px-4 py-3 border-b',
        body: 'p-4',
        footer: 'px-4 py-3 border-t'
      },
      table: {
        container: 'overflow-hidden border shadow-sm',
        header: 'bg-gray-50 text-left text-xs uppercase tracking-wider text-gray-500 font-medium',
        row: {
          base: '',
          hover: 'hover:bg-gray-50',
          striped: 'even:bg-white odd:bg-gray-50'
        },
        cell: 'px-4 py-3 text-sm text-gray-700'
      }
    }
    
    # Genera classi per un componente basato su variante
    def self.generate_component_classes(component_type, variant, options = {})
      base_classes = []
      
      case component_type
      when :button
        base_classes << 'inline-flex items-center justify-center'
        base_classes << 'font-medium'
        base_classes << COMMON_STYLES[:transitions]
        
        variant_colors = THEME_COLORS[variant.to_sym] || THEME_COLORS[:default]
        
        # Versione piena
        base_classes << variant_colors[:bg]
        base_classes << variant_colors[:text]
        base_classes << THEME_HOVER[variant.to_sym] || THEME_HOVER[:default]
        
        # Dimensione
        case options[:size]
        when :sm
          base_classes << 'px-2.5 py-1.5 text-xs'
        when :lg
          base_classes << 'px-6 py-3 text-base'
        else # :md (default)
          base_classes << 'px-4 py-2 text-sm'
        end
        
        # Disabilitato
        if options[:disabled]
          base_classes << 'opacity-50 cursor-not-allowed'
        end
        
        # Larghezza piena
        if options[:full_width]
          base_classes << 'w-full'
        end
      
      when :panel
        base_classes << LAYOUT_STYLES[:panel][:base]
        
        variant_colors = THEME_COLORS[variant.to_sym] || THEME_COLORS[:default]
        
        base_classes << variant_colors[:bg]
        base_classes << variant_colors[:text]
        base_classes << THEME_BORDERS[variant.to_sym] || THEME_BORDERS[:default]
        
      when :table
        base_classes << 'min-w-full'
        
        variant_colors = THEME_COLORS[variant.to_sym] || THEME_COLORS[:default]
        base_classes << variant_colors[:bg]
        base_classes << variant_colors[:text]
        
        # Bordi
        if options[:bordered]
          base_classes << 'border-collapse'
          base_classes << (THEME_BORDERS[variant.to_sym] || THEME_BORDERS[:default])
        end
        
        # Classi personalizzate
        base_classes << options[:classes] if options[:classes].present?
      end
      
      base_classes.compact.join(' ')
    end
  end
end 