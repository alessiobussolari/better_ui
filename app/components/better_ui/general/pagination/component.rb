# frozen_string_literal: true

module BetterUi
  module General
    module Pagination
      class Component < ViewComponent::Base
        include BetterUi::Engine.helpers

        # Costanti per temi
        PAGINATION_THEME = {
          default: {
            container: 'border-gray-300',
            page: 'border-gray-300 text-gray-500 hover:bg-gray-50 hover:text-gray-700',
            current: 'border-blue-500 bg-blue-50 text-blue-600',
            disabled: 'border-gray-300 text-gray-300 cursor-not-allowed'
          },
          blue: {
            container: 'border-blue-300',
            page: 'border-blue-300 text-blue-600 hover:bg-blue-50 hover:text-blue-700',
            current: 'border-blue-500 bg-blue-100 text-blue-700',
            disabled: 'border-blue-200 text-blue-300 cursor-not-allowed'
          },
          red: {
            container: 'border-red-300',
            page: 'border-red-300 text-red-600 hover:bg-red-50 hover:text-red-700',
            current: 'border-red-500 bg-red-100 text-red-700',
            disabled: 'border-red-200 text-red-300 cursor-not-allowed'
          },
          green: {
            container: 'border-green-300',
            page: 'border-green-300 text-green-600 hover:bg-green-50 hover:text-green-700',
            current: 'border-green-500 bg-green-100 text-green-700',
            disabled: 'border-green-200 text-green-300 cursor-not-allowed'
          },
          yellow: {
            container: 'border-yellow-300',
            page: 'border-yellow-300 text-yellow-600 hover:bg-yellow-50 hover:text-yellow-700',
            current: 'border-yellow-500 bg-yellow-100 text-yellow-700',
            disabled: 'border-yellow-200 text-yellow-300 cursor-not-allowed'
          },
          violet: {
            container: 'border-violet-300',
            page: 'border-violet-300 text-violet-600 hover:bg-violet-50 hover:text-violet-700',
            current: 'border-violet-500 bg-violet-100 text-violet-700',
            disabled: 'border-violet-200 text-violet-300 cursor-not-allowed'
          },
          orange: {
            container: 'border-orange-300',
            page: 'border-orange-300 text-orange-600 hover:bg-orange-50 hover:text-orange-700',
            current: 'border-orange-500 bg-orange-100 text-orange-700',
            disabled: 'border-orange-200 text-orange-300 cursor-not-allowed'
          },
          rose: {
            container: 'border-rose-300',
            page: 'border-rose-300 text-rose-600 hover:bg-rose-50 hover:text-rose-700',
            current: 'border-rose-500 bg-rose-100 text-rose-700',
            disabled: 'border-rose-200 text-rose-300 cursor-not-allowed'
          },
          white: {
            container: 'border-white',
            page: 'border-white text-gray-700 hover:bg-white hover:text-gray-900',
            current: 'border-white bg-white text-gray-900',
            disabled: 'border-white text-gray-400 cursor-not-allowed'
          }
        }.freeze

        # Costanti per dimensioni
        PAGINATION_SIZE = {
          small: 'px-2 py-1 text-sm',
          medium: 'px-3 py-2 text-base',
          large: 'px-4 py-3 text-lg'
        }.freeze

        def initialize(current_page:, total_pages:, path:, theme: :default, size: :medium, 
                       window: 2, show_info: false, per_page: nil, classes: '', **options)
          @current_page = current_page.to_i
          @total_pages = total_pages.to_i
          @path = path
          @theme = theme
          @size = size
          @window = window.to_i
          @show_info = show_info
          @per_page = per_page
          @classes = classes
          @options = options

          validate_params
        end

        private

        attr_reader :current_page, :total_pages, :path, :theme, :size, :window, 
                    :show_info, :per_page, :classes, :options

        def validate_params
          validate_theme
          validate_size
          validate_pages
        end

        def validate_theme
          return if PAGINATION_THEME.key?(theme)

          raise ArgumentError, 
                "Invalid theme: #{theme}. Valid themes are: #{PAGINATION_THEME.keys.join(', ')}"
        end

        def validate_size
          return if PAGINATION_SIZE.key?(size)

          raise ArgumentError, 
                "Invalid size: #{size}. Valid sizes are: #{PAGINATION_SIZE.keys.join(', ')}"
        end

        def validate_pages
          if current_page < 1 || current_page > total_pages
            raise ArgumentError, "current_page must be between 1 and #{total_pages}"
          end

          if total_pages < 1
            raise ArgumentError, "total_pages must be at least 1"
          end
        end

        def theme_classes
          PAGINATION_THEME[theme]
        end

        def size_classes
          PAGINATION_SIZE[size]
        end

        def container_classes
          "inline-flex -space-x-px rounded-md shadow-sm #{theme_classes[:container]} #{classes}".strip
        end

        def page_link_classes(page_num)
          base_classes = "relative inline-flex items-center border #{size_classes} font-medium"
          
          if page_num == current_page
            "#{base_classes} #{theme_classes[:current]}"
          else
            "#{base_classes} #{theme_classes[:page]} focus:z-10 focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500"
          end
        end

        def disabled_classes
          "relative inline-flex items-center border #{size_classes} font-medium #{theme_classes[:disabled]}"
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
      end
    end
  end
end
