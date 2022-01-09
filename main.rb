require 'json'
# One day Anna was walking her {{NUMBER}} {{UNIT_OF_MEASURE}} commute to {{PLACE}} and found a {{ADJECTIVE}} {{NOUN}} on the ground.

# Write a command line application in any language that accepts a json string of key-value inputs for the template above.
# With valid input, the application sends to STDOUT the story using the inputs provided. For example, "One day Anna was walking her 2 mile commute to school and found a blue rock on the ground." The application stores a record of valid inputs locally in a file. For the template above, you can assume NUMBER to be numerical data and all other inputs to be strings. Set sensible string validations for length.

# Write a second command line application that sends to STDOUT statistics about the stored records, including the maximum and minimum values for numerical inputs, the most common responses for string inputs, and anything else you think might be relevant.

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
  message = "One day Anna was walking her #{parsed_input['NUMBER']} #{parsed_input['UNIT_OF_MEASURE']} commute to #{parsed_input['PLACE']} and found a #{parsed_input['ADJECTIVE']} #{parsed_input['NOUN']} on the ground."
  puts "\n"
  puts '***Prompt created***'
  puts message
  File.open('out.txt', 'a+') { |f| f.puts(message) }

else
  puts '----- Error invalid JSON input please start again with a valid JSON'
end
