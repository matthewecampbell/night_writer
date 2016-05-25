class NightRead
  attr_reader :file_reader

  def initialize
    @braille_to_english = {
      "0....." => "a",
      "0.0..." => "b",
      "00...." => "c",
      "00.0.." => "d",
      "0..0.." => "e",
      "000..." => "f",
      "0000.." => "g",
      "0.00.." => "h",
      ".00..." => "i",
      ".000.." => "j",
      "0...0." => "k",
      "0.0.0." => "l",
      "00..0." => "m",
      "00.00." => "n",
      "0..00." => "o",
      "000.0." => "p",
      "00000." => "q",
      "0.000." => "r",
      ".00.0." => "s",
      ".0000." => "t",
      "0...00" => "u",
      "0.0.00" => "v",
      ".000.0" => "w",
      "00..00" => "x",
      "00.000" => "y",
      "0..000" => "z",
      "......" => " ",
      "..000." => "!",
      "....0." => "'",
      "..0..." => ",",
      "....00" => "-",
      "..00.0" => ".",
      "..0.00" => "?",
      ".....0" => "",
      ".....00....." => "A",
      ".....00.0..." => "B",
      ".....000...." => "C",
      ".....000.0.." => "D",
      ".....00..0.." => "E",
      ".....0000..." => "F",
      ".....00000.." => "G",
      ".....00.00.." => "H",
      ".....0.00..." => "I",
      ".....0.000.." => "J",
      ".....00...0." => "K",
      ".....00.0.0." => "L",
      ".....000..0." => "M",
      ".....000.00." => "N",
      ".....00..00." => "O",
      ".....0000.0." => "P",
      ".....000000." => "Q",
      ".....00.000." => "R",
      ".....0.00.0." => "S",
      ".....0.0000." => "T",
      ".....00...00" => "U",
      ".....00.0.00" => "V",
      ".....0.000.0" => "W",
      ".....000..00" => "X",
      ".....000.000" => "Y",
      ".....00..000" => "Z",
    }
  end


  def split_braille_into_three_indexes(braille)
    @braille_message = braille.split("\n")
  end

  def braille_to_two_character_index
    @braille_message_by_lines = []
    @braille_message.map do |line|
      @braille_message_by_lines << line.scan(/../)
    end
    @braille_message_by_lines
  end


  def combine_braille_character_lines_to_one_index
    @braille_characters = @braille_message_by_lines.transpose
    @braille_characters
  end

  def join_braille
    @braille_final = []
    @braille_characters.each do |letter|
      @braille_final << letter.join
    end
    @braille_final
  end

  def read_braille_to_english
    @braille_translation = ""
    current_val = 0
    next_val = current_val + 1
    while current_val != @braille_final.count
      if @braille_final[current_val] == ".....0"
        @braille_final[next_val] = @braille_final[current_val] + @braille_final[next_val]
      else
        @braille_translation += @braille_to_english[@braille_final[current_val]]
      end
      current_val += 1
      next_val += 1
    end
    @braille_translation
  end

  def convert_braille_to_english(braille)
    split_braille_into_three_indexes(braille)
    braille_to_two_character_index
    combine_braille_character_lines_to_one_index
    join_braille
    read_braille_to_english
  end

  def encode_file_to_braille
    # I wouldn't worry about testing this method
    # unless you get everything else done
    plain = night_reader.read
    braille = encode_to_braille(plain)
  end

  # def encode_to_braille(input)
  #   @message = File.read(ARGV[0])
  #   line_1_message = ""
  #   line_2_message = ""
  #   line_3_message - ""
  #   @message.split(//)
  #   @message.map do |letter|
  #     line_1_message += @english_to_braille[letter]
  #   end
  # end

  # you've taken in an INPUT string
  # do the magic
  # send out an OUTPUT string
  # puts @message
end
