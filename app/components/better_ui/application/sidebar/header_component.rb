# frozen_string_literal: true

module BetterUi
  module Application
    module Sidebar
      class HeaderComponent < BetterUi::Component
        attr_reader :icon, :image, :title, :subtitle

        def initialize(
          icon: nil,
          image: nil, 
          title: nil, 
          subtitle: nil, 
          **html_options
        )
          # Validazione: solo uno tra icon e image può essere presente
          if icon.present? && image.present?
            raise ArgumentError, "Non è possibile specificare sia 'icon' che 'image'. Scegli solo uno dei due."
          end
          
          # Normalizzazione: icon deve essere sempre un hash con :name
          @icon = normalize_icon(icon) if icon.present?
          
          # Normalizzazione: image deve essere sempre un hash con :src
          @image = normalize_image(image) if image.present?
          
          @title = title
          @subtitle = subtitle
          @html_options = html_options
        end

        def header_classes
          [
            "flex items-center px-4 py-6 border-b border-gray-200",
            @html_options[:class]
          ].compact.join(" ")
        end

        def logo_classes
          "flex-shrink-0 h-8 w-8"
        end

        def title_classes
          "ml-3 text-lg font-medium text-gray-900"
        end

        def subtitle_classes
          "ml-3 text-sm text-gray-500"
        end

        def has_logo?
          has_icon? || has_image?
        end
        
        def has_icon?
          @icon.present?
        end
        
        def has_image?
          @image.present?
        end

        def has_title?
          @title.present?
        end

        def has_subtitle?
          @subtitle.present?
        end

        private

        def normalize_icon(icon)
          case icon
          when String
            { name: icon }
          when Hash
            raise ArgumentError, "Icon hash deve contenere la chiave :name" unless icon[:name].present?
            icon
          else
            raise ArgumentError, "Icon deve essere una stringa o un hash con chiave :name"
          end
        end

        def normalize_image(image)
          case image
          when String
            { src: image, alt: "Logo", class: "h-full w-full object-contain" }
          when Hash
            raise ArgumentError, "Image hash deve contenere la chiave :src" unless image[:src].present?
            # Aggiungi valori di default se non presenti
            {
              alt: "Logo",
              class: "h-full w-full object-contain"
            }.merge(image)
          else
            raise ArgumentError, "Image deve essere una stringa o un hash con chiave :src"
          end
        end
      end
    end
  end
end