input = File.open('input.txt').read
sum   = 0

input.chars.each_with_index do |char, index|
  sum += char.to_i if char == input[index - 1]
end

puts sum