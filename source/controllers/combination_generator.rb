require_relative '../models/menu'
require_relative '../models/combination_set'
require_relative '../views/combination_display'

class CombinationGenerator

  def initialize(menu_file)
    @menu = Menu.new(menu_file)
    @total = @menu.total
    @app_menu = @menu.appetizer_menu
    @view = Display.new
    @combos = CombinationSet.new(@app_menu, find_max, @total)
  end

  def run
    @view.welcome_message
    @view.display_total(@total)
    @view.display_menu(@app_menu)

    user_approval_of_menu

    if @combos.all_combinations_valid? == false
      puts "Oops! Something went wrong. Try again?"
      exit(1)
    end

    @view.number_of_combos(@combos)
    if @combos.combo_options.empty?
      @view.display_no_options(@total)
      exit(1)
    end

    display_the_combo_options
    @view.display_closing_language(@total)
  end

  def user_approval_of_menu
    prompt = '> '
    input = $stdin.gets.chomp
    if input.empty?
      @view.calculating_response(@total)
    elsif input == "NO"
      puts "Ok, sorry about that. Try a different file next time."
      exit(1)
    else
      puts "Should I continue? Please press ENTER to continue or NO to exit the program.", prompt
      user_approval_of_menu
    end
  end

  def find_max
    (@total / @app_menu[0].price).to_i
  end

  def display_the_combo_options
    @combos.combo_options.each_with_index do |combo, index|
      if !(index == @combos.combo_options.count - 1)
        @view.display_combos(combo.combo_totals)
        @view.display_divider
      else
        @view.display_combos(combo.combo_totals)
        puts ""
      end
    end
  end

end
