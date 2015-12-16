require_relative 'combo'
require_relative 'combo_validation_module'

class CombinationSet

  include Validation
  attr_reader :combo_options

  def initialize(app_menu, max, total)
    @app_menu = app_menu
    @total = total
    @combo_options = []
    find_combos(app_menu, max, total)
  end

  def find_combos(array, max, total, combo_options = [])
    return @combo_options if max == 0
    combinations = array.repeated_combination(max).to_a
    combinations.each do |combo|
      if combo_valid?(combo, total)
        @combo_options << Combo.new(combo)
      end
    end
    @combo_options
    max -= 1
    find_combos(array, max, total, @combo_options)
  end

  def all_combinations_valid?
    self.combo_options.all? do |combo|
      combo_valid?(combo.combo_array, @total)
    end
  end

end