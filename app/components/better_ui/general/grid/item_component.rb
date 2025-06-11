module BetterUi
  module General
    module Grid
      class ItemComponent < BetterUi::Component
        attr_reader :span, :started, :ended, :row_span, :row_started, :row_ended, :theme, :padding, :rounded
        
GRID_ITEM_BASE_CLASSES = 'w-full'.freeze

        # Costanti per span (col-span)
        GRID_ITEM_SPAN_BASE_CLASSES = {
          1 => "col-span-1", 2 => "col-span-2", 3 => "col-span-3",
          4 => "col-span-4", 5 => "col-span-5", 6 => "col-span-6",
          7 => "col-span-7", 8 => "col-span-8", 9 => "col-span-9",
          10 => "col-span-10", 11 => "col-span-11", 12 => "col-span-12",
          full: "col-span-full", auto: "col-auto"
        }.freeze
        
        GRID_ITEM_SPAN_SM_CLASSES = {
          1 => "sm:col-span-1", 2 => "sm:col-span-2", 3 => "sm:col-span-3",
          4 => "sm:col-span-4", 5 => "sm:col-span-5", 6 => "sm:col-span-6",
          7 => "sm:col-span-7", 8 => "sm:col-span-8", 9 => "sm:col-span-9",
          10 => "sm:col-span-10", 11 => "sm:col-span-11", 12 => "sm:col-span-12",
          full: "sm:col-span-full", auto: "sm:col-auto"
        }.freeze
        
        GRID_ITEM_SPAN_MD_CLASSES = {
          1 => "md:col-span-1", 2 => "md:col-span-2", 3 => "md:col-span-3",
          4 => "md:col-span-4", 5 => "md:col-span-5", 6 => "md:col-span-6",
          7 => "md:col-span-7", 8 => "md:col-span-8", 9 => "md:col-span-9",
          10 => "md:col-span-10", 11 => "md:col-span-11", 12 => "md:col-span-12",
          full: "md:col-span-full", auto: "md:col-auto"
        }.freeze
        
        GRID_ITEM_SPAN_LG_CLASSES = {
          1 => "lg:col-span-1", 2 => "lg:col-span-2", 3 => "lg:col-span-3",
          4 => "lg:col-span-4", 5 => "lg:col-span-5", 6 => "lg:col-span-6",
          7 => "lg:col-span-7", 8 => "lg:col-span-8", 9 => "lg:col-span-9",
          10 => "lg:col-span-10", 11 => "lg:col-span-11", 12 => "lg:col-span-12",
          full: "lg:col-span-full", auto: "lg:col-auto"
        }.freeze
        
        GRID_ITEM_SPAN_XL_CLASSES = {
          1 => "xl:col-span-1", 2 => "xl:col-span-2", 3 => "xl:col-span-3",
          4 => "xl:col-span-4", 5 => "xl:col-span-5", 6 => "xl:col-span-6",
          7 => "xl:col-span-7", 8 => "xl:col-span-8", 9 => "xl:col-span-9",
          10 => "xl:col-span-10", 11 => "xl:col-span-11", 12 => "xl:col-span-12",
          full: "xl:col-span-full", auto: "xl:col-auto"
        }.freeze
        
        # Costanti per started (col-start)
        GRID_ITEM_STARTED_BASE_CLASSES = {
          1 => "col-start-1", 2 => "col-start-2", 3 => "col-start-3",
          4 => "col-start-4", 5 => "col-start-5", 6 => "col-start-6",
          7 => "col-start-7", 8 => "col-start-8", 9 => "col-start-9",
          10 => "col-start-10", 11 => "col-start-11", 12 => "col-start-12",
          auto: "col-start-auto"
        }.freeze
        
        GRID_ITEM_STARTED_SM_CLASSES = {
          1 => "sm:col-start-1", 2 => "sm:col-start-2", 3 => "sm:col-start-3",
          4 => "sm:col-start-4", 5 => "sm:col-start-5", 6 => "sm:col-start-6",
          7 => "sm:col-start-7", 8 => "sm:col-start-8", 9 => "sm:col-start-9",
          10 => "sm:col-start-10", 11 => "sm:col-start-11", 12 => "sm:col-start-12",
          auto: "sm:col-start-auto"
        }.freeze
        
        GRID_ITEM_STARTED_MD_CLASSES = {
          1 => "md:col-start-1", 2 => "md:col-start-2", 3 => "md:col-start-3",
          4 => "md:col-start-4", 5 => "md:col-start-5", 6 => "md:col-start-6",
          7 => "md:col-start-7", 8 => "md:col-start-8", 9 => "md:col-start-9",
          10 => "md:col-start-10", 11 => "md:col-start-11", 12 => "md:col-start-12",
          auto: "md:col-start-auto"
        }.freeze
        
        GRID_ITEM_STARTED_LG_CLASSES = {
          1 => "lg:col-start-1", 2 => "lg:col-start-2", 3 => "lg:col-start-3",
          4 => "lg:col-start-4", 5 => "lg:col-start-5", 6 => "lg:col-start-6",
          7 => "lg:col-start-7", 8 => "lg:col-start-8", 9 => "lg:col-start-9",
          10 => "lg:col-start-10", 11 => "lg:col-start-11", 12 => "lg:col-start-12",
          auto: "lg:col-start-auto"
        }.freeze
        
        GRID_ITEM_STARTED_XL_CLASSES = {
          1 => "xl:col-start-1", 2 => "xl:col-start-2", 3 => "xl:col-start-3",
          4 => "xl:col-start-4", 5 => "xl:col-start-5", 6 => "xl:col-start-6",
          7 => "xl:col-start-7", 8 => "xl:col-start-8", 9 => "xl:col-start-9",
          10 => "xl:col-start-10", 11 => "xl:col-start-11", 12 => "xl:col-start-12",
          auto: "xl:col-start-auto"
        }.freeze
        
        # Costanti per ended (col-end)
        GRID_ITEM_ENDED_BASE_CLASSES = {
          1 => "col-end-1", 2 => "col-end-2", 3 => "col-end-3",
          4 => "col-end-4", 5 => "col-end-5", 6 => "col-end-6",
          7 => "col-end-7", 8 => "col-end-8", 9 => "col-end-9",
          10 => "col-end-10", 11 => "col-end-11", 12 => "col-end-12",
          auto: "col-end-auto"
        }.freeze
        
        GRID_ITEM_ENDED_SM_CLASSES = {
          1 => "sm:col-end-1", 2 => "sm:col-end-2", 3 => "sm:col-end-3",
          4 => "sm:col-end-4", 5 => "sm:col-end-5", 6 => "sm:col-end-6",
          7 => "sm:col-end-7", 8 => "sm:col-end-8", 9 => "sm:col-end-9",
          10 => "sm:col-end-10", 11 => "sm:col-end-11", 12 => "sm:col-end-12",
          auto: "sm:col-end-auto"
        }.freeze
        
        GRID_ITEM_ENDED_MD_CLASSES = {
          1 => "md:col-end-1", 2 => "md:col-end-2", 3 => "md:col-end-3",
          4 => "md:col-end-4", 5 => "md:col-end-5", 6 => "md:col-end-6",
          7 => "md:col-end-7", 8 => "md:col-end-8", 9 => "md:col-end-9",
          10 => "md:col-end-10", 11 => "md:col-end-11", 12 => "md:col-end-12",
          auto: "md:col-end-auto"
        }.freeze
        
        GRID_ITEM_ENDED_LG_CLASSES = {
          1 => "lg:col-end-1", 2 => "lg:col-end-2", 3 => "lg:col-end-3",
          4 => "lg:col-end-4", 5 => "lg:col-end-5", 6 => "lg:col-end-6",
          7 => "lg:col-end-7", 8 => "lg:col-end-8", 9 => "lg:col-end-9",
          10 => "lg:col-end-10", 11 => "lg:col-end-11", 12 => "lg:col-end-12",
          auto: "lg:col-end-auto"
        }.freeze
        
        GRID_ITEM_ENDED_XL_CLASSES = {
          1 => "xl:col-end-1", 2 => "xl:col-end-2", 3 => "xl:col-end-3",
          4 => "xl:col-end-4", 5 => "xl:col-end-5", 6 => "xl:col-end-6",
          7 => "xl:col-end-7", 8 => "xl:col-end-8", 9 => "xl:col-end-9",
          10 => "xl:col-end-10", 11 => "xl:col-end-11", 12 => "xl:col-end-12",
          auto: "xl:col-end-auto"
        }.freeze
        
        # Costanti per row_span
        GRID_ITEM_ROW_SPAN_BASE_CLASSES = {
          1 => "row-span-1", 2 => "row-span-2", 3 => "row-span-3",
          4 => "row-span-4", 5 => "row-span-5", 6 => "row-span-6",
          full: "row-span-full", auto: "row-auto"
        }.freeze
        
        GRID_ITEM_ROW_SPAN_SM_CLASSES = {
          1 => "sm:row-span-1", 2 => "sm:row-span-2", 3 => "sm:row-span-3",
          4 => "sm:row-span-4", 5 => "sm:row-span-5", 6 => "sm:row-span-6",
          full: "sm:row-span-full", auto: "sm:row-auto"
        }.freeze
        
        GRID_ITEM_ROW_SPAN_MD_CLASSES = {
          1 => "md:row-span-1", 2 => "md:row-span-2", 3 => "md:row-span-3",
          4 => "md:row-span-4", 5 => "md:row-span-5", 6 => "md:row-span-6",
          full: "md:row-span-full", auto: "md:row-auto"
        }.freeze
        
        GRID_ITEM_ROW_SPAN_LG_CLASSES = {
          1 => "lg:row-span-1", 2 => "lg:row-span-2", 3 => "lg:row-span-3",
          4 => "lg:row-span-4", 5 => "lg:row-span-5", 6 => "lg:row-span-6",
          full: "lg:row-span-full", auto: "lg:row-auto"
        }.freeze
        
        GRID_ITEM_ROW_SPAN_XL_CLASSES = {
          1 => "xl:row-span-1", 2 => "xl:row-span-2", 3 => "xl:row-span-3",
          4 => "xl:row-span-4", 5 => "xl:row-span-5", 6 => "xl:row-span-6",
          full: "xl:row-span-full", auto: "xl:row-auto"
        }.freeze
        
        # Costanti per row_started
        GRID_ITEM_ROW_STARTED_BASE_CLASSES = {
          1 => "row-start-1", 2 => "row-start-2", 3 => "row-start-3",
          4 => "row-start-4", 5 => "row-start-5", 6 => "row-start-6",
          auto: "row-start-auto"
        }.freeze
        
        GRID_ITEM_ROW_STARTED_SM_CLASSES = {
          1 => "sm:row-start-1", 2 => "sm:row-start-2", 3 => "sm:row-start-3",
          4 => "sm:row-start-4", 5 => "sm:row-start-5", 6 => "sm:row-start-6",
          auto: "sm:row-start-auto"
        }.freeze
        
        GRID_ITEM_ROW_STARTED_MD_CLASSES = {
          1 => "md:row-start-1", 2 => "md:row-start-2", 3 => "md:row-start-3",
          4 => "md:row-start-4", 5 => "md:row-start-5", 6 => "md:row-start-6",
          auto: "md:row-start-auto"
        }.freeze
        
        GRID_ITEM_ROW_STARTED_LG_CLASSES = {
          1 => "lg:row-start-1", 2 => "lg:row-start-2", 3 => "lg:row-start-3",
          4 => "lg:row-start-4", 5 => "lg:row-start-5", 6 => "lg:row-start-6",
          auto: "lg:row-start-auto"
        }.freeze
        
        GRID_ITEM_ROW_STARTED_XL_CLASSES = {
          1 => "xl:row-start-1", 2 => "xl:row-start-2", 3 => "xl:row-start-3",
          4 => "xl:row-start-4", 5 => "xl:row-start-5", 6 => "xl:row-start-6",
          auto: "xl:row-start-auto"
        }.freeze
        
        # Costanti per row_ended
        GRID_ITEM_ROW_ENDED_BASE_CLASSES = {
          1 => "row-end-1", 2 => "row-end-2", 3 => "row-end-3",
          4 => "row-end-4", 5 => "row-end-5", 6 => "row-end-6",
          auto: "row-end-auto"
        }.freeze
        
        GRID_ITEM_ROW_ENDED_SM_CLASSES = {
          1 => "sm:row-end-1", 2 => "sm:row-end-2", 3 => "sm:row-end-3",
          4 => "sm:row-end-4", 5 => "sm:row-end-5", 6 => "sm:row-end-6",
          auto: "sm:row-end-auto"
        }.freeze
        
        GRID_ITEM_ROW_ENDED_MD_CLASSES = {
          1 => "md:row-end-1", 2 => "md:row-end-2", 3 => "md:row-end-3",
          4 => "md:row-end-4", 5 => "md:row-end-5", 6 => "md:row-end-6",
          auto: "md:row-end-auto"
        }.freeze
        
        GRID_ITEM_ROW_ENDED_LG_CLASSES = {
          1 => "lg:row-end-1", 2 => "lg:row-end-2", 3 => "lg:row-end-3",
          4 => "lg:row-end-4", 5 => "lg:row-end-5", 6 => "lg:row-end-6",
          auto: "lg:row-end-auto"
        }.freeze
        
        GRID_ITEM_ROW_ENDED_XL_CLASSES = {
          1 => "xl:row-end-1", 2 => "xl:row-end-2", 3 => "xl:row-end-3",
          4 => "xl:row-end-4", 5 => "xl:row-end-5", 6 => "xl:row-end-6",
          auto: "xl:row-end-auto"
        }.freeze
        
        # Costanti per theme
        GRID_ITEM_THEME_CLASSES = {
          transparent: "bg-transparent",
          default: "bg-gray-50",
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
        GRID_ITEM_PADDING_CLASSES = {
          none: "p-0",
          xs: "p-1",
          sm: "p-2",
          md: "p-4",
          lg: "p-6",
          xl: "p-8",
          xxl: "p-12"
        }.freeze
        
        # Costanti per border radius
        GRID_ITEM_ROUNDED_CLASSES = {
          none: "rounded-none",
          xs: "rounded-xs",
          sm: "rounded-sm",
          md: "rounded-md",
          lg: "rounded-lg",
          xl: "rounded-xl",
          full: "rounded-full"
        }.freeze
        
        configure_attributes({
          theme: {
            var: :@theme,
            default: :transparent,
            constants: [:GRID_ITEM_THEME_CLASSES],
            methods: [:get_theme_class]
          },
          padding: {
            var: :@padding,
            default: :none,
            constants: [:GRID_ITEM_PADDING_CLASSES],
            methods: [:get_padding_class]
          },
          rounded: {
            var: :@rounded,
            default: :none,
            constants: [:GRID_ITEM_ROUNDED_CLASSES],
            methods: [:get_rounded_class]
          }
        })
        
        def initialize(
          span: nil,
          started: nil,
          ended: nil,
          row_span: nil,
          row_started: nil,
          row_ended: nil,
          theme: :transparent,
          padding: :none,
          rounded: :none,
          **html_options
        )
          # Validazione che i parametri responsive siano hash o nil
          raise ArgumentError, "span must be a Hash or nil" unless span.nil? || span.is_a?(Hash)
          raise ArgumentError, "started must be a Hash or nil" unless started.nil? || started.is_a?(Hash)
          raise ArgumentError, "ended must be a Hash or nil" unless ended.nil? || ended.is_a?(Hash)
          raise ArgumentError, "row_span must be a Hash or nil" unless row_span.nil? || row_span.is_a?(Hash)
          raise ArgumentError, "row_started must be a Hash or nil" unless row_started.nil? || row_started.is_a?(Hash)
          raise ArgumentError, "row_ended must be a Hash or nil" unless row_ended.nil? || row_ended.is_a?(Hash)
          
          @span = span ? BetterUi::General::Grid::Component.normalize_responsive_hash(span) : nil
          @started = started ? BetterUi::General::Grid::Component.normalize_responsive_hash(started) : nil
          @ended = ended ? BetterUi::General::Grid::Component.normalize_responsive_hash(ended) : nil
          @row_span = row_span ? BetterUi::General::Grid::Component.normalize_responsive_hash(row_span) : nil
          @row_started = row_started ? BetterUi::General::Grid::Component.normalize_responsive_hash(row_started) : nil
          @row_ended = row_ended ? BetterUi::General::Grid::Component.normalize_responsive_hash(row_ended) : nil
          @html_options = html_options

          # Conversione esplicita a simboli per i parametri configurabili
          @theme = theme.to_sym
          @padding = padding.to_sym
          @rounded = rounded.to_sym
          
          validate_params                         # ✅ Validazione automatica BetterUi + component-specific
        end
        
        # Combinazione delle classi
        def item_classes
          [
            GRID_ITEM_BASE_CLASSES,
            get_span_classes,
            get_started_classes,
            get_ended_classes,
            get_row_span_classes,
            get_row_started_classes,
            get_row_ended_classes,
            get_theme_class,
            get_padding_class,
            get_rounded_class,
            @html_options[:class]
          ].compact.join(" ")
        end
        
        private
        
        def get_span_classes
          return nil unless @span
          parse_responsive_classes(@span, :span)
        end
        
        def get_started_classes
          return nil unless @started
          parse_responsive_classes(@started, :started)
        end
        
        def get_ended_classes
          return nil unless @ended
          parse_responsive_classes(@ended, :ended)
        end
        
        def get_row_span_classes
          return nil unless @row_span
          parse_responsive_classes(@row_span, :row_span)
        end
        
        def get_row_started_classes
          return nil unless @row_started
          parse_responsive_classes(@row_started, :row_started)
        end
        
        def get_row_ended_classes
          return nil unless @row_ended
          parse_responsive_classes(@row_ended, :row_ended)
        end
        
        # Metodi generati automaticamente da configure_attributes:
        # - get_theme_class (sostituisce la versione manuale)
        # - get_padding_class (sostituisce la versione manuale)  
        # - get_rounded_class (sostituisce la versione manuale)
        
        def parse_responsive_classes(responsive_hash, type)
          classes = []
          
          responsive_hash.each do |breakpoint, value|
            if [:sm, :md, :lg, :xl].include?(breakpoint)
              responsive_constant = self.class.const_get("GRID_ITEM_#{type.upcase}_#{breakpoint.upcase}_CLASSES")
              classes << responsive_constant[value]
            else
              # Base class senza breakpoint
              base_constant = self.class.const_get("GRID_ITEM_#{type.upcase}_BASE_CLASSES")
              classes << base_constant[value]
            end
          end
          
          classes.compact.join(" ")
        end
        
        def validate_params
          super                           # ✅ Validazioni automatiche configure_attributes (theme, padding, rounded)
          validate_component_params       # ✅ Validazioni specifiche di questo componente
        end
        
        def validate_component_params
          validate_hash_values(@span, GRID_ITEM_SPAN_BASE_CLASSES.keys, "span") if @span
          validate_hash_values(@started, GRID_ITEM_STARTED_BASE_CLASSES.keys, "started") if @started
          validate_hash_values(@ended, GRID_ITEM_ENDED_BASE_CLASSES.keys, "ended") if @ended
          validate_hash_values(@row_span, GRID_ITEM_ROW_SPAN_BASE_CLASSES.keys, "row_span") if @row_span
          validate_hash_values(@row_started, GRID_ITEM_ROW_STARTED_BASE_CLASSES.keys, "row_started") if @row_started
          validate_hash_values(@row_ended, GRID_ITEM_ROW_ENDED_BASE_CLASSES.keys, "row_ended") if @row_ended
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
