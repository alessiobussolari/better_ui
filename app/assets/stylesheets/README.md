# BetterUI - Sistema di stili modulare

Questo sistema di stili utilizza la moderna sintassi di Sass con `@use` e `@forward` anziché le direttive `@import` deprecate, insieme a Tailwind CSS.

## Struttura dei file

```
better_ui.scss               # File principale che importa tutto
├── _base.scss               # Importazioni di Tailwind e stili base
├── _components.scss         # Re-esposizione dei componenti
│   └── components/          # Directory dei singoli componenti
│       ├── _index.scss      # Indice dei componenti
│       ├── _button.scss     # Componente button
│       ├── _panel.scss      # Componente panel
│       └── ...              # Altri componenti
└── _utilities.scss          # Utility classes aggiuntive
```

## Nomenclatura BEM

I componenti utilizzano la metodologia BEM (Block Element Modifier):

```scss
.bui-button { }                  // Block (componente principale)
.bui-button__icon { }            // Element (parte del componente)
.bui-button--red { }             // Modifier (variante/stato)
.bui-button__icon--left { }      // Element con modifier
```

## Come usare i componenti

```html
<!-- Esempio di bottone -->
<button class="bui-button bui-button--blue bui-button--large">
  <span class="bui-button__icon bui-button__icon--left">
    <!-- Icona -->
  </span>
  <span class="bui-button__text">Pulsante</span>
</button>

<!-- Esempio di pannello -->
<div class="bui-panel bui-panel--default bui-panel--radius-medium">
  <div class="bui-panel__header">
    <h3 class="bui-panel__title">Titolo</h3>
  </div>
  <div class="bui-panel__body">
    Contenuto
  </div>
  <div class="bui-panel__footer">
    Footer
  </div>
</div>
```

## Importare componenti specifici

Per importare solo componenti specifici in un file SCSS:

```scss
// Importa solo le variabili e il componente button
@use "better_ui/components/variables" as vars;
@use "better_ui/components/button";

// Esempio di utilizzo variabili
.my-custom-element {
  color: vars.$bui-primary;
}
```

## Vantaggi di @use e @forward

1. **Namespacing**: Previene collisioni di nomi di variabili tramite namespaces
2. **Importazioni uniche**: Ogni modulo viene caricato una sola volta, indipendentemente da quante volte viene importato
3. **Visibilità delle variabili**: Le variabili sono accessibili solo tramite namespace, riducendo gli effetti collaterali
4. **Modularità**: Ogni componente è isolato e può essere importato individualmente
5. **Performance**: Riduce la duplicazione nel CSS finale 