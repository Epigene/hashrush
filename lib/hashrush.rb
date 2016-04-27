module Hashrush

  class ::Hash
    def self.build_from_symbol_variables(binding, *args)
      raise ArgumentError.new("Oops, expected the first argument to be a binding object. Try `Hash.rush(binding, :some_variable_name)`") if binding.class != Binding

      hash = Hash.new
      args = args.flatten if args.respond_to?(:flatten)
      args.each_with_index do |arg, i|
        raise ArgumentError.new("Oops, argument #{i+1} is not a symbol") unless arg.class == Symbol
        # remove leading '@' symbols from variables
        clean_key = arg.to_s.gsub(/^\@+/, '').to_sym
        begin
          if hash[clean_key] == nil
            hash[clean_key] = binding.eval("#{arg.to_s}")# if is_variable?(arg)
          else
            raise ArgumentError.new("Oops, argument collision detected. :@#{clean_key} and :#{clean_key} at the same time will not work")
          end
        rescue NameError
          raise ArgumentError.new("Oops, looks like the given binding does not have a variable '#{clean_key}'.")
        end
      end
      return hash
    end

    def self.rush(binding, *args)
      Hash.build_from_symbol_variables(binding, args)
    end
  end

end
