source "https://rubygems.org"

# Specifiche dipendenze della gemma in better_ui.gemspec
gemspec

# Dipendenze per lo sviluppo
gem "sqlite3"
gem "puma"
gem "propshaft"

# Stile del codice
gem "rubocop-rails-omakase", require: false

# Aggiungiamo le dipendenze necessarie per i componenti UI
gem "view_component"
gem "redcarpet"
gem "tailwindcss-rails"

# Start debugger with binding.b [https://github.com/ruby/debug]
# gem "debug", ">= 1.0.0"

gem "font-awesome-sass", "~> 6.5"

# Lookbook per la preview dei componenti
gem "lookbook", group: [:development, :test]

# Gemme aggiuntive per funzionalità avanzate di Lookbook
group :development do
  gem "listen"
  gem "actioncable"
end
