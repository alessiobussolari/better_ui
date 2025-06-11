module BetterUi
  module General
    module Components
      module Grid
        module GridHelper
          # Helper per renderizzare un grid responsive
          #
          # @param cols [Hash] Numero di colonne per breakpoint ({sm: 1, md: 2, lg: 4})
          # @param gap [Hash] Spaziatura tra elementi ({sm: :xs, md: :md, lg: :lg})
          # @param rows [Hash] Numero di righe per breakpoint (opzionale)
          # @param started [Hash] Posizione di inizio del grid (opzionale)
          # @param ended [Hash] Posizione di fine del grid (opzionale)
          # @param row_started [Hash] Riga di inizio del grid (opzionale)
          # @param row_ended [Hash] Riga di fine del grid (opzionale)
          # @param theme [Symbol] Tema del grid (:default, :white, :red, :rose, :orange, :green, :blue, :yellow, :violet)
          # @param padding [Symbol] Padding interno (:none, :xs, :sm, :md, :lg, :xl, :xxl)
          # @param rounded [Symbol] Border radius (:none, :xs, :sm, :md, :lg, :xl, :full)
          # @param justify [Symbol] Alignment orizzontale (:start, :center, :end, :stretch)
          # @param align [Symbol] Alignment verticale (:start, :center, :end, :stretch)
          # @param classes [String] Classi CSS aggiuntive
          # @param data [Hash] Attributi data
          # @param id [String] ID elemento
          # @param html_options [Hash] Opzioni HTML aggiuntive
          #
          # @return [String] HTML del grid
          def bui_grid(
            cols: {sm: 1},
            gap: {sm: :md},
            rows: nil,
            started: nil,
            ended: nil,
            row_started: nil,
            row_ended: nil,
            theme: :white,
            padding: :none,
            rounded: :none,
            justify: :start,
            align: :start,
            classes: nil,
            data: {},
            id: nil,
            **html_options,
            &block
          )
            render BetterUi::General::Grid::Component.new(
              cols: cols,
              gap: gap,
              rows: rows,
              started: started,
              ended: ended,
              row_started: row_started,
              row_ended: row_ended,
              theme: theme,
              padding: padding,
              rounded: rounded,
              justify: justify,
              align: align,
              class: classes,
              data: data,
              id: id,
              **html_options
            ), &block
          end
        end
      end
    end
  end
end
