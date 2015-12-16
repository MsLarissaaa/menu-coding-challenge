require_relative '../models/combination_set'
require_relative '../models/menu'

describe CombinationSet do
  let(:menu) { Menu.new("menu.txt") }
  let(:app_menu) { menu.appetizer_menu }
  let(:total) { menu.total }
  let(:combination) { CombinationSet.new(app_menu, 7, total) }

  describe '#combo_options' do
    it 'is a collection of Combo objects' do
      expect(combination.combo_options).to all be_a(Combo)
    end
  end

  describe 'attributes' do
    it 'corresponds to a specific appetizer menu' do
      expect(combination.instance_variable_get "@app_menu").to eq menu.appetizer_menu
    end

    it 'generates combinations that add up to a particular total' do
      expect(combination.instance_variable_get "@total").to eq 15.05
    end
  end

  describe '#find_combos' do
    it 'finds all possible combinations from the given menu that sum to the given total' do
      combination.combo_options.clear
      expect(combination.find_combos(app_menu, 7, total).length).to eq 2
    end
  end

  describe '#all_combinations_valid?' do
    it 'checks all the combination options for a given menu and verifies that they each sum to the given total' do
      expect(combination.all_combinations_valid?).to be true
    end

    it 'returns false if one or more of the combination options are invalid' do
      combination.combo_options[0].combo_array.delete_at(-1)
      expect(combination.all_combinations_valid?).to be false
    end
  end
end
