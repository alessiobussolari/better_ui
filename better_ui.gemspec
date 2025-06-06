require_relative "lib/better_ui/version"

Gem::Specification.new do |spec|
  spec.name        = "better_ui"
  spec.version     = BetterUi::VERSION
  spec.authors     = [ "alessiobussolari", "umberto_peserico" ]
  spec.email       = [ "alessio.bussolari@pandev.it", "umberto.peserico@pandev.it" ]
  spec.homepage    = "https://github.com/alessiobussolari/better_ui"
  spec.summary     = "Elegant and reusable UI components for Rails with integrated documentation"
  spec.description = "Better UI is a Rails gem that works as a mountable engine containing reusable UI components, " \
                     "built with ViewComponent and Tailwind CSS, following the BEM methodology. " \
                     "It includes documentation and interactive previews with Lookbook."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/alessiobussolari/better_ui"
  spec.metadata["changelog_uri"] = "https://github.com/alessiobussolari/better_ui/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib,spec}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  # Main dependencies
  spec.add_dependency "rails", ">= 7.0.0"
  spec.add_dependency "view_component", "~> 3.22"

  # Documentation dependencies
  spec.add_dependency "redcarpet", "~> 3.6"
  spec.add_dependency "coderay", "~> 1.1"
  spec.add_dependency "lookbook", "~> 2.3"

  # Icons and styling dependencies
  spec.add_dependency "font-awesome-sass", "~> 6.5"
end
