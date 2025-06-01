# 📚 Better UI - Documentazione

Better UI è una libreria di componenti UI per Rails, costruita con ViewComponent e Tailwind CSS, che fornisce componenti riutilizabili e ben documentati per accelerare lo sviluppo di interfacce moderne.

## 🚀 Panoramica

Better UI segue una architettura modulare con tre categorie principali di componenti:

- **🎨 GENERAL**: Componenti base riutilizabili (bottoni, input, alert, etc.)
- **🏗️ APPLICATION**: Componenti specifici per layout applicazioni (navbar, sidebar, main)
- **📝 FORM**: Componenti specializzati per form e validazione

## 📖 Documentazione

### 📋 Componenti
- [**Componenti Esistenti**](components/existing.md) - Lista completa dei componenti implementati
- [**Roadmap Componenti**](components/roadmap.md) - Componenti pianificati e priorità
- [**Architettura**](components/architecture.md) - Convenzioni e pattern di sviluppo

### 🛠️ Guide
- [**Installazione**](guides/installation.md) - Setup e configurazione
- [**Sviluppo**](guides/development.md) - Guida per sviluppatori
- [**Contribuire**](guides/contributing.md) - Come contribuire al progetto

## 🎯 Quick Start

```bash
# Installazione
gem install better_ui

# In Gemfile
gem 'better_ui', '~> 0.1.1'
```

```erb
<!-- Esempio componente -->
<%= bui_button(text: "Salva", theme: :green, size: :large) %>
```

## 🔗 Links Utili

- [GitHub Repository](https://github.com/alessiobussolari/better_ui)
- [RubyGems Package](https://rubygems.org/gems/better_ui)
- [Lookbook Preview](http://localhost:3000/lookbook) (in sviluppo)

---
**Versione attuale:** 0.1.1 | **Ultimo aggiornamento:** Gennaio 2025
