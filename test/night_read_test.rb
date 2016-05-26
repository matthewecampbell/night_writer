require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_read'
require 'pry'

class NightReadTest < Minitest::Test

  attr_reader       :night_read

  def setup
    @night_read     = NightRead.new
  end

  def test_can_split_braille_into_array_with_3_indexes
    assert_equal 3, night_read.split_braille_into_three_indexes("0..0\n000.\n....").count
  end

  def test_can_split_braille_into_two_character_indexes
    night_read.split_braille_into_three_indexes("0..0\n000.\n....")
    assert_equal [["0.", ".0"], ["00","0."], ["..",".."]],night_read.braille_to_two_character_index
  end

  def test_can_rearrange_array_so_braille_words_in_same_index
    night_read.split_braille_into_three_indexes("0..0\n000.\n....")
    night_read.braille_to_two_character_index
    assert_equal [["0.", "00", ".."], [".0", "0.", ".."]], night_read.combine_braille_character_lines_to_one_index
  end

  def test_make_braille_character_index_one_string
    night_read.split_braille_into_three_indexes("0..0\n000.\n....")
    night_read.braille_to_two_character_index
    night_read.combine_braille_character_lines_to_one_index
    assert_equal ["0.00..", ".00..."], night_read.join_braille
  end


  def test_can_translate_whole_braille_word_to_english
    night_read.split_braille_into_three_indexes("0..0\n000.\n....")
    night_read.braille_to_two_character_index
    night_read.combine_braille_character_lines_to_one_index
    night_read.join_braille
    assert_equal "hi", night_read.read_braille_to_english
  end

  def test_can_translate_a_sentence_without_capitals
    assert_equal "hello world", night_read.convert_braille_to_english("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...")
  end

  def test_can_translate_a_captial_letter
    assert_equal "A", night_read.convert_braille_to_english("..0.\n....\n.0..")
  end

  def test_can_translate_two_capital_letters
    assert_equal "AA", night_read.convert_braille_to_english("..0...0.\n........\n.0...0..")
  end

  def test_can_translate_braille_sentence_with_capitals
    assert_equal "Hello World", night_read.convert_braille_to_english("..0.0.0.0.0......00.0.0.00\n..00.00.0..0....00.0000..0\n.0....0.0.0....0.00.0.0...")
  end

  def test_can_get_line_four_to_line_one
    assert_equal ["0000","..",".."], night_read.split_braille_into_three_indexes("00\n..\n..\n00")
  end

  def test_can_get_braille_input_to_three_total_lines
    assert_equal ["0000", "....", "...."], night_read.split_braille_into_three_indexes("00\n..\n..\n00\n..\n..")
  end

  def test_can_find_numbers
    assert_equal true, night_read.numbers_check("#1")
  end

  def test_can_translate_a_number
    assert_equal "1", night_read.convert_braille_to_english(".00.\n.0..\n00..")
  end

  def test_can_translate_letters_and_numbers
    assert_equal "1a2b", night_read.convert_braille_to_english(".00.0..00.0.\n.0.....00.0.\n00....00....")
  end
end
