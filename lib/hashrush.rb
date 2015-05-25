require "hashrush/version"

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
  end

end

module Kernel
  # def is_variable?(sym)
  #   puts defined?(a)
  #   puts defined?(c)
  #   defined?(eval("#{sym.to_s}")).include?("variable")
  # end
end


