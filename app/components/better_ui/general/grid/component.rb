module BetterUi
  module General
    module Grid
      class Component < BetterUi::Component
        attr_reader :cols, :gap, :rows, :started, :ended, :row_started, :row_ended, :mx, :my, :theme, :padding, :rounded, :justify, :align
        
        # renders_many per gli items configurabili
        renders_many :items, "BetterUi::General::Grid::ItemComponent"
        
        # Metodi di classe condivisi per normalizzazione parametri
        def self.normalize_responsive_hash(hash)
          return hash unless hash.is_a?(Hash)
          hash.transform_values { |v| normalize_grid_value(v) }
        end
        
        def self.normalize_grid_value(value)
          case value
          when String
            # Converte stringhe numeriche in integer, altri in symbol
            value.match?(/^\d+$/) ? value.to_i : value.to_sym
          when Symbol, Integer
            value
          else
            value
          end
        end
        
        # Costanti per colonne base e responsive
        GRID_COLS_BASE_CLASSES = {
          1 => "grid-cols-1", 2 => "grid-cols-2", 3 => "grid-cols-3",
          4 => "grid-cols-4", 5 => "grid-cols-5", 6 => "grid-cols-6",
          7 => "grid-cols-7", 8 => "grid-cols-8", 9 => "grid-cols-9",
          10 => "grid-cols-10", 11 => "grid-cols-11", 12 => "grid-cols-12"
        }.freeze
        
        GRID_COLS_SM_CLASSES = {
          1 => "sm:grid-cols-1", 2 => "sm:grid-cols-2", 3 => "sm:grid-cols-3",
          4 => "sm:grid-cols-4", 5 => "sm:grid-cols-5", 6 => "sm:grid-cols-6",
          7 => "sm:grid-cols-7", 8 => "sm:grid-cols-8", 9 => "sm:grid-cols-9",
          10 => "sm:grid-cols-10", 11 => "sm:grid-cols-11", 12 => "sm:grid-cols-12"
        }.freeze
        
        GRID_COLS_MD_CLASSES = {
          1 => "md:grid-cols-1", 2 => "md:grid-cols-2", 3 => "md:grid-cols-3",
          4 => "md:grid-cols-4", 5 => "md:grid-cols-5", 6 => "md:grid-cols-6",
          7 => "md:grid-cols-7", 8 => "md:grid-cols-8", 9 => "md:grid-cols-9",
          10 => "md:grid-cols-10", 11 => "md:grid-cols-11", 12 => "md:grid-cols-12"
        }.freeze
        
        GRID_COLS_LG_CLASSES = {
          1 => "lg:grid-cols-1", 2 => "lg:grid-cols-2", 3 => "lg:grid-cols-3",
          4 => "lg:grid-cols-4", 5 => "lg:grid-cols-5", 6 => "lg:grid-cols-6",
          7 => "lg:grid-cols-7", 8 => "lg:grid-cols-8", 9 => "lg:grid-cols-9",
          10 => "lg:grid-cols-10", 11 => "lg:grid-cols-11", 12 => "lg:grid-cols-12"
        }.freeze
        
        GRID_COLS_XL_CLASSES = {
          1 => "xl:grid-cols-1", 2 => "xl:grid-cols-2", 3 => "xl:grid-cols-3",
          4 => "xl:grid-cols-4", 5 => "xl:grid-cols-5", 6 => "xl:grid-cols-6",
          7 => "xl:grid-cols-7", 8 => "xl:grid-cols-8", 9 => "xl:grid-cols-9",
          10 => "xl:grid-cols-10", 11 => "xl:grid-cols-11", 12 => "xl:grid-cols-12"
        }.freeze
        
        # Costanti per gap base e responsive
        GRID_GAP_BASE_CLASSES = {
          none: "gap-0", xs: "gap-1", sm: "gap-2", 
          md: "gap-4", lg: "gap-6", xl: "gap-8", xxl: "gap-12"
        }.freeze
        
        GRID_GAP_SM_CLASSES = {
          none: "sm:gap-0", xs: "sm:gap-1", sm: "sm:gap-2", 
          md: "sm:gap-4", lg: "sm:gap-6", xl: "sm:gap-8", xxl: "sm:gap-12"
        }.freeze
        
        GRID_GAP_MD_CLASSES = {
          none: "md:gap-0", xs: "md:gap-1", sm: "md:gap-2", 
          md: "md:gap-4", lg: "md:gap-6", xl: "md:gap-8", xxl: "md:gap-12"
        }.freeze
        
        GRID_GAP_LG_CLASSES = {
          none: "lg:gap-0", xs: "lg:gap-1", sm: "lg:gap-2", 
          md: "lg:gap-4", lg: "lg:gap-6", xl: "lg:gap-8", xxl: "lg:gap-12"
        }.freeze
        
        GRID_GAP_XL_CLASSES = {
          none: "xl:gap-0", xs: "xl:gap-1", sm: "xl:gap-2", 
          md: "xl:gap-4", lg: "xl:gap-6", xl: "xl:gap-8", xxl: "xl:gap-12"
        }.freeze
        
        # Costanti per margin x base e responsive
        GRID_MX_BASE_CLASSES = {
          none: "mx-0", xs: "mx-1", sm: "mx-2", 
          md: "mx-4", lg: "mx-6", xl: "mx-8", xxl: "mx-12",
          1 => "mx-1", 2 => "mx-2", 3 => "mx-3", 4 => "mx-4",
          5 => "mx-5", 6 => "mx-6", 8 => "mx-8", 12 => "mx-12"
        }.freeze
        
        GRID_MX_SM_CLASSES = {
          none: "sm:mx-0", xs: "sm:mx-1", sm: "sm:mx-2", 
          md: "sm:mx-4", lg: "sm:mx-6", xl: "sm:mx-8", xxl: "sm:mx-12",
          1 => "sm:mx-1", 2 => "sm:mx-2", 3 => "sm:mx-3", 4 => "sm:mx-4",
          5 => "sm:mx-5", 6 => "sm:mx-6", 8 => "sm:mx-8", 12 => "sm:mx-12"
        }.freeze
        
        GRID_MX_MD_CLASSES = {
          none: "md:mx-0", xs: "md:mx-1", sm: "md:mx-2", 
          md: "md:mx-4", lg: "md:mx-6", xl: "md:mx-8", xxl: "md:mx-12",
          1 => "md:mx-1", 2 => "md:mx-2", 3 => "md:mx-3", 4 => "md:mx-4",
          5 => "md:mx-5", 6 => "md:mx-6", 8 => "md:mx-8", 12 => "md:mx-12"
        }.freeze
        
        GRID_MX_LG_CLASSES = {
          none: "lg:mx-0", xs: "lg:mx-1", sm: "lg:mx-2", 
          md: "lg:mx-4", lg: "lg:mx-6", xl: "lg:mx-8", xxl: "lg:mx-12",
          1 => "lg:mx-1", 2 => "lg:mx-2", 3 => "lg:mx-3", 4 => "lg:mx-4",
          5 => "lg:mx-5", 6 => "lg:mx-6", 8 => "lg:mx-8", 12 => "lg:mx-12"
        }.freeze
        
        GRID_MX_XL_CLASSES = {
          none: "xl:mx-0", xs: "xl:mx-1", sm: "xl:mx-2", 
          md: "xl:mx-4", lg: "xl:mx-6", xl: "xl:mx-8", xxl: "xl:mx-12",
          1 => "xl:mx-1", 2 => "xl:mx-2", 3 => "xl:mx-3", 4 => "xl:mx-4",
          5 => "xl:mx-5", 6 => "xl:mx-6", 8 => "xl:mx-8", 12 => "xl:mx-12"
        }.freeze
        
        # Costanti per margin y base e responsive
        GRID_MY_BASE_CLASSES = {
          none: "my-0", xs: "my-1", sm: "my-2", 
          md: "my-4", lg: "my-6", xl: "my-8", xxl: "my-12",
          1 => "my-1", 2 => "my-2", 3 => "my-3", 4 => "my-4",
          5 => "my-5", 6 => "my-6", 8 => "my-8", 12 => "my-12"
        }.freeze
        
        GRID_MY_SM_CLASSES = {
          none: "sm:my-0", xs: "sm:my-1", sm: "sm:my-2", 
          md: "sm:my-4", lg: "sm:my-6", xl: "sm:my-8", xxl: "sm:my-12",
          1 => "sm:my-1", 2 => "sm:my-2", 3 => "sm:my-3", 4 => "sm:my-4",
          5 => "sm:my-5", 6 => "sm:my-6", 8 => "sm:my-8", 12 => "sm:my-12"
        }.freeze
        
        GRID_MY_MD_CLASSES = {
          none: "md:my-0", xs: "md:my-1", sm: "md:my-2", 
          md: "md:my-4", lg: "md:my-6", xl: "md:my-8", xxl: "md:my-12",
          1 => "md:my-1", 2 => "md:my-2", 3 => "md:my-3", 4 => "md:my-4",
          5 => "md:my-5", 6 => "md:my-6", 8 => "md:my-8", 12 => "md:my-12"
        }.freeze
        
        GRID_MY_LG_CLASSES = {
          none: "lg:my-0", xs: "lg:my-1", sm: "lg:my-2", 
          md: "lg:my-4", lg: "lg:my-6", xl: "lg:my-8", xxl: "lg:my-12",
          1 => "lg:my-1", 2 => "lg:my-2", 3 => "lg:my-3", 4 => "lg:my-4",
          5 => "lg:my-5", 6 => "lg:my-6", 8 => "lg:my-8", 12 => "lg:my-12"
        }.freeze
        
        GRID_MY_XL_CLASSES = {
          none: "xl:my-0", xs: "xl:my-1", sm: "xl:my-2", 
          md: "xl:my-4", lg: "xl:my-6", xl: "xl:my-8", xxl: "xl:my-12",
          1 => "xl:my-1", 2 => "xl:my-2", 3 => "xl:my-3", 4 => "xl:my-4",
          5 => "xl:my-5", 6 => "xl:my-6", 8 => "xl:my-8", 12 => "xl:my-12"
        }.freeze
        
        # Costanti per righe base e responsive
        GRID_ROWS_BASE_CLASSES = {
          1 => "grid-rows-1", 2 => "grid-rows-2", 3 => "grid-rows-3",
          4 => "grid-rows-4", 5 => "grid-rows-5", 6 => "grid-rows-6"
        }.freeze
        
        GRID_ROWS_SM_CLASSES = {
          1 => "sm:grid-rows-1", 2 => "sm:grid-rows-2", 3 => "sm:grid-rows-3",
          4 => "sm:grid-rows-4", 5 => "sm:grid-rows-5", 6 => "sm:grid-rows-6"
        }.freeze
        
        GRID_ROWS_MD_CLASSES = {
          1 => "md:grid-rows-1", 2 => "md:grid-rows-2", 3 => "md:grid-rows-3",
          4 => "md:grid-rows-4", 5 => "md:grid-rows-5", 6 => "md:grid-rows-6"
        }.freeze
        
        GRID_ROWS_LG_CLASSES = {
          1 => "lg:grid-rows-1", 2 => "lg:grid-rows-2", 3 => "lg:grid-rows-3",
          4 => "lg:grid-rows-4", 5 => "lg:grid-rows-5", 6 => "lg:grid-rows-6"
        }.freeze
        
        GRID_ROWS_XL_CLASSES = {
          1 => "xl:grid-rows-1", 2 => "xl:grid-rows-2", 3 => "xl:grid-rows-3",
          4 => "xl:grid-rows-4", 5 => "xl:grid-rows-5", 6 => "xl:grid-rows-6"
        }.freeze
        
        # Costanti per posizionamento grid
        GRID_STARTED_BASE_CLASSES = {
          1 => "col-start-1", 2 => "col-start-2", 3 => "col-start-3",
          4 => "col-start-4", 5 => "col-start-5", 6 => "col-start-6",
          7 => "col-start-7", 8 => "col-start-8", 9 => "col-start-9",
          10 => "col-start-10", 11 => "col-start-11", 12 => "col-start-12",
          auto: "col-start-auto"
        }.freeze
        
        GRID_STARTED_SM_CLASSES = {
          1 => "sm:col-start-1", 2 => "sm:col-start-2", 3 => "sm:col-start-3",
          4 => "sm:col-start-4", 5 => "sm:col-start-5", 6 => "sm:col-start-6",
          7 => "sm:col-start-7", 8 => "sm:col-start-8", 9 => "sm:col-start-9",
          10 => "sm:col-start-10", 11 => "sm:col-start-11", 12 => "sm:col-start-12",
          auto: "sm:col-start-auto"
        }.freeze
        
        GRID_STARTED_MD_CLASSES = {
          1 => "md:col-start-1", 2 => "md:col-start-2", 3 => "md:col-start-3",
          4 => "md:col-start-4", 5 => "md:col-start-5", 6 => "md:col-start-6",
          7 => "md:col-start-7", 8 => "md:col-start-8", 9 => "md:col-start-9",
          10 => "md:col-start-10", 11 => "md:col-start-11", 12 => "md:col-start-12",
          auto: "md:col-start-auto"
        }.freeze
        
        GRID_STARTED_LG_CLASSES = {
          1 => "lg:col-start-1", 2 => "lg:col-start-2", 3 => "lg:col-start-3",
          4 => "lg:col-start-4", 5 => "lg:col-start-5", 6 => "lg:col-start-6",
          7 => "lg:col-start-7", 8 => "lg:col-start-8", 9 => "lg:col-start-9",
          10 => "lg:col-start-10", 11 => "lg:col-start-11", 12 => "lg:col-start-12",
          auto: "lg:col-start-auto"
        }.freeze
        
        GRID_STARTED_XL_CLASSES = {
          1 => "xl:col-start-1", 2 => "xl:col-start-2", 3 => "xl:col-start-3",
          4 => "xl:col-start-4", 5 => "xl:col-start-5", 6 => "xl:col-start-6",
          7 => "xl:col-start-7", 8 => "xl:col-start-8", 9 => "xl:col-start-9",
          10 => "xl:col-start-10", 11 => "xl:col-start-11", 12 => "xl:col-start-12",
          auto: "xl:col-start-auto"
        }.freeze
        
        GRID_ENDED_BASE_CLASSES = {
          1 => "col-end-1", 2 => "col-end-2", 3 => "col-end-3",
          4 => "col-end-4", 5 => "col-end-5", 6 => "col-end-6",
          7 => "col-end-7", 8 => "col-end-8", 9 => "col-end-9",
          10 => "col-end-10", 11 => "col-end-11", 12 => "col-end-12",
          auto: "col-end-auto"
        }.freeze
        
        GRID_ENDED_SM_CLASSES = {
          1 => "sm:col-end-1", 2 => "sm:col-end-2", 3 => "sm:col-end-3",
          4 => "sm:col-end-4", 5 => "sm:col-end-5", 6 => "sm:col-end-6",
          7 => "sm:col-end-7", 8 => "sm:col-end-8", 9 => "sm:col-end-9",
          10 => "sm:col-end-10", 11 => "sm:col-end-11", 12 => "sm:col-end-12",
          auto: "sm:col-end-auto"
        }.freeze
        
        GRID_ENDED_MD_CLASSES = {
          1 => "md:col-end-1", 2 => "md:col-end-2", 3 => "md:col-end-3",
          4 => "md:col-end-4", 5 => "md:col-end-5", 6 => "md:col-end-6",
          7 => "md:col-end-7", 8 => "md:col-end-8", 9 => "md:col-end-9",
          10 => "md:col-end-10", 11 => "md:col-end-11", 12 => "md:col-end-12",
          auto: "md:col-end-auto"
        }.freeze
        
        GRID_ENDED_LG_CLASSES = {
          1 => "lg:col-end-1", 2 => "lg:col-end-2", 3 => "lg:col-end-3",
          4 => "lg:col-end-4", 5 => "lg:col-end-5", 6 => "lg:col-end-6",
          7 => "lg:col-end-7", 8 => "lg:col-end-8", 9 => "lg:col-end-9",
          10 => "lg:col-end-10", 11 => "lg:col-end-11", 12 => "lg:col-end-12",
          auto: "lg:col-end-auto"
        }.freeze
        
        GRID_ENDED_XL_CLASSES = {
          1 => "xl:col-end-1", 2 => "xl:col-end-2", 3 => "xl:col-end-3",
          4 => "xl:col-end-4", 5 => "xl:col-end-5", 6 => "xl:col-end-6",
          7 => "xl:col-end-7", 8 => "xl:col-end-8", 9 => "xl:col-end-9",
          10 => "xl:col-end-10", 11 => "xl:col-end-11", 12 => "xl:col-end-12",
          auto: "xl:col-end-auto"
        }.freeze
        
        GRID_ROW_STARTED_BASE_CLASSES = {
          1 => "row-start-1", 2 => "row-start-2", 3 => "row-start-3",
          4 => "row-start-4", 5 => "row-start-5", 6 => "row-start-6",
          auto: "row-start-auto"
        }.freeze
        
        GRID_ROW_STARTED_SM_CLASSES = {
          1 => "sm:row-start-1", 2 => "sm:row-start-2", 3 => "sm:row-start-3",
          4 => "sm:row-start-4", 5 => "sm:row-start-5", 6 => "sm:row-start-6",
          auto: "sm:row-start-auto"
        }.freeze
        
        GRID_ROW_STARTED_MD_CLASSES = {
          1 => "md:row-start-1", 2 => "md:row-start-2", 3 => "md:row-start-3",
          4 => "md:row-start-4", 5 => "md:row-start-5", 6 => "md:row-start-6",
          auto: "md:row-start-auto"
        }.freeze
        
        GRID_ROW_STARTED_LG_CLASSES = {
          1 => "lg:row-start-1", 2 => "lg:row-start-2", 3 => "lg:row-start-3",
          4 => "lg:row-start-4", 5 => "lg:row-start-5", 6 => "lg:row-start-6",
          auto: "lg:row-start-auto"
        }.freeze
        
        GRID_ROW_STARTED_XL_CLASSES = {
          1 => "xl:row-start-1", 2 => "xl:row-start-2", 3 => "xl:row-start-3",
          4 => "xl:row-start-4", 5 => "xl:row-start-5", 6 => "xl:row-start-6",
          auto: "xl:row-start-auto"
        }.freeze
        
        GRID_ROW_ENDED_BASE_CLASSES = {
          1 => "row-end-1", 2 => "row-end-2", 3 => "row-end-3",
          4 => "row-end-4", 5 => "row-end-5", 6 => "row-end-6",
          auto: "row-end-auto"
        }.freeze
        
        GRID_ROW_ENDED_SM_CLASSES = {
          1 => "sm:row-end-1", 2 => "sm:row-end-2", 3 => "sm:row-end-3",
          4 => "sm:row-end-4", 5 => "sm:row-end-5", 6 => "sm:row-end-6",
          auto: "sm:row-end-auto"
        }.freeze
        
        GRID_ROW_ENDED_MD_CLASSES = {
          1 => "md:row-end-1", 2 => "md:row-end-2", 3 => "md:row-end-3",
          4 => "md:row-end-4", 5 => "md:row-end-5", 6 => "md:row-end-6",
          auto: "md:row-end-auto"
        }.freeze
        
        GRID_ROW_ENDED_LG_CLASSES = {
          1 => "lg:row-end-1", 2 => "lg:row-end-2", 3 => "lg:row-end-3",
          4 => "lg:row-end-4", 5 => "lg:row-end-5", 6 => "lg:row-end-6",
          auto: "lg:row-end-auto"
        }.freeze
        
        GRID_ROW_ENDED_XL_CLASSES = {
          1 => "xl:row-end-1", 2 => "xl:row-end-2", 3 => "xl:row-end-3",
          4 => "xl:row-end-4", 5 => "xl:row-end-5", 6 => "xl:row-end-6",
          auto: "xl:row-end-auto"
        }.freeze
        
        # Costanti per theme
        GRID_THEME_CLASSES = {
          default: "",
          white: "bg-white",
          red: "bg-red-50",
          rose: "bg-rose-50",
          orange: "bg-orange-50",
          green: "bg-green-50",
          blue: "bg-blue-50",
          yellow: "bg-yellow-50",
          violet: "bg-violet-50"
        }.freeze
        
        # Costanti per padding
        GRID_PADDING_CLASSES = {
          none: "p-0",
          xs: "p-1",
          sm: "p-2",
          md: "p-4",
          lg: "p-6",
          xl: "p-8",
          xxl: "p-12"
        }.freeze
        
        # Costanti per border radius
        GRID_ROUNDED_CLASSES = {
          none: "rounded-none",
          xs: "rounded-xs",
          sm: "rounded-sm",
          md: "rounded-md",
          lg: "rounded-lg",
          xl: "rounded-xl",
          full: "rounded-full"
        }.freeze
        
        # Costanti per justify
        GRID_JUSTIFY_CLASSES = {
          start: "justify-items-start",
          center: "justify-items-center",
          end: "justify-items-end",
          stretch: "justify-items-stretch"
        }.freeze
        
        # Costanti per align
        GRID_ALIGN_CLASSES = {
          start: "items-start",
          center: "items-center",
          end: "items-end",
          stretch: "items-stretch"
        }.freeze
        
        configure_attributes({
          theme: {
            var: :@theme,
            default: :default,
            constants: [:GRID_THEME_CLASSES],
            methods: [:get_theme_class]
          },
          padding: {
            var: :@padding,
            default: :none,
            constants: [:GRID_PADDING_CLASSES],
            methods: [:get_padding_class]
          },
          rounded: {
            var: :@rounded,
            default: :none,
            constants: [:GRID_ROUNDED_CLASSES],
            methods: [:get_rounded_class]
          },
          justify: {
            var: :@justify,
            default: :start,
            constants: [:GRID_JUSTIFY_CLASSES],
            methods: [:get_justify_class]
          },
          align: {
            var: :@align,
            default: :start,
            constants: [:GRID_ALIGN_CLASSES],
            methods: [:get_align_class]
          }
        })
        
        def initialize(
          cols: {sm: 1},
          gap: {sm: :md},
          rows: nil,
          started: nil,
          ended: nil,
          row_started: nil,
          row_ended: nil,
          mx: nil,
          my: {sm: 4},
          theme: :default,
          padding: :none,
          rounded: :none,
          justify: :start,
          align: :start,
          **html_options
        )
          # Validazione che i parametri responsive siano sempre hash
          raise ArgumentError, "cols must be a Hash" unless cols.is_a?(Hash)
          raise ArgumentError, "gap must be a Hash" unless gap.is_a?(Hash)
          raise ArgumentError, "rows must be a Hash or nil" unless rows.nil? || rows.is_a?(Hash)
          raise ArgumentError, "started must be a Hash or nil" unless started.nil? || started.is_a?(Hash)
          raise ArgumentError, "ended must be a Hash or nil" unless ended.nil? || ended.is_a?(Hash)
          raise ArgumentError, "row_started must be a Hash or nil" unless row_started.nil? || row_started.is_a?(Hash)
          raise ArgumentError, "row_ended must be a Hash or nil" unless row_ended.nil? || row_ended.is_a?(Hash)
          raise ArgumentError, "mx must be a Hash or nil" unless mx.nil? || mx.is_a?(Hash)
          raise ArgumentError, "my must be a Hash or nil" unless my.nil? || my.is_a?(Hash)
          
          @cols = self.class.normalize_responsive_hash(cols)
          @gap = self.class.normalize_responsive_hash(gap)
          @rows = rows ? self.class.normalize_responsive_hash(rows) : nil
          @started = started ? self.class.normalize_responsive_hash(started) : nil
          @ended = ended ? self.class.normalize_responsive_hash(ended) : nil
          @row_started = row_started ? self.class.normalize_responsive_hash(row_started) : nil
          @row_ended = row_ended ? self.class.normalize_responsive_hash(row_ended) : nil
          @mx = mx ? self.class.normalize_responsive_hash(mx) : nil
          @my = my ? self.class.normalize_responsive_hash(my) : nil
          @html_options = html_options
          
          # Conversione esplicita a simboli per i parametri configurabili
          @theme = theme.to_sym
          @padding = padding.to_sym
          @rounded = rounded.to_sym
          @justify = justify.to_sym
          @align = align.to_sym
          
          # Estrai i valori di default base
          @cols_default = extract_base_default(@cols, 1)
          @gap_default = extract_base_default(@gap, :md)
          @rows_default = @rows ? extract_base_default(@rows, 1) : nil
          
          validate_params                         # ✅ Validazione automatica BetterUi + component-specific
        end
        
        # Combinazione delle classi
        def grid_classes
          [
            "grid", # classe base sempre presente
            get_cols_classes,
            get_gap_classes,
            get_rows_classes,
            get_started_classes,
            get_ended_classes,
            get_row_started_classes,
            get_row_ended_classes,
            get_mx_classes,
            get_my_classes,
            get_theme_class,
            get_padding_class,
            get_rounded_class,
            get_justify_class,
            get_align_class,
            @html_options[:class]
          ].compact.join(" ")
        end
        
        private
        
        def extract_base_default(responsive_hash, fallback)
          # Se c'è 'sm' o il valore più piccolo, usalo come base
          # Altrimenti usa il fallback
          responsive_hash[:sm] || responsive_hash.values.first || fallback
        end
        
        def get_cols_classes
          parse_responsive_classes(@cols, :cols, @cols_default)
        end
        
        def get_gap_classes
          parse_responsive_classes(@gap, :gap, @gap_default)
        end
        
        def get_rows_classes
          return nil unless @rows
          parse_responsive_classes(@rows, :rows, @rows_default)
        end
        
        def get_started_classes
          return nil unless @started
          parse_responsive_classes(@started, :started, nil)
        end
        
        def get_ended_classes
          return nil unless @ended
          parse_responsive_classes(@ended, :ended, nil)
        end
        
        def get_row_started_classes
          return nil unless @row_started
          parse_responsive_classes(@row_started, :row_started, nil)
        end
        
        def get_row_ended_classes
          return nil unless @row_ended
          parse_responsive_classes(@row_ended, :row_ended, nil)
        end
        
        def get_mx_classes
          return nil unless @mx
          parse_responsive_classes(@mx, :mx, nil)
        end
        
        def get_my_classes
          return nil unless @my
          my_default = extract_base_default(@my, :md)
          parse_responsive_classes(@my, :my, my_default)
        end
        
        # Metodi generati automaticamente da configure_attributes:
        # - get_theme_class (sostituisce la versione manuale)
        # - get_padding_class (sostituisce la versione manuale)
        # - get_rounded_class (sostituisce la versione manuale)
        # - get_justify_class (sostituisce la versione manuale)
        # - get_align_class (sostituisce la versione manuale)
        
        def parse_responsive_classes(responsive_hash, type, default_value)
          classes = []
          
          # 1. SEMPRE aggiungi classe base (senza breakpoint) se c'è un default
          if default_value
            base_constant = self.class.const_get("GRID_#{type.upcase}_BASE_CLASSES")
            classes << base_constant[default_value]
          end
          
          # 2. Aggiungi classi responsive specificate
          responsive_hash.each do |breakpoint, value|
            if [:sm, :md, :lg, :xl].include?(breakpoint)
              responsive_constant = self.class.const_get("GRID_#{type.upcase}_#{breakpoint.upcase}_CLASSES")
              classes << responsive_constant[value]
            end
          end
          
          classes.compact.join(" ")
        end
        
        def validate_params
          super                           # ✅ Validazioni automatiche configure_attributes (theme, padding, rounded, justify, align)
          validate_component_params       # ✅ Validazioni specifiche di questo componente
        end
        
        def validate_component_params
          # Validazione solo per parametri grid-specific (non quelli configurabili)
          validate_hash_values(@cols, self.class::GRID_COLS_BASE_CLASSES.keys, "cols")
          validate_hash_values(@gap, self.class::GRID_GAP_BASE_CLASSES.keys, "gap")
          validate_hash_values(@rows, self.class::GRID_ROWS_BASE_CLASSES.keys, "rows") if @rows
          validate_hash_values(@started, self.class::GRID_STARTED_BASE_CLASSES.keys, "started") if @started
          validate_hash_values(@ended, self.class::GRID_ENDED_BASE_CLASSES.keys, "ended") if @ended
          validate_hash_values(@row_started, self.class::GRID_ROW_STARTED_BASE_CLASSES.keys, "row_started") if @row_started
          validate_hash_values(@row_ended, self.class::GRID_ROW_ENDED_BASE_CLASSES.keys, "row_ended") if @row_ended
          validate_hash_values(@mx, self.class::GRID_MX_BASE_CLASSES.keys, "mx") if @mx
          validate_hash_values(@my, self.class::GRID_MY_BASE_CLASSES.keys, "my") if @my
        end
        
        def validate_hash_values(hash, valid_values, param_name)
          hash.each do |_breakpoint, value|
            unless valid_values.include?(value)
              raise ArgumentError, "Invalid #{param_name} value: #{value}. Valid values are: #{valid_values.join(', ')}"
            end
          end
        end
        
        def validate_single_value(value, valid_values, param_name)
          unless valid_values.include?(value)
            raise ArgumentError, "Invalid #{param_name} value: #{value}. Valid values are: #{valid_values.join(', ')}"
          end
        end
      end
    end
  end
end
