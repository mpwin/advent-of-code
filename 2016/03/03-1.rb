sum = 0

File.open('input.txt').each do |line|
  a, b, c = line.split.map(&:to_i)
  sum    += 1 if (a + b > c) && (b + c > a) && (c + a > b)
end

puts sum
