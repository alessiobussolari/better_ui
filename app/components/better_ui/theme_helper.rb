# frozen_string_literal: true

module BetterUi
  module ThemeHelper
    # Colori principali del tema
    THEME_COLORS = {
      # Neutrali
      white: 'bg-white',
      black: 'bg-black',
      
      # Colori del tema
      primary: {
        light: 'bg-orange-100',
        default: 'bg-orange-500',
        dark: 'bg-orange-600',
        text: 'text-white'
      },
      secondary: {
        light: 'bg-gray-100',
        default: 'bg-gray-200',
        dark: 'bg-gray-300',
        text: 'text-gray-800'
      },
      success: {
        light: 'bg-green-100',
        default: 'bg-green-500',
        dark: 'bg-green-600',
        text: 'text-white'
      },
      warning: {
        light: 'bg-amber-100',
        default: 'bg-amber-500',
        dark: 'bg-amber-600',
        text: 'text-white'
      },
      danger: {
        light: 'bg-red-100',
        default: 'bg-red-500',
        dark: 'bg-red-600',
        text: 'text-white'
      },
      info: {
        light: 'bg-blue-100',
        default: 'bg-blue-500',
        dark: 'bg-blue-600',
        text: 'text-white'
      }
    }
    
    # Bordi del tema
    THEME_BORDERS = {
      primary: 'border-orange-200',
      secondary: 'border-gray-200',
      success: 'border-green-200',
      warning: 'border-amber-200',
      danger: 'border-red-200',
      info: 'border-blue-200'
    }
    
    # Effetti hover
    THEME_HOVER = {
      primary: 'hover:bg-orange-600',
      secondary: 'hover:bg-gray-300',
      success: 'hover:bg-green-600',
      warning: 'hover:bg-amber-600',
      danger: 'hover:bg-red-600',
      info: 'hover:bg-blue-600'
    }
    
    # Stili base comuni
    COMMON_STYLES = {
      rounded: 'rounded-md',
      shadow: 'shadow-sm',
      transitions: 'transition-all duration-200'
    }
    
    # Stili per elementi di layout
    LAYOUT_STYLES = {
      panel: {
        base: 'rounded-lg border shadow-sm',
        header: 'px-4 py-3 border-b',
        body: 'p-4',
        footer: 'px-4 py-3 border-t'
      },
      table: {
        container: 'overflow-hidden rounded-md border shadow-sm',
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
        base_classes << COMMON_STYLES[:rounded]
        base_classes << COMMON_STYLES[:transitions]
        
        if options[:outline]
          # Versione outline
          base_classes << 'border-2'
          base_classes << "border-#{variant}-500"
          base_classes << "text-#{variant}-500"
          base_classes << "hover:bg-#{variant}-50"
        else
          # Versione piena
          base_classes << THEME_COLORS.dig(variant.to_sym, :default)&.sub('bg-', '') || "bg-#{variant}-500"
          base_classes << THEME_COLORS.dig(variant.to_sym, :text) || 'text-white'
          base_classes << THEME_HOVER[variant.to_sym] || "hover:bg-#{variant}-600"
        end
        
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
        
        # Colore di sfondo in base alla variante
        if variant.to_sym == :default
          base_classes << 'bg-white'
          base_classes << 'border-gray-200'
        else
          base_classes << THEME_COLORS.dig(variant.to_sym, :light)&.sub('bg-', '') || "bg-#{variant}-50"
          base_classes << THEME_BORDERS[variant.to_sym] || "border-#{variant}-200"
        end
        
      when :table
        base_classes << 'min-w-full bg-white'
        
        # Bordi
        if options[:bordered]
          base_classes << 'border-collapse'
          base_classes << (THEME_BORDERS[variant.to_sym] || 'border-gray-200')
        end
        
        # Classi personalizzate
        base_classes << options[:classes] if options[:classes].present?
      end
      
      base_classes.compact.join(' ')
    end
  end
end 