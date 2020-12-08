valid = 0

File.foreach('input.txt') do |line|
  l, m, char, pass = line.scan(/(\d+)-(\d+) (\D): (\D+)/).flatten

  valid += 1 if pass.count(char).between?(l.to_i, m.to_i)
end

puts valid
