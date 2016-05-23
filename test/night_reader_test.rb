require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/night_reader'

class NightReaderTest < Minitest::Test

  def test_can_read_file
    file = NightReader.new
    assert_equal file.read_file, ARGV[0]
  end

end
