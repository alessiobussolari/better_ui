module BetterUi
  module General
    module Avatar
      class ComponentPreview < Lookbook::Preview
        
        # @group Con Helper
        # @label Con Helper
        # @param name text "Nome per le iniziali"
        # @param src text "https://picsum.photos/seed/picsum/200/300 (opzionale)"
        # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione dell'avatar"
        # @param shape select { choices: [circle, square, rounded] } "Forma dell'avatar"
        # @param status select { choices: ["", online, offline, busy, away] } "Stato online (opzionale)"
        # @param status_position select { choices: [bottom_right, bottom_left, top_right, top_left] } "Posizione indicatore stato"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema dell'avatar"
        # @param style select { choices: [filled, outline, light] } "Stile dell'avatar"
        # @param classes text "Classi CSS aggiuntive (opzionali)"
        # @param id text "ID elemento (opzionale)"
        def default(
          name: "Mario Rossi",
          src: "https://picsum.photos/seed/picsum/200/300",
          size: :md,
          shape: :circle,
          status: "",
          status_position: :bottom_right,
          theme: :white,
          style: :filled,
          classes: nil,
          id: nil
        )
          # Implementazione con helper bui_avatar
          # 
          # Esempi di utilizzo:
          # <%= bui_avatar(name: "Mario Rossi") %>
          # <%= bui_avatar(name: "Luca Bianchi", theme: :blue, size: :lg) %>
          # <%= bui_avatar(src: "/path/to/image.jpg", size: :xl) %>
          # <%= bui_avatar(name: "Anna Verde", status: :online, theme: :green) %>
          
          normalized = normalize_params!(
            name: name,
            src: src,
            size: size,
            shape: shape,
            status: status,
            status_position: status_position,
            theme: theme,
            style: style,
            classes: classes,
            id: id
          )

          render_with_template locals: normalized
        end
        
        # @group Componente Raw
        # @label Componente Raw
        # @param name text "Nome per le iniziali"
        # @param src text "https://picsum.photos/seed/picsum/200/300 (opzionale)"
        # @param size select { choices: [xxs, xs, sm, md, lg, xl, xxl] } "Dimensione dell'avatar"
        # @param shape select { choices: [circle, square, rounded] } "Forma dell'avatar"
        # @param status select { choices: ["", online, offline, busy, away] } "Stato online (opzionale)"
        # @param status_position select { choices: [bottom_right, bottom_left, top_right, top_left] } "Posizione indicatore stato"
        # @param theme select { choices: [default, white, red, rose, orange, green, blue, yellow, violet] } "Tema dell'avatar"
        # @param style select { choices: [filled, outline, light] } "Stile dell'avatar"
        # @param classes text "Classi CSS aggiuntive (opzionali)"
        # @param id text "ID elemento (opzionale)"
        def raw(
          name: "Mario Rossi",
          src: "",
          size: :md,
          shape: :circle,
          status: "",
          status_position: :bottom_right,
          theme: :white,
          style: :filled,
          classes: nil,
          id: nil
        )
          # Implementazione diretta del componente
          # 
          # Esempi di utilizzo:
          # <%= render BetterUi::General::Avatar::Component.new(name: "Mario Rossi") %>
          # <%= render BetterUi::General::Avatar::Component.new(name: "Luca Bianchi", theme: :blue) %>
          # <%= render BetterUi::General::Avatar::Component.new(src: "/path/to/image.jpg") %>
          
          normalized = normalize_params!(
            name: name,
            src: src,
            size: size,
            shape: shape,
            status: status,
            status_position: status_position,
            theme: theme,
            style: style,
            classes: classes,
            id: id
          )

          render BetterUi::General::Avatar::Component.new(**normalized)
        end

        private

        # Normalizza parametri da Lookbook
        def normalize_params!(options)
          # Converte stringhe in simboli
          options[:size] = options[:size].to_sym if options[:size].is_a?(String)
          options[:shape] = options[:shape].to_sym if options[:shape].is_a?(String)
          options[:status_position] = options[:status_position].to_sym if options[:status_position].is_a?(String)
          options[:theme] = options[:theme].to_sym if options[:theme].is_a?(String)
          options[:style] = options[:style].to_sym if options[:style].is_a?(String)

          # Gestisce parametri opzionali vuoti
          options[:name] = nil if options[:name].blank?
          options[:src] = nil if options[:src].blank?
          options[:classes] = nil if options[:classes].blank?
          options[:id] = nil if options[:id].blank?
          
          # Gestisce status: se vuoto impostalo a nil, altrimenti convertilo a simbolo
          if options[:status].blank?
            options[:status] = nil
          elsif options[:status].is_a?(String)
            options[:status] = options[:status].to_sym
          end

          # Mantiene sempre tutte le variabili per garantire la disponibilità come variabili locali ERB
          # Non rimuoviamo nessuna chiave dall'hash per evitare errori "undefined local variable"
          options
        end
      end
    end
  end
end
