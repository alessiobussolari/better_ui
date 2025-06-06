# frozen_string_literal: true

module BetterUi
  module General
    module Grid
      class CellComponent < ViewComponent::Base
        attr_reader :col, :row, :col_start, :col_end, :row_start, :row_end,
                    :justify_self, :align_self, :classes, :id, :html_options

        # Validazione valori supportati
        VALID_COL_SPANS = (1..12).to_a + [:auto, :full].freeze
        VALID_ROW_SPANS = (1..6).to_a + [:auto, :full].freeze
        VALID_COL_POSITIONS = (1..13).to_a + [:auto].freeze
        VALID_ROW_POSITIONS = (1..7).to_a + [:auto].freeze
        VALID_BREAKPOINTS = [:sm, :md, :lg, :xl].freeze
        
        # Justify self options
        GRID_CELL_JUSTIFY_SELF = {
          auto: 'justify-self-auto', start: 'justify-self-start',
          center: 'justify-self-center', end: 'justify-self-end',
          stretch: 'justify-self-stretch'
        }.freeze

        # Align self options
        GRID_CELL_ALIGN_SELF = {
          auto: 'self-auto', start: 'self-start',
          center: 'self-center', end: 'self-end',
          stretch: 'self-stretch'
        }.freeze

        def initialize(
          col: 1,
          row: nil,
          col_start: nil,
          col_end: nil,
          row_start: nil,
          row_end: nil,
          justify_self: nil,
          align_self: nil,
          classes: '',
          id: nil,
          **html_options
        )
          @col = normalize_cell_col_with_defaults(col)
          @row = normalize_cell_row_with_defaults(row) if row
          @col_start = normalize_cell_position_with_defaults(col_start) if col_start
          @col_end = normalize_cell_position_with_defaults(col_end) if col_end
          @row_start = normalize_cell_position_with_defaults(row_start) if row_start
          @row_end = normalize_cell_position_with_defaults(row_end) if row_end
          @justify_self = justify_self&.to_sym
          @align_self = align_self&.to_sym
          @classes = classes
          @id = id
          @html_options = html_options

          validate_cell_params
        end

        def combined_classes
          [
            generate_col_classes,
            generate_row_classes,
            generate_col_start_classes,
            generate_col_end_classes,
            generate_row_start_classes,
            generate_row_end_classes,
            @justify_self ? GRID_CELL_JUSTIFY_SELF[@justify_self] : nil,
            @align_self ? GRID_CELL_ALIGN_SELF[@align_self] : nil,
            @classes,
            @html_options[:class]
          ].compact.join(" ")
        end

        def cell_attributes
          attrs = {
            class: combined_classes,
            id: @id
          }

          @html_options.except(:class).each do |key, value|
            attrs[key] = value
          end

          attrs
        end

        private

        # Genera classi CSS dinamicamente invece di usare costanti massive
        def generate_col_span_class(span, breakpoint = nil)
          prefix = breakpoint ? "#{breakpoint}:" : ""
          "#{prefix}col-span-#{span}"
        end

        def generate_row_span_class(span, breakpoint = nil)
          prefix = breakpoint ? "#{breakpoint}:" : ""
          "#{prefix}row-span-#{span}"
        end

        def generate_col_start_class(start, breakpoint = nil)
          prefix = breakpoint ? "#{breakpoint}:" : ""
          "#{prefix}col-start-#{start}"
        end

        def generate_col_end_class(end_val, breakpoint = nil)
          prefix = breakpoint ? "#{breakpoint}:" : ""
          "#{prefix}col-end-#{end_val}"
        end

        def generate_row_start_class(start, breakpoint = nil)
          prefix = breakpoint ? "#{breakpoint}:" : ""
          "#{prefix}row-start-#{start}"
        end

        def generate_row_end_class(end_val, breakpoint = nil)
          prefix = breakpoint ? "#{breakpoint}:" : ""
          "#{prefix}row-end-#{end_val}"
        end

        # Normalizza col con default intelligenti per tutti i breakpoint
        def normalize_cell_col_with_defaults(col)
          # Se è un valore semplice, lo usiamo per tutti i breakpoint
          return col unless col.is_a?(Hash)

          # Se è un hash, riempiamo i breakpoint mancanti con fallback intelligente
          normalized = {}
          last_value = 1  # Default base

          # Base (senza breakpoint)
          normalized[:base] = 1

          # Processa i breakpoint in ordine
          VALID_BREAKPOINTS.each do |breakpoint|
            if col.key?(breakpoint)
              last_value = col[breakpoint]
            end
            normalized[breakpoint] = last_value
          end

          normalized
        end

        # Normalizza row con default intelligenti (solo se specificato)
        def normalize_cell_row_with_defaults(row)
          return row unless row.is_a?(Hash)

          normalized = {}
          last_value = nil

          VALID_BREAKPOINTS.each do |breakpoint|
            if row.key?(breakpoint)
              last_value = row[breakpoint]
            end
            normalized[breakpoint] = last_value if last_value
          end

          normalized
        end

        # Normalizza posizioni (start/end) con fallback intelligente
        def normalize_cell_position_with_defaults(position)
          return position unless position.is_a?(Hash)

          normalized = {}
          last_value = nil

          VALID_BREAKPOINTS.each do |breakpoint|
            if position.key?(breakpoint)
              last_value = position[breakpoint]
            end
            normalized[breakpoint] = last_value if last_value
          end

          normalized
        end

        def generate_col_classes
          return nil unless @col

          if @col.is_a?(Hash)
            classes = []
            
            # Base class (senza breakpoint)
            if @col[:base]
              classes << generate_col_span_class(@col[:base])
            end
            
            # Responsive classes
            VALID_BREAKPOINTS.each do |breakpoint|
              if @col[breakpoint]
                classes << generate_col_span_class(@col[breakpoint], breakpoint)
              end
            end
            
            classes.join(" ")
          else
            generate_col_span_class(@col)
          end
        end

        def generate_row_classes
          return nil unless @row

          if @row.is_a?(Hash)
            @row.map do |breakpoint, row_value|
              generate_row_span_class(row_value, breakpoint)
            end.compact.join(" ")
          else
            generate_row_span_class(@row)
          end
        end

        def generate_col_start_classes
          return nil unless @col_start

          if @col_start.is_a?(Hash)
            @col_start.map do |breakpoint, start_value|
              generate_col_start_class(start_value, breakpoint)
            end.compact.join(" ")
          else
            generate_col_start_class(@col_start)
          end
        end

        def generate_col_end_classes
          return nil unless @col_end

          if @col_end.is_a?(Hash)
            @col_end.map do |breakpoint, end_value|
              generate_col_end_class(end_value, breakpoint)
            end.compact.join(" ")
          else
            generate_col_end_class(@col_end)
          end
        end

        def generate_row_start_classes
          return nil unless @row_start

          if @row_start.is_a?(Hash)
            @row_start.map do |breakpoint, start_value|
              generate_row_start_class(start_value, breakpoint)
            end.compact.join(" ")
          else
            generate_row_start_class(@row_start)
          end
        end

        def generate_row_end_classes
          return nil unless @row_end

          if @row_end.is_a?(Hash)
            @row_end.map do |breakpoint, end_value|
              generate_row_end_class(end_value, breakpoint)
            end.compact.join(" ")
          else
            generate_row_end_class(@row_end)
          end
        end

        def validate_cell_params
          validate_cell_col if @col
          validate_cell_row if @row
          validate_cell_col_start if @col_start
          validate_cell_col_end if @col_end
          validate_cell_row_start if @row_start
          validate_cell_row_end if @row_end
          validate_cell_justify_self if @justify_self
          validate_cell_align_self if @align_self
        end

        def validate_cell_col
          if @col.is_a?(Hash)
            @col.each do |breakpoint, col_value|
              next if breakpoint == :base  # Skip validation for base
              
              unless VALID_BREAKPOINTS.include?(breakpoint)
                raise ArgumentError, "Breakpoint #{breakpoint} non supportato per col"
              end
              unless VALID_COL_SPANS.include?(col_value)
                raise ArgumentError, "Valore col #{col_value} non supportato per breakpoint #{breakpoint}"
              end
            end
          else
            unless VALID_COL_SPANS.include?(@col)
              raise ArgumentError, "col deve essere uno tra: #{VALID_COL_SPANS.join(', ')}"
            end
          end
        end

        def validate_cell_row
          if @row.is_a?(Hash)
            @row.each do |breakpoint, row_value|
              unless VALID_BREAKPOINTS.include?(breakpoint)
                raise ArgumentError, "Breakpoint #{breakpoint} non supportato per row"
              end
              unless VALID_ROW_SPANS.include?(row_value)
                raise ArgumentError, "Valore row #{row_value} non supportato per breakpoint #{breakpoint}"
              end
            end
          else
            unless VALID_ROW_SPANS.include?(@row)
              raise ArgumentError, "row deve essere uno tra: #{VALID_ROW_SPANS.join(', ')}"
            end
          end
        end

        def validate_cell_col_start
          if @col_start.is_a?(Hash)
            @col_start.each do |breakpoint, start_value|
              unless VALID_BREAKPOINTS.include?(breakpoint)
                raise ArgumentError, "Breakpoint #{breakpoint} non supportato per col_start"
              end
              unless VALID_COL_POSITIONS.include?(start_value)
                raise ArgumentError, "Valore col_start #{start_value} non supportato per breakpoint #{breakpoint}"
              end
            end
          else
            unless VALID_COL_POSITIONS.include?(@col_start)
              raise ArgumentError, "col_start deve essere uno tra: #{VALID_COL_POSITIONS.join(', ')}"
            end
          end
        end

        def validate_cell_col_end
          if @col_end.is_a?(Hash)
            @col_end.each do |breakpoint, end_value|
              unless VALID_BREAKPOINTS.include?(breakpoint)
                raise ArgumentError, "Breakpoint #{breakpoint} non supportato per col_end"
              end
              unless VALID_COL_POSITIONS.include?(end_value)
                raise ArgumentError, "Valore col_end #{end_value} non supportato per breakpoint #{breakpoint}"
              end
            end
          else
            unless VALID_COL_POSITIONS.include?(@col_end)
              raise ArgumentError, "col_end deve essere uno tra: #{VALID_COL_POSITIONS.join(', ')}"
            end
          end
        end

        def validate_cell_row_start
          if @row_start.is_a?(Hash)
            @row_start.each do |breakpoint, start_value|
              unless VALID_BREAKPOINTS.include?(breakpoint)
                raise ArgumentError, "Breakpoint #{breakpoint} non supportato per row_start"
              end
              unless VALID_ROW_POSITIONS.include?(start_value)
                raise ArgumentError, "Valore row_start #{start_value} non supportato per breakpoint #{breakpoint}"
              end
            end
          else
            unless VALID_ROW_POSITIONS.include?(@row_start)
              raise ArgumentError, "row_start deve essere uno tra: #{VALID_ROW_POSITIONS.join(', ')}"
            end
          end
        end

        def validate_cell_row_end
          if @row_end.is_a?(Hash)
            @row_end.each do |breakpoint, end_value|
              unless VALID_BREAKPOINTS.include?(breakpoint)
                raise ArgumentError, "Breakpoint #{breakpoint} non supportato per row_end"
              end
              unless VALID_ROW_POSITIONS.include?(end_value)
                raise ArgumentError, "Valore row_end #{end_value} non supportato per breakpoint #{breakpoint}"
              end
            end
          else
            unless VALID_ROW_POSITIONS.include?(@row_end)
              raise ArgumentError, "row_end deve essere uno tra: #{VALID_ROW_POSITIONS.join(', ')}"
            end
          end
        end

        def validate_cell_justify_self
          unless GRID_CELL_JUSTIFY_SELF.keys.include?(@justify_self)
            raise ArgumentError, "justify_self deve essere uno tra: #{GRID_CELL_JUSTIFY_SELF.keys.join(', ')}"
          end
        end

        def validate_cell_align_self
          unless GRID_CELL_ALIGN_SELF.keys.include?(@align_self)
            raise ArgumentError, "align_self deve essere uno tra: #{GRID_CELL_ALIGN_SELF.keys.join(', ')}"
          end
        end
      end
    end
  end
end
