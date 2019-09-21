sum = 0

File.open('input.txt').each_slice(3) do |lines|
  lines.map { |line| line.split.map(&:to_i) }.transpose.each do |a, b, c|
    sum += 1 if (a + b > c) && (b + c > a) && (c + a > b)
  end
end

puts sum
