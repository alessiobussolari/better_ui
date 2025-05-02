module BetterUi
  module Application
    class ToastComponentPreview < ViewComponent::Preview
      # Toast configurabile
      #
      # @param title text "Titolo del toast"
      # @param message text "Messaggio del toast"
      # @param variant select { choices: [primary, info, success, warning, danger, dark] } "Variante di colore"
      # @param icon text "Nome icona personalizzata (opzionale)"
      # @param dismissible toggle "Mostra pulsante di chiusura"
      # @param position select { choices: [top-right, top-left, bottom-right, bottom-left, top-center, bottom-center] } "Posizione del toast"
      # @param auto_hide toggle "Nascondi automaticamente"
      # @param duration select { choices: [2000, 5000, 10000] } "Durata in millisecondi"
      def default(
        title: "Notifica",
        message: "Questa è una notifica temporanea.",
        variant: :info,
        icon: nil,
        dismissible: true,
        position: :"top-right",
        auto_hide: true,
        duration: 5000
      )
        # Conversione dei tipi
        variant = variant.to_sym if variant.is_a?(String)
        position = position.to_sym if position.is_a?(String)
        dismissible = dismissible == true || dismissible == "true"
        auto_hide = auto_hide == true || auto_hide == "true"
        duration = duration.to_i if duration.is_a?(String)
        
        # Validazione
        valid_variants = [:primary, :info, :success, :warning, :danger, :dark]
        valid_positions = [:"top-right", :"top-left", :"bottom-right", :"bottom-left", :"top-center", :"bottom-center"]
        valid_durations = [2000, 5000, 10000]
        
        variant = :info unless valid_variants.include?(variant)
        position = :"top-right" unless valid_positions.include?(position)
        duration = 5000 unless valid_durations.include?(duration)
        
        # Pulisci valori vuoti
        icon = nil if icon.is_a?(String) && icon.strip.empty?
        title = nil if title.is_a?(String) && title.strip.empty?
        message = nil if message.is_a?(String) && message.strip.empty?
        
        # Per la preview, renderizziamo direttamente il componente
        render BetterUi::Application::ToastComponent.new(
          title: title,
          message: message,
          variant: variant,
          icon: icon,
          dismissible: dismissible,
          position: position,
          auto_hide: auto_hide,
          duration: duration,
          data: { controller: "" },
          classes: "static transform-none min-w-0"
        )
      end
      
      # @!group Esempi specifici
      
      # @label Tutte le varianti
      def all_variants
        render_with_template
      end
      
      # @label Con barra di progresso
      def with_progress_bar
        render BetterUi::Application::ToastComponent.new(
          title: "Operazione completata",
          message: "Il file è stato caricato con successo.",
          variant: :success,
          auto_hide: true,
          data: { controller: "" },
          classes: "static transform-none min-w-0"
        )
      end
      
      # @label Notifica di errore
      def error_toast
        render BetterUi::Application::ToastComponent.new(
          title: "Errore",
          message: "Si è verificato un errore durante il salvataggio dei dati.",
          variant: :danger,
          data: { controller: "" },
          classes: "static transform-none min-w-0"
        )
      end
      
      # @label Con HTML personalizzato
      def with_custom_html
        render BetterUi::Application::ToastComponent.new(
          title: "Download",
          variant: :primary,
          data: { controller: "" },
          classes: "static transform-none min-w-0"
        ) do
          "<div class='mb-1'>Download completato: <strong>report.pdf</strong></div>
          <div class='flex items-center mt-2'>
            <div class='bg-orange-200 h-2 rounded-full w-full'>
              <div class='bg-orange-500 h-2 rounded-full' style='width: 100%'></div>
            </div>
            <span class='text-xs text-orange-800 ml-2'>100%</span>
          </div>".html_safe
        end
      end
      
      # @label Toast impilati
      def stacked_toast
        render_with_template
      end
      
      # @!endgroup
    end
  end
end 