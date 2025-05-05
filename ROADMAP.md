# Roadmap di Better UI

Questo documento descrive la pianificazione e la direzione futura di Better UI. Rappresenta le nostre intenzioni per lo sviluppo della libreria, ma i dettagli e le tempistiche possono variare.

## Obiettivi strategici

- Creare una libreria di componenti UI completa per Rails
- Fornire un'alternativa moderna e leggera alle librerie UI esistenti
- Mantenere un'architettura che favorisca la personalizzazione
- Garantire la compatibilità con le versioni future di Rails e Tailwind CSS

## Rilasci Pianificati

### v1.0.0 (Rilascio stabile)

- [x] Componenti di base funzionanti
- [x] Sistema di override SCSS
- [x] Documentazione essenziale
- [x] Demo app

### v1.1.0 (Breve termine)

- [ ] Nuovi componenti:
  - [ ] Tabs
  - [ ] Breadcrumbs
  - [ ] Toast/notification
  - [ ] Dropdown avanzato
  - [ ] Paginazione
- [ ] Miglioramenti alla documentazione
- [ ] Preview dei componenti in Lookbook
- [ ] Ottimizzazione delle performance

### v1.2.0 (Medio termine)

- [ ] Miglioramento dell'accessibilità di tutti i componenti
- [ ] Supporto per temi multipli
- [ ] Componenti per form avanzati
- [ ] Configurazione più granulare
- [ ] Esempi di integrazione con Hotwire

### v2.0.0 (Lungo termine)

- [ ] Supporto per generazione automatica di componenti personalizzati
- [ ] Dashboard di amministrazione di esempio
- [ ] Temi e componenti per siti web (non solo dashboard)
- [ ] CLI per la gestione dei componenti
- [ ] Sistema di versionamento dei componenti

## Aree di sviluppo futuro

### Componenti

#### Nuovi componenti General
- [ ] Tag input
- [ ] Range slider
- [ ] Tooltip avanzato
- [ ] Avatar group
- [ ] Toggle button group

#### Nuovi componenti Application
- [ ] Wizard/stepper
- [ ] Charts
- [ ] Data table avanzata con ordinamento/filtri
- [ ] Calendar
- [ ] Kanban board

#### Nuovi componenti Website
- [ ] Hero section
- [ ] Pricing table
- [ ] Feature grid
- [ ] Testimonial carousel
- [ ] Footer configurabile

### Miglioramenti tecnici

- [ ] Test di accessibilità automatizzati
- [ ] CSS più modulare con possibilità di includere solo i componenti utilizzati
- [ ] Integrazione con View Components per Rails
- [ ] Sistema di estensione per componenti di terze parti
- [ ] Gestione automatica dei preflight per Tailwind CSS

### Documentazione

- [ ] Migrazione a un sistema di documentazione interattiva
- [ ] Esempi di implementazione più complessi
- [ ] Showcase di applicazioni reali che utilizzano Better UI
- [ ] Video tutorial
- [ ] API reference completa

### Integrazioni

- [ ] Integrazioni native con:
  - [ ] SimpleForm
  - [ ] Ransack
  - [ ] Devise
  - [ ] Pagy
- [ ] Supporto per altri framework CSS oltre a Tailwind

## Come contribuire

Apprezziamo i contributi della community per far crescere Better UI. Se sei interessato a contribuire, consulta:

1. [Issues](https://github.com/alessiobussolari/better_ui/issues) - Per trovare feature in pianificazione o bug da risolvere
2. [Discussions](https://github.com/alessiobussolari/better_ui/discussions) - Per proporre nuove idee o discutere priorità
3. [CONTRIBUTING.md](CONTRIBUTING.md) - Per linee guida su come contribuire

### Priorità attuali

Le nostre priorità attuali sono:

1. Migliorare la documentazione esistente
2. Completare i componenti base mancanti
3. Migliorare l'accessibilità dei componenti esistenti
4. Ottimizzare la performance e la dimensione del bundle

### Richieste di feature

Incoraggiamo la community a inviare richieste di feature attraverso le GitHub Issues. Ogni proposta verrà valutata in base a:

- Allineamento con la filosofia della libreria
- Potenziale utilità per la community
- Complessità dell'implementazione
- Manutenibilità nel lungo periodo

## Note sulla retrocompatibilità

- Le versioni minori (1.x.0) possono introdurre nuove feature ma manterranno la retrocompatibilità
- Le versioni patch (1.0.x) conterranno solo fix di bug e miglioramenti minori
- Le versioni major (2.0.0) possono introdurre cambiamenti non retrocompatibili, che saranno chiaramente documentati

## Timeline approssimativa

| Versione | Data stimata | Focus principale |
|----------|--------------|------------------|
| v1.1.0   | Q3 2023      | Nuovi componenti e documentazione |
| v1.2.0   | Q1 2024      | Accessibilità e tematizzazione |
| v1.3.0   | Q3 2024      | Integrazioni e ottimizzazioni |
| v2.0.0   | 2025         | Revisione dell'architettura e funzionalità avanzate |

Questa timeline è indicativa e soggetta a modifiche in base al feedback della community e alle priorità di sviluppo. 