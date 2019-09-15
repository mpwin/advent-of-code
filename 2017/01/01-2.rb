input = File.read('input.txt')
sum   = 0

input.each_char.with_index do |char, index|
  sum += char.to_i if char == input[index - input.length / 2]
end

puts sum
