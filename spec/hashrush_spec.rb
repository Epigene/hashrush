require 'spec_helper'

describe Hashrush do
  it 'has a version number' do
    expect(Hashrush::VERSION).not_to be nil
  end

  describe "Hash.build_from_symbol_variables" do
    it 'Builds a hash from passed variables' do
      a = "value one"
      b = "value two"
      expect(Hash.build_from_symbol_variables(binding, :a, :b)).to eq ({a: "value one", b: "value two"})
    end
    it 'Raises if variables are not dfined' do
      a = "value one"
      b = "value two"
      expect {Hash.build_from_symbol_variables(binding, :c, :d)}.to raise_error
    end
    it 'Raises if symbol variables are not symbols' do
      a = "value one"
      b = "value two"
      expect {Hash.build_from_symbol_variables(binding, a, "nein!")}.to raise_error "Argments must all be symbols!"
    end
  end

  describe "is_variable?" do
    xit 'Reports whether there is a variable named like the symbol' do
      a = "value one"
      b = "value two"
      expect(is_variable?(:a)).to eq true
    end
  end
end
