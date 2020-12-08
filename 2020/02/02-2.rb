valid = 0

File.foreach('input.txt') do |line|
  p1, p2, char, pass = line.scan(/(\d+)-(\d+) (\D): (\D+)/).flatten

  valid += 1 if (char == pass[p1.to_i-1]) ^ (char == pass[p2.to_i-1])
end

puts valid
