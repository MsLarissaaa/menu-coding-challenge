require_relative '../views/combination_display'
require_relative '../models/menu'
require_relative '../models/combination_set'

describe Display do
  let(:display) { Display.new }
  let(:menu) { Menu.new("menu.txt") }
  let(:app_menu) { menu.appetizer_menu}
  let(:combination) { CombinationSet.new(app_menu, 7, 15.05) }
  let(:appetizer1) { Appetizer.new("food", 4.56) }
  let(:appetizer2) { Appetizer.new("snack", 6.54) }
  let(:combo) { Combo.new((0..4).map{ appetizer1 }) }

  describe '#welcome_message' do
    it 'prints the welcome message string to the console' do
      expect { display.welcome_message }.to output("\nWelcome to the Appetizer Combination Generator!\n\n").to_stdout
    end
  end

  describe '#display_total' do
    it 'displays the desired total from the menu file with exactly two decimal places precision' do
      expect { display.display_total(3.5) }.to output("I understand that you want to spend exactly $3.50 on appetizers today.\n\n").to_stdout
    end
  end

  describe '#display_menu' do
    it 'prints each of the appetizer items along with their price to the console' do
      expect { display.display_menu(app_menu) }.to output("...And, you have the following menu options to choose from:\n\nmixed fruit - $2.15\nfrench fries - $2.75\nside salad - $3.35\nhot wings - $3.55\nmozzarella sticks - $4.20\nsampler plate - $5.80\n\nIf this is correct, press ENTER to continue.\n").to_stdout
    end
  end

  describe '#calculating_response' do
    it 'prints the message that it is finding combinations' do
      expect { display.calculating_response(3.5) }.to output("Great! I will find all the combinations from this menu that add up to $3.50.\n\n").to_stdout
    end
  end

  describe '#number_of_combos' do
    it 'displays the number of possible combinations from the inputed menu' do
      expect { display.number_of_combos(combination) }.to output("You have 2 appetizer combination option(s).\n\n").to_stdout
    end
  end

  describe '#display_no_options' do
    it 'prints the closing message when no combinations are possible from a given menu' do
      expect { display.display_no_options(3.6) }.to output("Unfortunately, there are no possible combinations of the items on this menu that amount to exactly $3.60. Goodbye!\n").to_stdout
    end
  end

  describe '#display_combos' do
    it 'displays the total number of each item present in a particular combo' do
      2.times { combo.combo_array << appetizer2 }
      expect { display.display_combos(combo.combo_totals) }.to output("5 food at $4.56/each\n2 snack at $6.54/each\n").to_stdout
    end
  end

  describe '#display_divider' do
    it 'prints "OR" between multiple combinations' do
      expect { display.display_divider }.to output("\nOR\n\n").to_stdout
    end
  end

  describe '#display_closing_language' do
    it 'displays the closing message of the program, including goal total to two decimal places' do
      expect { display.display_closing_language(menu.total) }.to output("Ta-Da! For a grand total of $15.05. :)\n\n").to_stdout
    end
  end

end