require 'spec_helper'

describe Hashrush do

  describe "Hash.build_from_symbol_variables" do
    it 'Builds a hash from passed variables' do
      a = "value one"
      b = "value two"
      expect(Hash.build_from_symbol_variables(binding, :a, :b)).to eq ({a: "value one", b: "value two"})
    end
    it 'Builds a hash from a passed array' do
      a = "value one"
      b = "value two"
      expect(Hash.build_from_symbol_variables(binding, [:a, :b]) ).to eq ({a: "value one", b: "value two"})
    end
    it 'Raises if variables are not defined' do
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

  describe "Hash.rush" do
    it 'Builds a hash from passed variables' do
      a = "value one"
      b = "value two"
      expect(Hash.rush(binding, :a, :b)).to eq ({a: "value one", b: "value two"})
    end
    it 'Raises if variables are not defined' do
      a = "value one"
      b = "value two"
      expect {Hash.rush(binding, :c, :d)}.to raise_error
    end
    it 'Raises if symbol variables are not symbols' do
      a = "value one"
      b = "value two"
      expect {Hash.rush(binding, a, "nein!")}.to raise_error "Argments must all be symbols!"
    end
  end


end
