require 'json'

# Method for json validation
def valid_json?(string)
  !!JSON.parse(string)
rescue JSON::ParserError
  false
end
sample_json = {
  'NUMBER' => 1,
  'UNIT_OF_MEASURE' => 'meter',
  'PLACE' => 'Reillyville',
  'ADJECTIVE' => 'red',
  'NOUN' => 'hat'
}

# generate a JSON test string
json_data = JSON.generate(sample_json)

puts 'Welcome to the CommonPaper story prompt generator! Please enter a valid JSON to construct your prompt, or copy and paste the sample JSON below'
puts "\n"
puts json_data
puts "\n"
input = gets.chomp
# Validate JSON input
if input.length < 200 && valid_json?(input)
  parsed_input = JSON.parse(input)
  # Check if values in JSON are blank
  if !parsed_input.values.include?("")
    message = "One day Anna was walking her #{parsed_input['NUMBER']} #{parsed_input['UNIT_OF_MEASURE']} commute to #{parsed_input['PLACE']} and found a #{parsed_input['ADJECTIVE']} #{parsed_input['NOUN']} on the ground."
    puts "\n"
    puts '***Prompt created***'
    puts message
    File.open('out.txt', 'a+') { |f| f.puts(message) }
  else
    puts '--- Error, blank values in JSON detected, please run main.rb again with a valid JSON'
  end
else
  puts '--- Error invalid JSON input please start again with a valid JSON'
end
