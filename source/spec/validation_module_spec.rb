require_relative '../models/combo_validation_module'
require_relative '../models/appetizer'

describe Validation do

  let(:appetizer1) { Appetizer.new("food", 4.56) }
  let(:appetizer2) { Appetizer.new("snack", 6.54) }
  let(:extended_class) { Class.new { extend Validation } }

  describe '#combo_valid?' do
    it 'returns true if the combination is valid' do
      expect(extended_class.combo_valid?([appetizer1, appetizer2], 11.10)).to be true
    end

    it 'returns false if the combination is invalid' do
      expect(extended_class.combo_valid?([appetizer1, appetizer1, appetizer2], 11.10)).to be false
    end
  end

end
