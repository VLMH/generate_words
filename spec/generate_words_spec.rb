require 'generate_words'

describe GenerateWords do
  before do
    @dict_path = 'lib/dict.txt'
    @parseDigit = '228'
    @input = "1-800-#{@parseDigit}"

    @generator = GenerateWords.new(@dict_path)
  end

  context '#initialize' do
    it 'parse the dictionary file' do
      @generator.file_dict.to_path.should == @dict_path
    end

    it 'read and build dictionary' do
      @generator.dict.count.should > 0
    end
  end

  context '#generate_combinations' do
    before do
      @result = @generator.generate_combinations(@input)
    end

    it 'get the last digit set' do
      @generator.parseDigit.should == @parseDigit
    end

    it 'generate all combinations' do
      @result.count.should == @parseDigit.length ** @parseDigit.length
    end
  end
end
