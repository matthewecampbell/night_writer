require './lib/night_write'
require 'pry'

text = File.read(ARGV[0])
english = NightWrite.new
translate = english.convert_english_to_braille(text)
english_file = File.open(ARGV[1], 'w')
File.write(english_file, translate)

print "Created '#{ARGV[1]}' containing #{english_file.size} characters"
#
