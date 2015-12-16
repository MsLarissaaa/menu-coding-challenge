require_relative 'appetizer'

class Menu
  attr_reader :total, :appetizer_menu

  def initialize(menu_file)
    @menu_file = menu_file
    @appetizer_menu = []
    begin
      @total = File.open(@menu_file).first.match(/(?<=\$).+/)[0].to_f
    rescue
      puts "File open failed, either because the file is improperly formatted or cannot be found. Please check that this file exists and is formatted correctly."
      exit(1)
    end
    create_menu
  end

  def create_menu
    File.readlines(@menu_file).each_with_index do |line, index|
      next if index == 0
      @appetizer_menu << Appetizer.new(line.match(/^[^\,]*/)[0], line.match(/(?<=\$).+/)[0].to_f)
    end
    @appetizer_menu.sort_by!{ |item| item.price }
  end
end






