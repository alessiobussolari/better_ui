module BetterUi
  module General
    module Icon
      class Component < ViewComponent::Base
        # Classi base per l'icona con nomenclatura BEM
        ICON_BASE_CLASSES = "bui-icon inline-flex items-center justify-center"
        
        # Dimensioni dell'icona (standardizzate: small, medium, large)
        ICON_SIZE_CLASSES = {
          small: "bui-icon--small w-4 h-4 text-sm",
          medium: "bui-icon--medium w-5 h-5 text-base", 
          large: "bui-icon--large w-6 h-6 text-lg"
        }.freeze

        # Temi dell'icona con colori coerenti
        ICON_THEME_CLASSES = {
          default: "bui-icon--default text-gray-600",
          white: "bui-icon--white text-white",
          red: "bui-icon--red text-red-600",
          rose: "bui-icon--rose text-rose-600", 
          orange: "bui-icon--orange text-orange-600",
          green: "bui-icon--green text-green-600",
          blue: "bui-icon--blue text-blue-600",
          yellow: "bui-icon--yellow text-yellow-600",
          violet: "bui-icon--violet text-violet-600",
          purple: "bui-icon--purple text-purple-600"
        }.freeze

        # Animazioni disponibili
        ICON_ANIMATION_CLASSES = {
          spin: "bui-icon--spin animate-spin",
          pulse: "bui-icon--pulse animate-pulse"
        }.freeze

        # Trasformazioni disponibili
        ICON_ROTATION_CLASSES = {
          90 => "bui-icon--rotate-90 transform rotate-90",
          180 => "bui-icon--rotate-180 transform rotate-180", 
          270 => "bui-icon--rotate-270 transform rotate-270"
        }.freeze

        ICON_FLIP_CLASSES = {
          horizontal: "bui-icon--flip-h transform scale-x-[-1]",
          vertical: "bui-icon--flip-v transform scale-y-[-1]",
          both: "bui-icon--flip-both transform scale-[-1]"
        }.freeze

        # Bordo e larghezza fissa
        ICON_BORDER_CLASSES = "bui-icon--border border border-current rounded-full p-1"
        ICON_FIXED_WIDTH_CLASSES = "bui-icon--fixed-width w-5"

        attr_reader :name, :style, :size, :theme, :spin, :pulse, :border, :fixed_width, 
                    :rotation, :flip, :classes, :id, :html_options

        # @param name [String] Nome dell'icona (richiesto)
        # @param style [Symbol] Stile dell'icona (:solid, :regular, :brands)
        # @param size [Symbol] Dimensione (:small, :medium, :large)
        # @param theme [Symbol] Tema colore (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
        # @param spin [Boolean] Rotazione continua
        # @param pulse [Boolean] Animazione pulsazione
        # @param border [Boolean] Mostra bordo attorno all'icona
        # @param fixed_width [Boolean] Larghezza fissa per allineamento
        # @param rotation [Integer] Rotazione in gradi (0, 90, 180, 270)
        # @param flip [Symbol] Tipo di flip (:horizontal, :vertical, :both)
        # @param classes [String] Classi CSS aggiuntive
        # @param id [String] ID HTML
        # @param html_options [Hash] Attributi HTML aggiuntivi
        def initialize(
          name:,
          style: :solid,
          size: :medium,
          theme: :default,
          spin: false,
          pulse: false,
          border: false,
          fixed_width: false,
          rotation: nil,
          flip: nil,
          classes: nil,
          id: nil,
          **html_options
        )
          @name = name
          @style = style.to_sym
          @size = size.to_sym
          @theme = theme.to_sym
          @spin = spin
          @pulse = pulse
          @border = border
          @fixed_width = fixed_width
          @rotation = rotation&.to_i
          @flip = flip&.to_sym
          @classes = classes
          @id = id
          @html_options = html_options

          validate_params!
        end

        # Genera le classi CSS complete per l'icona
        def icon_classes
          classes = [
            ICON_BASE_CLASSES,
            size_classes,
            theme_classes,
            animation_classes,
            transformation_classes,
            border_classes,
            fixed_width_classes,
            @classes
          ].compact.join(" ")
        end

        # Attributi HTML per l'elemento icona
        def icon_attributes
          {
            class: icon_classes,
            id: @id,
            **@html_options
          }.compact
        end

        # Nome completo della classe FontAwesome basato su stile
        def fa_class_name
          prefix = case @style
                   when :solid then "fas"
                   when :regular then "far" 
                   when :brands then "fab"
                   else "fas"
                   end
          
          "#{prefix} fa-#{@name}"
        end

        # Verifica se il componente deve essere renderizzato
        def render?
          @name.present?
        end

        private

        def validate_params!
          validate_name!
          validate_style!
          validate_size!
          validate_theme!
          validate_rotation!
          validate_flip!
        end

        def validate_name!
          raise ArgumentError, "Il nome dell'icona è richiesto" if @name.blank?
        end

        def validate_style!
          valid_styles = [:solid, :regular, :brands]
          unless valid_styles.include?(@style)
            raise ArgumentError, "Lo stile deve essere uno tra: #{valid_styles.join(', ')}"
          end
        end

        def validate_size!
          unless ICON_SIZE_CLASSES.key?(@size)
            valid_sizes = ICON_SIZE_CLASSES.keys
            raise ArgumentError, "La dimensione deve essere una tra: #{valid_sizes.join(', ')}"
          end
        end

        def validate_theme!
          unless ICON_THEME_CLASSES.key?(@theme)
            valid_themes = ICON_THEME_CLASSES.keys
            raise ArgumentError, "Il tema deve essere uno tra: #{valid_themes.join(', ')}"
          end
        end

        def validate_rotation!
          if @rotation && !ICON_ROTATION_CLASSES.key?(@rotation)
            valid_rotations = ICON_ROTATION_CLASSES.keys
            raise ArgumentError, "La rotazione deve essere una tra: #{valid_rotations.join(', ')}"
          end
        end

        def validate_flip!
          if @flip && !ICON_FLIP_CLASSES.key?(@flip)
            valid_flips = ICON_FLIP_CLASSES.keys
            raise ArgumentError, "Il flip deve essere uno tra: #{valid_flips.join(', ')}"
          end
        end

        def size_classes
          ICON_SIZE_CLASSES[@size]
        end

        def theme_classes
          ICON_THEME_CLASSES[@theme]
        end

        def animation_classes
          animations = []
          animations << ICON_ANIMATION_CLASSES[:spin] if @spin
          animations << ICON_ANIMATION_CLASSES[:pulse] if @pulse
          animations.join(" ")
        end

        def transformation_classes
          transformations = []
          transformations << ICON_ROTATION_CLASSES[@rotation] if @rotation
          transformations << ICON_FLIP_CLASSES[@flip] if @flip
          transformations.join(" ")
        end

        def border_classes
          @border ? ICON_BORDER_CLASSES : nil
        end

        def fixed_width_classes
          @fixed_width ? ICON_FIXED_WIDTH_CLASSES : nil
        end
      end
    end
  end
end
