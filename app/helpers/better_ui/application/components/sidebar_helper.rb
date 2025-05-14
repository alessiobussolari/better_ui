module BetterUi
  module Application
    module Components
      module SidebarHelper
        # Helper per creare la sidebar
        def bui_sidebar(**options, &block)
          render BetterUi::Application::Sidebar::Component.new(**options), &block
        end
        
        # Helper per creare il brand
        def bui_sidebar_brand(compact, **options)
          render BetterUi::Application::Sidebar::BrandComponent.new(
            name: "BetterUI",
            logo: "https://tailwindcss.com/plus-assets/img/logos/mark.svg?color=indigo&shade=600",
            compact: compact,
            **options
          )
        end
        
        # Helper per creare un divider nella sidebar
        def bui_sidebar_divider(label = nil, **options)
          render BetterUi::Application::Sidebar::DividerComponent.new(
            label: label,
            **options
          )
        end
        
        # Helper per creare un link (supporta sia testo che blocco)
        def bui_sidebar_link(text_or_url, url_or_options = nil, icon_or_options = nil, options = {}, &block)
          if block_given?
            # Se c è un blocco, il primo parametro è l URL
            url = text_or_url
            opts = url_or_options || {}
            
            render BetterUi::Application::Sidebar::LinkComponent.new(
              url: url,
              **opts
            ) do
              # Aggiungiamo automaticamente un div flex attorno al contenuto del blocco
              content_tag(:div, class: "flex items-center") do
                capture(&block)
              end
            end
          else
            # Altrimenti, usiamo i parametri standard
            text = text_or_url
            url = url_or_options
            icon = icon_or_options
            
            render BetterUi::Application::Sidebar::LinkComponent.new(
              text: text,
              url: url,
              icon: icon,
              **options
            )
          end
        end
        
        # Helper per creare un gruppo
        def bui_sidebar_group(title, options = {}, &block)
          render BetterUi::Application::Sidebar::GroupComponent.new(
            title: title,
            **options
          ) do
            capture(&block)
          end
        end
        
        # Helper per creare un utente
        def bui_sidebar_user(compact, **options)
          default_options = {
            name: "Mario Rossi",
            email: "mario@example.com",
            role: "Amministratore",
            compact: compact
          }
          
          render BetterUi::Application::Sidebar::UserComponent.new(
            **default_options.merge(options)
          )
        end
        
        # Helper per creare un footer
        def bui_sidebar_footer(compact, **options, &block)
          render BetterUi::Application::Sidebar::FooterComponent.new(
            compact: compact,
            **options
          ) do
            capture(&block)
          end
        end
      end
    end
  end
end