# Changelog

Tutte le modifiche importanti a questo progetto saranno documentate in questo file.

Il formato è basato su [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
e questo progetto aderisce al [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.4.0] - 2025-01-07

### Aggiunto
- **Componente PIN Input**: Nuovo componente per inserimento codici PIN/OTP
- **Dropdown con selezione**: Aggiunta opzione selectable al componente dropdown
- **Miglioramenti vari**: Correzioni e ottimizzazioni generali

### Migliorato
- **Namespace icone**: Correzioni al sistema di namespace delle icone
- **ViewComponent loading**: Migliorato caricamento della gemma ViewComponent
- **Stabilità**: Varie correzioni per migliorare la stabilità generale

## [0.3.0] - 2025-01-06

### Aggiunto
- **Componente Accordion**: Nuovo componente per contenuti collassabili/espandibili
  - Supporto modalità multiple/single per apertura sezioni
  - 9 temi di colore disponibili (default, white, blue, red, green, yellow, violet, orange, rose)
  - 3 varianti stilistiche (minimal, bordered, separated)
  - 3 dimensioni (small, medium, large)
  - Controller Stimulus per interattività e accessibilità
  - Preview Lookbook complete con parametri interattivi
  - Helper `bui_accordion` con documentazione YARD completa
  - Supporto per icone personalizzate e stati disabled

### Migliorato
- **Standardizzazione Preview Lookbook**: Tutte le preview ora seguono il pattern `@!group/@!endgroup`
- **Documentazione @notes**: Esempi di codice più dettagliati e casi d'uso pratici
- **Sistema Helper**: Namespace completi e documentazione YARD estesa
- **Accessibilità**: Attributi ARIA completi per screen reader

### Corretto
- **Preview Accordion**: Corretto raggruppamento metodi per conformità specifiche
- **Template rendering**: Migliorato rendering degli item accordion

## [0.2.0] - 2024-12-15

### Aggiunto
- **Componente Modal**: Sistema modal completo per dialoghi e overlay
  - Modal trigger e modal content come componenti separati
  - Supporto backdrop click e escape key
  - Animazioni smooth di apertura/chiusura
  - Controller Stimulus per gestione stato
- **Componente Dropdown**: Menu contestuali e dropdown
  - Posizionamento automatico
  - Supporto per item con icone e separatori
  - Chiusura automatica su click esterno
- **Componente Tabs**: Sistema di navigazione a schede
  - Orientamento orizzontale e verticale
  - 4 varianti stilistiche (pills, underline, bordered, minimal)
  - Controller Stimulus per switching
- **Sistema Application**: Componenti per layout
  - Sidebar navigazione con collapsible
  - Main content area responsive

### Migliorato
- **Sistema Stimulus**: Controller JavaScript modulari e riutilizzabili
- **Lookbook Integration**: Preview interattive per tutti i componenti
- **Responsive Design**: Miglioramenti mobile-first

## [0.1.1] - 2024-11-20

### Corretto
- **Button Component**: Fix classi CSS per varianti outline
- **Icon System**: Risolti problemi di rendering con Font Awesome
- **Helper Methods**: Corretti parametri opzionali per compatibilità Rails 7+

### Migliorato
- **Performance**: Ottimizzazioni caricamento asset CSS/JS
- **Documentation**: Esempi più chiari nella documentazione componenti

## [0.1.0] - 2024-11-01

### Aggiunto
- **Setup iniziale**: Struttura base gem Rails con ViewComponent
- **Componenti Base**:
  - Button: Componente bottone con varianti tema, dimensioni e stati
  - Alert: Notifiche e messaggi informativi
  - Avatar: Visualizzazione immagini profilo e iniziali
  - Badge: Indicatori numerici e stati
  - Breadcrumb: Navigazione gerarchica
  - Divider: Separatori visuali
  - Heading: Titoli semantici con styling
  - Icon: Sistema icone integrato Font Awesome
  - Link: Collegamenti con styling consistente
  - Pagination: Navigazione paginata
- **Input Components**:
  - Text: Campo testo base
  - Checkbox: Caselle di selezione
  - Radio: Bottoni radio
  - Select: Menu a tendina
  - Textarea: Area testo estesa
  - Date/DateTime/Email/Number/Password/Search/Tel/Time/URL: Input specializzati
- **Sistema Helper**: Helper methods `bui_*` per tutti i componenti
- **Tailwind Integration**: Styling completo con classi Tailwind CSS
- **Lookbook**: Documentazione interattiva componenti
- **Architettura Modulare**: 
  - Categorie GENERAL/APPLICATION/FORM
  - Namespace organizzato per scalabilità

### Documentazione
- Guide installazione e configurazione
- Architettura e convenzioni sviluppo
- Esempi d'uso per ogni componente
- Roadmap sviluppo futuro

---

**Note**: Per dettagli completi su breaking changes e migrazioni, consultare la [documentazione](https://github.com/alessiobussolari/better_ui/blob/main/docs/).
