module BetterUi
  module General
    class IconComponentPreview < Lookbook::Preview
      # @!group Esempi Base

      # @label Con Helper
      # @param name text "Nome dell'icona"
      # @param style select { choices: [solid, regular, brands] } "Stile dell'icona"
      # @param size select { choices: [xsmall, small, medium, large, xlarge, 2xl] } "Dimensione dell'icona"
      # @param spin toggle "Rotazione continua"
      # @param pulse toggle "Pulsazione"
      # @param border toggle "Con bordo"
      # @param fixed_width toggle "Larghezza fissa"
      # @param rotation select { choices: [0, 90, 180, 270] } "Rotazione (gradi)"
      # @param flip select { choices: [none, horizontal, vertical, both] } "Flip"
      def default(
        name: "star",
        style: :solid,
        size: :medium,
        spin: false,
        pulse: false,
        border: false,
        fixed_width: false,
        rotation: nil,
        flip: nil
      )
        normalize_params!(
          name: name,
          style: style,
          size: size,
          spin: spin,
          pulse: pulse,
          border: border,
          fixed_width: fixed_width,
          rotation: rotation,
          flip: flip
        )

        bui_icon(
          name,
          style: style,
          size: size,
          spin: spin,
          pulse: pulse,
          border: border,
          fixed_width: fixed_width,
          rotation: rotation,
          flip: flip
        )
      end

      # @label Istanziazione Diretta
      # @param name text "Nome dell'icona"
      # @param style select { choices: [solid, regular, brands] } "Stile dell'icona"
      # @param size select { choices: [xsmall, small, medium, large, xlarge, 2xl] } "Dimensione dell'icona"
      # @param spin toggle "Rotazione continua"
      # @param pulse toggle "Pulsazione"
      # @param border toggle "Con bordo"
      # @param fixed_width toggle "Larghezza fissa"
      # @param rotation select { choices: [0, 90, 180, 270] } "Rotazione (gradi)"
      # @param flip select { choices: [none, horizontal, vertical, both] } "Flip"
      def raw(
        name: "star",
        style: :solid,
        size: :medium,
        spin: false,
        pulse: false,
        border: false,
        fixed_width: false,
        rotation: nil,
        flip: nil
      )
        normalize_params!(
          name: name,
          style: style,
          size: size,
          spin: spin,
          pulse: pulse,
          border: border,
          fixed_width: fixed_width,
          rotation: rotation,
          flip: flip
        )

        render BetterUi::General::IconComponent.new(
          name: name,
          style: style,
          size: size,
          spin: spin,
          pulse: pulse,
          border: border,
          fixed_width: fixed_width,
          rotation: rotation,
          flip: flip
        )
      end

      # @!endgroup

      private

      def normalize_params!(options)
        # Conversione dei tipi
        options[:style] = options[:style].to_sym if options[:style].is_a?(String)
        options[:size] = options[:size].to_sym if options[:size].is_a?(String)
        options[:spin] = options[:spin] == true || options[:spin] == "true"
        options[:pulse] = options[:pulse] == true || options[:pulse] == "true"
        options[:border] = options[:border] == true || options[:border] == "true"
        options[:fixed_width] = options[:fixed_width] == true || options[:fixed_width] == "true"

        if options[:rotation].present?
          options[:rotation] = options[:rotation].to_i if options[:rotation].is_a?(String)
        end

        if options[:flip].present? && options[:flip] != "none"
          options[:flip] = options[:flip].to_sym if options[:flip].is_a?(String)
        else
          options[:flip] = nil
        end

        # Validazione
        valid_styles = [:solid, :regular, :brands]
        valid_sizes = [:xsmall, :small, :medium, :large, :xlarge, :'2xl']
        valid_rotations = [nil, 0, 90, 180, 270]
        valid_flips = [nil, :horizontal, :vertical, :both]

        options[:style] = :solid unless valid_styles.include?(options[:style])
        options[:size] = :medium unless valid_sizes.include?(options[:size])
        options[:rotation] = nil unless valid_rotations.include?(options[:rotation])
        options[:flip] = nil unless valid_flips.include?(options[:flip])

        options
      end

      # @!group esempi_specifici

      # @!group Dimensioni

      # @label Extra small
      def extra_small
        render BetterUi::General::IconComponent.new(
          name: 'star',
          size: :xsmall
        )
      end

      # @label Small
      def small
        render BetterUi::General::IconComponent.new(
          name: 'star',
          size: :small
        )
      end

      # @label Medium (default)
      def medium
        render BetterUi::General::IconComponent.new(
          name: 'star',
          size: :medium
        )
      end

      # @label Large
      def large
        render BetterUi::General::IconComponent.new(
          name: 'star',
          size: :large
        )
      end

      # @label Extra large
      def extra_large
        render BetterUi::General::IconComponent.new(
          name: 'star',
          size: :xlarge
        )
      end

      # @label 2x large
      def double_extra_large
        render BetterUi::General::IconComponent.new(
          name: 'star',
          size: :'2xl'
        )
      end

      # @!endgroup

      # @!group Animazioni

      # @label Rotazione (spin)
      def spinning
        render BetterUi::General::IconComponent.new(
          name: 'spinner',
          spin: true,
          size: :xlarge
        )
      end

      # @label Pulsazione (pulse)
      def pulsing
        render BetterUi::General::IconComponent.new(
          name: 'circle-notch',
          pulse: true,
          size: :xlarge
        )
      end

      # @!endgroup

      # @!group Formattazione

      # @label Larghezza fissa
      def fixed_width
        render(inline: <<~ERB)
          <div class="flex flex-col w-48 border p-2">
            <div class="flex items-center mb-2">
              <%= render BetterUi::General::IconComponent.new(name: 'home', fixed_width: true) %>
              <span class="ml-2">Home</span>
            </div>
            <div class="flex items-center mb-2">
              <%= render BetterUi::General::IconComponent.new(name: 'user', fixed_width: true) %>
              <span class="ml-2">Profilo</span>
            </div>
            <div class="flex items-center">
              <%= render BetterUi::General::IconComponent.new(name: 'cog', fixed_width: true) %>
              <span class="ml-2">Impostazioni</span>
            </div>
          </div>
        ERB
      end

      # @label Con bordo
      def bordered
        render BetterUi::General::IconComponent.new(
          name: 'star',
          border: true,
          size: :xlarge
        )
      end

      # @!endgroup

      # @!group Trasformazioni

      # @label Rotazione 90°
      def rotated_90
        render BetterUi::General::IconComponent.new(
          name: 'arrow-up',
          rotation: 90,
          size: :xlarge
        )
      end

      # @label Flip orizzontale
      def horizontal_flip
        render BetterUi::General::IconComponent.new(
          name: 'arrow-right',
          flip: :horizontal,
          size: :xlarge
        )
      end

      # @label Flip verticale
      def vertical_flip
        render BetterUi::General::IconComponent.new(
          name: 'arrow-up',
          flip: :vertical,
          size: :xlarge
        )
      end

      # @!endgroup

      # @!group Icone comuni

      # @label Icone comuni
      def common_icons
        render(inline: <<~ERB)
          <div class="grid grid-cols-4 gap-4 p-4">
            <div class="flex flex-col items-center">
              <%= render BetterUi::General::IconComponent.new(name: 'home', size: :xlarge) %>
              <span class="mt-2 text-sm">home</span>
            </div>
            <div class="flex flex-col items-center">
              <%= render BetterUi::General::IconComponent.new(name: 'user', size: :xlarge) %>
              <span class="mt-2 text-sm">user</span>
            </div>
            <div class="flex flex-col items-center">
              <%= render BetterUi::General::IconComponent.new(name: 'cog', size: :xlarge) %>
              <span class="mt-2 text-sm">cog</span>
            </div>
            <div class="flex flex-col items-center">
              <%= render BetterUi::General::IconComponent.new(name: 'trash', size: :xlarge) %>
              <span class="mt-2 text-sm">trash</span>
            </div>
            <div class="flex flex-col items-center">
              <%= render BetterUi::General::IconComponent.new(name: 'check', size: :xlarge) %>
              <span class="mt-2 text-sm">check</span>
            </div>
            <div class="flex flex-col items-center">
              <%= render BetterUi::General::IconComponent.new(name: 'times', size: :xlarge) %>
              <span class="mt-2 text-sm">times</span>
            </div>
            <div class="flex flex-col items-center">
              <%= render BetterUi::General::IconComponent.new(name: 'search', size: :xlarge) %>
              <span class="mt-2 text-sm">search</span>
            </div>
            <div class="flex flex-col items-center">
              <%= render BetterUi::General::IconComponent.new(name: 'download', size: :xlarge) %>
              <span class="mt-2 text-sm">download</span>
            </div>
          </div>
        ERB
      end

      # @!endgroup
    end
  end
end
