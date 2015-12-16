require_relative '../models/menu'

describe Menu do
  let(:menu) { Menu.new("menu.txt") }
  # let(:menu2) { Menu.new("imafile.txt")}
  # let(:menu3) { Menu.new("../false_file.txt")}

  describe 'attributes' do
    it 'is connected to a specific menu file' do
      expect(menu.instance_variable_get "@menu_file").to eq "menu.txt"
    end

    it 'has a desired total amount' do
      expect(menu.total).to eq 15.05
    end

    it 'has an appetizer menu composed of Appetizer objects' do
      expect(menu.appetizer_menu).to all be_a(Appetizer)
    end
  end

  describe '#create_menu' do
    it 'creates an appetizer object for each appetizer listed in the menu file' do
      menu.appetizer_menu.clear
      expect(menu.create_menu.length).to eq 6
    end
  end
end

  # describe 'error message for nonexistant file' do
  #   it 'should close the program and notify the user that the file was improperly formatted or could not be found' do
  #     expect { Menu.new("") }.to output("File open failed, either because the file is improperly formatted or cannot be found. Please check that this file exists and is formatted correctly.").to_stdout
  #   end
  # end

  # describe 'error message for improperly-formatted file' do
  #   it 'should close the program and notify the user that the file was improperly formatted or could not be found' do
  #     expect { Menu.new("false_file.txt") }.to output("File open failed, either because the file is improperly formatted or cannot be found. Please check that this file exists and is formatted correctly.").to_stdout
  #   end
  # end



