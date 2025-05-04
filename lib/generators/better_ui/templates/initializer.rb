# frozen_string_literal: true

# Configurazione di Better UI
# Questo file contiene le impostazioni predefinite per i componenti di Better UI.
# Puoi modificare queste impostazioni in base alle tue necessità.

BetterUi.configure do |config|
  # Configurazione predefinita per i bottoni
  # Queste impostazioni verranno applicate a tutti i bottoni a meno che non vengano sovrascritte
  config.button_defaults = {
    type: :default,     # Tipo di bottone (:default, :white, :red, :green, ecc.)
    size: :medium,      # Dimensione del bottone (:small, :medium, :large)
    rounded: :small,    # Arrotondamento (:none, :small, :medium, :large, :full)
    full_width: false,  # Se il bottone deve occupare tutta la larghezza disponibile
    disabled: false     # Se il bottone è disabilitato di default
  }
  
  # Configurazione predefinita per gli alert
  config.alert_defaults = {
    theme: :default,    # Tema dell'alert (:default, :success, :warning, :danger, :info)
    dismissible: true,  # Se l'alert può essere chiuso dall'utente
    icon: true          # Se mostrare l'icona associata al tema
  }
  
  # Configurazione predefinita per le card
  config.card_defaults = {
    theme: :default,    # Tema della card (:default, :outline, :elevated)
    padding: :medium,   # Padding interno (:small, :medium, :large)
    rounded: :medium,   # Arrotondamento (:none, :small, :medium, :large)
    shadow: :medium     # Ombreggiatura (:none, :small, :medium, :large)
  }
  
  # Configurazione predefinita per i tab
  config.tabs_defaults = {
    theme: :default,    # Tema dei tab (:default, :pills, :underline)
    size: :medium,      # Dimensione (:small, :medium, :large)
    alignment: :left    # Allineamento (:left, :center, :right, :justified)
  }
  
  # Puoi aggiungere altre configurazioni predefinite per i tuoi componenti qui
end 