module BetterUi
  module General
    module Icon
      class Component < BetterUi::Component
        # Classi base per l'icona
        ICON_BASE_CLASSES = "inline-flex items-center justify-center"

        # Dimensioni dell'icona - Sistema uniforme 7 livelli
        ICON_SIZE_CLASSES = {
          xs: "text-xs",     # Extra small
          sm: "text-sm",         # Small
          md: "text-base",       # Medium (default)
          lg: "text-lg",         # Large
          xl: "text-xl",         # Extra large
          xxl: "text-2xl"        # Extra extra large
        }.freeze

        # Temi dell'icona con colori coerenti
        ICON_THEME_CLASSES = {
          default: "text-gray-600",
          white: "text-white",
          red: "text-red-600",
          rose: "text-rose-600",
          orange: "text-orange-600",
          green: "text-green-600",
          blue: "text-blue-600",
          yellow: "text-yellow-600",
          violet: "text-violet-600"
        }.freeze

        # Animazioni disponibili
        ICON_ANIMATION_CLASSES = {
          spin: "animate-spin",
          pulse: "animate-pulse"
        }.freeze

        # Trasformazioni disponibili
        ICON_ROTATION_CLASSES = {
          90 => "transform rotate-90",
          180 => "transform rotate-180",
          270 => "transform rotate-270"
        }.freeze

        ICON_FLIP_CLASSES = {
          horizontal: "transform -scale-x-100",
          vertical: "transform -scale-y-100",
          both: "transform -scale-100"
        }.freeze

        # Bordo e larghezza fissa
        ICON_BORDER_CLASSES = "border border-current rounded-full p-1"
        ICON_FIXED_WIDTH_CLASSES = "w-5"

        configure_attributes({
          theme: {
            var: :@theme,
            default: :default,
            constants: [:ICON_THEME_CLASSES],
            methods: [:get_theme_class]
          },
          size: {
            var: :@size,
            default: :md,
            constants: [:ICON_SIZE_CLASSES],
            methods: [:get_size_class]
          }
        })

        attr_reader :name, :style, :size, :theme, :spin, :pulse, :border, :fixed_width, 
                    :rotation, :flip, :classes, :id, :href, :method, :target, :html_options

        # @param name [String] Nome dell'icona (richiesto)
        # @param style [Symbol] Stile dell'icona (:solid, :regular, :brands)
        # @param size [Symbol] Dimensione (:xxs, :xs, :sm, :md, :lg, :xl, :xxl)
        # @param theme [Symbol] Tema colore (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
        # @param spin [Boolean] Rotazione continua
        # @param pulse [Boolean] Animazione pulsazione
        # @param border [Boolean] Mostra bordo attorno all'icona
        # @param fixed_width [Boolean] Larghezza fissa per allineamento
        # @param rotation [Integer] Rotazione in gradi (0, 90, 180, 270)
        # @param flip [Symbol] Tipo di flip (:horizontal, :vertical, :both)
        # @param classes [String] Classi CSS aggiuntive
        # @param id [String] ID HTML
        # @param href [String] URL per l'icona
        # @param html_options [Hash] Attributi HTML aggiuntivi
        def initialize(
          name:,
          style: :solid,
          size: :md,
          theme: :default,
          spin: false,
          pulse: false,
          border: false,
          fixed_width: false,
          rotation: nil,
          flip: nil,
          classes: nil,
          id: nil,
          href: nil,
          method: nil,
          target: nil,
          **html_options
        )
          @name = name
          @style = style.to_sym
          @spin = spin
          @pulse = pulse
          @border = border
          @fixed_width = fixed_width
          @rotation = rotation&.to_i
          @flip = flip&.to_sym
          @classes = classes
          @id = id
          @href = href
          @method = method
          @target = target
          @html_options = html_options

          # Conversione esplicita a simboli per i parametri configurabili
          @size = size.to_sym
          @theme = theme.to_sym

          validate_params
          validate_icon_specific_params!
        end

        # Genera le classi CSS complete per l'icona
        def icon_classes
          classes = [
            ICON_BASE_CLASSES,
            get_size_class,      # Metodo generato automaticamente da configure_attributes
            get_theme_class,     # Metodo generato automaticamente da configure_attributes
            animation_classes,
            transformation_classes,
            border_classes,
            fixed_width_classes,
            @classes
          ].compact.join(" ")
        end

        # Attributi HTML per l'elemento icona
        def icon_attributes
          attrs = {
            class: icon_classes,
            id: @id,
            href: @href,
            target: @target,
            **@html_options
          }.compact

          # Handle method for Turbo
          if @method.present?
            attrs[:data] ||= {}
            attrs[:data][:turbo_method] = @method
          end

          attrs
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

        def validate_icon_specific_params!
          validate_name!
          validate_style!
          validate_rotation!
          validate_flip!
        end

        def validate_name!
          raise ArgumentError, "Il nome dell'icona è richiesto" if @name.blank?
        end

        def validate_style!
          valid_styles = [ :solid, :regular, :brands ]
          unless valid_styles.include?(@style)
            raise ArgumentError, "Lo stile deve essere uno tra: #{valid_styles.join(', ')}"
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
