// Navbar controller per gestire il comportamento del menu mobile e dei dropdown
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "dropdown", "submenu"]
  
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

    // Aggiungi listener per i click all'esterno del menu
    document.addEventListener("click", this.handleClickOutside.bind(this))
  }
  
  disconnect() {
    // Rimuovi event listener per il resize della finestra
    window.removeEventListener("resize", this.updateMenuState.bind(this));

    // Rimuovi listener al disconnette
    document.removeEventListener("click", this.handleClickOutside.bind(this))
  }
  
  // Metodo per alternare l'apertura/chiusura del menu
  toggleMenu(event) {
    event.stopPropagation()
    const isExpanded = this.menuTarget.classList.contains("hidden") === false
    
    if (isExpanded) {
      this.closeMenu()
    } else {
      this.openMenu()
    }
  }
  
  // Metodo per chiudere il menu
  closeMenu() {
    this.menuTarget.classList.add("hidden")
    
    // Aggiorna l'attributo aria-expanded
    const button = this.element.querySelector("[aria-controls='navbar-menu']")
    if (button) {
      button.setAttribute("aria-expanded", "false")
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

  openMenu() {
    this.menuTarget.classList.remove("hidden")
    
    // Chiudi tutti i dropdown nel menu mobile
    if (this.hasSubmenuTarget) {
      this.submenuTargets.forEach(submenu => {
        submenu.classList.add("hidden")
      })
    }

    // Aggiorna stato del pulsante
    event.currentTarget.setAttribute("aria-expanded", "true")
  }

  toggleDropdown(event) {
    event.stopPropagation()
    const button = event.currentTarget
    const dropdownId = button.getAttribute("aria-controls")
    const dropdown = document.getElementById(dropdownId)
    
    if (dropdown) {
      const isExpanded = button.getAttribute("aria-expanded") === "true"
      
      if (isExpanded) {
        dropdown.classList.add("hidden")
        button.setAttribute("aria-expanded", "false")
      } else {
        // Chiudi tutti gli altri dropdown prima di aprire quello corrente
        if (this.hasSubmenuTarget) {
          this.submenuTargets.forEach(submenu => {
            if (submenu.id !== dropdownId) {
              submenu.classList.add("hidden")
              
              // Trova e aggiorna il pulsante associato
              const associatedButton = this.element.querySelector(`[aria-controls='${submenu.id}']`)
              if (associatedButton) {
                associatedButton.setAttribute("aria-expanded", "false")
              }
            }
          })
        }
        
        dropdown.classList.remove("hidden")
        button.setAttribute("aria-expanded", "true")
      }
    }
  }

  handleClickOutside(event) {
    // Chiudi il menu se si fa clic all'esterno
    if (this.element.contains(event.target) === false) {
      this.closeMenu()
    }
  }
} 