require './night_reader'
class NightWriter
  attr_reader :file_reader

  def initialize
    @reader = NightReader.new
    @message
  end

  def encode_file_to_braille
    # I wouldn't worry about testing this method
    # unless you get everything else done
    plain = night_reader.read
    braille = encode_to_braille(plain)
  end

  def encode_to_braille(input)
    @message = File.read(ARGV[0])
    line_1_message = ""
    line_2_message = ""
    line_3_message - ""
    @message.split(//)
    @message.map do |letter|
      line_1_message += @english_to_braille[letter]
    end
  end

    # you've taken in an INPUT string
    # do the magic
    # send out an OUTPUT string
    puts @message
end



binding.pry
