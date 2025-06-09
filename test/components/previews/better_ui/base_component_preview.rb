module BetterUi
  class BaseComponentPreview < ViewComponent::Preview
    private

    def normalize_params!(options)
      options.each do |key, value|
        if value.is_a?(String)
          stripped_value = value.strip
          
          # Gestione parametri enum con valori di default
          if enum_params.include?(key)
            if stripped_value.empty?
              options[key] = default_params[key] if default_params.key?(key)
            else
              options[key] = stripped_value.to_sym
            end
          # Gestione parametri stringa che possono essere nil
          elsif nullable_string_params.include?(key)
            options[key] = stripped_value.empty? ? nil : stripped_value
          # Gestione parametri numerici
          elsif numeric_params.include?(key)
            options[key] = stripped_value.to_i if stripped_value.present?
          # Altri parametri stringa
          else
            options[key] = stripped_value
          end
        end
      end
      
      options
    end

    # Metodi da sovrascrivere nelle sottoclassi
    def enum_params
      []
    end

    def nullable_string_params
      []
    end

    def numeric_params
      []
    end

    def default_params
      {}
    end
  end
end