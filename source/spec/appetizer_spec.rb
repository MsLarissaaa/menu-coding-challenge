require_relative '../models/appetizer'

describe Appetizer do
  let(:appetizer) { Appetizer.new("french fries", 5.06) }

  describe '#initialize' do
    it 'creates an appetizer object' do
      expect(appetizer).to be_an_instance_of Appetizer
    end

    it 'has a string description' do
      expect(appetizer.description).to eq "french fries"
    end

    it 'has a float price' do
      expect(appetizer.price).to eq 5.06
    end
  end

end