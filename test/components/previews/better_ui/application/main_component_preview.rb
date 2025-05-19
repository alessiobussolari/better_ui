# frozen_string_literal: true

module BetterUi
  module Application
    class MainComponentPreview < Lookbook::Preview
      # @!group Esempi Base

      # @label Con Helper
      # @param padding toggle "Applicare il padding al contenitore principale"
      # @param inner_padding toggle "Applicare il padding al contenitore interno"
      # @param rounded select { choices: [none, small, medium, large, full] } "Stile dei bordi arrotondati del contenitore interno"
      # @param shadow select { choices: [none, sm, md, lg] } "Ombra del contenitore interno"
      # @param with_sidebar toggle "Lasciare spazio per la sidebar"
      # @param with_navbar toggle "Lasciare spazio per la navbar"
      def default(
        padding: true,
        inner_padding: true,
        rounded: :small,
        shadow: :md,
        with_sidebar: true,
        with_navbar: true
      )
        normalize_params!(
          padding: padding,
          inner_padding: inner_padding,
          rounded: rounded,
          shadow: shadow,
          with_sidebar: with_sidebar,
          with_navbar: with_navbar
        )

        render_with_template(locals: {
          padding: padding,
          inner_padding: inner_padding,
          rounded: rounded,
          shadow: shadow,
          with_sidebar: with_sidebar,
          with_navbar: with_navbar
        })
      end

      # @label Istanziazione Diretta
      # @param padding toggle "Applicare il padding al contenitore principale"
      # @param inner_padding toggle "Applicare il padding al contenitore interno"
      # @param rounded select { choices: [none, small, medium, large, full] } "Stile dei bordi arrotondati del contenitore interno"
      # @param shadow select { choices: [none, sm, md, lg] } "Ombra del contenitore interno"
      # @param with_sidebar toggle "Lasciare spazio per la sidebar"
      # @param with_navbar toggle "Lasciare spazio per la navbar"
      def raw(
        padding: true,
        inner_padding: true,
        rounded: :small,
        shadow: :md,
        with_sidebar: true,
        with_navbar: true
      )
        normalize_params!(
          padding: padding,
          inner_padding: inner_padding,
          rounded: rounded,
          shadow: shadow,
          with_sidebar: with_sidebar,
          with_navbar: with_navbar
        )

        render_with_template(locals: {
          padding: padding,
          inner_padding: inner_padding,
          rounded: rounded,
          shadow: shadow,
          with_sidebar: with_sidebar,
          with_navbar: with_navbar
        })
      end

      # @!endgroup

      private

      def normalize_params!(options)
        # Normalizzazione parametri
        options[:rounded] = options[:rounded].to_sym if options[:rounded].is_a?(String)
        options[:shadow] = options[:shadow].to_sym if options[:shadow].is_a?(String)

        # Conversione booleani
        options[:padding] = options[:padding] == true || options[:padding] == "true"
        options[:inner_padding] = options[:inner_padding] == true || options[:inner_padding] == "true"
        options[:with_sidebar] = options[:with_sidebar] == true || options[:with_sidebar] == "true"
        options[:with_navbar] = options[:with_navbar] == true || options[:with_navbar] == "true"

        options
      end
    end
  end
end 
