require_relative '../models/combo'
require_relative '../models/appetizer'

describe Combo do
  let(:appetizer1) { Appetizer.new("food", 4.56) }
  let(:appetizer2) { Appetizer.new("snack", 6.54) }
  let(:combo) { Combo.new((0..4).map{ appetizer1 }) }

  describe '#initialize' do
    it 'accepts an array of Appetizer objects and creates a Combo object' do
      expect(combo).to be_an_instance_of Combo
    end
  end

  describe '#combo_array' do
    it 'is a collection of Appetizer objects' do
      expect(combo.combo_array).to all be_a(Appetizer)
    end
  end

  describe '#combo_totals' do
    it 'generates a hash with the appetizers present in the combo listed as keys and the rate of their occurrence as the corresponding values' do
      2.times { combo.combo_array << appetizer2 }
      expect(combo.combo_totals).to include(appetizer1 => 5, appetizer2 => 2)
    end
  end

end
