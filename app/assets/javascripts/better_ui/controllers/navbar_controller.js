// Navbar controller per gestire il comportamento del menu responsive
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]
  
  connect() {
    // Verifica se siamo su mobile e aggiorna lo stato del menu
    this.updateMenuState();
    
    // Aggiungi un event listener per il resize della finestra
    window.addEventListener("resize", this.updateMenuState.bind(this));
    
    // Chiudi menu quando si clicca su un link (solo su mobile)
    if (this.hasMenuTarget) {
      const links = this.menuTarget.querySelectorAll("a");
      links.forEach(link => {
        link.addEventListener("click", () => {
          // Se siamo su mobile, chiudi il menu
          if (window.innerWidth < 768) {
            this.closeMenu();
          }
        });
      });
    }
  }
  
  disconnect() {
    // Rimuovi event listener per il resize della finestra
    window.removeEventListener("resize", this.updateMenuState.bind(this));
  }
  
  // Metodo per alternare l'apertura/chiusura del menu
  toggleMenu() {
    if (this.hasMenuTarget) {
      this.menuTarget.classList.toggle("hidden");
      
      // Aggiorna l'attributo aria-expanded
      const button = this.element.querySelector("[aria-controls='navbar-menu']");
      if (button) {
        const isExpanded = this.menuTarget.classList.contains("hidden") ? "false" : "true";
        button.setAttribute("aria-expanded", isExpanded);
      }
    }
  }
  
  // Metodo per chiudere il menu
  closeMenu() {
    if (this.hasMenuTarget) {
      this.menuTarget.classList.add("hidden");
      
      // Aggiorna l'attributo aria-expanded
      const button = this.element.querySelector("[aria-controls='navbar-menu']");
      if (button) {
        button.setAttribute("aria-expanded", "false");
      }
    }
  }
  
  // Metodo per aggiornare lo stato del menu in base alla dimensione della finestra
  updateMenuState() {
    if (this.hasMenuTarget) {
      // Se siamo su desktop (md breakpoint - 768px)
      if (window.innerWidth >= 768) {
        // Assicurati che il menu sia visibile su desktop
        this.menuTarget.classList.remove("hidden");
        this.menuTarget.classList.add("md:block");
      } else {
        // Su mobile, nascondi il menu di default
        this.menuTarget.classList.add("hidden");
      }
      
      // Aggiorna l'attributo aria-expanded
      const button = this.element.querySelector("[aria-controls='navbar-menu']");
      if (button) {
        const isExpanded = window.innerWidth >= 768 ? "true" : "false";
        button.setAttribute("aria-expanded", isExpanded);
      }
    }
  }
} 