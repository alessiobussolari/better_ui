module BetterUi
  module General
    class AvatarComponent < ViewComponent::Base
      attr_reader :name, :src, :size, :shape, :status, :status_position, :type, :classes, :id

      # Temi di colore disponibili
      AVATAR_THEME = {
        default: "bui-avatar-default",
        white: "bui-avatar-white",
        red: "bui-avatar-red",
        rose: "bui-avatar-rose",
        orange: "bui-avatar-orange",
        green: "bui-avatar-green",
        blue: "bui-avatar-blue",
        yellow: "bui-avatar-yellow",
        violet: "bui-avatar-violet",
        gray: "bui-avatar-gray"
      }
      
      # Dimensioni disponibili
      AVATAR_SIZES = {
        xxsmall: "bui-avatar-size-xxsmall",
        xsmall: "bui-avatar-size-xsmall",
        small: "bui-avatar-size-small",
        medium: "bui-avatar-size-medium",
        large: "bui-avatar-size-large",
        xlarge: "bui-avatar-size-xlarge",
        xxlarge: "bui-avatar-size-xxlarge"
      }
      
      # Forme disponibili
      AVATAR_SHAPES = {
        circle: "bui-avatar-shape-circle",
        square: "bui-avatar-shape-square",
        rounded: "bui-avatar-shape-rounded"
      }
      
      # Stati online disponibili
      AVATAR_STATUS = {
        online: "bui-avatar-status-online",
        offline: "bui-avatar-status-offline",
        busy: "bui-avatar-status-busy",
        away: "bui-avatar-status-away"
      }
      
      # Posizioni dell'indicatore di stato
      AVATAR_STATUS_POSITION = {
        bottom_right: "bui-avatar-status-position-bottom-right",
        bottom_left: "bui-avatar-status-position-bottom-left",
        top_right: "bui-avatar-status-position-top-right",
        top_left: "bui-avatar-status-position-top-left"
      }

      def initialize(
        name: nil,
        src: nil,
        size: :medium,
        shape: :circle,
        status: nil,
        status_position: :bottom_right,
        type: :default,
        classes: nil,
        id: nil
      )
        @name = name
        @src = src
        @size = size.to_sym
        @shape = shape.to_sym
        @status = status&.to_sym
        @status_position = status_position.to_sym
        @type = type.to_sym
        @classes = classes
        @id = id
      end

      # Combina tutte le classi
      def combined_classes
        [
          "bui-avatar", # Classe base per tutti gli avatar
          get_avatar_theme_class,
          get_avatar_size_class,
          get_avatar_shape_class,
          @classes
        ].compact.join(" ")
      end
      
      def get_avatar_theme_class
        AVATAR_THEME[@type] || AVATAR_THEME[:default]
      end
      
      def get_avatar_size_class
        AVATAR_SIZES[@size] || AVATAR_SIZES[:medium]
      end
      
      def get_avatar_shape_class
        AVATAR_SHAPES[@shape] || AVATAR_SHAPES[:circle]
      end
      
      def get_avatar_status_class
        AVATAR_STATUS[@status] || ""
      end
      
      def get_avatar_status_position_class
        AVATAR_STATUS_POSITION[@status_position] || AVATAR_STATUS_POSITION[:bottom_right]
      end
      
      # Restituisce gli attributi per l'avatar
      def avatar_attributes
        attrs = {
          class: combined_classes,
          id: @id
        }
        
        attrs
      end
      
      # Restituisce le classi per l'indicatore di stato
      def status_indicator_classes
        [
          "bui-avatar-status-indicator",
          get_avatar_status_class,
          get_avatar_status_position_class
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
    end
  end
end 