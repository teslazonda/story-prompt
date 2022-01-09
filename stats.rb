# Check if we have any prompts already made
if File.exist?('out.txt')
  prompt_count = 0
  # Create arrays to store values of each field in JSON
  outputs_array = []
  number_array = []
  unit_of_measure_array = []
  place_array = []
  adjective_array = []
  noun_array = []
  File.readlines('out.txt').each do |line|
    line_array = line.split(' ')
    outputs_array << line_array
    prompt_count += 1
  end
  # Creates an array of arrays, where each inner array is a line in out.txt
  outputs_array.each do |line|
    number_array << line[6].to_i
    unit_of_measure_array << line[7]
    place_array << line[10]
    adjective_array << line[14]
    noun_array << line[15]
  end
  # Create frequency tables for each array and show max and min NUMBER in console
  max_numberical_input = number_array.max
  min_numerical_input = number_array.min
  # nouns
  noun_freq = noun_array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  noun_max = noun_array.max_by { |v| noun_freq[v] }
  # adjectives
  adjective_freq = adjective_array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  adjective_max = adjective_array.max_by { |v| adjective_freq[v] }
  # places
  place_freq = place_array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  place_max = place_array.max_by { |v| place_freq[v] }
  # unit_of_measures
  unit_of_measure_freq = unit_of_measure_array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  unit_of_measure_max = unit_of_measure_array.max_by { |v| unit_of_measure_freq[v] }
  # Print stats in the terminal
  puts '--- INPUT STATISTICS ---'
  puts "Maximum Numerical input: #{max_numberical_input}"
  puts "Minimum Numerical input: #{min_numerical_input}"
  puts "Most common Unit-of-measure response: '#{unit_of_measure_max}', occuring #{unit_of_measure_freq[unit_of_measure_max]} times"
  puts "Most common Place response: '#{place_max}', occuring #{place_freq[place_max]} times"
  puts "Most common Adjective response: '#{adjective_max}', occuring #{adjective_freq[adjective_max]} times"
  puts "Most common Noun response: '#{noun_max}', occuring #{noun_freq[noun_max]} times"
  puts "Number of story prompts you have on file: #{prompt_count}"
else
  puts '---Error you have not created story prompts yet. Please run main.rb before running stats.rb'
end
