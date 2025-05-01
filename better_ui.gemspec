require_relative "lib/better_ui/version"

Gem::Specification.new do |spec|
  spec.name        = "better_ui"
  spec.version     = BetterUi::VERSION
  spec.authors     = [ "alessiobussolari" ]
  spec.email       = [ "alessio.bussolari@pandev.it" ]
  spec.homepage    = "https://github.com/alessiobussolari/better_ui"
  spec.summary     = "Componenti UI riutilizzabili per Rails con documentazione integrata"
  spec.description = "Una gem Rails che funziona come engine montabile contenente componenti UI riutilizzabili e pagine di documentazione"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/alessiobussolari/better_ui"
  spec.metadata["changelog_uri"] = "https://github.com/alessiobussolari/better_ui/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  # Dipendenze di runtime
  spec.add_dependency "rails", ">= 7.0.0"
  spec.add_dependency "view_component", ">= 3.0.0"
  spec.add_dependency "redcarpet", "~> 3.6"
  spec.add_dependency "tailwindcss-rails", "~> 2.0"
  spec.add_dependency "coderay", "~> 1.1"
  spec.add_dependency "font-awesome-sass", "~> 6.5.1"

  # Dipendenze di sviluppo
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "puma"
end
