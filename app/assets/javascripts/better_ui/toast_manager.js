// Gestore per l'impilamento dei toast in diverse posizioni
class ToastManager {
  constructor() {
    // Mantiene traccia dei toast attivi per posizione
    this.toasts = {
      'top-right': [],
      'top-left': [],
      'bottom-right': [],
      'bottom-left': [],
      'top-center': [],
      'bottom-center': []
    }
    
    // Offset di base per ogni posizione (in px)
    this.baseOffset = 16; // equivalente a Tailwind top-4 (16px)
    
    // Spaziatura tra i toast (in px)
    this.spacing = 12;
  }
  
  // Registra un nuovo toast e calcola la sua posizione
  registerToast(toast, position) {
    if (!this.toasts[position]) {
      console.warn(`Posizione toast non valida: ${position}. Utilizzo 'top-right' come predefinita.`);
      position = 'top-right';
    }
    
    // Aggiungi il toast all'array della posizione specifica
    this.toasts[position].push(toast);
    
    // Ricalcola le posizioni per tutti i toast in questa posizione
    this.updatePositions(position);
    
    return () => this.removeToast(toast, position);
  }
  
  // Rimuove un toast e ricalcola le posizioni
  removeToast(toast, position) {
    const index = this.toasts[position].indexOf(toast);
    if (index !== -1) {
      this.toasts[position].splice(index, 1);
      this.updatePositions(position);
    }
  }
  
  // Aggiorna le posizioni di tutti i toast in una data posizione
  updatePositions(position) {
    const isTopPosition = position.startsWith('top-');
    const toastArray = this.toasts[position];
    
    let currentOffset = this.baseOffset;
    
    toastArray.forEach((toast, index) => {
      // Applica la posizione corretta
      if (isTopPosition) {
        toast.style.top = `${currentOffset}px`;
      } else {
        toast.style.bottom = `${currentOffset}px`;
      }
      
      // Aggiorna l'offset per il prossimo toast
      const height = toast.offsetHeight;
      currentOffset += height + this.spacing;
    });
  }
  
  // Metodo statico per accedere all'istanza singleton
  static getInstance() {
    if (!ToastManager.instance) {
      ToastManager.instance = new ToastManager();
    }
    return ToastManager.instance;
  }
}

// Esporta il gestore come singleton
export default ToastManager.getInstance(); 