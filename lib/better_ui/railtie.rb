module BetterUi
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      # Configure Lookbook to include BetterUI previews if Lookbook is available
      if defined?(Lookbook)
        # Get the gem's root path
        gem_root = Gem.loaded_specs["better_ui"]&.gem_dir

        if gem_root
          # Add the gem's preview path to Lookbook
          preview_path = File.join(gem_root, "spec", "components", "previews")

          if File.directory?(preview_path)
            Lookbook.config.preview_paths << preview_path
          end
        end
      end
    end
  end
end
