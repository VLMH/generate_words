class GenerateWords
  attr_accessor :file_dict, :dict, :parseDigit

  # To open the dictionary file and build the dictionary
  # @dict_path path of dictionary
  def initialize(dict_path)
    @dict = {}

    # should catch exception for file handling
    @file_dict = File.open(dict_path)
    build_dict
    @file_dict.close
  end

  def generate_combinations(input)
    # get the last digit set
    @parseDigit = input.split('-').pop

    # prepare the converted array to generate results
    converted_array = []
    @parseDigit.each_char do |c|
      @dict.each do |key, value|
        converted_array << value if c == key
      end
    end

    # Generate all combinations based on converted_array
    # Be honest, I found the solution here
    # http://stackoverflow.com/questions/5226895/combine-array-of-array-into-all-possible-combinations-forward-only-in-ruby
    converted_array.first.product(*converted_array[1..-1]).map(&:join)
  end

  private

  def build_dict
    @file_dict.each do |line|
      key_value = line.split(' ')
      temp_array = []
      key_value[1].each_char do |c|
        temp_array << c
      end
      @dict[key_value[0]] = temp_array
    end
  end
end
