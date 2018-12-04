input = File.open('input.txt').read
sum   = input.split.map(&:to_i).sum
puts sum
