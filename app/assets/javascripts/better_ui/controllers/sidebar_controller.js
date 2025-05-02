// Sidebar controller per gestire il comportamento del menu laterale
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container", "overlay", "toggleButton", "toggleIcon", "dropdown", "submenu", "chevron"]
  static values = {
    collapsed: { type: Boolean, default: false },
    position: { type: String, default: "left" },
    overlayOnMobile: { type: Boolean, default: true }
  }
  
  connect() {
    // Applica lo stato iniziale
    if (this.collapsedValue) {
      this.collapse();
    } else {
      // Assicuriamo che la sidebar sia espansa all'inizio
      this.containerTarget.style.transform = "translateX(0)";
    }
    
    // Imposta i listener per il ridimensionamento della finestra
    window.addEventListener("resize", this.handleResize.bind(this));
    
    // Gestisci lo stato iniziale in base alla dimensione della finestra
    this.handleResize();
    
    // Trova e apri i sottomenu con elementi attivi
    this.openSubmenuWithActiveItems();
  }
  
  disconnect() {
    // Rimuovi i listener all'uscita
    window.removeEventListener("resize", this.handleResize.bind(this));
  }
  
  // Toggle dell'intera sidebar
  toggle() {
    if (this.isCollapsed()) {
      this.expand();
    } else {
      this.collapse();
    }
  }
  
  // Espandi la sidebar
  expand() {
    // Mostra la sidebar completa
    this.containerTarget.classList.remove("transform-translate");
    this.containerTarget.style.transform = "translateX(0)";
    
    // Ruota l'icona del toggle button
    if (this.hasToggleIconTarget) {
      if (this.positionValue === "left") {
        this.toggleIconTarget.style.transform = "rotate(0deg)";
      } else {
        this.toggleIconTarget.style.transform = "rotate(0deg)";
      }
    }
    
    // Aggiorna lo stato
    this.collapsedValue = false;
  }
  
  // Contrai la sidebar
  collapse() {
    const width = this.containerTarget.offsetWidth;
    // Usa un valore più piccolo per mantenere visibile una parte della sidebar
    const translateValue = this.positionValue === "left" ? `-${width - 10}px` : `${width - 10}px`;
    
    // Nascondi la sidebar
    this.containerTarget.classList.add("transform-translate");
    this.containerTarget.style.transform = `translateX(${translateValue})`;
    
    // Ruota l'icona del toggle button
    if (this.hasToggleIconTarget) {
      if (this.positionValue === "left") {
        this.toggleIconTarget.style.transform = "rotate(180deg)";
      } else {
        this.toggleIconTarget.style.transform = "rotate(180deg)";
      }
    }
    
    // Aggiorna lo stato
    this.collapsedValue = true;
  }
  
  // Apri la sidebar
  open() {
    // Mostra la sidebar
    this.containerTarget.style.transform = "translateX(0)";
    
    // Mostra l'overlay se necessario
    if (this.overlayOnMobileValue && window.innerWidth < 768) {
      this.overlayTarget.classList.remove("hidden");
      this.overlayTarget.classList.add("opacity-100");
      document.body.classList.add("overflow-hidden");
    }
    
    // Aggiorna lo stato
    this.collapsedValue = false;
  }
  
  // Chiudi la sidebar
  close() {
    // Se è già contratta su desktop, non fare nulla
    if (this.collapsedValue && window.innerWidth >= 768) {
      return;
    }
    
    // Su mobile, nascondi completamente
    if (window.innerWidth < 768) {
      const width = this.containerTarget.offsetWidth;
      const translateValue = this.positionValue === "left" ? `-${width}px` : `${width}px`;
      this.containerTarget.style.transform = `translateX(${translateValue})`;
      
      // Nascondi l'overlay
      this.overlayTarget.classList.add("hidden");
      this.overlayTarget.classList.remove("opacity-100");
      document.body.classList.remove("overflow-hidden");
    } else {
      // Su desktop, contrai
      this.collapse();
    }
  }
  
  // Verifica se la sidebar è contratta
  isCollapsed() {
    return this.collapsedValue;
  }
  
  // Handler per il ridimensionamento della finestra
  handleResize() {
    // Su mobile, mostra l'overlay se la sidebar è aperta
    if (window.innerWidth < 768) {
      const isHidden = this.containerTarget.style.transform.includes("translateX");
      
      if (!isHidden && this.overlayOnMobileValue) {
        this.overlayTarget.classList.remove("hidden");
      } else {
        this.overlayTarget.classList.add("hidden");
      }
    } else {
      // Su desktop, nascondi l'overlay
      this.overlayTarget.classList.add("hidden");
      document.body.classList.remove("overflow-hidden");
      
      // Ripristina lo stato della sidebar in base al valore di collapsed
      if (this.collapsedValue) {
        this.collapse();
      } else {
        this.expand();
      }
    }
  }
  
  // Toggle di un sottomenu
  toggleSubmenu(event) {
    const button = event.currentTarget;
    const submenuId = button.getAttribute("aria-controls");
    const submenu = document.getElementById(submenuId);
    const chevron = button.querySelector("[data-sidebar-target='chevron']");
    
    if (submenu) {
      const isExpanded = button.getAttribute("aria-expanded") === "true";
      
      if (isExpanded) {
        // Chiudi il sottomenu
        submenu.classList.add("hidden");
        button.setAttribute("aria-expanded", "false");
        if (chevron) {
          chevron.querySelector("svg").style.transform = "rotate(0deg)";
        }
      } else {
        // Apri il sottomenu
        submenu.classList.remove("hidden");
        button.setAttribute("aria-expanded", "true");
        if (chevron) {
          chevron.querySelector("svg").style.transform = "rotate(180deg)";
        }
      }
    }
  }
  
  // Apri automaticamente i sottomenu che contengono elementi attivi
  openSubmenuWithActiveItems() {
    // Trova tutti i dropdown
    if (this.hasDropdownTarget) {
      this.dropdownTargets.forEach(dropdown => {
        const submenuId = dropdown.getAttribute("aria-controls");
        const submenu = document.getElementById(submenuId);
        
        if (submenu) {
          // Verifica se il sottomenu contiene elementi attivi
          const activeItems = submenu.querySelectorAll(".bg-gray-100, .bg-gray-700, .bg-orange-700, .bg-blue-700");
          
          if (activeItems.length > 0) {
            // Apri il sottomenu
            submenu.classList.remove("hidden");
            dropdown.setAttribute("aria-expanded", "true");
            
            // Ruota l'icona chevron se presente
            const chevron = dropdown.querySelector("[data-sidebar-target='chevron']");
            if (chevron) {
              chevron.querySelector("svg").style.transform = "rotate(180deg)";
            }
          }
        }
      });
    }
  }
} 