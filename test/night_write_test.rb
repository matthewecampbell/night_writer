require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_write'

class NightWriteTest < Minitest::Test

  attr_reader       :night_write

  def setup
    @night_write = NightWrite.new
  end

  def test_look_up_top_line_of_braille_for_letter
    assert_equal "0.", night_write.english_to_braille_top_line("a")
  end

  def test_look_up_middle_line_of_braille_for_letter
    assert_equal "..", night_write.english_to_braille_middle_line("a")
  end

  def test_look_up_bottom_line_of_braille_for_letter
    assert_equal "..", night_write.english_to_braille_bottom_line("a")
  end

  def test_can_translate_whole_word_top_line
    assert_equal "0..0", night_write.english_to_braille_word_top_line("hi")
  end

  def test_can_translate_whole_word_middle_line
    assert_equal "000.", night_write.english_to_braille_word_middle_line("hi")
  end

  def test_can_translate_whole_word_bottom_line
    assert_equal "....", night_write.english_to_braille_word_bottom_line("hi")
  end

  def test_can_translate_whole_word_to_english
    assert_equal "0..0\n000.\n....", night_write.convert_english_to_braille("hi")
  end

  def test_can_translate_word_with_capitals_to_braille
    assert_equal "..0..0\n..000.\n.0....", night_write.convert_english_to_braille("Hi")
  end

  def test_can_translate_sentences_to_braille
    assert_equal "..0.0.0.0.0......00.0.0.00\n..00.00.0..0....00.0000..0\n.0....0.0.0....0.00.0.0...", night_write.convert_english_to_braille("Hello World")
  end

end
