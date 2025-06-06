# frozen_string_literal: true

module BetterUi
  module General
    module Grid
      class Component < ViewComponent::Base
        attr_reader :cols, :rows, :gap, :flow, :align_items, :justify_items, :classes, :id, :html_options

        # Classi base grid
        GRID_BASE_CLASSES = "grid"

        # Valori supportati per validazione
        VALID_GRID_COLS = (1..12).to_a + [:auto, :none].freeze
        VALID_GRID_ROWS = (1..6).to_a + [:auto, :none].freeze
        VALID_BREAKPOINTS = [:sm, :md, :lg, :xl].freeze

        # Gap (spaziatura)
        GRID_GAP = {
          none: 'gap-0', small: 'gap-2', medium: 'gap-4', large: 'gap-6'
        }.freeze

        # Flow (direzione)
        GRID_FLOW = {
          row: 'grid-flow-row', col: 'grid-flow-col',
          row_dense: 'grid-flow-row-dense', col_dense: 'grid-flow-col-dense'
        }.freeze

        # Align items
        GRID_ALIGN_ITEMS = {
          start: 'items-start', center: 'items-center',
          end: 'items-end', stretch: 'items-stretch'
        }.freeze

        # Justify items  
        GRID_JUSTIFY_ITEMS = {
          start: 'justify-items-start', center: 'justify-items-center',
          end: 'justify-items-end', stretch: 'justify-items-stretch'
        }.freeze

        def initialize(
          cols: 1,
          rows: nil,
          gap: :medium,
          flow: :row,
          align_items: nil,
          justify_items: nil,
          classes: '',
          id: nil,
          **html_options
        )
          @cols = normalize_grid_cols_with_defaults(cols)
          @rows = normalize_grid_rows_with_defaults(rows) if rows
          @gap = normalize_grid_gap_with_defaults(gap)
          @flow = flow.to_sym
          @align_items = align_items&.to_sym
          @justify_items = justify_items&.to_sym
          @classes = classes
          @id = id
          @html_options = html_options

          validate_grid_params
        end

        def combined_classes
          [
            GRID_BASE_CLASSES,
            generate_cols_classes,
            generate_rows_classes,
            generate_gap_classes,
            GRID_FLOW[@flow],
            @align_items ? GRID_ALIGN_ITEMS[@align_items] : nil,
            @justify_items ? GRID_JUSTIFY_ITEMS[@justify_items] : nil,
            @classes,
            @html_options[:class]
          ].compact.join(" ")
        end

        def grid_attributes
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
        def generate_grid_cols_class(cols, breakpoint = nil)
          prefix = breakpoint ? "#{breakpoint}:" : ""
          "#{prefix}grid-cols-#{cols}"
        end

        def generate_grid_rows_class(rows, breakpoint = nil)
          prefix = breakpoint ? "#{breakpoint}:" : ""
          "#{prefix}grid-rows-#{rows}"
        end

        def generate_grid_gap_class(gap, breakpoint = nil)
          prefix = breakpoint ? "#{breakpoint}:" : ""
          gap_class = GRID_GAP[gap.to_sym]
          return nil unless gap_class
          
          if breakpoint
            "#{breakpoint}:#{gap_class.sub(/^gap-/, 'gap-')}"
          else
            gap_class
          end
        end

        # Normalizza cols con default intelligenti per tutti i breakpoint
        def normalize_grid_cols_with_defaults(cols)
          # Se è un valore semplice, lo usiamo per tutti i breakpoint
          return cols unless cols.is_a?(Hash)

          # Se è un hash, riempiamo i breakpoint mancanti con fallback intelligente
          normalized = {}
          last_value = 1  # Default base

          # Base (senza breakpoint)
          normalized[:base] = 1

          # Processa i breakpoint in ordine
          VALID_BREAKPOINTS.each do |breakpoint|
            if cols.key?(breakpoint)
              last_value = cols[breakpoint]
            end
            normalized[breakpoint] = last_value
          end

          normalized
        end

        # Normalizza rows con default intelligenti (solo se specificato)
        def normalize_grid_rows_with_defaults(rows)
          return rows unless rows.is_a?(Hash)

          normalized = {}
          last_value = nil

          VALID_BREAKPOINTS.each do |breakpoint|
            if rows.key?(breakpoint)
              last_value = rows[breakpoint]
            end
            normalized[breakpoint] = last_value if last_value
          end

          normalized
        end

        # Normalizza gap con default intelligenti
        def normalize_grid_gap_with_defaults(gap)
          return gap unless gap.is_a?(Hash)

          normalized = {}
          last_value = :medium  # Default base

          VALID_BREAKPOINTS.each do |breakpoint|
            if gap.key?(breakpoint)
              last_value = gap[breakpoint]
            end
            normalized[breakpoint] = last_value
          end

          normalized
        end

        def generate_cols_classes
          return nil unless @cols

          if @cols.is_a?(Hash)
            classes = []
            
            # Base class (senza breakpoint)
            if @cols[:base]
              classes << generate_grid_cols_class(@cols[:base])
            end
            
            # Responsive classes
            VALID_BREAKPOINTS.each do |breakpoint|
              if @cols[breakpoint]
                classes << generate_grid_cols_class(@cols[breakpoint], breakpoint)
              end
            end
            
            classes.join(" ")
          else
            generate_grid_cols_class(@cols)
          end
        end

        def generate_rows_classes
          return nil unless @rows

          if @rows.is_a?(Hash)
            @rows.map do |breakpoint, rows_value|
              generate_grid_rows_class(rows_value, breakpoint)
            end.compact.join(" ")
          else
            generate_grid_rows_class(@rows)
          end
        end

        def generate_gap_classes
          if @gap.is_a?(Hash)
            @gap.map do |breakpoint, gap_value|
              generate_grid_gap_class(gap_value, breakpoint)
            end.compact.join(" ")
          else
            GRID_GAP[@gap.to_sym]
          end
        end

        def validate_grid_params
          validate_grid_cols
          validate_grid_rows if @rows
          validate_grid_gap
          validate_grid_flow
          validate_grid_align_items if @align_items
          validate_grid_justify_items if @justify_items
        end

        def validate_grid_cols
          if @cols.is_a?(Hash)
            @cols.each do |breakpoint, cols_value|
              next if breakpoint == :base  # Skip validation for base
              
              unless VALID_BREAKPOINTS.include?(breakpoint)
                raise ArgumentError, "Breakpoint #{breakpoint} non supportato per cols"
              end
              unless VALID_GRID_COLS.include?(cols_value)
                raise ArgumentError, "Valore cols #{cols_value} non supportato per breakpoint #{breakpoint}"
              end
            end
          else
            unless VALID_GRID_COLS.include?(@cols)
              raise ArgumentError, "cols deve essere uno tra: #{VALID_GRID_COLS.join(', ')}"
            end
          end
        end

        def validate_grid_rows
          if @rows.is_a?(Hash)
            @rows.each do |breakpoint, rows_value|
              unless VALID_BREAKPOINTS.include?(breakpoint)
                raise ArgumentError, "Breakpoint #{breakpoint} non supportato per rows"
              end
              unless VALID_GRID_ROWS.include?(rows_value)
                raise ArgumentError, "Valore rows #{rows_value} non supportato per breakpoint #{breakpoint}"
              end
            end
          else
            unless VALID_GRID_ROWS.include?(@rows)
              raise ArgumentError, "rows deve essere uno tra: #{VALID_GRID_ROWS.join(', ')}"
            end
          end
        end

        def validate_grid_gap
          if @gap.is_a?(Hash)
            @gap.each do |breakpoint, gap_value|
              unless VALID_BREAKPOINTS.include?(breakpoint)
                raise ArgumentError, "Breakpoint #{breakpoint} non supportato per gap"
              end
              unless GRID_GAP.keys.include?(gap_value.to_sym)
                raise ArgumentError, "Valore gap #{gap_value} non supportato per breakpoint #{breakpoint}"
              end
            end
          else
            unless GRID_GAP.keys.include?(@gap.to_sym)
              raise ArgumentError, "gap deve essere uno tra: #{GRID_GAP.keys.join(', ')}"
            end
          end
        end

        def validate_grid_flow
          unless GRID_FLOW.keys.include?(@flow)
            raise ArgumentError, "flow deve essere uno tra: #{GRID_FLOW.keys.join(', ')}"
          end
        end

        def validate_grid_align_items
          unless GRID_ALIGN_ITEMS.keys.include?(@align_items)
            raise ArgumentError, "align_items deve essere uno tra: #{GRID_ALIGN_ITEMS.keys.join(', ')}"
          end
        end

        def validate_grid_justify_items
          unless GRID_JUSTIFY_ITEMS.keys.include?(@justify_items)
            raise ArgumentError, "justify_items deve essere uno tra: #{GRID_JUSTIFY_ITEMS.keys.join(', ')}"
          end
        end
      end
    end
  end
end
