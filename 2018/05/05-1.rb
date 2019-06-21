input = File.open('input.txt').read.chomp
index = 0

while index < input.length - 1 do
  if input[index] == input[index + 1].swapcase
    input.slice!(index..index + 1)
    index -= 1 unless index.zero?
  else
    index += 1
  end
end

puts input.length
