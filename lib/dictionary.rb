require'pry'
class Dictionary
attr_reader           :braille_message,
                      :braille_message_by_lines
  def initialize
    @braille_final = []
    @braille_message = braille_message
    @braille_message_by_lines = braille_message_by_lines
    @english_to_braille = {
      "a" => ["0.", "..", ".."],
      "b" => ["0.", "0.", ".."],
      "c" => ["00", '..', '..'],
      "d" => ["00", ".0", ".."],
      "e" => ["0.", ".0", ".."],
      "f" => ["00", "0.", ".."],
      "g" => ["00", "00", ".."],
      "h" => ["0.", "00", ".."],
      "i" => [".0", "0.", ".."],
      "j" => [".0", "00", ".."],
      "k" => ["0.", "..", "0."],
      "l" => ["0.", "0.", "0."],
      "m" => ["00", "..", "0."],
      "n" => ["00", ".0", "0."],
      "o" => ["0.", ".0", "0."],
      "p" => ["00", "0.", "0."],
      "q" => ["00", "00", "0."],
      "r" => ["0.", "00", "0."],
      "s" => [".0", "0.", "0."],
      "t" => [".0", "00", "0."],
      "u" => ["0.", "..", "00"],
      "v" => ["0.", "0.", "00"],
      "w" => [".0", "00", ".0"],
      "x" => ["00", "..", "00"],
      "y" => ["00", ".0", "00"],
      "z" => ["0.", ".0", "00"],
      " " => ["..", "..", ".."],
      "!" => ["..", "00", "0."],
      "'" => ["..", "..", "0."],
      "," => ["..", "0.", ".."],
      "-" => ["..", "..", "00"],
      "." => ["..", "00", ".0"],
      "?" => ["..", "0.", "00"],
      "A" => ["..0.", "....", ".0.."],
      "B" => ["..0.", "..0.", ".0.."],
      "C" => ["..00", '....', '.0..'],
      "D" => ["..00", "...0", ".0.."],
      "E" => ["..0.", "...0", ".0.."],
      "F" => ["..00", "..0.", ".0.."],
      "G" => ["..00", "..00", ".0.."],
      "H" => ["..0.", "..00", ".0.."],
      "I" => ["...0", "..0.", ".0.."],
      "J" => ["...0", "..00", ".0.."],
      "K" => ["..0.", "....", ".00."],
      "L" => ["..0.", "..0.", ".00."],
      "M" => ["..00", "....", ".00."],
      "N" => ["..00", "...0", ".00."],
      "O" => ["..0.", "...0", ".00."],
      "P" => ["..00", "..0.", ".00."],
      "Q" => ["..00", "..00", ".00."],
      "R" => ["..0.", "..00", ".00."],
      "S" => ["...0", "..0.", ".00."],
      "T" => ["...0", "..00", ".00."],
      "U" => ["..0.", "....", ".000"],
      "V" => ["..0.", "..0.", ".000"],
      "W" => ["...0", "..00", ".0.0"],
      "X" => ["..00", "....", ".000"],
      "Y" => ["..00", "...0", ".000"],
      "Z" => ["..0.", "...0", ".000"]
    }

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

  def english_to_braille_top_line(letter)
    @english_to_braille[letter][0]
  end

  def english_to_braille_middle_line(letter)
    @english_to_braille[letter][1]
  end

  def english_to_braille_bottom_line(letter)
    @english_to_braille[letter][2]
  end

  def english_to_braille_word_top_line(word)
    top_line = ""
    letters = word.split(//)
    letters.each do |letter|
      top_line += english_to_braille_top_line(letter)
    end
    top_line
  end

  def english_to_braille_word_middle_line(word)
    middle_line = ""
    letters = word.split(//)
    letters.each do |letter|
      middle_line += english_to_braille_middle_line(letter)
    end
    middle_line
  end

  def english_to_braille_word_bottom_line(word)
    bottom_line = ""
    letters = word.split(//)
    letters.each do |letter|
      bottom_line += english_to_braille_bottom_line(letter)
    end
    bottom_line
  end

  def english_to_braille_whole_word(word)
    whole_word = ""
    letters = word.split(//)
    letters.each do |letter|
      whole_word += english_to_braille_top_line(letter)
    end
    whole_word += "\n"
    letters.each do |letter|
      whole_word += english_to_braille_middle_line(letter)
    end
    whole_word += "\n"
    letters.each do |letter|
      whole_word += english_to_braille_bottom_line(letter)
    end
    whole_word
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

    def translate_braille_to_english(braille)
      split_braille_into_three_indexes(braille)
      braille_to_two_character_index
      combine_braille_character_lines_to_one_index
      join_braille
      read_braille_to_english
    end

  end
