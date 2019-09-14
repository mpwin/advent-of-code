input = File.open('input.txt').each_line.map(&:to_i)
puts input.sum
