module Hashrush

  class ::Hash
    def self.build_from_symbol_variables(binding, *args)
      hash = Hash.new
      args.each do |arg|
        raise "Argments must all be symbols!" unless arg.class == Symbol
        hash[arg] = binding.eval("#{arg.to_s}")# if is_variable?(arg)
      end
      return hash
    end
    
    def self.rush(binding, *args)
      Hash.build_from_symbol_variables(binding, args)  
    end
  end

end




