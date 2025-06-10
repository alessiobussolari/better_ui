# frozen_string_literal: true

module BetterUi
  module Application
    module Components
      module Sidebar
        module SidebarHelper
          # Helper per creare la sidebar dell'applicazione
          #
          # @param width [Symbol] Larghezza della sidebar (:sm, :md, :lg, :xl), default :md
          # @param position [Symbol] Posizione della sidebar (:left, :right), default :left
          # @param theme [Symbol] Tema colori (default, white, red, rose, orange, green, blue, yellow, violet), default :blue
          # @param shadow [Symbol] Tipo di ombra (:none, :sm, :md, :lg), default :lg
          # @param block [Proc] Blocco per configurare header, footer e navigation_sections usando renders_one/renders_many
          #
          # @return [String] HTML del componente sidebar
          #
          # @example Uso base
          #   <%= bui_sidebar(width: :lg, theme: :blue) do |sidebar| %>
          #     <% sidebar.with_header(title: "Dashboard", logo: { name: "home", size: :md }) %>
          #     <% sidebar.with_navigation_section(title: "Menu") do |section| %>
          #       <% section.with_navigation_item(label: "Home", href: "/", icon: { name: "home" }) %>
#       <% section.with_navigation_item(label: "Settings", href: "/settings", icon: { name: "cog" }) %>
          #     <% end %>
          #     <% sidebar.with_footer(user_info: { name: "John Doe", email: "john@example.com" }) %>
          #   <% end %>
          def bui_sidebar(
            width: :md,
            position: :left,
            theme: :default,
            shadow: :lg,
            **html_options,
            &block
          )
            render BetterUi::Application::Sidebar::Component.new(
              width: width,
              position: position,
              theme: theme,
              shadow: shadow,
              **html_options
            ), &block
          end
        end
      end
    end
  end
end
