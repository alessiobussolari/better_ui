require_relative "lib/better_ui/version"

Gem::Specification.new do |spec|
  spec.name        = "better_ui"
  spec.version     = BetterUi::VERSION
  spec.authors     = [ "alessiobussolari" ]
  spec.email       = [ "alessio.bussolari@pandev.it" ]
  spec.homepage    = "https://github.com/alessiobussolari/better_ui"
  spec.summary     = "Reusable UI components for Rails with integrated documentation"
  spec.description = "A Rails gem that works as a mountable engine containing reusable UI components and documentation pages"
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

  # Runtime dependencies
  spec.add_dependency "rails", ">= 7.0.0"
  spec.add_dependency "view_component", ">= 3.0.0"
  spec.add_dependency "redcarpet", "~> 3.6"
  spec.add_dependency "tailwindcss-rails", "~> 4.0"
  spec.add_dependency "coderay", "~> 1.1"
  spec.add_dependency "font-awesome-sass", ">= 6.5.1", "< 6.8.0"
  spec.add_dependency "lookbook", "~> 2.1"
  spec.add_dependency "listen"
  spec.add_dependency "actioncable"

  # Development dependencies
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "puma"
end
