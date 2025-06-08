# frozen_string_literal: true

module BetterUi
  module General
    module Grid
      class Component < ViewComponent::Base
        attr_reader :cols, :rows, :gap, :flow, :align_items, :justify_items, :classes, :id, :html_options

        # ===== CONSTANTS =====
        
        # Valid values for grid columns (1-12)
        GRID_COLS_VALUES = (1..12).to_a.freeze
        
        # Valid values for grid rows (1-6)
        GRID_ROWS_VALUES = (1..6).to_a.freeze
        
        # Valid breakpoints for responsive design
        GRID_BREAKPOINTS = %i[sm md lg xl].freeze
        
        # Base grid classes
        GRID_BASE_CLASSES = "grid".freeze
        
        # Pre-generated grid column classes for all valid combinations
        GRID_COLS_CLASSES = {
          # Base classes
          1 => "grid-cols-1", 2 => "grid-cols-2", 3 => "grid-cols-3", 4 => "grid-cols-4",
          5 => "grid-cols-5", 6 => "grid-cols-6", 7 => "grid-cols-7", 8 => "grid-cols-8",
          9 => "grid-cols-9", 10 => "grid-cols-10", 11 => "grid-cols-11", 12 => "grid-cols-12",
          :auto => "grid-cols-auto", :none => "grid-cols-none",
          
          # Responsive classes
          sm: {
            1 => "sm:grid-cols-1", 2 => "sm:grid-cols-2", 3 => "sm:grid-cols-3", 4 => "sm:grid-cols-4",
            5 => "sm:grid-cols-5", 6 => "sm:grid-cols-6", 7 => "sm:grid-cols-7", 8 => "sm:grid-cols-8",
            9 => "sm:grid-cols-9", 10 => "sm:grid-cols-10", 11 => "sm:grid-cols-11", 12 => "sm:grid-cols-12",
            :auto => "sm:grid-cols-auto", :none => "sm:grid-cols-none"
          },
          md: {
            1 => "md:grid-cols-1", 2 => "md:grid-cols-2", 3 => "md:grid-cols-3", 4 => "md:grid-cols-4",
            5 => "md:grid-cols-5", 6 => "md:grid-cols-6", 7 => "md:grid-cols-7", 8 => "md:grid-cols-8",
            9 => "md:grid-cols-9", 10 => "md:grid-cols-10", 11 => "md:grid-cols-11", 12 => "md:grid-cols-12",
            :auto => "md:grid-cols-auto", :none => "md:grid-cols-none"
          },
          lg: {
            1 => "lg:grid-cols-1", 2 => "lg:grid-cols-2", 3 => "lg:grid-cols-3", 4 => "lg:grid-cols-4",
            5 => "lg:grid-cols-5", 6 => "lg:grid-cols-6", 7 => "lg:grid-cols-7", 8 => "lg:grid-cols-8",
            9 => "lg:grid-cols-9", 10 => "lg:grid-cols-10", 11 => "lg:grid-cols-11", 12 => "lg:grid-cols-12",
            :auto => "lg:grid-cols-auto", :none => "lg:grid-cols-none"
          },
          xl: {
            1 => "xl:grid-cols-1", 2 => "xl:grid-cols-2", 3 => "xl:grid-cols-3", 4 => "xl:grid-cols-4",
            5 => "xl:grid-cols-5", 6 => "xl:grid-cols-6", 7 => "xl:grid-cols-7", 8 => "xl:grid-cols-8",
            9 => "xl:grid-cols-9", 10 => "xl:grid-cols-10", 11 => "xl:grid-cols-11", 12 => "xl:grid-cols-12",
            :auto => "xl:grid-cols-auto", :none => "xl:grid-cols-none"
          }
        }.freeze
        
        # Pre-generated grid row classes for all valid combinations
        GRID_ROWS_CLASSES = {
          # Base classes
          1 => "grid-rows-1", 2 => "grid-rows-2", 3 => "grid-rows-3",
          4 => "grid-rows-4", 5 => "grid-rows-5", 6 => "grid-rows-6",
          :auto => "grid-rows-auto", :none => "grid-rows-none",
          
          # Responsive classes
          sm: {
            1 => "sm:grid-rows-1", 2 => "sm:grid-rows-2", 3 => "sm:grid-rows-3",
            4 => "sm:grid-rows-4", 5 => "sm:grid-rows-5", 6 => "sm:grid-rows-6",
            :auto => "sm:grid-rows-auto", :none => "sm:grid-rows-none"
          },
          md: {
            1 => "md:grid-rows-1", 2 => "md:grid-rows-2", 3 => "md:grid-rows-3",
            4 => "md:grid-rows-4", 5 => "md:grid-rows-5", 6 => "md:grid-rows-6",
            :auto => "md:grid-rows-auto", :none => "md:grid-rows-none"
          },
          lg: {
            1 => "lg:grid-rows-1", 2 => "lg:grid-rows-2", 3 => "lg:grid-rows-3",
            4 => "lg:grid-rows-4", 5 => "lg:grid-rows-5", 6 => "lg:grid-rows-6",
            :auto => "lg:grid-rows-auto", :none => "lg:grid-rows-none"
          },
          xl: {
            1 => "xl:grid-rows-1", 2 => "xl:grid-rows-2", 3 => "xl:grid-rows-3",
            4 => "xl:grid-rows-4", 5 => "xl:grid-rows-5", 6 => "xl:grid-rows-6",
            :auto => "xl:grid-rows-auto", :none => "xl:grid-rows-none"
          }
        }.freeze
        
        # Grid flow options
        GRID_FLOW = {
          row: "grid-flow-row",
          col: "grid-flow-col",
          dense: "grid-flow-dense",
          row_dense: "grid-flow-row-dense",
          col_dense: "grid-flow-col-dense"
        }.freeze
        
        # Grid alignment options
        GRID_ALIGN_ITEMS = {
          start: "items-start",
          end: "items-end",
          center: "items-center",
          baseline: "items-baseline",
          stretch: "items-stretch"
        }.freeze
        
        GRID_JUSTIFY_ITEMS = {
          start: "justify-items-start",
          end: "justify-items-end",
          center: "justify-items-center",
          stretch: "justify-items-stretch"
        }.freeze

        def initialize(cols: nil, rows: nil, gap: nil, flow: nil, align_items: nil, justify_items: nil, classes: nil, id: nil, **html_options)
          @cols = cols
          @rows = rows
          @gap = gap
          @flow = flow&.to_sym
          @align_items = align_items&.to_sym
          @justify_items = justify_items&.to_sym
          @classes = classes
          @id = id
          @html_options = html_options

          validate_grid_params
        end

        def combined_classes
          classes = [GRID_BASE_CLASSES]
          classes << get_cols_classes(@cols) if @cols
          classes << get_rows_classes(@rows) if @rows
          classes << @gap if @gap
          classes << get_flow_class(@flow) if @flow
          classes << get_align_items_class(@align_items) if @align_items
          classes << get_justify_items_class(@justify_items) if @justify_items
          classes << @classes if @classes
          classes << @html_options[:class] if @html_options[:class]
          classes.compact.join(" ")
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

        # ===== HELPER METHODS =====
        
        def get_normalized_cols(cols)
          return 1 if cols.nil?
          return cols if cols.is_a?(Hash)
          return cols if %i[auto none].include?(cols)
          
          cols.to_i
        end
        
        def get_normalized_rows(rows)
          return 1 if rows.nil?
          return rows if rows.is_a?(Hash)
          return rows if %i[auto none].include?(rows)
          
          rows.to_i
        end
        
        def get_grid_cols_class(cols, breakpoint = nil)
          if breakpoint
            GRID_COLS_CLASSES[breakpoint]&.[](cols) || ""
          else
            GRID_COLS_CLASSES[cols] || ""
          end
        end
        
        def get_grid_rows_class(rows, breakpoint = nil)
          if breakpoint
            GRID_ROWS_CLASSES[breakpoint]&.[](rows) || ""
          else
            GRID_ROWS_CLASSES[rows] || ""
          end
        end
        
        def get_cols_classes(cols)
          normalized_cols = get_normalized_cols(cols)
          
          if normalized_cols.is_a?(Hash)
            # Handle responsive breakpoints
            normalized_cols.map do |breakpoint, value|
              get_grid_cols_class(value, breakpoint)
            end.join(" ")
          else
            # Handle single value
            get_grid_cols_class(normalized_cols)
          end
        end
        
        def get_rows_classes(rows)
          normalized_rows = get_normalized_rows(rows)
          
          if normalized_rows.is_a?(Hash)
            # Handle responsive breakpoints
            normalized_rows.map do |breakpoint, value|
              get_grid_rows_class(value, breakpoint)
            end.join(" ")
          else
            # Handle single value
            get_grid_rows_class(normalized_rows)
          end
        end
        
        def get_flow_class(flow)
          GRID_FLOW[flow]
        end
        
        def get_align_items_class(align_items)
          GRID_ALIGN_ITEMS[align_items]
        end
        
        def get_justify_items_class(justify_items)
          GRID_JUSTIFY_ITEMS[justify_items]
        end

        # ===== VALIDATION METHODS =====
        
        def validate_grid_params
          validate_cols(@cols) if @cols
          validate_rows(@rows) if @rows
          validate_flow(@flow) if @flow
          validate_align_items(@align_items) if @align_items
          validate_justify_items(@justify_items) if @justify_items
        end
        
        def validate_cols(cols)
          return if cols.nil?
          
          if cols.is_a?(Hash)
            cols.each do |breakpoint, value|
              validate_breakpoint(breakpoint)
              validate_single_cols_value(value)
            end
          else
            validate_single_cols_value(cols)
          end
        end
        
        def validate_rows(rows)
          return if rows.nil?
          
          if rows.is_a?(Hash)
            rows.each do |breakpoint, value|
              validate_breakpoint(breakpoint)
              validate_single_rows_value(value)
            end
          else
            validate_single_rows_value(rows)
          end
        end
        
        def validate_single_cols_value(value)
          return if %i[auto none].include?(value)
          
          unless GRID_COLS_VALUES.include?(value.to_i)
            raise ArgumentError, "Invalid cols value: #{value}. Must be one of #{GRID_COLS_VALUES}, :auto, or :none"
          end
        end
        
        def validate_single_rows_value(value)
          return if %i[auto none].include?(value)
          
          unless GRID_ROWS_VALUES.include?(value.to_i)
            raise ArgumentError, "Invalid rows value: #{value}. Must be one of #{GRID_ROWS_VALUES}, :auto, or :none"
          end
        end
        
        def validate_breakpoint(breakpoint)
          unless GRID_BREAKPOINTS.include?(breakpoint.to_sym)
            raise ArgumentError, "Invalid breakpoint: #{breakpoint}. Must be one of #{GRID_BREAKPOINTS}"
          end
        end
        
        def validate_flow(flow)
          unless GRID_FLOW.key?(flow)
            raise ArgumentError, "Invalid flow value: #{flow}. Must be one of #{GRID_FLOW.keys}"
          end
        end
        
        def validate_align_items(align_items)
          unless GRID_ALIGN_ITEMS.key?(align_items)
            raise ArgumentError, "Invalid align_items value: #{align_items}. Must be one of #{GRID_ALIGN_ITEMS.keys}"
          end
        end
        
        def validate_justify_items(justify_items)
          unless GRID_JUSTIFY_ITEMS.key?(justify_items)
            raise ArgumentError, "Invalid justify_items value: #{justify_items}. Must be one of #{GRID_JUSTIFY_ITEMS.keys}"
          end
        end
      end
    end
  end
end
