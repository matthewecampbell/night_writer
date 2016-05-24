require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/dictionary'
require 'pry'

class DictionaryTest < Minitest::Test
  attr_reader       :dictionary

  def setup
    @dictionary = Dictionary.new
  end

  def test_look_up_top_line_of_braille_for_letter
    assert_equal "0.", dictionary.english_to_braille_top_line("a")
  end

  def test_look_up_middle_line_of_braille_for_letter
    assert_equal "..", dictionary.english_to_braille_middle_line("a")
  end

  def test_look_up_bottom_line_of_braille_for_letter
    assert_equal "..", dictionary.english_to_braille_bottom_line("a")
  end

  def test_can_translate_whole_word_top_line
    assert_equal "0..0", dictionary.english_to_braille_word_top_line("hi")
  end

  def test_can_translate_whole_word_middle_line
    assert_equal "000.", dictionary.english_to_braille_word_middle_line("hi")
  end

  def test_can_translate_whole_word_bottom_line
    assert_equal "....", dictionary.english_to_braille_word_bottom_line("hi")
  end

  def test_can_translate_whole_word_to_english
    assert_equal "0..0\n000.\n....", dictionary.english_to_braille_whole_word("hi")
  end

  def test_can_translate_word_with_capitals_to_english
    assert_equal "..0..0\n..000.\n.0....", dictionary.english_to_braille_whole_word("Hi")
  end

  def test_can_translate_sentences_to_english
    assert_equal "..0.0.0.0.0......00.0.0.00\n..00.00.0..0....00.0000..0\n.0....0.0.0....0.00.0.0...", dictionary.english_to_braille_whole_word("Hello World")
  end

  def test_can_split_braille_into_array_with_3_indexes
    assert_equal 3, dictionary.split_braille_into_three_indexes("0..0\n000.\n....").count
  end

  def test_can_split_braille_into_two_character_indexes
    dictionary.split_braille_into_three_indexes("0..0\n000.\n....")
    assert_equal [["0.", ".0"], ["00","0."], ["..",".."]],dictionary.braille_to_two_character_index
  end

  def test_can_rearrange_array_so_braille_words_in_same_index
    dictionary.split_braille_into_three_indexes("0..0\n000.\n....")
    dictionary.braille_to_two_character_index
    assert_equal [["0.", "00", ".."], [".0", "0.", ".."]], dictionary.combine_braille_character_lines_to_one_index
  end

  def test_make_braille_character_index_one_string
    dictionary.split_braille_into_three_indexes("0..0\n000.\n....")
    dictionary.braille_to_two_character_index
    dictionary.combine_braille_character_lines_to_one_index
    assert_equal ["0.00..", ".00..."], dictionary.join_braille
  end


  def test_can_translate_whole_braille_word_to_english
    dictionary.split_braille_into_three_indexes("0..0\n000.\n....")
    dictionary.braille_to_two_character_index
    dictionary.combine_braille_character_lines_to_one_index
    dictionary.join_braille
    assert_equal "hi", dictionary.read_braille_to_english
  end

  def test_can_translate_a_sentence_without_capitals
    assert_equal "hello world", dictionary.translate_braille_to_english("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...")
  end

  def test_can_translate_a_captial_letter
    assert_equal "A", dictionary.translate_braille_to_english("..0.\n....\n.0..")
  end

  def test_can_translate_two_capital_letters
    assert_equal "AA", dictionary.translate_braille_to_english("..0...0.\n........\n.0...0..")
  end

  def test_can_translate_braille_sentence_with_capitals
    assert_equal "Hello World", dictionary.translate_braille_to_english("..0.0.0.0.0......00.0.0.00\n..00.00.0..0....00.0000..0\n.0....0.0.0....0.00.0.0...")
  end
end
