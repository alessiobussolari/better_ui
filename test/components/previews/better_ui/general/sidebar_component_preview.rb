module BetterUi
  module General
    class SidebarComponentPreview < Lookbook::Preview
      # @!group Esempi Base

      # @label Sidebar Base
      # @param visible toggle "Visibile"
      # @param position select { choices: [left, right] } "Posizione della sidebar"
      # @param width text "Larghezza della sidebar (es. w-64)"
      # @param title text "Titolo della sidebar"
      # @param content text "Contenuto HTML della sidebar"
      def default(
        visible: true,
        position: :left,
        width: 'w-64',
        title: 'Titolo Sidebar',
        content: '<p>Contenuto di esempio</p>'
      )
        normalize_params!(
          visible: visible,
          position: position,
          width: width,
          title: title,
          content: content
        )

        render_with_template(locals: {
          visible: visible,
          position: position,
          width: width,
          title: title,
          content: content
        })
      end

      # @!endgroup

      private

      def normalize_params!(options)
        # Normalizzazione parametri
        options[:position] = options[:position].to_sym if options[:position].is_a?(String)

        # Pulizia valori vuoti
        options[:width] = nil if options[:width].is_a?(String) && options[:width].strip.empty?
        options[:title] = nil if options[:title].is_a?(String) && options[:title].strip.empty?
        options[:content] = nil if options[:content].is_a?(String) && options[:content].strip.empty?

        options
      end
    end
  end
end 