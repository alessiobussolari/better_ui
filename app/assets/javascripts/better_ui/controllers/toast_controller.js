// Toast controller per gestire il comportamento delle notifiche toast
import { Controller } from "@hotwired/stimulus"
import ToastManager from "../toast_manager"

export default class extends Controller {
  static targets = ["progressBar"]
  static values = {
    duration: { type: Number, default: 5000 },
    autoHide: { type: Boolean, default: true },
    position: { type: String, default: "top-right" }
  }
  
  connect() {
    // Estrai la posizione dalle classi del toast o utilizza il valore predefinito
    this.position = this.getPositionFromClasses() || this.positionValue;
    
    // Rimuovi le classi di posizione originali per evitare conflitti
    this.removePositionClasses();
    
    // Registra il toast con il manager e ottieni la funzione di pulizia
    this.cleanupFunction = ToastManager.registerToast(this.element, this.position);
    
    // Applica l'animazione di entrata
    this.element.classList.add("opacity-0", "translate-y-2");
    
    // Permetti al DOM di essere aggiornato prima di mostrare
    setTimeout(() => {
      this.element.classList.remove("opacity-0", "translate-y-2");
      this.element.classList.add("opacity-100", "translate-y-0");
    }, 10);
    
    // Se auto-hide è attivato, imposta il timer
    if (this.autoHideValue) {
      this.startProgressBar();
      this.hideTimeout = setTimeout(() => {
        this.hide();
      }, this.durationValue);
    }
    
    // Aggiungi eventi per pausa/ripresa dell'auto-hide
    this.element.addEventListener("mouseenter", this.mouseEnter.bind(this));
    this.element.addEventListener("mouseleave", this.mouseLeave.bind(this));
  }
  
  // Estrae la posizione dalle classi del toast
  getPositionFromClasses() {
    const positionClasses = [
      "top-right", "top-left", "bottom-right", "bottom-left", "top-center", "bottom-center"
    ];
    
    for (const position of positionClasses) {
      if (this.element.classList.contains(position)) {
        return position;
      }
    }
    
    return null;
  }
  
  // Rimuove le classi di posizione originali
  removePositionClasses() {
    const positionClasses = [
      "top-4", "right-4", "bottom-4", "left-4", "left-1/2", "transform", "-translate-x-1/2"
    ];
    
    positionClasses.forEach(cls => {
      this.element.classList.remove(cls);
    });
  }
  
  startProgressBar() {
    if (this.hasProgressBarTarget) {
      this.progressBarTarget.style.width = "100%";
      
      // Imposta una transizione che dura quanto il timeout
      this.progressBarTarget.style.transition = `width ${this.durationValue}ms linear`;
      
      // Forza un reflow per assicurare che la transizione inizi
      void this.progressBarTarget.offsetWidth;
      
      // Inizia la transizione
      this.progressBarTarget.style.width = "0%";
    }
  }
  
  disconnect() {
    if (this.hideTimeout) {
      clearTimeout(this.hideTimeout);
    }
    
    // Rimuovi gli event listener
    this.element.removeEventListener("mouseenter", this.mouseEnter.bind(this));
    this.element.removeEventListener("mouseleave", this.mouseLeave.bind(this));
    
    // Esegui la funzione di pulizia per rimuovere il toast dal manager
    if (this.cleanupFunction) {
      this.cleanupFunction();
    }
  }
  
  hide(event) {
    if (event) {
      event.preventDefault();
    }
    
    // Applica l'animazione di uscita
    this.element.classList.remove("opacity-100", "translate-y-0");
    this.element.classList.add("opacity-0", "translate-y-2");
    
    // Rimuovi l'elemento dopo l'animazione
    setTimeout(() => {
      this.element.remove();
    }, 300);
  }
  
  // Metodo per pausa e ripresa dell'autoHide quando l'utente interagisce con il toast
  pauseAutoHide() {
    if (this.hideTimeout) {
      clearTimeout(this.hideTimeout);
      
      if (this.hasProgressBarTarget) {
        // Salva la larghezza corrente per riprendere da lì
        const computedStyle = window.getComputedStyle(this.progressBarTarget);
        this.pausedWidth = computedStyle.width;
        this.progressBarTarget.style.transition = "none";
        this.progressBarTarget.style.width = this.pausedWidth;
      }
    }
  }
  
  resumeAutoHide() {
    if (this.autoHideValue) {
      // Calcola il tempo rimanente basato sulla larghezza della barra di progresso
      let remainingTime = this.durationValue;
      
      if (this.hasProgressBarTarget && this.pausedWidth) {
        const percentage = parseFloat(this.pausedWidth) / parseFloat(window.getComputedStyle(this.progressBarTarget.parentElement).width);
        remainingTime = this.durationValue * percentage;
      }
      
      this.hideTimeout = setTimeout(() => {
        this.hide();
      }, remainingTime);
      
      if (this.hasProgressBarTarget && this.pausedWidth) {
        this.progressBarTarget.style.transition = `width ${remainingTime}ms linear`;
        void this.progressBarTarget.offsetWidth;
        this.progressBarTarget.style.width = "0%";
      }
    }
  }
  
  // Gestori eventi per pausa/ripresa dell'autoHide
  mouseEnter() {
    this.pauseAutoHide();
  }
  
  mouseLeave() {
    this.resumeAutoHide();
  }
} 