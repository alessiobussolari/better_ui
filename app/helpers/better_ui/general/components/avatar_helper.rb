module BetterUi
  module General
    module Components
      module AvatarHelper
        def bui_avatar(image = nil, **options)
          render BetterUi::General::AvatarComponent.new(
            image: image,
            **options
          )
        end
        
        # Supporto per la sintassi originale per compatibilità
        alias_method :better_ui_general_avatar, :bui_avatar
      end
    end
  end
end 