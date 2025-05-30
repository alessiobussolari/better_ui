# frozen_string_literal: true

module BetterUi
  module General
    module Components
      module Input
        module InputHelper
          # Caricare prima tutti gli helper specifici
          require_relative 'checkbox/checkbox_helper'
          require_relative 'radio/radio_helper'
          require_relative 'select/select_helper'
          require_relative 'text/text_helper'
          require_relative 'textarea/textarea_helper'
          require_relative 'datetime/datetime_helper'

          # Poi includerli nel modulo InputHelper con i namespace completi
          include BetterUi::General::Components::Input::Checkbox::CheckboxHelper
          include BetterUi::General::Components::Input::Radio::RadioHelper
          include BetterUi::General::Components::Input::Select::SelectHelper
          include BetterUi::General::Components::Input::Text::TextHelper
          include BetterUi::General::Components::Input::Textarea::TextareaHelper
          include BetterUi::General::Components::Input::Datetime::DatetimeHelper
        end
      end
    end
  end
end
