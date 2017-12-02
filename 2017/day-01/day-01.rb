input = File.open('input.txt').read
sum_1 = 0
sum_2 = 0

input.chars.each_with_index do |char, index|
  sum_1 += char.to_i if char == input[index - 1]
  sum_2 += char.to_i if char == input[index - input.length / 2]
end

puts "Answer 1: #{sum_1}"
puts "Answer 2: #{sum_2}"
