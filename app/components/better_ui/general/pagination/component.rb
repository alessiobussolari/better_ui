# frozen_string_literal: true

module BetterUi
  module General
    module Pagination
      class Component < BetterUi::Component
        # Delega per metodi helper necessari
        delegate :link_to, to: :helpers
        
        attr_reader :current_page, :total_pages, :path, :window, :show_info, :per_page, :classes, :options

        # Costanti per temi - Container
        PAGINATION_THEME_CONTAINER_CLASSES = {
          default: 'border-gray-300',
          blue: 'border-blue-300',
          red: 'border-red-300',
          green: 'border-green-300',
          yellow: 'border-yellow-300',
          violet: 'border-violet-300',
          orange: 'border-orange-300',
          rose: 'border-rose-300',
          white: 'border-white'
        }.freeze

        # Costanti per temi - Pagina normale
        PAGINATION_THEME_PAGE_CLASSES = {
          default: 'border-gray-300 text-gray-500 hover:bg-gray-50 hover:text-gray-700',
          blue: 'border-blue-300 text-blue-600 hover:bg-blue-50 hover:text-blue-700',
          red: 'border-red-300 text-red-600 hover:bg-red-50 hover:text-red-700',
          green: 'border-green-300 text-green-600 hover:bg-green-50 hover:text-green-700',
          yellow: 'border-yellow-300 text-yellow-600 hover:bg-yellow-50 hover:text-yellow-700',
          violet: 'border-violet-300 text-violet-600 hover:bg-violet-50 hover:text-violet-700',
          orange: 'border-orange-300 text-orange-600 hover:bg-orange-50 hover:text-orange-700',
          rose: 'border-rose-300 text-rose-600 hover:bg-rose-50 hover:text-rose-700',
          white: 'border-white text-gray-700 hover:bg-white hover:text-gray-900'
        }.freeze

        # Costanti per temi - Pagina corrente
        PAGINATION_THEME_CURRENT_CLASSES = {
          default: 'border-blue-500 bg-blue-50 text-blue-600',
          blue: 'border-blue-500 bg-blue-100 text-blue-700',
          red: 'border-red-500 bg-red-100 text-red-700',
          green: 'border-green-500 bg-green-100 text-green-700',
          yellow: 'border-yellow-500 bg-yellow-100 text-yellow-700',
          violet: 'border-violet-500 bg-violet-100 text-violet-700',
          orange: 'border-orange-500 bg-orange-100 text-orange-700',
          rose: 'border-rose-500 bg-rose-100 text-rose-700',
          white: 'border-white bg-white text-gray-900'
        }.freeze

        # Costanti per temi - Pagina disabilitata
        PAGINATION_THEME_DISABLED_CLASSES = {
          default: 'border-gray-300 text-gray-300 cursor-not-allowed',
          blue: 'border-blue-200 text-blue-300 cursor-not-allowed',
          red: 'border-red-200 text-red-300 cursor-not-allowed',
          green: 'border-green-200 text-green-300 cursor-not-allowed',
          yellow: 'border-yellow-200 text-yellow-300 cursor-not-allowed',
          violet: 'border-violet-200 text-violet-300 cursor-not-allowed',
          orange: 'border-orange-200 text-orange-300 cursor-not-allowed',
          rose: 'border-rose-200 text-rose-300 cursor-not-allowed',
          white: 'border-white text-gray-400 cursor-not-allowed'
        }.freeze

        # Costanti per dimensioni - Sistema uniforme 7 livelli
        PAGINATION_SIZE_CLASSES = {
          xxs: 'px-1 py-0.5 text-xs',      # Extra extra small
          xs: 'px-1.5 py-0.5 text-xs',     # Extra small
          sm: 'px-2 py-1 text-sm',         # Small
          md: 'px-3 py-2 text-base',       # Medium (default)
          lg: 'px-4 py-3 text-lg',         # Large
          xl: 'px-5 py-3.5 text-xl',       # Extra large
          xxl: 'px-6 py-4 text-2xl'        # Extra extra large
        }.freeze

        configure_attributes({
          theme: {
            var: :@theme,
            default: :default,
            constants: [
              :PAGINATION_THEME_CONTAINER_CLASSES,
              :PAGINATION_THEME_PAGE_CLASSES,
              :PAGINATION_THEME_CURRENT_CLASSES,
              :PAGINATION_THEME_DISABLED_CLASSES
            ],
            methods: [
              :get_theme_container_class,
              :get_theme_page_class,
              :get_theme_current_class,
              :get_theme_disabled_class
            ]
          },
          size: {
            var: :@size,
            default: :md,
            constants: [:PAGINATION_SIZE_CLASSES],
            methods: [:get_size_class]
          }
        })

        def initialize(current_page:, total_pages:, path:, theme: :default, size: :md,
                       window: 2, show_info: false, per_page: nil, classes: '', **options)
          @current_page = current_page.to_i
          @total_pages = total_pages.to_i
          @path = path
          @theme = theme.to_sym
          @size = size.to_sym
          @window = window.to_i
          @show_info = show_info
          @per_page = per_page
          @classes = classes
          @options = options

          validate_pages
          validate_params
        end

        def container_classes
          "inline-flex -space-x-px rounded-md shadow-sm #{get_theme_container_class} #{classes}".strip
        end

        def page_link_classes(page_num)
          base_classes = "relative inline-flex items-center border #{get_size_class} font-medium"
          
          if page_num == current_page
            "#{base_classes} #{get_theme_current_class}"
          else
            "#{base_classes} #{get_theme_page_class} focus:z-10 focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500"
          end
        end

        def disabled_classes
          "relative inline-flex items-center border #{get_size_class} font-medium #{get_theme_disabled_class}"
        end

        def page_range
          return [1] if total_pages == 1

          start_page = [current_page - window, 1].max
          end_page = [current_page + window, total_pages].min

          # Espandi il range se possibile
          if end_page - start_page < (window * 2)
            if start_page == 1
              end_page = [start_page + (window * 2), total_pages].min
            elsif end_page == total_pages
              start_page = [end_page - (window * 2), 1].max
            end
          end

          (start_page..end_page).to_a
        end

        def show_left_ellipsis?
          page_range.first > 2
        end

        def show_right_ellipsis?
          page_range.last < total_pages - 1
        end

        def build_url(page_num)
          return '#' if page_num == current_page

          uri = URI.parse(path)
          params = URI.decode_www_form(uri.query || '')
          params = params.reject { |k, _v| k == 'page' }
          params << ['page', page_num] if page_num > 1

          uri.query = params.empty? ? nil : URI.encode_www_form(params)
          uri.to_s
        end

        def previous_page
          current_page > 1 ? current_page - 1 : nil
        end

        def next_page
          current_page < total_pages ? current_page + 1 : nil
        end

        def info_text
          return '' unless show_info && per_page

          start_item = ((current_page - 1) * per_page) + 1
          end_item = [current_page * per_page, total_items].min
          
          "Mostrando #{start_item}-#{end_item} di #{total_items} risultati"
        end

        def total_items
          total_pages * per_page
        end

        def should_show_pagination?
          total_pages > 1
        end

        private

        def validate_pages
          if current_page < 1 || current_page > total_pages
            raise ArgumentError, "current_page must be between 1 and #{total_pages}"
          end

          if total_pages < 1
            raise ArgumentError, "total_pages must be at least 1"
          end
        end
      end
    end
  end
end
