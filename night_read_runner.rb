require './lib/night_read'
require 'pry'

text = File.read(ARGV[0])
braille = NightRead.new
translate = braille.convert_braille_to_english(text)
braille_file= File.open(ARGV[1], 'w')
File.write(braille_file, translate)

print "Created '#{ARGV[1]}' containing #{braille_file.size} characters"
