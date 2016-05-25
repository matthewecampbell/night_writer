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
    current_val = 0
    other_val = 3
    a = []
    a = braille.split("\n")
    @braille_message = []
    until a.count == 3
      a[current_val] += a[other_val]
      a.delete_at(other_val)
      if current_val == 2
        current_val = 0
      else
        current_val += 1
      end
    end
    @braille_message = a
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
end
