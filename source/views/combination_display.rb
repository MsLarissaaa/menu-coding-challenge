class Display

  def welcome_message
    puts "\n" + "Welcome to the Appetizer Combination Generator!" + "\n" + "\n"
  end

  def display_total(total)
    puts "I understand that you want to spend exactly $#{'%.2f' % total} on appetizers today." + "\n" + "\n"
  end

  def display_menu(app_menu)
    puts "...And, you have the following menu options to choose from:" + "\n" + "\n"
    app_menu.each do |item|
      puts "#{item.description} - $#{'%.2f' % item.price}"
    end
    puts "\n" + "If this is correct, press ENTER to continue."
  end

  def calculating_response(total)
    puts "Great! I will find all the combinations from this menu that add up to $#{'%.2f' % total}." + "\n" + "\n"
  end

  def number_of_combos(combos)
    puts "You have #{combos.combo_options.length} appetizer combination option(s)." + "\n" + "\n"
  end

  def display_no_options(total)
    puts "Unfortunately, there are no possible combinations of the items on this menu that amount to exactly $#{'%.2f' % total}. Goodbye!"
  end

  def display_combos(combo_totals)
    combo_totals.each do |k,v|
      puts "#{v} #{k.description} at $#{'%.2f' % k.price}/each"
    end
  end

  def display_divider
    puts "\n" + "OR" + "\n" + "\n"
  end

  def display_closing_language(total)
    puts "Ta-Da! For a grand total of $#{'%.2f' % total}. :)" + "\n" + "\n"
  end

end
