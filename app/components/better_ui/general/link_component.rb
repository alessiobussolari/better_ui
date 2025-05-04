module BetterUi
  module General
    class LinkComponent < ViewComponent::Base
      attr_reader :label, :href, :theme, :icon, :classes, :active, :data, :method, :target

      # Temi di colore disponibili
      LINK_THEME = {
        default: {
          link: "bui-link--default",
          active: "bui-link--active bui-link--default",
          text: "bui-link--text bui-link--default"
        },
        white: {
          link: "bui-link--white",
          active: "bui-link--active bui-link--white",
          text: "bui-link--text bui-link--white"
        },
        red: {
          link: "bui-link--red",
          active: "bui-link--active bui-link--red",
          text: "bui-link--text bui-link--red"
        },
        rose: {
          link: "bui-link--rose",
          active: "bui-link--active bui-link--rose",
          text: "bui-link--text bui-link--rose"
        },
        orange: {
          link: "bui-link--orange",
          active: "bui-link--active bui-link--orange",
          text: "bui-link--text bui-link--orange"
        },
        green: {
          link: "bui-link--green",
          active: "bui-link--active bui-link--green",
          text: "bui-link--text bui-link--green"
        },
        blue: {
          link: "bui-link--blue",
          active: "bui-link--active bui-link--blue",
          text: "bui-link--text bui-link--blue"
        },
        yellow: {
          link: "bui-link--yellow",
          active: "bui-link--active bui-link--yellow",
          text: "bui-link--text bui-link--yellow"
        },
        violet: {
          link: "bui-link--violet",
          active: "bui-link--active bui-link--violet",
          text: "bui-link--text bui-link--violet"
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
        
        base_classes = ["bui-link"]
        
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