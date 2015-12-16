require_relative 'combo_validation_module'

class Combo

  include Validation
  attr_reader :combo_array

  def initialize(combo_array)
    @combo_array = combo_array
  end

  def combo_totals
    combo_totals = Hash.new(0)
    self.combo_array.each do |item|
      combo_totals[item] += 1
    end
    combo_totals
  end

end