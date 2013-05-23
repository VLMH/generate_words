require './lib/generate_words.rb'

generator = GenerateWords.new('lib/dict.txt')
begin
  print "Please input text (sample: 1-800-456 or '.' to quit)> "
  input_text = gets.chomp
  puts generator.generate_combinations(input_text) if input_text != '.'
end until input_text == '.'
