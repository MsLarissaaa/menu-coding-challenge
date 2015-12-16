require_relative '../controllers/combination_generator'

describe CombinationGenerator do
  let(:new_combo_program) { CombinationGenerator.new("menu.txt") }

  describe 'attributes' do
    it 'is initialized with a menu file and instantiates a Menu object as an attribute' do
      expect(new_combo_program.instance_variable_get "@menu").to be_an_instance_of(Menu)
    end

    it 'has a total value taken from the menu' do
      expect(new_combo_program.instance_variable_get "@total").to eq 15.05
    end

    it 'accesses display method through the view instance variable' do
      expect(new_combo_program.instance_variable_get "@view").to be_an_instance_of(Display)
    end
  end

  describe '#find_max' do
    it 'takes the desired total and divides it by the lowest price of any one item on the menu to calculate the largest number of items that can be present in valid combination' do
      expect(new_combo_program.find_max).to eq 7
    end
  end

  describe '#display_the_combo_options' do
    it 'displays the valid combinations from the given menu' do
      expect { new_combo_program.display_the_combo_options }.to output("7 mixed fruit at $2.15/each\n\nOR\n\n1 mixed fruit at $2.15/each\n2 hot wings at $3.55/each\n1 sampler plate at $5.80/each\n\n").to_stdout
    end
  end
end