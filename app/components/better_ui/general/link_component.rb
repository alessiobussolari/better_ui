module BetterUi
  module General
    class LinkComponent < ViewComponent::Base
      attr_reader :label, :href, :theme, :icon, :classes, :active, :data, :method, :target

      # Temi di colore disponibili
      LINK_THEME = {
        default: {
          link: "bui-link-default-link",
          active: "bui-link-default-active",
          text: "bui-link-default-text"
        },
        white: {
          link: "bui-link-white-link",
          active: "bui-link-white-active",
          text: "bui-link-white-text"
        },
        red: {
          link: "bui-link-red-link",
          active: "bui-link-red-active",
          text: "bui-link-red-text"
        },
        rose: {
          link: "bui-link-rose-link",
          active: "bui-link-rose-active",
          text: "bui-link-rose-text"
        },
        orange: {
          link: "bui-link-orange-link",
          active: "bui-link-orange-active",
          text: "bui-link-orange-text"
        },
        green: {
          link: "bui-link-green-link",
          active: "bui-link-green-active",
          text: "bui-link-green-text"
        },
        blue: {
          link: "bui-link-blue-link",
          active: "bui-link-blue-active",
          text: "bui-link-blue-text"
        },
        yellow: {
          link: "bui-link-yellow-link",
          active: "bui-link-yellow-active",
          text: "bui-link-yellow-text"
        },
        violet: {
          link: "bui-link-violet-link",
          active: "bui-link-violet-active",
          text: "bui-link-violet-text"
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
        theme_classes = LINK_THEME.fetch(@theme, LINK_THEME[:default])
        
        base_classes = ["bui-link-base"]
        
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