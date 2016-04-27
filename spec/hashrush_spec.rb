require 'spec_helper'

describe Hashrush do
  context "Excepetions" do
    it 'should raise if binding is not passed' do
      expect{Hash.build_from_symbol_variables(nil)}.to raise_error(ArgumentError, "Oops, expected the first argument to be a binding object. Try `Hash.rush(binding, :some_variable_name)`")
    end

    it 'should raise if symbol variables are not symbols' do
      expect{Hash.build_from_symbol_variables(binding, "nein!")}.to raise_error(ArgumentError, /Oops, argument 1 is not a symbol/)
    end

    it 'should raise if variables are not defined' do
      expect{Hash.build_from_symbol_variables(binding, :a)}.to raise_error(ArgumentError, /Oops, looks like the given binding does not have a variable/ )
    end

    it "should raise if variable collision detected" do
      @a = "a"
      a = "b"
      expect{Hash.build_from_symbol_variables(binding, :a, :@a)}.to raise_error(ArgumentError, /Oops, argument collision detected./ )
    end
  end

  describe "Hash.build_from_symbol_variables" do
    it 'should build a hash from passed variables' do
      a = "value one"
      b = "value two"
      expect(Hash.build_from_symbol_variables(binding, :a, :b)).to eq ({a: "value one", b: "value two"})
    end

    it 'should build a hash from a passed array' do
      a = "value one"
      b = "value two"
      expect(Hash.build_from_symbol_variables(binding, [:a, :b]) ).to eq ({a: "value one", b: "value two"})
    end

    it "should strip leading '@' and '@@' from passed variable symbols" do
      @a = "instance var"
      @@b = "class var"
      expect(Hash.build_from_symbol_variables(binding, %i|@a @@b|)).to eq({a: "instance var", b: "class var"})
    end
  end

  describe "Hash.rush" do
    it "should delegate to #build_from_symbol_variables" do
      expect(Hash).to receive(:build_from_symbol_variables).exactly(1).times

      Hash.rush(binding, false)
    end
  end

end
