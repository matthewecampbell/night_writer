
class NightWrite
  attr_reader              :translation

  def initialize
    @final_output          = []
    @split_output          = []
    @english_to_braille    = {
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
      "Z" => ["..0.", "...0", ".000"],
      "0" => [".0.0.0",".000","00.."],
      "1" => [".00.",".0..","00.."],
      "2" => [".00.",".00.","00.."],
      "3" => [".000",".0..","00.."],
      "4" => [".000",".0.0","00.."],
      "5" => [".00.",".0.0","00.."],
      "6" => [".000",".00.","00.."],
      "7" => [".000",".000","00.."],
      "8" => [".00.",".000","00.."],
      "9" => [".0.0",".00.","00.."]
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

  def split_lines(whole_word)
    new_lines = []
    braille = whole_word.split("\n")
    x = braille[0].length
    while x > 0
      braille.map do |line|
        new_line = line.slice!(0..79)
        new_lines << new_line
      end
      x -= 80
    end
    new_lines
  end

  def convert_english_to_braille(word)
    whole_word = ""
    letters = word.chomp.split(//)
    letters.each do |letter|
      whole_word += english_to_braille_word_top_line(letter)
    end
    whole_word += "\n"
    letters.each do |letter|
      whole_word += english_to_braille_word_middle_line(letter)
    end
    whole_word += "\n"
    letters.each do |letter|
      whole_word += english_to_braille_word_bottom_line(letter)
    end
    whole_word
    split_array = split_lines(whole_word)
    translation = []
    split_array.each do |line|
      translation << line += "\n"
    end
    translation.join
  end
end
