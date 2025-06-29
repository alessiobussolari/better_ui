module BetterUi
  module General
    module Link
      class Component < BetterUi::Component
        attr_reader :label, :href, :icon, :active, :disabled, :data, :method, :target, :theme, :orientation, :style, :size

        # Classi base sempre presenti
        LINK_BASE_CLASSES = "transition-colors duration-200 no-underline"

        # Temi con classi Tailwind dirette - LOGICA CORRETTA
        LINK_THEME_CLASSES = {
          default: "text-white hover:text-gray-300",        # Bianco per sfondi scuri
          white: "text-gray-900 hover:text-gray-700",      # Nero per sfondi chiari
          red: "text-red-500 hover:text-red-600",
          rose: "text-rose-500 hover:text-rose-600",
          orange: "text-orange-500 hover:text-orange-600",
          green: "text-green-500 hover:text-green-600",
          blue: "text-blue-500 hover:text-blue-600",
          yellow: "text-yellow-600 hover:text-yellow-700",
          violet: "text-violet-500 hover:text-violet-600"
        }.freeze

        # Orientamenti con classi Tailwind dirette
        LINK_ORIENTATION_CLASSES = {
          horizontal: "inline-flex items-center",
          vertical: "flex flex-col items-center"
        }.freeze

        # Stili con classi Tailwind dirette
        LINK_STYLE_CLASSES = {
          default: "",
          underline: "underline",
          bold: "font-bold",
          text: "no-underline"
        }.freeze

        # Dimensioni con classi Tailwind dirette - Sistema uniforme 7 livelli
        LINK_SIZE_CLASSES = {
          xxs: "text-xs",        # Extra extra small
          xs: "text-xs",         # Extra small
          sm: "text-sm",         # Small
          md: "text-base",       # Medium (default)
          lg: "text-lg",         # Large
          xl: "text-xl",         # Extra large
          xxl: "text-2xl"        # Extra extra large
        }.freeze

        # Stati con classi Tailwind dirette
        LINK_STATE_CLASSES = {
          normal: "",
          active: "font-semibold",
          disabled: "opacity-50 cursor-not-allowed pointer-events-none"
        }.freeze

        configure_attributes({
          theme: {
            var: :@theme,
            default: :white,
            constants: [:LINK_THEME_CLASSES],
            methods: [:get_theme_class]
          },
          orientation: {
            var: :@orientation,
            default: :horizontal,
            constants: [:LINK_ORIENTATION_CLASSES],
            methods: [:get_orientation_class]
          },
          style: {
            var: :@style,
            default: :default,
            constants: [:LINK_STYLE_CLASSES],
            methods: [:get_style_class]
          },
          size: {
            var: :@size,
            default: :md,
            constants: [:LINK_SIZE_CLASSES],
            methods: [:get_size_class]
          }
        })

        # @param label [String] testo del link
        # @param href [String] URL di destinazione (nil per semplice testo)
        # @param theme [Symbol] tema del colore (:default, :white, etc.)
        # @param orientation [Symbol] orientamento (:horizontal, :vertical)
        # @param style [Symbol] stile (:default, :underline, :bold, :text)
        # @param size [Symbol] dimensione (:xxs, :xs, :sm, :md, :lg, :xl, :xxl)
        # @param icon [String] icona opzionale
        # @param active [Boolean] stato attivo del link
        # @param disabled [Boolean] stato disabilitato del link
        # @param data [Hash] attributi data
        # @param method [Symbol] metodo HTTP (per Turbo)
        # @param target [String] target del link
        # @param html_options [Hash] opzioni HTML aggiuntive
        def initialize(
          label:,
          href: nil,
          theme: :white,
          orientation: :horizontal,
          style: :default,
          size: :md,
          icon: nil,
          active: false,
          disabled: false,
          data: {},
          method: nil,
          target: nil,
          **html_options
        )
          @label = label
          @href = href
          @icon = icon
          @active = active
          @disabled = disabled
          @data = data || {}
          @method = method
          @target = target
          @html_options = html_options

          # Conversione esplicita a simboli per i parametri configurabili
          @theme = theme.to_sym
          @orientation = orientation.to_sym
          @style = style.to_sym
          @size = size.to_sym

          validate_params
        end

        # Determina se è un link attivo/corrente
        def active?
          @active
        end

        # Determina se è disabilitato
        def disabled?
          @disabled
        end

        # Determina se è un link o solo testo
        def link?
          @href.present? && !@disabled
        end

        # Combina tutte le classi CSS
        def combined_classes
          [
            LINK_BASE_CLASSES,
            get_theme_class,
            get_orientation_class,
            get_style_class,
            get_size_class,
            get_state_class,
            @html_options[:class]
          ].compact.join(" ")
        end

        # Classi per l'icona con dimensionamento proporzionale
        def icon_classes
          return "" unless @icon.present?

          # Definisce spacing e dimensioni icona basate su size
          base_spacing = case @orientation
          when :horizontal
            "mr-2"
          when :vertical
            "mb-1"
          else
            "mr-2"
          end

          icon_size = case @size
          when :xxs
            "w-3 h-3"
          when :xs
            "w-3 h-3"
          when :sm
            "w-4 h-4"
          when :md
            "w-5 h-5"
          when :lg
            "w-6 h-6"
          when :xl
            "w-7 h-7"
          when :xxl
            "w-8 h-8"
          else
            "w-5 h-5"
          end

          "#{base_spacing} #{icon_size} inline-block"
        end

        # Classi per il testo
        def text_classes
          "inline-block"
        end

        # Restituisce gli attributi per il link/span
        def element_attributes
          attrs = @html_options.except(:class)
          attrs[:class] = combined_classes

          if link?
            # Attributi specifici per i link
            if @method.present?
              attrs[:data] = @data.merge(turbo_method: @method)
            elsif @data.present?
              attrs[:data] = @data
            end

            attrs[:target] = @target if @target.present?
            attrs[:aria] ||= {}
            attrs[:aria][:current] = "page" if active?
          else
            # Attributi per span (testo semplice o disabilitato)
            attrs[:aria] ||= {}
            attrs[:aria][:disabled] = true if disabled?
          end

          attrs
        end

        # Determina se mostrare l'icona
        def show_icon?
          @icon.present?
        end

        # Renderizza l'icona
        def render_icon
          return nil unless show_icon?

          if @icon.is_a?(String)
            render BetterUi::General::IconComponent.new(name: @icon)
          else
            @icon # Assumiamo che sia già un componente renderizzato
          end
        end

        private

        def get_state_class
          return LINK_STATE_CLASSES[:disabled] if disabled?
          return LINK_STATE_CLASSES[:active] if active?
          LINK_STATE_CLASSES[:normal]
        end
      end
    end
  end
end
