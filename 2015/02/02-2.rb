sum = 0

File.open('input.txt').each do |line|
  sides = line.split('x').map(&:to_i).sort
  sum  += (2 * sides.first(2).sum) + sides.inject(:*)
end

puts sum
