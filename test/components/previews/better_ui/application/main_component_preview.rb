# frozen_string_literal: true

module BetterUi
  module Application
    class MainComponentPreview < ViewComponent::Preview
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
              content_tag(:li, "Interno: gestisce padding interno, bordi arrotondati e ombra", class: "mb-1")
            end
          end
        end
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
              content_tag(:li, "Interno: gestisce padding interno, bordi arrotondati e ombra", class: "mb-1")
            end
          end
        end
      end
      
      # @!endgroup
    end
  end
end 