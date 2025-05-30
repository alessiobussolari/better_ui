if defined?(Lookbook)
  Lookbook.configure do |config|
    # Configura la directory delle preview dei componenti
    config.preview_paths << BetterUi::Engine.root.join("test/components/previews")

    # Configura il titolo della pagina Lookbook
    config.page_title = "BetterUI - Catalogo Componenti"

    # Configura i tag principali
    config.preview_display_names = {
      "BetterUi::General" => "Componenti Generali",
      "BetterUi::Application" => "Componenti Applicazione",
      "BetterUi::Website" => "Componenti Sito Web"
    }

    # Per supportare i componenti ViewComponent
    config.listen_for_changes = {
      component: "app/components/**/*.rb",
      preview: "test/components/previews/**/*_preview.rb",
      template: "app/components/**/*.erb"
    }
  end
end
