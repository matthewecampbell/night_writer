
File.write((ARGV[1]),File.read(ARGV[0]))
puts "Created #{ARGV[1]} containing #{ARGV.count} characters."
puts File.readlines(ARGV[0])*3

File.readlines(ARGV[0]).each do |letter|

alphabet = {
  "a" => [[0,.],[.,.],[.,.]],
  "b" => [[0,.],[0,.],[.,.]],
  "c" => [[0,.],[.,.],[.,.]],
  "d" => [[0,0],[.,0],[.,.]],
  "e" => [[0,.],[.,0],[.,.]],
  "f" => [[0,0],[0,.],[.,.]],
  "g" => [[0,0],[0,0],[.,.]],
  "h" => [[0,.],[0,0],[.,.]],
  "i" => [[.,0],[0,.],[.,.]],
  "j" => [[.,0],[0,0],[.,.]],
  "k" => [[0,.],[.,.],[0,.]],
  "l" => [[0,.],[0,.],[0,.]],
  "m" => [[0,0],[.,.],[0,.]],
  "n" => [[0,0],[.,0],[0,.]],
  "o" => [[0,.],[.,0],[0,.]],
  "p" => [[0,0],[0,.],[0,.]],
  "q" => [[0,0],[0,0],[0,.]],
  "r" => [[0,.],[0,0],[0,.]],
  "s" => [[.,0],[0,.],[0,.]],
  "t" => [[.,0],[0,0],[0,.]],
  "u" => [[0,.],[.,.],[0,0]],
  "v" => [[0,.],[0,.],[0,0]],
  "x" => [[0,0],[.,.],[0,0]],
  "y" => [[0,0],[.,0],[0,0]],
  "z" => [[0,.],[.,0],[0,0]]
}