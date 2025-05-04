module BetterUi
  module General
    class IconComponentPreview < ViewComponent::Preview
      # @!group Icone di base
      
      # @label Icona base
      def default
        bui_icon('star')
      end
      
      # @label Icona brands
      def brand_icon
        render BetterUi::General::IconComponent.new(
          name: 'github',
          style: :brands
        )
      end
      
      # @label Icona regular
      def regular_icon
        render BetterUi::General::IconComponent.new(
          name: 'bell',
          style: :regular
        )
      end
      
      # @!endgroup
      
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