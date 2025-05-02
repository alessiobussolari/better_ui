module BetterUi
  module General
    class LinkComponent < ViewComponent::Base
      attr_reader :label, :href, :theme, :icon, :classes, :active, :data, :method, :target

      # Temi di colore disponibili
      THEMES = {
        default: {
          link: "text-gray-300 hover:text-white",
          active: "text-white font-medium",
          text: "text-white"
        },
        white: {
          link: "text-gray-600 hover:text-gray-900",
          active: "text-black font-medium",
          text: "text-black"
        },
        red: {
          link: "text-red-200 hover:text-white",
          active: "text-white font-medium",
          text: "text-white"
        },
        rose: {
          link: "text-rose-200 hover:text-white",
          active: "text-white font-medium",
          text: "text-white"
        },
        orange: {
          link: "text-orange-200 hover:text-white",
          active: "text-white font-medium",
          text: "text-white"
        },
        green: {
          link: "text-green-200 hover:text-white",
          active: "text-white font-medium",
          text: "text-white"
        },
        blue: {
          link: "text-blue-200 hover:text-white",
          active: "text-white font-medium",
          text: "text-white"
        },
        yellow: {
          link: "text-yellow-700 hover:text-black",
          active: "text-black font-medium",
          text: "text-black"
        },
        violet: {
          link: "text-violet-200 hover:text-white",
          active: "text-white font-medium",
          text: "text-white"
        }
      }

      # Inizializzazione del componente
      def initialize(
        label:, 
        href: nil,
        theme: :default,
        icon: nil,
        classes: nil,
        active: false,
        data: {},
        method: nil,
        target: nil
      )
        @label = label
        @href = href
        @theme = theme.to_sym
        @icon = icon
        @classes = classes
        @active = active
        @data = data || {}
        @method = method
        @target = target
      end

      # Determina se è un link attivo/corrente
      def active?
        @active
      end

      # Determina se è un link o solo testo
      def link?
        @href.present?
      end

      # Genera le classi per il componente
      def component_classes
        theme_classes = THEMES.fetch(@theme, THEMES[:default])
        
        base_classes = ["flex items-center"]
        
        if active?
          base_classes << theme_classes[:active]
        elsif link?
          base_classes << theme_classes[:link]
        else
          base_classes << theme_classes[:text]
        end
        
        base_classes << @classes if @classes.present?
        
        base_classes.compact.join(" ")
      end

      # Restituisce gli attributi per il link
      def link_attributes
        attrs = {
          class: component_classes
        }
        
        attrs[:data] = @data.merge(turbo_method: @method) if @method.present?
        attrs[:data] = @data if @data.present? && !@method.present?
        attrs[:target] = @target if @target.present?
        
        attrs
      end

      # Renderizza l'icona
      def render_icon
        return nil unless @icon.present?
        
        if @icon.is_a?(String)
          render BetterUi::General::IconComponent.new(name: @icon)
        else
          @icon # Assumiamo che sia già un componente renderizzato
        end
      end
    end
  end
end 