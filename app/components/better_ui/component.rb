module BetterUi
  class Component < ViewComponent::Base

    def self.configure_attributes(config)
      @attribute_config = config.freeze
      
      # Genera tutti i metodi getter dinamicamente
      config.each do |param, settings|
        # Supporta sia la struttura nuova (con methods e constants) che quella vecchia (con constant)
        if settings[:methods] && settings[:constants]
          # Struttura nuova con metodi multipli
          settings[:methods].each_with_index do |method_name, index|
            constant_name = settings[:constants][index]
            
            define_method method_name do
              constant_hash = self.class.const_get(constant_name)
              value = instance_variable_get(settings[:var])
              constant_hash[value] || constant_hash[settings[:default]]
            end
          end
        elsif settings[:constant]
          # Struttura vecchia con un solo constant, genera metodo getter automatico
          method_name = "get_#{param}_class".to_sym
          constant_name = settings[:constant]
          
          define_method method_name do
            constant_hash = self.class.const_get(constant_name)
            value = instance_variable_get("@#{param}".to_sym)
            constant_hash[value] || constant_hash[settings[:default]]
          end
        end
      end
    end
    
    def self.attribute_config
      @attribute_config || {}
    end
    
    private
    
    def set_instance_variables(options = {})
      self.class.attribute_config.each do |param, config|
        # Determina il nome della variabile di istanza
        var_name = config[:var] || "@#{param}".to_sym
        
        # Ottiene il valore dalle opzioni o usa il default
        value = options[param] || options[param.to_s] || config[:default]
        
        # Imposta la variabile di istanza
        instance_variable_set(var_name, value)
      end
    end
    
    def validate_params
      self.class.attribute_config.each do |param, config|
        # Supporta sia la struttura nuova che quella vecchia
        if config[:var]
          value = instance_variable_get(config[:var])
        else
          value = instance_variable_get("@#{param}".to_sym)
        end
        
        # Determina quale constant usare
        constant_name = config[:constants] ? config[:constants].first : config[:constant]
        constant_hash = self.class.const_get(constant_name)
        valid_values = constant_hash.keys
        
        next if valid_values.include?(value)
        
        raise ArgumentError, "#{self.class.name} - parametro '#{param}' con valore '#{value}' " \
                            "non è valido. Deve essere uno tra: #{valid_values.join(', ')}"
      end
    end

  end
end