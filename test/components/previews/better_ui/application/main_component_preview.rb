# frozen_string_literal: true

module BetterUi
  module Application
    class MainComponentPreview < ViewComponent::Preview
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
        render(BetterUi::Application::MainComponent.new(
          padding: padding,
          inner_padding: inner_padding,
          rounded: rounded.to_sym,
          shadow: shadow.to_sym,
          with_sidebar: with_sidebar,
          with_navbar: with_navbar
        )) do
          content_tag(:div) do
            content_tag(:h1, "Contenuto principale", class: "text-2xl font-bold mb-4") +
            content_tag(:p, "Questo è il contenuto principale della pagina. Il componente Main fornisce una struttura base per tutte le pagine dell'applicazione.", class: "mb-2") +
            content_tag(:p, "Il componente configura due livelli di contenitori:", class: "mb-2") +
            content_tag(:ul, class: "list-disc pl-5 mb-4") do
              content_tag(:li, "Esterno: gestisce il padding, lo spazio per sidebar e navbar", class: "mb-1") +
              content_tag(:li, "Interno: gestisce padding interno, bordi arrotondati e ombra", class: "mb-1") +
              content_tag(:li, "Interno: gestisce padding interno, bordi arrotondati e ombra", class: "mb-1") + 
              content_tag(:li, "Interno: gestisce padding interno, bordi arrotondati e ombra", class: "mb-1") +
              content_tag(:li, "Interno: gestisce padding interno, bordi arrotondati e ombra", class: "mb-1") +
              content_tag(:li, "Interno: gestisce padding interno, bordi arrotondati e ombra", class: "mb-1") +
              content_tag(:li, "Interno: gestisce padding interno, bordi arrotondati e ombra", class: "mb-1") +
              content_tag(:li, "Interno: gestisce padding interno, bordi arrotondati e ombra", class: "mb-1") +
              content_tag(:li, "Interno: gestisce padding interno, bordi arrotondati e ombra", class: "mb-1") +
              content_tag(:li, "Interno: gestisce padding interno, bordi arrotondati e ombra", class: "mb-1") +
              content_tag(:li, "Interno: gestisce padding interno, bordi arrotondati e ombra", class: "mb-1") +
              content_tag(:li, "Interno: gestisce padding interno, bordi arrotondati e ombra", class: "mb-1") +
              content_tag(:li, "Interno: gestisce padding interno, bordi arrotondati e ombra", class: "mb-1")
            end
          end
        end
      end

      # @!group Esempi Specifici

      # @label Layout completo
      def complete_layout
        render(BetterUi::Application::MainComponent.new(
          padding: true,
          inner_padding: true,
          rounded: :medium,
          shadow: :md,
          with_sidebar: true,
          with_navbar: true
        )) do
          content_tag(:div) do
            content_tag(:h1, "Layout completo", class: "text-2xl font-bold mb-4") +
            content_tag(:p, "Questo esempio mostra il layout con spazio per sidebar e navbar, padding esterno ed interno, bordi arrotondati e ombra.", class: "mb-2") +
            content_tag(:p, "Configurazione ideale per dashboard e pagine amministrative.")
          end
        end
      end

      # @label Solo contenuto
      def content_only
        render(BetterUi::Application::MainComponent.new(
          padding: true,
          inner_padding: true,
          rounded: :medium,
          shadow: :md,
          with_sidebar: false,
          with_navbar: false
        )) do
          content_tag(:div) do
            content_tag(:h1, "Solo contenuto", class: "text-2xl font-bold mb-4") +
            content_tag(:p, "Questo esempio mostra il layout senza spazio per sidebar e navbar.", class: "mb-2") +
            content_tag(:p, "Utilizza tutto lo spazio disponibile per il contenuto.")
          end
        end
      end

      # @label Senza padding esterno
      def without_outer_padding
        render(BetterUi::Application::MainComponent.new(
          padding: false,
          inner_padding: true,
          rounded: :small,
          shadow: :md,
          with_sidebar: true,
          with_navbar: true
        )) do
          content_tag(:div) do
            content_tag(:h1, "Senza padding esterno", class: "text-2xl font-bold mb-4") +
            content_tag(:p, "Questo esempio mostra il layout senza padding esterno, ma con padding interno.", class: "mb-2") +
            content_tag(:p, "Utile quando si vuole sfruttare tutto lo spazio disponibile.")
          end
        end
      end

      # @label Senza padding interno
      def without_inner_padding
        render(BetterUi::Application::MainComponent.new(
          padding: true,
          inner_padding: false,
          rounded: :small,
          shadow: :md,
          with_sidebar: true,
          with_navbar: true
        )) do
          content_tag(:div, class: "p-0") do
            content_tag(:div, class: "p-4") do
              content_tag(:h1, "Senza padding interno", class: "text-2xl font-bold mb-4") +
              content_tag(:p, "Questo esempio mostra il layout con padding esterno ma senza padding interno.", class: "mb-2") +
              content_tag(:p, "Utile quando si vuole controllare direttamente lo spazio all'interno del contenuto.")
            end
          end
        end
      end

      # @label Box semplice
      def simple_box
        render(BetterUi::Application::MainComponent.new(
          padding: true,
          inner_padding: true,
          rounded: :small,
          shadow: :none,
          with_sidebar: false,
          with_navbar: false
        )) do
          content_tag(:div) do
            content_tag(:h1, "Box semplice", class: "text-2xl font-bold mb-4") +
            content_tag(:p, "Questo esempio mostra un box semplice senza ombra.", class: "mb-2") +
            content_tag(:p, "Adatto per contenuti semplici o secondari.")
          end
        end
      end

      # @!endgroup
    end
  end
end 