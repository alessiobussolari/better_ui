module BetterUi
  module General
    module Components
      module Table
        # Require di tutti i file helper
        require_relative 'table/table_helper'
        require_relative 'table/thead_helper'
        require_relative 'table/tbody_helper'
        require_relative 'table/tfoot_helper'
        require_relative 'table/tr_helper'
        require_relative 'table/th_helper'
        require_relative 'table/td_helper'

        # Include di tutti i moduli helper nel modulo Table
        include TableHelper
        include TheadHelper
        include TbodyHelper
        include TfootHelper
        include TrHelper
        include ThHelper
        include TdHelper
      end
    end
  end
end
