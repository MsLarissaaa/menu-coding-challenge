module Validation

  def combo_valid?(array, total)
    array.map(&:price).inject(0, :+) == total
  end

end