// Entry point per tutti i componenti JavaScript di Better UI
import { Application } from "@hotwired/stimulus"
import ToastController from "./controllers/toast_controller"
import NavbarController from "./controllers/navbar_controller"
import SidebarController from "./controllers/sidebar_controller"

// Configura Stimulus
const application = Application.start()

// Registra i controller
application.register("toast", ToastController)
application.register("navbar", NavbarController)
application.register("sidebar", SidebarController)

// Esporta i controller e altri componenti
export { ToastController, NavbarController, SidebarController }
export { default as ToastManager } from "./toast_manager"

// Funzione di utilità per creare e mostrare un toast programmaticamente
export function showToast(options = {}) {
  const {
    title = null,
    message = "Notifica",
    variant = "info",
    position = "top-right",
    duration = 5000,
    dismissible = true,
    autoHide = true,
    icon = null
  } = options;

  // Crea l'elemento toast
  const toast = document.createElement("div");
  toast.setAttribute("role", "status");
  toast.setAttribute("aria-live", "polite");
  toast.classList.add(
    "fixed", "z-50", "rounded-lg", "p-4", "border", "shadow-lg",
    "transform", "transition-transform", "duration-300",
    "min-w-[20rem]", "max-w-sm", "flex", "items-start",
    position
  );
  
  // Aggiungi classi specifiche per la variante
  const variantClasses = {
    primary: ["bg-orange-50", "border-orange-300"],
    info: ["bg-blue-50", "border-blue-300"],
    success: ["bg-green-50", "border-green-300"],
    warning: ["bg-yellow-50", "border-yellow-300"],
    danger: ["bg-red-50", "border-red-300"],
    dark: ["bg-gray-800", "border-gray-700"]
  };
  
  // Applica le classi della variante
  const selectedVariant = variantClasses[variant] || variantClasses.info;
  toast.classList.add(...selectedVariant);
  
  // Aggiungi attributi per Stimulus
  toast.setAttribute("data-controller", "toast");
  toast.setAttribute("data-toast-duration-value", duration);
  toast.setAttribute("data-toast-auto-hide-value", autoHide);
  toast.setAttribute("data-toast-position-value", position);
  
  // Costruisci il contenuto HTML
  let html = "";
  
  // Icona
  const defaultIcons = {
    primary: "bell",
    info: "info-circle",
    success: "check-circle",
    warning: "exclamation-triangle",
    danger: "exclamation-circle",
    dark: "shield-exclamation"
  };
  
  const iconName = icon || defaultIcons[variant] || defaultIcons.info;
  
  if (iconName) {
    const iconColorClasses = {
      primary: "text-orange-500",
      info: "text-blue-500",
      success: "text-green-500",
      warning: "text-yellow-500",
      danger: "text-red-500",
      dark: "text-gray-400"
    };
    
    html += `
      <div class="flex-shrink-0 mr-3 mt-0.5 ${iconColorClasses[variant] || iconColorClasses.info}">
        <i class="fas fa-${iconName}"></i>
      </div>
    `;
  }
  
  // Contenuto
  const titleColorClasses = {
    primary: "text-orange-800",
    info: "text-blue-800",
    success: "text-green-800",
    warning: "text-yellow-800",
    danger: "text-red-800",
    dark: "text-white"
  };
  
  const messageColorClasses = {
    primary: "text-orange-700",
    info: "text-blue-700",
    success: "text-green-700",
    warning: "text-yellow-700",
    danger: "text-red-700",
    dark: "text-gray-300"
  };
  
  html += '<div class="flex-1">';
  
  if (title) {
    html += `<div class="font-medium ${titleColorClasses[variant] || titleColorClasses.info}">${title}</div>`;
  }
  
  if (message) {
    html += `<div class="mt-1 ${messageColorClasses[variant] || messageColorClasses.info}">${message}</div>`;
  }
  
  if (autoHide) {
    html += `
      <div class="w-full bg-gray-200 h-1 mt-2 rounded overflow-hidden">
        <div class="bg-current h-1 transition-all" data-toast-target="progressBar"></div>
      </div>
    `;
  }
  
  html += '</div>';
  
  // Pulsante di chiusura
  if (dismissible) {
    const closeButtonColorClasses = {
      primary: "text-orange-500 hover:bg-orange-100",
      info: "text-blue-500 hover:bg-blue-100",
      success: "text-green-500 hover:bg-green-100",
      warning: "text-yellow-500 hover:bg-yellow-100",
      danger: "text-red-500 hover:bg-red-100",
      dark: "text-gray-400 hover:bg-gray-700"
    };
    
    html += `
      <button type="button" class="ml-auto -mr-1.5 -mt-1.5 inline-flex h-8 w-8 rounded-lg p-1.5 focus:ring-2 focus:ring-gray-400 ${closeButtonColorClasses[variant] || closeButtonColorClasses.info}" data-action="toast#hide" aria-label="Chiudi">
        <i class="fas fa-xmark"></i>
      </button>
    `;
  }
  
  // Inserisci il contenuto
  toast.innerHTML = html;
  
  // Aggiungi il toast al documento
  document.body.appendChild(toast);
  
  return toast;
} 