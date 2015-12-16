require_relative 'controllers/combination_generator'

if ARGV.any?
  controller = CombinationGenerator.new(ARGV[0])
  controller.run
else
  puts "Please enter a text file."
end