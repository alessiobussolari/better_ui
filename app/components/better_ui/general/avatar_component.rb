module BetterUi
  module General
    class AvatarComponent < ViewComponent::Base
      attr_reader :name, :src, :size, :shape, :status, :status_position, :theme, :style, :classes, :id

      # Temi di avatar disponibili
      AVATAR_THEME = {
        default: "bui-avatar--default",
        white: "bui-avatar--white",
        red: "bui-avatar--red",
        rose: "bui-avatar--rose",
        orange: "bui-avatar--orange",
        green: "bui-avatar--green",
        blue: "bui-avatar--blue",
        yellow: "bui-avatar--yellow",
        violet: "bui-avatar--violet",
        gray: "bui-avatar--gray"
      }
      
      # Dimensioni disponibili
      AVATAR_SIZE = {
        xxsmall: "bui-avatar--xxsmall",
        xsmall: "bui-avatar--xsmall",
        small: "bui-avatar--small",
        medium: "bui-avatar--medium",
        large: "bui-avatar--large",
        xlarge: "bui-avatar--xlarge",
        xxlarge: "bui-avatar--xxlarge"
      }
      
      # Forme disponibili
      AVATAR_SHAPE = {
        circle: "bui-avatar--circle",
        square: "bui-avatar--square",
        rounded: "bui-avatar--rounded"
      }
      
      # Stati online disponibili
      AVATAR_STATUS = {
        online: "bui-avatar__status--online",
        offline: "bui-avatar__status--offline",
        busy: "bui-avatar__status--busy",
        away: "bui-avatar__status--away"
      }
      
      # Posizioni dell'indicatore di stato
      AVATAR_STATUS_POSITION = {
        bottom_right: "bui-avatar__status--bottom-right",
        bottom_left: "bui-avatar__status--bottom-left",
        top_right: "bui-avatar__status--top-right",
        top_left: "bui-avatar__status--top-left"
      }

      # Stili disponibili
      AVATAR_STYLE = {
        filled: "bui-avatar--filled",
        outline: "bui-avatar--outline",
        light: "bui-avatar--light"
      }

      def initialize(
        name: nil,
        src: nil,
        size: :medium,
        shape: :circle,
        status: nil,
        status_position: :bottom_right,
        theme: :default,
        style: :filled,
        classes: nil,
        id: nil,
        **html_options
      )
        @name = name
        @src = src
        @size = size.to_sym
        @shape = shape.to_sym
        @status = status&.to_sym
        @status_position = status_position.to_sym
        @theme = theme.to_sym
        @style = style.to_sym
        @classes = classes
        @id = id
        @html_options = html_options
        
        validate_params
      end

      # Combina tutte le classi
      def combined_classes
        [
          "bui-avatar", # Classe base per tutti gli avatar
          get_theme_class,
          get_size_class,
          get_shape_class,
          get_style_class,
          @classes,
          @html_options[:class]
        ].compact.join(" ")
      end
      
      def get_theme_class
        AVATAR_THEME[@theme] || AVATAR_THEME[:default]
      end
      
      def get_size_class
        AVATAR_SIZE[@size] || AVATAR_SIZE[:medium]
      end
      
      def get_shape_class
        AVATAR_SHAPE[@shape] || AVATAR_SHAPE[:circle]
      end
      
      def get_style_class
        AVATAR_STYLE[@style] || AVATAR_STYLE[:filled]
      end
      
      def get_status_class
        AVATAR_STATUS[@status] || ""
      end
      
      def get_status_position_class
        AVATAR_STATUS_POSITION[@status_position] || AVATAR_STATUS_POSITION[:bottom_right]
      end
      
      # Restituisce gli attributi per l'avatar
      def avatar_attributes
        attrs = {
          class: combined_classes,
          id: @id
        }
        
        # Aggiungi altri attributi HTML se presenti
        @html_options.except(:class).each do |key, value|
          attrs[key] = value
        end
        
        attrs
      end
      
      # Restituisce le classi per l'indicatore di stato
      def status_indicator_classes
        [
          "bui-avatar__status",
          get_status_class,
          get_status_position_class
        ].compact.join(" ")
      end
      
      # Determina se mostrare l'indicatore di stato
      def show_status?
        @status.present? && AVATAR_STATUS.key?(@status)
      end
      
      # Ottiene le iniziali dal nome
      def initials
        return "" unless @name.present?
        
        words = @name.strip.split(/\s+/)
        if words.size >= 2
          "#{words[0][0]}#{words[1][0]}".upcase
        else
          @name[0..1].upcase
        end
      end
      
      # Determina se mostrare l'immagine
      def show_image?
        @src.present?
      end
      
      # Ottiene le dimensioni dell'avatar in pixel
      def pixel_size
        case @size
        when :xxsmall
          20
        when :xsmall
          24
        when :small
          32
        when :medium
          40
        when :large
          48
        when :xlarge
          64
        when :xxlarge
          96
        else
          40
        end
      end

      private

      def validate_params
        validate_size
        validate_shape
        validate_theme
        validate_style
        validate_status
        validate_status_position
      end

      def validate_size
        unless AVATAR_SIZE.keys.include?(@size)
          raise ArgumentError, "La dimensione deve essere una tra: #{AVATAR_SIZE.keys.join(', ')}"
        end
      end

      def validate_shape
        unless AVATAR_SHAPE.keys.include?(@shape)
          raise ArgumentError, "La forma deve essere una tra: #{AVATAR_SHAPE.keys.join(', ')}"
        end
      end

      def validate_theme
        unless AVATAR_THEME.keys.include?(@theme)
          raise ArgumentError, "Il tema deve essere uno tra: #{AVATAR_THEME.keys.join(', ')}"
        end
      end

      def validate_style
        unless AVATAR_STYLE.keys.include?(@style)
          raise ArgumentError, "Lo stile deve essere uno tra: #{AVATAR_STYLE.keys.join(', ')}"
        end
      end

      def validate_status
        return if @status.nil?
        
        unless AVATAR_STATUS.keys.include?(@status)
          raise ArgumentError, "Lo stato deve essere uno tra: #{AVATAR_STATUS.keys.join(', ')}"
        end
      end

      def validate_status_position
        unless AVATAR_STATUS_POSITION.keys.include?(@status_position)
          raise ArgumentError, "La posizione dello stato deve essere una tra: #{AVATAR_STATUS_POSITION.keys.join(', ')}"
        end
      end
    end
  end
end 