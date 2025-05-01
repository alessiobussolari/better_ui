module BetterUi
  class ButtonComponentPreview < ViewComponent::Preview
    # @!group Tipi di bottone
    
    # @label Primary
    def primary
      render BetterUi::ButtonComponent.new(label: "Bottone Primary", type: :primary)
    end
    
    # @label Secondary
    def secondary
      render BetterUi::ButtonComponent.new(label: "Bottone Secondary", type: :secondary)
    end
    
    # @label Success
    def success
      render BetterUi::ButtonComponent.new(label: "Bottone Success", type: :success)
    end
    
    # @label Danger
    def danger
      render BetterUi::ButtonComponent.new(label: "Bottone Danger", type: :danger)
    end
    
    # @label Warning
    def warning
      render BetterUi::ButtonComponent.new(label: "Bottone Warning", type: :warning)
    end
    
    # @label Info
    def info
      render BetterUi::ButtonComponent.new(label: "Bottone Info", type: :info)
    end
    
    # @label Light
    def light
      render BetterUi::ButtonComponent.new(label: "Bottone Light", type: :light)
    end
    
    # @label Dark
    def dark
      render BetterUi::ButtonComponent.new(label: "Bottone Dark", type: :dark)
    end
    
    # @!endgroup
    
    # @!group Varianti
    
    # @label Outline
    def outline
      render BetterUi::ButtonComponent.new(label: "Bottone Outline", type: :primary, outline: true)
    end
    
    # @label Full width
    def full_width
      render BetterUi::ButtonComponent.new(label: "Bottone Full Width", type: :primary, full_width: true)
    end
    
    # @label Disabled
    def disabled
      render BetterUi::ButtonComponent.new(label: "Bottone Disabilitato", type: :primary, disabled: true)
    end
    
    # @!endgroup
    
    # @!group Dimensioni
    
    # @label Small
    def small
      render BetterUi::ButtonComponent.new(label: "Bottone Small", type: :primary, size: :sm)
    end
    
    # @label Medium (default)
    def medium
      render BetterUi::ButtonComponent.new(label: "Bottone Medium", type: :primary, size: :md)
    end
    
    # @label Large
    def large
      render BetterUi::ButtonComponent.new(label: "Bottone Large", type: :primary, size: :lg)
    end
    
    # @!endgroup
    
    # @!group Con icone
    
    # @label Icona a sinistra
    def icon_left
      render BetterUi::ButtonComponent.new(label: "Icona a sinistra", type: :primary, icon: "download")
    end
    
    # @label Icona a destra
    def icon_right
      render BetterUi::ButtonComponent.new(label: "Icona a destra", type: :primary, icon: "arrow-right", icon_position: :right)
    end
    
    # @!endgroup
    
    # @!group Come link
    
    # @label Link standard
    def link
      render BetterUi::ButtonComponent.new(label: "Vai alla pagina", type: :primary, href: "#")
    end
    
    # @label Link con metodo
    def link_with_method
      render BetterUi::ButtonComponent.new(label: "Logout", type: :danger, href: "#", method: :delete)
    end
    
    # @!endgroup
    
    # @!group Con contenuto personalizzato
    
    # @label Contenuto personalizzato
    def custom_content
      render(BetterUi::ButtonComponent.new(type: :success)) do
        "<span>Contenuto</span><span class='ml-2'>personalizzato</span>".html_safe
      end
    end
    
    # @!endgroup
  end
end 