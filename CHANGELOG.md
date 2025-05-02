# Changelog

Tutte le modifiche importanti a BetterUI saranno documentate in questo file.

Il formato è basato su [Keep a Changelog](https://keepachangelog.com/it-IT/1.0.0/),
e questo progetto aderisce al [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### In arrivo
- Componente **FormComponent** per input form avanzati
  - Input di testo con validazione
  - Select avanzati
  - Checkbox e radio button
  - Date picker
  - File uploader
- Componente **TableComponent** per visualizzazione dati tabulari
  - Ordinamento delle colonne
  - Filtri avanzati
  - Paginazione
  - Selezione righe
- Integrazione con Hotwire per aggiornamenti in tempo reale
- Tema dark/light con switch automatico

## [0.4.0] - 2024-05-02

### Aggiunto
- Componente **HeaderComponent** per creare intestazioni di pagina
  - Supporto per titolo con icona opzionale
  - Supporto per sottotitolo
  - Integrazione con breadcrumb e controllo della visibilità
  - Supporto per azioni (pulsanti, menu, etc.)
  - Varianti di stile: modern, light, dark, primary, transparent
  - Posizionamento fisso opzionale (top, bottom)
  - Struttura responsiva mobile-friendly
  - Icone SVG native integrate
  - Preview complete in Lookbook con parametri configurabili

### Migliorato
- Aggiornato il README con la documentazione per il HeaderComponent
- Migliorata l'organizzazione delle preview in Lookbook
- Ottimizzata la struttura dei componenti per una migliore coerenza visiva

## [0.3.0] - 2024-04-15

### Aggiunto
- Componente **ToastComponent** per notifiche temporanee
  - Timer configurabile con barra di progresso
  - Animazioni di entrata e uscita
  - Varianti di colore
  - Posizionamento configurabile
  - Opzioni di chiusura automatica o manuale

### Migliorato
- Aggiornata la documentazione per i nuovi componenti
- Migliorata la compatibilità con dispositivi mobili
- Aggiunta la variante "simple" alle notifiche Alert

## [0.2.0] - 2024-03-20

### Aggiunto
- Componente **NavbarComponent** per barre di navigazione responsive
  - Supporto per menu dropdown
  - Varianti di colore
  - Layout responsivo per mobile e desktop
  - Controller Stimulus per interazioni avanzate
  - Supporto per logo e branding
- Componente **SidebarComponent** per menu laterali
  - Supporto per navigazione gerarchica
  - Gestione dei dropdown di sottomenu
  - Header e footer personalizzabili
  - Icone integrate
  - Design moderno minimalista

### Corretto
- Risolti problemi di visualizzazione su schermi piccoli
- Risolti problemi di accessibilità
- Migliorato il contrasto per una migliore leggibilità

## [0.1.0] - 2024-02-10

### Aggiunto
- Configurazione iniziale dell'engine Rails
- Integrazione con Lookbook per preview dei componenti
- Componente **ButtonComponent** con varianti di stile
- Componente **AlertComponent** per messaggi di notifica
- Componente **CardComponent** per layout flessibili
- Componente **ModalComponent** per finestre modali
- Componente **TabsComponent** per navigazione a schede
- Documentazione di base
- Setup di testing e app dummy per lo sviluppo

[Unreleased]: https://github.com/alessiobussolari/better_ui/compare/v0.4.0...HEAD
[0.4.0]: https://github.com/alessiobussolari/better_ui/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/alessiobussolari/better_ui/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/alessiobussolari/better_ui/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/alessiobussolari/better_ui/releases/tag/v0.1.0 