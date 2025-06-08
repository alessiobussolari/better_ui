module BetterUi
  module General
    module Spinner
      class Component < ViewComponent::Base
        THEMES = %i[default white red rose orange green blue yellow violet].freeze
        SIZES = %i[xxs xs sm md lg xl xxl].freeze
        STYLES = %i[default outline].freeze

        # Classi base sempre presenti
        SPINNER_BASE_CLASSES = "inline-flex items-center gap-2"

        # Dimensioni SVG con classi Tailwind dirette - Sistema uniforme 7 livelli
        SPINNER_SIZES = {
          xxs: "w-3 h-3",      # 12px - Extra extra small
          xs: "w-3.5 h-3.5",   # 14px - Extra small
          sm: "w-4 h-4",       # 16px - Small
          md: "w-6 h-6",       # 24px - Medium (default)
          lg: "w-8 h-8",       # 32px - Large
          xl: "w-10 h-10",     # 40px - Extra large
          xxl: "w-12 h-12"     # 48px - Extra extra large
        }

        # Temi colore con classi Tailwind dirette
        SPINNER_THEMES = {
          default: "text-gray-900",
          white: "text-white",
          red: "text-red-500",
          rose: "text-rose-500",
          orange: "text-orange-500",
          green: "text-green-500",
          blue: "text-blue-500",
          yellow: "text-yellow-500",
          violet: "text-violet-500"
        }

        # Stili con classi Tailwind dirette
        SPINNER_STYLES = {
          default: "",
          outline: "opacity-75"
        }

        def initialize(theme: :default, size: :md, style: :default, label: nil, **html_options)
          @theme = theme.to_sym
          @size = size.to_sym
          @style = style.to_sym
          @label = label
          @html_options = html_options

          validate_options!
        end

        private

        attr_reader :theme, :size, :style, :label, :html_options

        def validate_options!
          raise ArgumentError, "Theme deve essere uno di: #{THEMES.join(', ')}" unless THEMES.include?(theme)
          raise ArgumentError, "Size deve essere uno di: #{SIZES.join(', ')}" unless SIZES.include?(size)
          raise ArgumentError, "Style deve essere uno di: #{STYLES.join(', ')}" unless STYLES.include?(style)
        end

        def combined_classes
          [
            SPINNER_BASE_CLASSES,
            get_spinner_theme_classes,
            get_spinner_style_classes,
            html_options[:class]
          ].compact.join(" ")
        end

        def get_spinner_theme_classes
          SPINNER_THEMES[theme] || SPINNER_THEMES[:default]
        end

        def get_spinner_style_classes
          SPINNER_STYLES[style] || SPINNER_STYLES[:default]
        end

        def get_spinner_size_classes
          SPINNER_SIZES[size] || SPINNER_SIZES[:md]
        end

        def container_attributes
          html_options.except(:class).merge(class: combined_classes)
        end

        def svg_classes
          get_spinner_size_classes
        end

        def show_label?
          label.present?
        end
      end
    end
  end
end
